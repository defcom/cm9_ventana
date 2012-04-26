
/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "SensorPoll.h"
#include "isl29018.h"
#include "MPLSensor.h"
#include "MPLSensorDefs.h"

#define LUX_SYSFS_PATH  "/sys/bus/iio/devices/device0/illuminance0_input"
#define PROX_SYSFS_PATH  "/sys/bus/iio/devices/device0/proximity_raw"

enum {
    light             = 0,
    proximity         = 1,
    mpl               = 2,
    mpl_accel,
    mpl_timer,
    numSensors,
};

static struct SensorUtil *_sensors[numSensors];

static int handleToDriver(int handle) {
    switch (handle) {
        case ID_RV:
        case ID_LA:
        case ID_GR:
        case ID_GY:
        case ID_A:
        case ID_M:
        case ID_O:
#ifdef ENABLE_GESTURE_MANAGER
        case ID_G_TAP: // Gesture handles, these are gesture specific, so other sensors need to claim other id numbers.
        case ID_G_SHA:
        case ID_G_YIR:
        case ID_G_OR6:
        case ID_G_GRD:
        case ID_G_GRN:
        case ID_G_CSG:
        case ID_G_MOT:
        case ID_G_STP:
        case ID_G_SNA:
#endif
            return mpl;

        case ID_L:
            return light;

        case ID_P:
            return proximity;
   }
    return -EINVAL;
}

static const struct sensor_t sSensorList[] = {
#ifdef ENABLE_GESTURE_MANAGER
      { "placeholder 7",  "", 1,  ID_G_TAP, 0, 0.0f, 0.0f, 0.0f, 20000, {} },  //placeholder sensors for the gesture data types
      { "placeholder 8",  "", 1,  ID_G_SHA, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 9",  "", 1,  ID_G_YIR, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 10", "", 1,  ID_G_OR6, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 11", "", 1,  ID_G_GRN, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 12", "", 1,  ID_G_GRD, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 13", "", 1,  ID_G_CSG, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 14", "", 1,  ID_G_MOT, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 15", "", 1,  ID_G_STP, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
      { "placeholder 16", "", 1,  ID_G_SNA, 0, 0.0f, 0.0f, 0.0f, 20000, {} },
#endif
      MPLROTATIONVECTOR_DEF,
      MPLLINEARACCEL_DEF,
      MPLGRAVITY_DEF,
      MPLGYRO_DEF,
      MPLACCEL_DEF,
      MPLMAGNETICFIELD_DEF,
      MPLORIENTATION_DEF,
      ISL29018LIGHT_DEF(ID_L),
      ISL29018PROX_DEF(ID_P),
};

static int sensors__get_sensors_list(struct sensors_module_t* module,
                                     struct sensor_t const** list)
{
    *list = sSensorList;
    return ARRAY_SIZE(sSensorList);
}

static int open_sensors(const struct hw_module_t* module, const char* id,
                        struct hw_device_t** device)
{
    _sensors[light] = new Isl29018Light(LUX_SYSFS_PATH, ID_L);
    _sensors[proximity] = new Isl29018Prox(PROX_SYSFS_PATH, ID_P);
    /* MPL Sensor must be present 3 times */
    _sensors[mpl] = new MPLSensor();
    _sensors[mpl_accel]  = _sensors[mpl_timer] = _sensors[mpl];

    sensors_poll_device_t *sensors_poll = sensors_poll_create_context(_sensors, numSensors, mpl, handleToDriver, (sensors_module_t *)module);
    *device = &sensors_poll->common;

    return 0;
}

static struct hw_module_methods_t sensors_module_methods = {
        open: open_sensors
};

struct sensors_module_t HAL_MODULE_INFO_SYM = {
        common: {
                tag: HARDWARE_MODULE_TAG,
                version_major: 1,
                version_minor: 0,
                id: SENSORS_HARDWARE_MODULE_ID,
                name: "Ventana sensors module",
                author: "nvidia",
                methods: &sensors_module_methods,
                dso: NULL,
                reserved: {0}
        },
        get_sensors_list: sensors__get_sensors_list,
};

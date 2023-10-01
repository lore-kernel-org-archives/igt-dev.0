Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A36610E1F0
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Oct 2023 10:22:26 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  1 Oct 2023 16:00:05 +0530
Message-Id: <20231001103006.431894-2-kunal1.joshi@intel.com>
In-Reply-To: <20231001103006.431894-1-kunal1.joshi@intel.com>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_simulation_hpd: New test for
 hotplug validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test to validate hotplug in simulation environment we
have scratch pad register 0x4f080 from which we can
trigger uevents such as HPD, VBLANK..etc, Idea is to
have port mapping placed in igtrcthrough which test
can write to 0x4f080 and check if we get hotplug

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_simulation_hpd.c | 534 +++++++++++++++++++++++++++++++
 1 file changed, 534 insertions(+)
 create mode 100644 tests/intel/kms_simulation_hpd.c

diff --git a/tests/intel/kms_simulation_hpd.c b/tests/intel/kms_simulation_hpd.c
new file mode 100644
index 000000000..e48200e48
--- /dev/null
+++ b/tests/intel/kms_simulation_hpd.c
@@ -0,0 +1,534 @@
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ * Author : Kunal Joshi <kunal1.joshi@intel.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "igt_edid.h"
+#include "igt.h"
+#include "igt_rc.h"
+
+#define HPD_REGISTER 0x4f080
+#define HOTPLUG_HOTUNPLUG_COUNT 2
+#define SIMULATION_HOTPLUG_TIMEOUT 20
+
+/*
+ * Cobalt uses scratch pad register 33 (0x4f080) for triggering events such as
+ * HPD, vblank etc.., with this test we are writing to register to generate
+ * hotplug event and check if we are getting hotplug
+ *
+ * 0x4f080 (32 bit register definiton)
+ *
+ * 3:0 Event to trigger
+ * #define IDLE 0
+ * #define IMAGE_DRAW 0x0001
+ * #define VBLANK_INTTERUP 0x0010
+ *
+ * 4:7 Pipe
+ * #define ALL_PIPES 0x0
+ * #define PIPE_A 0x0001
+ * #define PIPE_B 0x0010
+ * #define PIPE_C 0x0011
+ * #define PIPE_D 0x0100
+ *
+ * 11:8 DDI Port
+ * #define NONE 0x0
+ * #define DDIA 0x0001
+ * #define DDIB 0x0010
+ * #define DDITC1 0x0011
+ * #define DDITC2 0x0100
+ * #define DDITC3 0x0101
+ * #define DDITC4 0x0110
+ *
+ * 15:12 Port Type
+ * #define HDMI_DP 0x0
+ * #define TBT 0x0001
+ * #define TYPE_C_ALT 0x0010
+ *
+ * 19:16 Pulse Yype
+ * #define SHORT_PULSE 0x0
+ * #define LONG_PULSE 0x0001
+ * #define SHORT_AND_LONG 0x0010
+ *
+ * 24:20 Monitor ID (0-30), 1F(31) is unplug
+ *
+ * 30:25 Reserved
+ *
+ * 31
+ * #define READY 0
+ * #define BUSY 1
+ *
+ * Below is example for configuring
+ * port mapping in igtrc
+ *
+ * [PortMapping]
+ * PortId:[0-5]
+ * MonitorId:[0-30]
+ * PortType:[0-2]
+ *
+ */
+
+/**
+ * TEST: kms simulation hpd
+ * Category: Display
+ * Description: Validates hotplug on simulation
+ */
+
+typedef struct port_mapping {
+	int port_id;
+	int port_type;
+	int monitor_id;
+	int connector_id;
+} port_mappings;
+
+typedef struct data {
+	int fd;
+	int port_mapping_count;
+	struct intel_mmio_data mmio_data;
+	port_mappings *port_maps;
+} data_t;
+
+/*
+ * Check if configured port mapping which we got from igtrc
+ * is valid
+ * data: data_t struct
+ *
+ * Port id should be between 0 and 5
+ * Monitor id should be between 0 and 30
+ * Port type should be 0 (DP/HDMI),1(TBT),2 (ALT)
+ *
+ * returns void
+ */
+static void validate_port_mapping(data_t *data)
+{
+	int i;
+
+	for (i = 0; i < data->port_mapping_count; i++) {
+		igt_debug("Port Mapping %d\n", i+1);
+		igt_debug("Port ID: %d\n",
+			  data->port_maps[i].port_id);
+		igt_debug("Monitor ID: %d\n",
+			  data->port_maps[i].monitor_id);
+		igt_debug("Port Type: %d\n",
+			  data->port_maps[i].port_type);
+
+		if (data->port_maps[i].port_id < 0 || data->port_maps[i].port_id > 5)
+			igt_skip("Invalid port id\n");
+		if (data->port_maps[i].monitor_id < 0 || data->port_maps[i].monitor_id > 30)
+			igt_skip("Invalid monitor id\n");
+		if (data->port_maps[i].port_type < 0 || data->port_maps[i].port_type > 2)
+			igt_skip("Invalid port type\n");
+	}
+}
+
+/*
+ * Read mappings from igtrc file and port_map struct
+ * data: data_t struct
+ *
+ * returns void
+ */
+static void set_mappings(data_t *data)
+{
+	int i = 0, count;
+	GError *error = NULL;
+	char **group_list;
+	char *group;
+	port_mappings port_map;
+
+	if (!igt_key_file)
+		igt_skip("igtrc config file not found\n");
+	group_list = g_key_file_get_groups(igt_key_file, NULL);
+	for (count = 0; group_list[count] != NULL; count++);
+
+	data->port_mapping_count = count;
+	data->port_maps = (port_mappings *)malloc(data->port_mapping_count * sizeof(port_map));
+	for (i = 0; group_list[i] != NULL; i++) {
+		group = group_list[i];
+		data->port_maps[i].port_id = g_key_file_get_integer(igt_key_file,
+								    group, "PortId",
+								    &error);
+		data->port_maps[i].monitor_id = g_key_file_get_integer(igt_key_file,
+								       group, "Monitor",
+								       &error);
+		data->port_maps[i].port_type = g_key_file_get_integer(igt_key_file,
+								      group, "PortType",
+								      &error);
+	}
+}
+
+/*
+ * perform mmio read on HPD_REGISTER
+ * data: data_t struct
+ *
+ * returns value stored in HPD_REGISTER
+ */
+static int intel_reg_read(data_t *data)
+{
+	uint32_t val;
+
+	intel_register_access_init(&data->mmio_data,
+				   intel_get_pci_device(), 1, data->fd);
+	val = INREG(HPD_REGISTER);
+	intel_register_access_fini(&data->mmio_data);
+
+	return val;
+}
+
+/*
+ * performs mmio write on HPD_REGISTER
+ * data: data_t struct
+ * val: Value to write
+ *
+ * returns EXIT_SUCCESS if write successfull
+ */
+static int intel_reg_write(data_t *data, uint32_t val)
+{
+	intel_register_access_init(&data->mmio_data,
+				   intel_get_pci_device(),
+				   1, data->fd);
+	OUTREG(HPD_REGISTER, val);
+	intel_register_access_fini(&data->mmio_data);
+
+	return EXIT_SUCCESS;
+}
+
+/*
+ * Generates value for hotplugging particular port
+ * port_map: port_map struct
+ *
+ * returns value to plug particular port
+ */
+static int get_plug_value(port_mappings *port_map)
+{
+	int pulse = 1;
+	uint32_t val = 0;
+
+	val = (port_map->port_id << 8 | port_map->port_type << 12 | pulse << 16 | port_map->monitor_id << 20);
+
+	return val;
+}
+
+/*
+ * Generates value for hotplugging particular port
+ * with given monitor
+ * port_map: port_map struct
+ * monitor_id: Id of minitor to plug with
+ *
+ * returns value to hotplug particular port with given monitor
+ */
+static int get_plug_value_for_monitor(port_mappings *port_map,
+				      int monitor_id)
+{
+	int pulse = 1;
+	uint32_t val = 0;
+
+	val = (port_map->port_id << 8 | port_map->port_type << 12 | pulse << 16 | monitor_id << 20);
+
+	return val;
+}
+
+/*
+ * Generates value for hot unplugging particular port
+ * port_map: port_map struct
+ *
+ * returns value to hot unplug particular port
+ */
+static int get_unplug_value(port_mappings *port_map)
+{
+	int pulse = 1;
+	int unplug = 31;
+	uint32_t val = 0;
+
+	val = (port_map->port_id << 8 | port_map->port_type << 12 | pulse << 16 | unplug << 20);
+
+	return val;
+}
+
+/*
+ * Wait for hotplug and return on detction
+ *
+ * mon: udev monitor
+ * timeout: timeout in sec
+ *
+ * return true if hotplug detected
+ * else false
+ */
+static bool wait_for_hotplug(struct udev_monitor *mon, int *timeout)
+{
+	bool detected;
+
+	detected = igt_hotplug_detected(mon, *timeout);
+	return detected;
+}
+
+/*
+ * Check if after hotplug connector status is reflected
+ * as intended
+ * data: data_t struct
+ * port: index of port_maps
+ * mon: udev monitor
+ * status: drmModeConnection
+ *
+ * returns void
+ */
+static void
+wait_for_connector_after_hotplug_hotunplug(data_t *data, int port,
+				 struct udev_monitor *mon,
+				 drmModeConnection status)
+{
+	int timeout = SIMULATION_HOTPLUG_TIMEOUT;
+	int hotplug_count = 0;
+	drmModeConnector *connector;
+	drmModeConnection current_status;
+
+	connector = drmModeGetConnector(data->fd,
+					data->port_maps[port].connector_id);
+	igt_assert(connector);
+
+	igt_debug("Reprobing %s-%d...\n",
+		  kmstest_connector_type_str(connector->connector_type),
+		  connector->connector_type_id);
+
+	igt_debug("Waiting for %s-%d to get %s after a hotplug/hotunplug event...\n",
+		  kmstest_connector_type_str(connector->connector_type),
+		  connector->connector_type_id, kmstest_connector_status_str(status));
+
+	while (timeout > 0) {
+		if (!wait_for_hotplug(mon, &timeout))
+			break;
+
+		hotplug_count++;
+
+		current_status = connector->connection;
+		if (current_status == status)
+			return;
+	}
+
+	igt_assert_f(false,
+		     "Timed out waiting for %s-%d to get %s after a hotplug/hotunplug. Current state %s hotplug_count %d\n",
+		     kmstest_connector_type_str(connector->connector_type),
+		     connector->connector_type_id,
+		     kmstest_connector_status_str(status),
+		     kmstest_connector_status_str(current_status), hotplug_count);
+}
+
+/*
+ * Byte 12 to 16 is serial id in edid
+ * Function retrieves serial id from id
+ * drm_fd: drm file descriptor
+ * connector: drmModeConnector
+ *
+ * returns int serial id if valid
+ * else -1
+ */
+static int serial_id_from_edid(int drm_fd, drmModeConnector *connector)
+{
+	int serial_id = -1;
+	bool ok;
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid *edid;
+
+	if (connector->connection != DRM_MODE_CONNECTED) {
+		igt_debug("Skipping for connector %s-%d: as connector status is not connected\n",
+			  kmstest_connector_type_str(connector->connector_type),
+			  connector->connector_type_id);
+		return -1;
+	}
+
+	ok = kmstest_get_property(drm_fd, connector->connector_id,
+				  DRM_MODE_OBJECT_CONNECTOR, "EDID",
+				  NULL, &edid_blob_id, NULL);
+
+	if (!ok || !edid_blob_id) {
+		igt_debug("Skipping for connector %s-%d: missing the EDID property\n",
+			  kmstest_connector_type_str(connector->connector_type),
+			  connector->connector_type_id);
+		return -1;
+	}
+
+	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	edid = (const struct edid *) edid_blob->data;
+
+	serial_id = edid->serial[3];
+
+	drmModeFreePropertyBlob(edid_blob);
+	return serial_id;
+}
+
+/*
+ * Map ports provided in igtrc to connector id
+ * so after hotplug we can check connector status
+ * data: data_t struct
+ *
+ * returns true if port to connector mapping successfull
+ * else false
+ */
+static bool port_connector_mapping(data_t *data)
+{
+	int i, j, conn_id, serial_id;
+	uint32_t val;
+	drmModeRes *res;
+	drmModeConnector *connector;
+
+	for (i = 0; i < data->port_mapping_count; i++) {
+		/*
+		 * In simulation environment display_edid_dpcd.xml file
+		 * consists of edid's with serial value from 1 to 6 and their
+		 * respective monitor_id is 25 to 30
+		 */
+		int monitor_id = 25 + i;
+
+		val = get_plug_value_for_monitor(&data->port_maps[i],
+						 monitor_id);
+		igt_debug("Plugging port %d with monitor %d and value %x\n",
+			  i, monitor_id, val);
+		intel_reg_write(data, val);
+
+		/* Reprobe connectors and build the mapping */
+		res = drmModeGetResources(data->fd);
+		if (!res)
+			return false;
+
+		for (j = 0; j < res->count_connectors; j++) {
+			conn_id = res->connectors[j];
+			/* Read the EDID and parse the Port ID we stored
+			 * there.
+			 */
+			connector = drmModeGetConnector(data->fd,
+							res->connectors[j]);
+			serial_id = serial_id_from_edid(data->fd,
+							connector);
+			igt_debug("Serial id is %d for conn id %d\n",
+				  serial_id, conn_id);
+			if (serial_id == -1)
+				continue;
+
+			if (serial_id == (i+1)) {
+				igt_debug("Mapped Port %d to %s-%d\n",
+					  i, kmstest_connector_type_str(connector->connector_type),
+					  connector->connector_type_id);
+				data->port_maps[i].connector_id = conn_id;
+				intel_reg_write(data,
+						get_plug_value(&data->port_maps[i]));
+				igt_debug("Plugging default edid to port %d\n", i);
+				break;
+			}
+		}
+		drmModeFreeConnector(connector);
+	}
+	drmModeFreeResources(res);
+
+	return true;
+}
+
+/**
+ * SUBTEST: sim-hpd-%s-%d
+ * Description: Check that we get uevents and updated connector status on
+ * 		hotplug and unplug
+ * Test category: functionality test
+ * Functionality: hotplug
+ * Mega feature: DP, HDMI
+ *
+ * Driver requirement: i915, xe
+ * arg[1]:
+ *
+ * @DP:           for DP connectors
+ * @HDMI:         for HDMI connectors
+ *
+ * arg[2]:
+ *
+ * @number:       connector id
+*/
+static void test_simulation_hotplug(data_t *data, int i)
+{
+	int j;
+	uint32_t val;
+	struct udev_monitor *mon;
+
+	mon = igt_watch_uevents();
+
+	for (j = 0; j < HOTPLUG_HOTUNPLUG_COUNT; j++) {
+		// Unplug
+		val = get_unplug_value(&data->port_maps[i]);
+		igt_debug("Unplug value for mapping %d %x\n", i, val);
+
+		if (intel_reg_write(data, val) != EXIT_SUCCESS || intel_reg_read(data) != val)
+			igt_skip("Unable to write to register\n");
+		wait_for_connector_after_hotplug_hotunplug(data, i, mon,
+						 DRM_MODE_DISCONNECTED);
+		igt_flush_uevents(mon);
+
+		// Plug
+		val = get_plug_value(&data->port_maps[i]);
+		igt_debug("Plug value for mapping %d %x\n", i, val);
+
+		if (intel_reg_write(data, val) != EXIT_SUCCESS || intel_reg_read(data) != val)
+			igt_skip("Unable to write to register\n");
+		wait_for_connector_after_hotplug_hotunplug(data, i, mon,
+						 DRM_MODE_CONNECTED);
+		igt_flush_uevents(mon);
+	}
+}
+
+IGT_TEST_DESCRIPTION("Test HPD on simulation");
+igt_main
+{
+	int i;
+	data_t data = {0};
+	drmModeConnector *connector;
+
+	igt_fixture {
+		data.fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+		igt_require(igt_run_in_simulation());
+		/*
+		 * We get port mappings from igtrc file
+		 * If that's misconfigured or empty, port_count will be 0
+		 * and test will skip
+		 */
+		set_mappings(&data);
+		validate_port_mapping(&data);
+		igt_assert_f(port_connector_mapping(&data),
+			     "Error in port mapping");
+	}
+	igt_describe("Hotplug test for all ports mentioned in igtrc");
+	igt_subtest_with_dynamic("sim-hpd")
+	{
+		for (i = 0; i < data.port_mapping_count; i++) {
+			connector = drmModeGetConnector(data.fd,
+							data.port_maps[i].connector_id);
+			igt_dynamic_f("%s-%d",
+				      kmstest_connector_type_str(connector->connector_type),
+				      connector->connector_type_id)
+			test_simulation_hotplug(&data, i);
+		}
+	}
+
+	igt_fixture {
+		close(data.fd);
+	}
+}
-- 
2.25.1

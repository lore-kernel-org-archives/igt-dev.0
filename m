Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACAC10E06E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 21:42:29 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 03:01:35 +0530
Message-Id: <20231128213135.29062-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230912081129.6809-1-mohammed.thasleem@intel.com>
References: <20230912081129.6809-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/intel/xe_pm: Add helper to turn on
 and off the displays
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: Use IGT_CRTC_ACTIVE for displays On/Off.
v3: -Update commit message and helper names.
    -Update display on and off helpers.
v4: Remove redundant code. (Bhanu)
v5: Move helper calls to test file.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/xe_pm.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 54f9c0f5e..377884112 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -37,10 +37,30 @@ typedef struct {
 	struct pci_device *pci_xe;
 	struct pci_device *pci_root;
 	char pci_slot_name[NAME_MAX];
+	drmModeResPtr res;
 } device_t;
 
 uint64_t orig_threshold;
 
+static void update_display(drmModeResPtr res, int fd_xe, int mode)
+{
+	int i;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *connector = drmModeGetConnectorCurrent(fd_xe, res->connectors[i]);
+
+		if (!connector)
+			continue;
+
+		if (connector->connection != DRM_MODE_CONNECTED)
+			continue;
+
+		kmstest_set_connector_dpms(fd_xe, connector, mode);
+
+		drmModeFreeConnector(connector);
+	}
+}
+
 /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
 static bool runtime_usage_available(struct pci_device *pci)
 {
@@ -95,7 +115,8 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
-	update_display(device.fd_xe);
+	if (device.res)
+		update_display(device.res, device.fd_xe, DRM_MODE_DPMS_OFF);
 
 	switch (state) {
 	case IGT_ACPI_D3Cold:
@@ -115,7 +136,10 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 
 static void cleanup_d3(device_t device)
 {
-	update_display(device.fd_xe);
+	if (device.res) {
+		update_display(device.res, device.fd_xe, DRM_MODE_DPMS_ON);
+		drmModeFreeResources(device.res);
+	}
 }
 
 static bool in_d3(device_t device, enum igt_acpi_d_state state)
@@ -484,6 +508,7 @@ igt_main
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
 		sysfs_fd = igt_sysfs_open(device.fd_xe);
+		device.res = drmModeGetResources(device.fd_xe);
 	}
 
 	for (const struct s_state *s = s_states; s->name; s++) {
-- 
2.25.1

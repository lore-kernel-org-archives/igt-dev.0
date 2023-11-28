Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9B10E06E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 21:41:50 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 03:00:50 +0530
Message-Id: <20231128213050.28999-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230718110852.2965553-3-anshuman.gupta@intel.com>
References: <20230718110852.2965553-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 1/2] tests/intel/xe_pm : Add support to disable
 all crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Anshuman Gupta <anshuman.gupta@intel.com>

xe_pm d3 test requires to turn off all crtc in order to enter
to d3 state therefore, adding the support to triggering
"DPMS OFF" in setup_d3() and "DPMS ON" in cleanup_d3().

v2: Update DPMS OFF and DPMS ON function name.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9423984cc..54f9c0f5e 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -16,6 +16,7 @@
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_kms.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -94,6 +95,8 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
+	update_display(device.fd_xe);
+
 	switch (state) {
 	case IGT_ACPI_D3Cold:
 		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
@@ -110,6 +113,11 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 	return false;
 }
 
+static void cleanup_d3(device_t device)
+{
+	update_display(device.fd_xe);
+}
+
 static bool in_d3(device_t device, enum igt_acpi_d_state state)
 {
 	uint16_t val;
@@ -510,6 +518,7 @@ igt_main
 				xe_for_each_hw_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
 						  NO_RPM);
+				cleanup_d3(device);
 			}
 		}
 	}
@@ -518,6 +527,7 @@ igt_main
 		igt_subtest_f("%s-basic", d->name) {
 			igt_assert(setup_d3(device, d->state));
 			igt_assert(in_d3(device, d->state));
+			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-basic-exec", d->name) {
@@ -525,6 +535,7 @@ igt_main
 			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
 					  NO_SUSPEND, d->state);
+			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
@@ -532,6 +543,7 @@ igt_main
 			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
 					  NO_SUSPEND, d->state);
+			cleanup_d3(device);
 		}
 	}
 
-- 
2.25.1

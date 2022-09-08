Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D6B10E4A5
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 14:46:38 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 20:16:09 +0530
Message-Id: <20220908144609.2878575-3-riana.tauro@intel.com>
In-Reply-To: <20220908144609.2878575-1-riana.tauro@intel.com>
References: <20220908144609.2878575-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/i915_suspend: Disable
 d3cold_allowed for basic-s2idle-without-i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When module is unloaded and s2idle is triggered,
PCI core leaves the endpoint in D0 and the bridge in D3 state causing
PCIE spec violation. The config space is read as 0xFF

Keep the bridge in D0 before module unload to prevent
this issue

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_suspend.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 94935595..a6769d64 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -43,6 +43,7 @@
 #include "igt.h"
 #include "igt_kmod.h"
 #include "igt_device.h"
+#include "igt_device_scan.h"
 
 #define OBJECT_SIZE (16*1024*1024)
 
@@ -206,13 +207,40 @@ test_forcewake(int fd, bool hibernate)
 static void
 test_suspend_without_i915(int state)
 {
+	struct igt_device_card card;
+	char d3cold_allowed[2];
+	int fd;
+
+	fd = __drm_open_driver(DRIVER_INTEL);
+	igt_devices_scan(false);
+
+	/*
+	 * When module is unloaded and s2idle is triggered,
+	 * PCI core leaves the endpoint in D0 and the bridge in
+	 * D3 state causing PCIE spec violation.
+	 *
+	 * Keep the bridge in D0 before module unload to prevent
+	 * this issue
+	 **/
+	if (state == SUSPEND_STATE_FREEZE &&
+	    igt_device_find_first_i915_discrete_card(&card)) {
+		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
+		igt_pm_set_d3cold_allowed(&card, "0\n");
+	}
+	close(fd);
+
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
 
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
+	if (state == SUSPEND_STATE_FREEZE && strlen(card.card))
+		igt_pm_set_d3cold_allowed(&card, d3cold_allowed);
+
 	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
 	igt_assert_eq(igt_i915_driver_load(NULL), 0);
+
+	igt_devices_free();
 }
 
 int fd;
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8D10E878
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:19:52 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 15:48:49 +0530
Message-Id: <20220324101852.73089-2-riana.tauro@intel.com>
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 1/4] lib/igt_aux: Suspend/resume without
 i915 module
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Add library function that unloads i915 module and executes system
suspend/resume.
This function tests the system wide health of suspend/resume feature before executing
i915 suspend/resume tests.

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 lib/igt_aux.c | 23 +++++++++++++++++++++++
 lib/igt_aux.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 03cc38c9..904591b1 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -60,6 +60,7 @@
 #include "igt_aux.h"
 #include "igt_debugfs.h"
 #include "igt_gt.h"
+#include "igt_kmod.h"
 #include "igt_params.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
@@ -833,6 +834,28 @@ static uint32_t get_supported_suspend_states(int power_dir)
 	return state_mask;
 }
 
+/**
+ * igt_i915_unload_systemsuspend:
+ * @state: an #igt_suspend_state, the target suspend state
+ * @test: an #igt_suspend_test, test point at which to complete the suspend
+ *	  cycle
+ * Execute system suspend/resume by unloading i915 module and reload again
+ * Used to test system wide suspend/resume health before executing
+ * i915 suspend tests
+ */
+void igt_i915_unload_systemsuspend(enum igt_suspend_state state,
+                                   enum igt_suspend_test test)
+{
+	igt_kmsg(KMSG_INFO "System suspend without i915\n");
+	drm_cancel_work_at_exit();
+	igt_i915_driver_unload();
+
+	igt_system_suspend_autoresume(state, test);
+
+	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
+	igt_assert_eq(igt_i915_driver_load(NULL), 0);
+}
+
 /**
  * igt_system_suspend_autoresume:
  * @state: an #igt_suspend_state, the target suspend state
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 9f2588ae..40b1e140 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -186,6 +186,9 @@ enum igt_suspend_test {
 	SUSPEND_TEST_NUM,
 };
 
+void igt_i915_unload_systemsuspend(enum igt_suspend_state state,
+				  enum igt_suspend_test test);
+
 void igt_system_suspend_autoresume(enum igt_suspend_state state,
 				   enum igt_suspend_test test);
 void igt_set_autoresume_delay(int delay_secs);
-- 
2.25.1

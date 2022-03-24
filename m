Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AA910E87D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:19:58 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 15:48:52 +0530
Message-Id: <20220324101852.73089-5-riana.tauro@intel.com>
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 4/4] i915/i915_pm_rpm: Add
 suspend/resume cycle without i915 module
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

Exercise suspend/resume cycles without i915 module to know the
system wide health of suspend/resume feature before executing
i915 suspend/resume tests.

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rpm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 461730e8..4850ba55 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1535,6 +1535,10 @@ __noreturn static void stay_subtest(void)
 
 static void system_suspend_subtest(int state, int debug)
 {
+	teardown_environment(false);
+	igt_i915_unload_systemsuspend(state, debug);
+	setup_environment(false);
+
 	disable_all_screens_and_wait(&ms_data);
 
 	igt_system_suspend_autoresume(state, debug);
@@ -1550,6 +1554,10 @@ static void system_suspend_execbuf_subtest(void)
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 objs[1] = {{}};
 
+	teardown_environment(false);
+	igt_i915_unload_systemsuspend(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	setup_environment(false);
+
 	i = 0;
 	batch_buf[i++] = MI_NOOP;
 	batch_buf[i++] = MI_NOOP;
@@ -1582,6 +1590,10 @@ static void system_suspend_execbuf_subtest(void)
 
 static void system_suspend_modeset_subtest(void)
 {
+	teardown_environment(false);
+	igt_i915_unload_systemsuspend(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	setup_environment(false);
+
 	disable_all_screens_and_wait(&ms_data);
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 	igt_assert(wait_for_suspended());
-- 
2.25.1

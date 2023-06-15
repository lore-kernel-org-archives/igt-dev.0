Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6210E189
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 08:32:50 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 14:02:15 +0530
Message-Id: <20230615083216.1861288-2-anshuman.gupta@intel.com>
In-Reply-To: <20230615083216.1861288-1-anshuman.gupta@intel.com>
References: <20230615083216.1861288-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_aux: Disable console suspend
 for suspend test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We need no_console_suspend to be enable in order to dump the suspend
logs over serial console before attempting the suspend during
CI Execution.
Therefore disable the console_suspend using printk module parameters
while executing suspend test.

v2:
- Keep console_suspend restore only in exit handler. [Ashutosh]
- Don't skip the test on open error, while opening printk parameters,
  instead print warning. [Kmail]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_aux.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 672d7d4b0..425a1f911 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -694,6 +694,10 @@ void igt_print_activity(void)
 }
 
 static int autoresume_delay;
+bool __console_suspend_saved_state;
+
+#define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
+#define CONSOLE_SUSPEND_DISABLE false
 
 static const char *suspend_state_name[] = {
 	[SUSPEND_STATE_FREEZE] = "freeze",
@@ -899,6 +903,35 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 	return str;
 }
 
+static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
+{
+	int sysfs_fd;
+
+	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
+
+	if (sysfs_fd <  0)
+		return;
+
+	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", __console_suspend_saved_state);
+	close(sysfs_fd);
+}
+
+static void igt_aux_enable_pm_suspend_dbg(void)
+{
+	int sysfs_fd;
+
+	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
+	if (sysfs_fd > 0) {
+		__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
+		igt_sysfs_set_boolean(sysfs_fd, "console_suspend", CONSOLE_SUSPEND_DISABLE);
+		igt_install_exit_handler(igt_aux_pm_suspend_dbg_restore_exit_handler);
+	} else {
+		igt_warn("Unable to open printk parameters Err:%d\n", errno);
+	}
+
+	close(sysfs_fd);
+}
+
 /**
  * igt_system_suspend_autoresume:
  * @state: an #igt_suspend_state, the target suspend state
@@ -937,6 +970,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		      "Suspend to disk requires swap space.\n");
 
 	orig_test = get_suspend_test(power_dir);
+	igt_aux_enable_pm_suspend_dbg();
 
 	if (state == SUSPEND_STATE_S3) {
 		orig_mem_sleep = get_mem_sleep();
-- 
2.25.1

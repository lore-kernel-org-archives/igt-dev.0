Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331A010E1F7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 12:50:59 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jun 2023 18:20:45 +0530
Message-Id: <20230626125045.3699311-3-anshuman.gupta@intel.com>
In-Reply-To: <20230626125045.3699311-1-anshuman.gupta@intel.com>
References: <20230626125045.3699311-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/2] lib/igt_aux: Enable PM Suspend dbg
 messages
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

Enabling PM Suspend dbg messages by turning on
/sys/power/pm_debug_messages switch also adding an
exit handler provision to restore the
pm_debug_messages state.

v2:
- Fixed sysfs_fd leak. [Badal]
v3:
- Added igt_aux_enable_pm_suspend_dbg() function doc. [Kmail]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 lib/igt_aux.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 5eb6d9e270..35263b4519 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -703,6 +703,7 @@ void igt_print_activity(void)
 
 static int autoresume_delay;
 bool __console_suspend_saved_state;
+bool __pm_debug_messages_state;
 
 #define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
 #define CONSOLE_SUSPEND_DISABLE false
@@ -913,7 +914,7 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 
 static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 {
-	int sysfs_fd;
+	int sysfs_fd, power_dir;
 
 	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
 
@@ -922,17 +923,30 @@ static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 
 	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", __console_suspend_saved_state);
 	close(sysfs_fd);
+	power_dir = open("/sys/power", O_RDONLY);
+
+	if (power_dir <  0)
+		return;
+
+	if (!faccessat(power_dir, "pm_debug_messages", R_OK |  W_OK, 0))
+		igt_sysfs_set_boolean(power_dir, "pm_debug_messages", __pm_debug_messages_state);
+
+	close(power_dir);
 }
 
 /**
  * igt_aux_enable_pm_suspend_dbg:
+ * @power_dir: /sys/power/ dir fd
  *
  * Enhance the System wide suspend/resume debugging by,
- * disabling console suspend. Disabling console suspend dump the suspend/resume
- * logs over serial console. That will be useful to debug CI Suspend/Resume issues
- * tagged with 'Incomplete' result.
+ * disabling console suspend and enabling PM debug messages.
+ * Disabling console suspend dump the suspend/resume logs over serial console.
+ * That will be useful to debug CI Suspend/Resume issues tagged
+ * with 'Incomplete' result.
+ * pm_debug_messages sysfs enables Linux PM Core debug messages, which will
+ * be useful to debug system wide suspend/resume related issues.
  */
-static void igt_aux_enable_pm_suspend_dbg(void)
+static void igt_aux_enable_pm_suspend_dbg(int power_dir)
 {
 	int sysfs_fd;
 
@@ -943,11 +957,18 @@ static void igt_aux_enable_pm_suspend_dbg(void)
 		if (!igt_sysfs_set_boolean(sysfs_fd, "console_suspend", CONSOLE_SUSPEND_DISABLE))
 			igt_warn("Unable to disable console suspend\n");
 
-		igt_install_exit_handler(igt_aux_pm_suspend_dbg_restore_exit_handler);
 	} else {
 		igt_warn("Unable to open printk parameters Err:%d\n", errno);
 	}
 
+	/* pm_debug_messages depends on  CONFIG_PM_SLEEP_DEBUG */
+	if (!faccessat(power_dir, "pm_debug_messages", R_OK |  W_OK, 0)) {
+		__pm_debug_messages_state = igt_sysfs_get_boolean(sysfs_fd, "pm_debug_messages");
+		igt_sysfs_set_boolean(power_dir, "pm_debug_messages", true);
+	}
+
+	igt_install_exit_handler(igt_aux_pm_suspend_dbg_restore_exit_handler);
+
 	close(sysfs_fd);
 }
 
@@ -989,7 +1010,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		      "Suspend to disk requires swap space.\n");
 
 	orig_test = get_suspend_test(power_dir);
-	igt_aux_enable_pm_suspend_dbg();
+	igt_aux_enable_pm_suspend_dbg(power_dir);
 
 	if (state == SUSPEND_STATE_S3) {
 		orig_mem_sleep = get_mem_sleep();
-- 
2.25.1

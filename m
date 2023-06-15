Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6B610E499
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 08:32:52 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 14:02:16 +0530
Message-Id: <20230615083216.1861288-3-anshuman.gupta@intel.com>
In-Reply-To: <20230615083216.1861288-1-anshuman.gupta@intel.com>
References: <20230615083216.1861288-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_aux: Enable PM Suspend dbg
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
pm_debug_messagesvstate.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_aux.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 425a1f911..87c3933a5 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -695,6 +695,7 @@ void igt_print_activity(void)
 
 static int autoresume_delay;
 bool __console_suspend_saved_state;
+bool __pm_debug_messages_state;
 
 #define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
 #define CONSOLE_SUSPEND_DISABLE false
@@ -905,7 +906,7 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 
 static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 {
-	int sysfs_fd;
+	int sysfs_fd, power_dir;
 
 	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
 
@@ -913,10 +914,19 @@ static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 		return;
 
 	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", __console_suspend_saved_state);
+	power_dir = open("/sys/power", O_RDONLY);
+
+	if (power_dir <  0)
+		return;
+
+	if (!faccessat(power_dir, "pm_debug_messages", R_OK |  W_OK, 0))
+		igt_sysfs_set_boolean(power_dir, "pm_debug_messages", __pm_debug_messages_state);
+
 	close(sysfs_fd);
+	close(power_dir);
 }
 
-static void igt_aux_enable_pm_suspend_dbg(void)
+static void igt_aux_enable_pm_suspend_dbg(int power_dir)
 {
 	int sysfs_fd;
 
@@ -924,11 +934,18 @@ static void igt_aux_enable_pm_suspend_dbg(void)
 	if (sysfs_fd > 0) {
 		__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
 		igt_sysfs_set_boolean(sysfs_fd, "console_suspend", CONSOLE_SUSPEND_DISABLE);
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
 
@@ -970,7 +987,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		      "Suspend to disk requires swap space.\n");
 
 	orig_test = get_suspend_test(power_dir);
-	igt_aux_enable_pm_suspend_dbg();
+	igt_aux_enable_pm_suspend_dbg(power_dir);
 
 	if (state == SUSPEND_STATE_S3) {
 		orig_mem_sleep = get_mem_sleep();
-- 
2.25.1

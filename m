Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37E10E280
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 12:44:41 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Mar 2023 18:14:30 +0530
Message-Id: <20230301124430.186193-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: disable console suspend for suspend
 test
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

We need no_console_suspend to be enable in order to dump the suspend
logs over serial console before attempting the suspend during
CI Execution.
Therefore disable the console_suspend using printk module parameters
while executing suspend test.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_aux.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 15e304407f..e1260c1e88 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -694,6 +694,10 @@ void igt_print_activity(void)
 }
 
 static int autoresume_delay;
+bool __console_suspend_saved_state;
+
+#define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
+#define CONSOLE_SUSPEND_DISABLE 0
 
 static const char *suspend_state_name[] = {
 	[SUSPEND_STATE_FREEZE] = "freeze",
@@ -899,6 +903,19 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 	return str;
 }
 
+static void __igt_aux_console_suspend_restore_exit_handler(int sig)
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
 /**
  * igt_system_suspend_autoresume:
  * @state: an #igt_suspend_state, the target suspend state
@@ -923,10 +940,15 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 void igt_system_suspend_autoresume(enum igt_suspend_state state,
 				   enum igt_suspend_test test)
 {
-	int power_dir;
+	int power_dir, sysfs_fd;
 	enum igt_suspend_test orig_test;
 	enum igt_mem_sleep orig_mem_sleep = MEM_SLEEP_NONE;
 
+	igt_require((sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY)) >= 0);
+	__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
+	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", CONSOLE_SUSPEND_DISABLE);
+	igt_install_exit_handler(__igt_aux_console_suspend_restore_exit_handler);
+
 	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
 	igt_require(is_state_supported(power_dir, state));
 	igt_require(test == SUSPEND_TEST_NONE ||
@@ -958,7 +980,9 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		set_mem_sleep(power_dir, orig_mem_sleep);
 
 	set_suspend_test(power_dir, orig_test);
+	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", __console_suspend_saved_state);
 	close(power_dir);
+	close(sysfs_fd);
 }
 
 static int original_autoresume_delay;
-- 
2.25.1

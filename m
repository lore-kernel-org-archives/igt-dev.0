Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828A710E362
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 06:47:35 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 12:17:19 +0530
Message-Id: <20230628064720.3969317-2-anshuman.gupta@intel.com>
In-Reply-To: <20230628064720.3969317-1-anshuman.gupta@intel.com>
References: <20230628064720.3969317-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/2] lib/igt_aux: Disable console suspend
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
v3:
- Fixed cosmetics and return value comment. [Ashutosh]
v4:
- Added igt_aux_enable_pm_suspend_dbg() function doc. [Kmail]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_aux.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 386e257834..dca559384e 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -702,6 +702,10 @@ void igt_print_activity(void)
 }
 
 static int autoresume_delay;
+bool __console_suspend_saved_state;
+
+#define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
+#define CONSOLE_SUSPEND_DISABLE false
 
 static const char *suspend_state_name[] = {
 	[SUSPEND_STATE_FREEZE] = "freeze",
@@ -907,6 +911,45 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 	return str;
 }
 
+static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
+{
+	int sysfs_fd;
+
+	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
+	if (sysfs_fd < 0)
+		return;
+
+	igt_sysfs_set_boolean(sysfs_fd, "console_suspend", __console_suspend_saved_state);
+	close(sysfs_fd);
+}
+
+/**
+ * igt_aux_enable_pm_suspend_dbg:
+ *
+ * Enhance the System wide suspend/resume debugging by
+ * disabling console suspend. Disabling console suspend dump the suspend/resume
+ * logs over serial console. That will be useful to debug CI Suspend/Resume issues
+ * tagged with 'Incomplete' result.
+ */
+static void igt_aux_enable_pm_suspend_dbg(void)
+{
+	int sysfs_fd;
+
+	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
+	if (sysfs_fd > 0) {
+		__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
+
+		if (!igt_sysfs_set_boolean(sysfs_fd, "console_suspend", CONSOLE_SUSPEND_DISABLE))
+			igt_warn("Unable to disable console suspend\n");
+
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
@@ -945,6 +988,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		      "Suspend to disk requires swap space.\n");
 
 	orig_test = get_suspend_test(power_dir);
+	igt_aux_enable_pm_suspend_dbg();
 
 	if (state == SUSPEND_STATE_S3) {
 		orig_mem_sleep = get_mem_sleep();
-- 
2.25.1

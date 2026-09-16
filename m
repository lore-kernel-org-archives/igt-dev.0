Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B6C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 14:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74DE10E12D;
	Wed, 16 Sep 2026 14:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRkpXD2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027A110E12D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789568277; x=1821104277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4QlNl74wcF3fpIunraEJ9T4Ji1G6G/whV1swFdPebeg=;
 b=MRkpXD2btAMWZxdd0kVqDyv0sqZbmsjJ5D6cBXWSIoMjiF9EsgOTs3F1
 59J3ANZJyD1aeyEwQ4zyPYeaP562da147/SwdmHwH1qqnbUOqUwHA4hCN
 /eSp1qVBHTKaWbxHCFTdS+f0aL/743c5iMhUsB5YKHwvyGUuSP/3j84mi
 WgxNPfx6oVZeJvcYBFV+6mGZ2Dm7xzww3K39F2mHoFVsQLF91MEGCuioV
 ayyN24INrcfPC0g31idKCXnMSIxXzSFYJruLVRhaFBZMV6BADUTREsZcG
 hmfAlKXV73mz9bBCASQOZvC/MdN6yUmPDnloSTSPdNy8YWgvlsSGA9TsX g==;
X-CSE-ConnectionGUID: 2qt/ZQk7Q8CUvtJM/MHEcA==
X-CSE-MsgGUID: wjug+muATN2yzACiN0Gf5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="450252"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="450252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 07:17:56 -0700
X-CSE-ConnectionGUID: BLCtnrECRd+vLf/kV2pOzg==
X-CSE-MsgGUID: ppJh0MocS2aUhpAekP691Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276891210"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 07:17:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] lib/igt_aux: enable serial printk logs during suspend
Date: Wed, 16 Sep 2026 19:47:09 +0530
Message-Id: <20260916141709.1216470-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Save /proc/sys/kernel/printk, set the console loglevel to 8 before system
suspend so suspend-stage logs reach the serial console, and restore the
original value after resume or exit-handler cleanup.

During system suspend, userspace log collection is no longer reliable and
the useful failure point is often before resume completes. Raise the printk
loglevel to 8 for the suspend window so PM and driver messages reach the
serial console, then restore the original setting after resume.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: GitHub-Copilot:GPT-5.4
---
 lib/igt_aux.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 0d250ae2f..510266319 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -699,9 +699,13 @@ void igt_print_activity(void)
 static int autoresume_delay;
 bool __console_suspend_saved_state;
 bool __pm_debug_messages_state;
+static char __printk_saved_state[64];
+static ssize_t __printk_saved_state_len = -1;
 
 #define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
+#define PROC_SYS_KERNEL_PRINTK "/proc/sys/kernel/printk"
 #define CONSOLE_SUSPEND_DISABLE false
+#define SERIAL_CONSOLE_LOGLEVEL "8\n"
 
 static const char *suspend_state_name[] = {
 	[SUSPEND_STATE_FREEZE] = "freeze",
@@ -915,6 +919,23 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
 static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 {
 	int sysfs_fd, power_dir;
+	int fd;
+	ssize_t written;
+
+	if (__printk_saved_state_len > 0) {
+		fd = open(PROC_SYS_KERNEL_PRINTK, O_WRONLY);
+		if (fd >= 0) {
+			written = write(fd, __printk_saved_state, __printk_saved_state_len);
+			if (written != __printk_saved_state_len)
+				igt_warn("Unable to restore %s Err:%d\n",
+					 PROC_SYS_KERNEL_PRINTK, errno);
+			close(fd);
+		} else {
+			igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+		}
+
+		__printk_saved_state_len = -1;
+	}
 
 	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
 	if (sysfs_fd < 0)
@@ -933,6 +954,67 @@ static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
 	close(power_dir);
 }
 
+static void igt_aux_enable_suspend_serial_logs(void)
+{
+	int fd;
+	ssize_t len;
+	ssize_t written;
+
+	fd = open(PROC_SYS_KERNEL_PRINTK, O_RDWR);
+	if (fd < 0) {
+		igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+		return;
+	}
+
+	len = read(fd, __printk_saved_state, sizeof(__printk_saved_state) - 1);
+	if (len < 0) {
+		igt_warn("Unable to read %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+		close(fd);
+		return;
+	}
+
+	__printk_saved_state[len] = '\0';
+	__printk_saved_state_len = len;
+
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		igt_warn("Unable to seek %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+		close(fd);
+		return;
+	}
+
+	written = write(fd, SERIAL_CONSOLE_LOGLEVEL, strlen(SERIAL_CONSOLE_LOGLEVEL));
+	if (written != strlen(SERIAL_CONSOLE_LOGLEVEL)) {
+		igt_warn("Unable to set %s to %s Err:%d\n",
+			 PROC_SYS_KERNEL_PRINTK, SERIAL_CONSOLE_LOGLEVEL, errno);
+		__printk_saved_state_len = -1;
+	}
+
+	close(fd);
+}
+
+static void igt_aux_restore_suspend_serial_logs(void)
+{
+	int fd;
+	ssize_t written;
+
+	if (__printk_saved_state_len <= 0)
+		return;
+
+	fd = open(PROC_SYS_KERNEL_PRINTK, O_WRONLY);
+	if (fd < 0) {
+		igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+		return;
+	}
+
+	written = write(fd, __printk_saved_state, __printk_saved_state_len);
+	if (written != __printk_saved_state_len)
+		igt_warn("Unable to restore %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
+	else
+		__printk_saved_state_len = -1;
+
+	close(fd);
+}
+
 /**
  * igt_aux_enable_pm_suspend_dbg:
  * @power_dir: /sys/power/ dir fd
@@ -949,6 +1031,8 @@ static void igt_aux_enable_pm_suspend_dbg(int power_dir)
 {
 	int sysfs_fd;
 
+	igt_aux_enable_suspend_serial_logs();
+
 	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
 	if (sysfs_fd > 0) {
 		__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
@@ -1027,6 +1111,8 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	else
 		suspend_via_sysfs(power_dir, state);
 
+	igt_aux_restore_suspend_serial_logs();
+
 	if (orig_mem_sleep)
 		set_mem_sleep(power_dir, orig_mem_sleep);
 
-- 
2.25.1


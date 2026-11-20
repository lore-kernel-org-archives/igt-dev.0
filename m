Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B5606A326
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zk3Dhkxk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF5E10E8F0;
	Fri, 20 Nov 2026 13:36:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D0112A55
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795181688; x=1826717688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gcezl251fLqA/XouxEKKzLM/MFNXvpyskWepKyfP1Hg=;
 b=Zk3DhkxkBA/Jc8trQjUMlUaNeJqKMfLwD1eQz1VEoeYIeorizWJrjw2a
 5KuspROy1h7d5CgiDroJybrU8UzNwda9z547F4YWZS71pq2Q1zSlGGkdL
 ceMVLlrjL97VSkCcgmUXrbceVdKw/qfwonLAqL298Cbgl9bkMLBF86/+d
 aCxA8Gv2wod53EFxxhlOqS2AButEiJInzEwdDm88BJ3sU7a9le+UCupzw
 rJYsJB04zPWGKwMYFhi3wWRjsm8qY22+ifGEe3JPzz/ue2ra7L4Ct7iAi
 FC+ck8u7HOspH7qpH4uKwmqx3qIczF507gjaEQUyDXsWq5fzPo+TPlh9F A==;
X-CSE-ConnectionGUID: Tl5DNjn+QmiTB6rwsG78vA==
X-CSE-MsgGUID: N+Yy39hwQpGC4lrFcRu9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3943158"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3943158"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:48 -0800
X-CSE-ConnectionGUID: T/k7wHSQS4KSNj63yZ98UQ==
X-CSE-MsgGUID: j1+xJSmpRbqVVjB5iP4Xww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12412021"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:34:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_aux: Add hibernate autoresume helper
Date: Fri, 20 Nov 2026 19:13:58 +0530
Message-Id: <20261120134400.1888895-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120134400.1888895-1-swati2.sharma@intel.com>
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the hibernation checks and GRUB kernel selection into a reusable
igt_system_hibernate_autoresume() helper.

The helper verifies hibernation support, swap availability, and the
resume kernel configuration, then configures GRUB to boot the running
kernel before starting the suspend-to-disk cycle. Update kms_ccs to use
the shared helper.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_aux.c         | 143 +++++++++++++++++++++++++++++++++++++
 lib/igt_aux.h         |   1 +
 tests/intel/kms_ccs.c | 162 +-----------------------------------------
 3 files changed, 145 insertions(+), 161 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 18053db8f..dec8073d3 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1120,6 +1120,149 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	close(power_dir);
 }
 
+static bool igt_aux_hibernation_supported(void)
+{
+	char buffer[2048];
+	ssize_t state_bytes;
+	size_t cmdline_bytes;
+	FILE *cmdline;
+	int fd;
+
+	fd = open("/sys/power/state", O_RDONLY);
+	if (fd < 0) {
+		igt_debug("Failed to open /sys/power/state\n");
+		return false;
+	}
+
+	state_bytes = read(fd, buffer, sizeof(buffer) - 1);
+	close(fd);
+	if (state_bytes <= 0) {
+		igt_debug("Failed to read /sys/power/state\n");
+		return false;
+	}
+
+	buffer[state_bytes] = '\0';
+	if (!strstr(buffer, "disk")) {
+		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
+		return false;
+	}
+
+	cmdline = fopen("/proc/cmdline", "r");
+	if (!cmdline) {
+		igt_debug("Failed to open /proc/cmdline\n");
+		return false;
+	}
+
+	cmdline_bytes = fread(buffer, 1, sizeof(buffer) - 1, cmdline);
+	fclose(cmdline);
+	buffer[cmdline_bytes] = '\0';
+	if (!strstr(buffer, "resume=")) {
+		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool igt_aux_ensure_grub_boots_same_kernel(void)
+{
+	char cmdline[1024];
+	char current_kernel[256];
+	char last_menuentry[512] = "";
+	char grub_entry[512];
+	char command[1024];
+	char line[1024];
+	FILE *cmdline_file, *grub_cfg;
+	char *kernel_arg, *kernel_end;
+	bool kernel_found = false;
+
+	cmdline_file = fopen("/proc/cmdline", "r");
+	if (!cmdline_file) {
+		igt_debug("Failed to open /proc/cmdline\n");
+		return false;
+	}
+
+	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
+		fclose(cmdline_file);
+		igt_debug("Failed to read /proc/cmdline\n");
+		return false;
+	}
+	fclose(cmdline_file);
+
+	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
+	if (!kernel_arg) {
+		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
+		return false;
+	}
+
+	kernel_arg += strlen("BOOT_IMAGE=");
+	kernel_end = strchr(kernel_arg, ' ');
+	if (!kernel_end)
+		kernel_end = kernel_arg + strlen(kernel_arg);
+
+	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
+		 (int)(kernel_end - kernel_arg), kernel_arg);
+	igt_debug("Current kernel image: %s\n", current_kernel);
+
+	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
+	if (!grub_cfg) {
+		igt_debug("Failed to open GRUB configuration file\n");
+		return false;
+	}
+
+	while (fgets(line, sizeof(line), grub_cfg)) {
+		if (strstr(line, "menuentry")) {
+			char *start = strchr(line, '\'');
+			char *end = start ? strchr(start + 1, '\'') : NULL;
+
+			if (start && end)
+				snprintf(last_menuentry, sizeof(last_menuentry), "%.*s",
+					 (int)(end - start - 1), start + 1);
+		}
+
+		if (strstr(line, current_kernel)) {
+			snprintf(grub_entry, sizeof(grub_entry), "%s", last_menuentry);
+			kernel_found = true;
+			break;
+		}
+	}
+	fclose(grub_cfg);
+
+	if (!kernel_found) {
+		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
+			  current_kernel);
+		return false;
+	}
+
+	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
+	if (system(command) != 0) {
+		igt_debug("Failed to set GRUB boot target to: %s\n", grub_entry);
+		return false;
+	}
+
+	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
+		  current_kernel, grub_entry);
+	return true;
+}
+
+/**
+ * igt_system_hibernate_autoresume:
+ *
+ * Prepare GRUB to boot the running kernel on the next boot, then perform a
+ * full suspend-to-disk cycle and automatically resume.
+ */
+void igt_system_hibernate_autoresume(void)
+{
+	igt_require_f(igt_aux_hibernation_supported(),
+		      "Kernel is not configured for hibernation resume\n");
+	igt_require_f(igt_get_total_swap_mb(),
+		      "Suspend to disk requires swap space.\n");
+	igt_require_f(igt_aux_ensure_grub_boots_same_kernel(),
+		      "Couldn't find correct kernel in grub.cfg\n");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_DISK, SUSPEND_TEST_NONE);
+}
+
 static int original_autoresume_delay;
 
 static void igt_restore_autoresume_delay(int sig)
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 30530a404..8d7168fe7 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -216,6 +216,7 @@ enum igt_mem_sleep {
 
 void igt_system_suspend_autoresume(enum igt_suspend_state state,
 				   enum igt_suspend_test test);
+void igt_system_hibernate_autoresume(void);
 void igt_set_autoresume_delay(int delay_secs);
 int igt_get_autoresume_delay(enum igt_suspend_state state);
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a7..9740fe1ae 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -270,161 +270,6 @@ static const struct {
 #define MAX_SPRITE_PLANE_WIDTH 2000
 
 
-/**
- * check_hibernation_support:
- *
- * Return: True if kernel is configured with resume point for hibernate.
- */
-static bool check_hibernation_support(void)
-{
-	int fd;
-	char buffer[2048];
-	ssize_t bytes_read;
-	FILE *cmdline;
-
-	/* Check if hibernation is supported in /sys/power/state */
-	fd = open("/sys/power/state", O_RDONLY);
-
-	if (fd <= 0) {
-		igt_debug("Failed to open /sys/power/state\n");
-		return false;
-	}
-
-	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
-	close(fd);
-
-	if (bytes_read <= 0) {
-		igt_debug("Failed to read /sys/power/state");
-		return false;
-	}
-
-	buffer[bytes_read] = '\0';
-	if (strstr(buffer, "disk") == NULL) {
-		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
-		return false;
-	}
-
-	/* Check if resume is configured in kernel command line */
-	cmdline = fopen("/proc/cmdline", "r");
-
-	if (!cmdline) {
-		igt_debug("Failed to open /proc/cmdline");
-		return false;
-	}
-
-	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
-	fclose(cmdline);
-
-	if (strstr(buffer, "resume=") == NULL) {
-		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
-		return false;
-	}
-
-	return true;
-}
-
-/**
- * Ensure_grub_boots_same_kernel:
- *
- * Return: True if kernel was found and set for next reboot.
- */
-static bool ensure_grub_boots_same_kernel(void)
-{
-	char cmdline[1024];
-	char current_kernel[256];
-	char last_menuentry[512] = "";
-	char grub_entry[512];
-	char command[1024];
-	FILE *cmdline_file, *grub_cfg;
-	char line[1024];
-	bool kernel_found = false;
-	char *kernel_arg;
-	char *kernel_end;
-
-	/* Read /proc/cmdline to get the current kernel image */
-	cmdline_file = fopen("/proc/cmdline", "r");
-	if (!cmdline_file) {
-		igt_debug("Failed to open /proc/cmdline");
-		return false;
-	}
-
-	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
-		fclose(cmdline_file);
-		igt_debug("Failed to read /proc/cmdline");
-		return false;
-	}
-	fclose(cmdline_file);
-
-	/* Parse the kernel image from cmdline */
-	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
-	if (!kernel_arg) {
-		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
-		return false;
-	}
-
-	kernel_arg += strlen("BOOT_IMAGE=");
-	kernel_end = strchr(kernel_arg, ' ');
-
-	if (!kernel_end)
-		kernel_end = kernel_arg + strlen(kernel_arg);
-
-	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
-		 (int)(kernel_end - kernel_arg), kernel_arg);
-	igt_debug("Current kernel image: %s\n", current_kernel);
-
-	/* Open GRUB config file to find matching entry */
-	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
-	if (!grub_cfg) {
-		igt_debug("Failed to open GRUB configuration file");
-		return false;
-	}
-
-	while (fgets(line, sizeof(line), grub_cfg)) {
-		/* Check if the line contains a menuentry */
-		if (strstr(line, "menuentry")) {
-		/* Store the menuentry line */
-			char *start = strchr(line, '\'');
-			char *end = start ? strchr(start + 1, '\'') : NULL;
-
-			if (start && end) {
-				snprintf(last_menuentry,
-					 sizeof(last_menuentry),
-					 "%.*s", (int)(end - start - 1),
-					 start + 1);
-			}
-		}
-
-		/* Check if the current line contains the kernel */
-		if (strstr(line, current_kernel)) {
-			/* Use the last seen menuentry as the match */
-			snprintf(grub_entry, sizeof(grub_entry), "%s",
-				 last_menuentry);
-			kernel_found = true;
-			break;
-		}
-	}
-
-	fclose(grub_cfg);
-
-	if (!kernel_found) {
-		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
-			  current_kernel);
-		return false;
-	}
-
-	/* Set the GRUB boot target using grub-reboot */
-	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
-	if (system(command) != 0) {
-		igt_debug("Failed to set GRUB boot target to: %s\n",
-			  grub_entry);
-		return false;
-	}
-
-	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
-		  current_kernel, grub_entry);
-	return true;
-}
-
 static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 {
 	int i;
@@ -994,12 +839,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
 		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
 			if (data->do_hibernate) {
-				igt_require_f(check_hibernation_support(),
-					      "Kernel is not cofigured for resume\n");
-				igt_require_f(ensure_grub_boots_same_kernel(),
-					      "Couldn't find correct kernel in grub.cfg\n");
-				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
-							      SUSPEND_TEST_NONE);
+				igt_system_hibernate_autoresume();
 			} else {
 				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 							      SUSPEND_TEST_NONE);
-- 
2.25.1


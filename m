Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB77AC0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 11:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3FF10E258;
	Tue, 28 Jan 2025 11:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BYyh/YKZ";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700310E258
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 11:51:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21670dce0a7so114962025ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738065078; x=1738669878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vDejqVVO+YZVqFjevgLaoCEx9uw2gMl1JzsmRHn0tY=;
 b=BYyh/YKZFeVNkBgsVA4g6vYVzprFNRQ2CMjQjLrYZZSPTmO4Pb4sDazhEkuw5IjUJv
 XUK3d0dxhp+d9RmBkKhSBGXR5KyeXwCIdIR+fsmPGO+bA/NF84MR4vWnmMH1eObSsHSl
 D5fsOUqtZSCXDsBXNcYl6bdXmRQNDJvViqhNNnd34zep05Mg7Y3qokEOe8uUktngzKot
 yMmr429BgRRk2o/gT1n/YKtZgxYnCWoP9auZSqtUBHj9GR5rGyybWa+nV07lrXAWSsCz
 eMF/n/ymXOISCZZvmlVFjs4gsQMDAzkObGjQ2pDIG6nayGfgmdY4ZTiWbj5gRmWl6Hhw
 BadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065078; x=1738669878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vDejqVVO+YZVqFjevgLaoCEx9uw2gMl1JzsmRHn0tY=;
 b=YFh0khEtmLKnAH18uJfaFpqroz9x0gHd3WM4BPbvQjj9UdkBKbnalZ09WfMf7NvxGI
 Z2OWATJqPh8vMUichH7CG93s887mLk1jZIGptdsn7n4yArgLYmp/g5H1sdEve4m5TcBP
 5b+YaVekPkTAjzB8GBsKy97i1n6ey9fooUT0iH20qbz6iQ8HLnvtgib4OnyC9AOY5f4F
 Msz6/5az9bhk7lZlmuwU8GqIewy44oxYOO3D/VO55xmkZW9+m5FIZuL1M/20FhVj0lcz
 mH3r+ywzRZxV2Z817dwJM7U7tIxoNWbE3hvOCRm6MgQpZ9DSZ2XG+knpOXQ/TZieAGKM
 YFow==
X-Gm-Message-State: AOJu0YyExVrHe8xjOm3IVQ8SMSYYJCf66w+AcUuQiasnbdwRQbjxODAw
 KANnpUHb4Keol8DdV1Koo9cBJjPPEGfCIAAerVnPLnkHP7b8wpfjF2uGsFqB
X-Gm-Gg: ASbGncsjy8JPBySc1KDldLU/UcrZ8h6vieQfziAKaYlFkYxo/Dc83KKLzAtIHtZGmie
 pZ0144MzrL2ePDm9TF5jwR9m8vntncQ1nXLlbjDGCHFbe9sU6aFaY/ToJXQEZWTtxXu5YDw4N+z
 10i2I692oGPsTJjkBQSv5IC8lNfa/t3SjeDawIQS7WpgJMdj7zTvkLRNiBlqxYdGXEGdeBGcbWs
 3sapGEE8WB4Pl9zv45reLci8MpbrFExFlFRZMC2/cMU2C7pjwQaFd+W8zzzA2RtUSIRCKuZ7mW3
 2SwQd+H9uC1nAhgCILrRB9up
X-Google-Smtp-Source: AGHT+IGDF91iRFbKEH7gyT71+wQymBacE/fChZwNwsaoiLmDqGcGvpMQosT1IUBcjirXH4RIVKQvYw==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id
 adf61e73a8af0-1eb215ec4b9mr75124501637.29.1738065078316; 
 Tue, 28 Jan 2025 03:51:18 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a69f411sm8793835b3a.6.2025.01.28.03.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 03:51:18 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Date: Tue, 28 Jan 2025 13:55:58 +0200
Message-ID: <20250128115558.1980222-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
References: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
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

Add hibernate test which bring entire system down for short
hibernate. This mode is added to suspend tests to be run
manually with '-r' flag because this is not ci friendly test,
on hibernate ci would lose connection to the hibernated box.

This test is written against Ubuntu distro relying grub
configuration found there.

For this test to work kernel resume point need to be set, from
kernel command line is checked if there is found something along
the lines of "resume=/dev/nvme0n1p2" or so to verify hibernate
will be successful.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 176 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 3e9a57863..8be3c063a 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -190,6 +190,7 @@ typedef struct {
 	bool user_seed;
 	enum igt_commit_style commit;
 	int fb_list_length;
+	bool do_hibernate;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -271,6 +272,162 @@ static const struct {
  */
 #define MAX_SPRITE_PLANE_WIDTH 2000
 
+
+/**
+ * check_hibernation_support:
+ *
+ * Return: True if kernel is configured with resume point for hibernate.
+ */
+static bool check_hibernation_support(void)
+{
+	int fd;
+	char buffer[2048];
+	ssize_t bytes_read;
+	FILE *cmdline;
+
+	/* Check if hibernation is supported in /sys/power/state */
+	fd = open("/sys/power/state", O_RDONLY);
+
+	if (fd <= 0) {
+		igt_debug("Failed to open /sys/power/state\n");
+		return false;
+	}
+
+	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
+	close(fd);
+
+	if (bytes_read <= 0) {
+		igt_debug("Failed to read /sys/power/state");
+		return false;
+	}
+
+	buffer[bytes_read] = '\0';
+	if (strstr(buffer, "disk") == NULL) {
+		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
+		return false;
+	}
+
+	/* Check if resume is configured in kernel command line */
+	cmdline = fopen("/proc/cmdline", "r");
+
+	if (!cmdline) {
+		igt_debug("Failed to open /proc/cmdline");
+		return false;
+	}
+
+	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
+	fclose(cmdline);
+
+	if (strstr(buffer, "resume=") == NULL) {
+		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * Ensure_grub_boots_same_kernel:
+ *
+ * Return: True if kernel was found and set for next reboot.
+ */
+static bool ensure_grub_boots_same_kernel(void)
+{
+	char cmdline[1024];
+	char current_kernel[256];
+	char last_menuentry[512] = "";
+	char grub_entry[512];
+	char command[1024];
+	FILE *cmdline_file, *grub_cfg;
+	char line[1024];
+	bool kernel_found = false;
+	char *kernel_arg;
+	char *kernel_end;
+
+	/* Read /proc/cmdline to get the current kernel image */
+	cmdline_file = fopen("/proc/cmdline", "r");
+	if (!cmdline_file) {
+		igt_debug("Failed to open /proc/cmdline");
+		return false;
+	}
+
+	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
+		fclose(cmdline_file);
+		igt_debug("Failed to read /proc/cmdline");
+		return false;
+	}
+	fclose(cmdline_file);
+
+	/* Parse the kernel image from cmdline */
+	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
+	if (!kernel_arg) {
+		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
+		return false;
+	}
+
+	kernel_arg += strlen("BOOT_IMAGE=");
+	kernel_end = strchr(kernel_arg, ' ');
+
+	if (!kernel_end)
+		kernel_end = kernel_arg + strlen(kernel_arg);
+
+	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
+		 (int)(kernel_end - kernel_arg), kernel_arg);
+	igt_debug("Current kernel image: %s\n", current_kernel);
+
+	/* Open GRUB config file to find matching entry */
+	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
+	if (!grub_cfg) {
+		igt_debug("Failed to open GRUB configuration file");
+		return false;
+	}
+
+	while (fgets(line, sizeof(line), grub_cfg)) {
+		/* Check if the line contains a menuentry */
+		if (strstr(line, "menuentry")) {
+		/* Store the menuentry line */
+			char *start = strchr(line, '\'');
+			char *end = start ? strchr(start + 1, '\'') : NULL;
+
+			if (start && end) {
+				snprintf(last_menuentry,
+					 sizeof(last_menuentry),
+					 "%.*s", (int)(end - start - 1),
+					 start + 1);
+			}
+		}
+
+		/* Check if the current line contains the kernel */
+		if (strstr(line, current_kernel)) {
+			/* Use the last seen menuentry as the match */
+			snprintf(grub_entry, sizeof(grub_entry), "%s",
+				 last_menuentry);
+			kernel_found = true;
+			break;
+		}
+	}
+
+	fclose(grub_cfg);
+
+	if (!kernel_found) {
+		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
+			  current_kernel);
+		return false;
+	}
+
+	/* Set the GRUB boot target using grub-reboot */
+	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
+	if (system(command) != 0) {
+		igt_debug("Failed to set GRUB boot target to: %s\n",
+			  grub_entry);
+		return false;
+	}
+
+	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
+		  current_kernel, grub_entry);
+	return true;
+}
+
 static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 {
 	int i;
@@ -839,8 +996,17 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
 		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
+			if (data->do_hibernate) {
+				igt_require_f(check_hibernation_support(),
+					      "Kernel is not cofigured for resume\n");
+				igt_require_f(ensure_grub_boots_same_kernel(),
+					      "Couldn't find correct kernel in grub.cfg\n");
+				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
+							      SUSPEND_TEST_NONE);
+			} else {
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+							      SUSPEND_TEST_NONE);
+			}
 
 			/* on resume check flat ccs is still compressed */
 			if (is_xe_device(data->drm_fd) &&
@@ -1044,6 +1210,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 		data->user_seed = true;
 		data->seed = strtoul(optarg, NULL, 0);
 		break;
+	case 'r':
+		data->do_hibernate = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1056,9 +1225,10 @@ static data_t data;
 static const char *help_str =
 "  -c\t\tCheck the presence of compression meta-data\n"
 "  -s <seed>\tSeed for random number generator\n"
+"  -r\t\tOn suspend test do full hibernate with reboot\n"
 ;
 
-igt_main_args("cs:", NULL, help_str, opt_handler, &data)
+igt_main_args("csr:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2


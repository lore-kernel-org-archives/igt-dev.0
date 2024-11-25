Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA9AD58D62
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0C710E6A2;
	Mon, 25 Nov 2024 16:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IYZp+tSN";
	dkim-atps=neutral
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C02B10E6A2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:15:32 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7fbc29b3145so2853962a12.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732551332; x=1733156132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9x2fM53I5l8n5phUaeuW5iwqhcDjn9gmBSC+8ErWjA=;
 b=IYZp+tSNNxZoUS/gV9MIRTRRKEENUi4cP/2hkQI+orblp+BtU69Pgj5MZoSjlymQKY
 MWd2VkPfCXnmOHXCxGS97ln1J70pdSWc00uXrsA2EfmMNbSaRiBVeU1YjaHlR02hSWkH
 EfVAvKF9xfa88msbAPQdGAqnLS28Jnz5M5u/NOlLBTZzae6Uw8Pu63/QBwVYZ7QHqkf8
 PISt5l4m/IUZJyJrL5orr7LgJLHkl9PHWdK69gNe/mamT/VGXp2KyRtuySzEVUzA5YHh
 nxDw7ResFr17eKf8muz4DaeVmpqO/q4Im6liWYba7Y8/afdwrQg5fafr431xK4xgjuGg
 yRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732551332; x=1733156132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9x2fM53I5l8n5phUaeuW5iwqhcDjn9gmBSC+8ErWjA=;
 b=rru/nbCVoa4eF5MutjWRF+Q56vu8vDZtJFgCwsBL8sZagxH1Gq1WEz/p/rVpkd09JL
 WpCDAF0FIqMvqnS6cZXv9LCcuKBDn6fIX7iyOIeAHQLfyd2lONWQA9R98sHVGKNcfazr
 VE4EN5kVSrSnE0GTqfILRXG37zf9p+Gwj+1uahR32/LYWnbr/QPCQ5/Ck+6/uU2jb7+7
 tOA6/hcElpiFklV62cZqgZFGvzAtFBu4VxJb8SPztaTrXm7afp5CAr7JAYDjbiHbhYAy
 N4LqbNti9YiZuDoULObvi/MkF+y6FoV5AkXyT4pbgSi1D0AIJZQuEnow48mAXzPDLlsr
 FBBg==
X-Gm-Message-State: AOJu0YwKc8oSJsl0vrtPIKVifJ2ypyp3A8VPF4tTwmIw9aWpGm8sBnev
 kNb2hV8WwuSmmgy4uT239Fqr/QH/Izf2+urQhhfQmiwe9e5v676eCBKNjEPM
X-Gm-Gg: ASbGnctNkqmmN4ycBWJa7z9uq6OXrTYD+B4IV3AwSxfHbD2v8Y2lXyQrX8X5WMOXzwW
 pHrvCXJKBojVml+X/LK7qWipAzTK15b26QbiB5AACRSQ7M61VzV0vmIonTcz/NsZlLxCCG1qOrv
 /kdg036n9ZxTF0AIPz1SbzEoSyqkwln3Ec414VQmsV2pPuDHpu1v3kEhV2av7ZEIpgsbFtySpt0
 mnIsBLfizHY89SCutDpNhUfYbTKxjYvMD0jOEpuY7IPxuny6fzq9q9hTZU=
X-Google-Smtp-Source: AGHT+IH2Q4sSjBnhve6q4d33HenO1sMtoaQ/lxVmor9D9kyFSUKHnzEVFWO2hBnK3LH9H70dQLPpkw==
X-Received: by 2002:a05:6a20:6a0c:b0:1e0:c7b9:28ba with SMTP id
 adf61e73a8af0-1e0c7b92c0bmr7724618637.9.1732551331401; 
 Mon, 25 Nov 2024 08:15:31 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fbcc0dbcefsm6861381a12.18.2024.11.25.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 08:15:31 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Date: Mon, 25 Nov 2024 18:19:58 +0200
Message-ID: <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
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

For this test to work kernel resume point need to be set using swapfile, from
kernel command line is checked if there is found something along the lines of
"resume=/dev/nvme0n1p2 resume_offset=73527296" or so to verify hibernate
will be successfull.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 162 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 3e9a57863..fd2fe9d3d 100644
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
@@ -271,6 +272,154 @@ static const struct {
  */
 #define MAX_SPRITE_PLANE_WIDTH 2000
 
+/* constants for hibenate test */
+#define RTC_WAKE_CMD "rtcwake -m no -s %d"
+#define PROC_CMDLINE "/proc/cmdline"
+#define SYS_POWER_STATE "/sys/power/state"
+#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
+
+static void check_hibernation_support(void)
+{
+	int fd;
+	char buffer[2048];
+	ssize_t bytes_read;
+	FILE *cmdline;
+
+	/* Check if hibernation is supported in /sys/power/state */
+	fd = open(SYS_POWER_STATE, O_RDONLY);
+	igt_require_f(fd > 0, "Failed to open /sys/power/state");
+	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
+	close(fd);
+
+	igt_require_f(bytes_read > 0, "Failed to read /sys/power/state");
+
+	buffer[bytes_read] = '\0';
+	igt_require_f(strstr(buffer, "disk") != NULL,
+		      "Hibernation (suspend to disk) is not supported on this system.\n");
+
+	/* Check if resume is configured in kernel command line */
+	cmdline = fopen(PROC_CMDLINE, "r");
+	igt_require_f(cmdline, "Failed to open /proc/cmdline");
+	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
+	fclose(cmdline);
+
+	igt_require_f(strstr(buffer, "resume="),
+		      "Kernel does not have 'resume' parameter configured for hibernation.\n");
+}
+
+static void set_rtc_wake_timer(int seconds)
+{
+	char command[256];
+
+	snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds);
+
+	igt_require_f(system(command) == 0,
+		      "Failed to set RTC wake timer.\n");
+}
+
+static void hibernate_system(void)
+{
+	int fd;
+
+	fd = open(SYS_POWER_STATE, O_WRONLY);
+	igt_require_f(fd > 0, "Failed to open /sys/power/state");
+
+	if (write(fd, "disk", 4) != 4) {
+		close(fd);
+		igt_require_f(0, "Failed to write 'disk' to /sys/power/state");
+	}
+	close(fd);
+}
+
+static void ensure_grub_boots_same_kernel(void)
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
+	cmdline_file = fopen(PROC_CMDLINE, "r");
+	igt_require_f(cmdline_file, "Failed to open /proc/cmdline");
+
+	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
+		fclose(cmdline_file);
+		igt_require_f(0, "Failed to read /proc/cmdline");
+	}
+	fclose(cmdline_file);
+
+	/* Parse the kernel image from cmdline */
+	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
+	igt_require_f(kernel_arg, "BOOT_IMAGE= not found in /proc/cmdline\n");
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
+	grub_cfg = fopen(GRUB_CFG_PATH, "r");
+	igt_require_f(grub_cfg, "Failed to open GRUB configuration file");
+
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
+	igt_require_f(kernel_found, "Failed to find matching GRUB entry for kernel: %s\n",
+		      current_kernel);
+
+	/* Set the GRUB boot target using grub-reboot */
+	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
+	igt_require_f(system(command) == 0, "Failed to set GRUB boot target to: %s\n",
+		      grub_entry);
+
+	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
+		  current_kernel, grub_entry);
+}
+
+static void hibernate_autoresume(int resume_delay)
+{
+	check_hibernation_support();
+	set_rtc_wake_timer(resume_delay);
+	ensure_grub_boots_same_kernel();
+	hibernate_system();
+}
+
 static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 {
 	int i;
@@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
 		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
+			if (data->do_hibernate)
+				hibernate_autoresume(30);
+			else
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+							      SUSPEND_TEST_NONE);
 
 			/* on resume check flat ccs is still compressed */
 			if (is_xe_device(data->drm_fd) &&
@@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 		data->user_seed = true;
 		data->seed = strtoul(optarg, NULL, 0);
 		break;
+	case 'r':
+		data->do_hibernate = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1056,9 +1211,10 @@ static data_t data;
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


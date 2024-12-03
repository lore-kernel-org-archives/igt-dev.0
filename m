Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49938E6C61A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 09:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B98A10E99C;
	Tue,  3 Dec 2024 09:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+nBQrQ2";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914D110E99C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 09:20:04 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-215bebfba73so4369695ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Dec 2024 01:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733217604; x=1733822404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEtONwicdleHEYgZ+zS5glyvGmPXjpZPRzU/fEMJ38w=;
 b=d+nBQrQ2ttL6jSN//thOINLCrDQc2rJ6kmR1FlPTcrazUJyFANrsTTV97h0XMn4u44
 AA0GZe+nCCP7cZZu4eixro2e36jBV2R1hXsf12B3V47dFhEIwHrNP+vGMopJ50fRq1EJ
 4rwN+89Q4swoqcjjEObZwcRNKj5489k54/f35TAnBo3p2k4A2pslYQ3o6B6lfwx5MRM+
 q4AHN9uBMjcFw6TgzvMi5xxvC6xojFl+hjORXi+6fG9BB/fJgxSELmc02UyCo0i5yH9r
 sXEdYLGE78n8SgzeSE2lQMuSzivMdrQbcaX6x6ZUv1A4tfaHnb5byJg3Tj0s4KC8XKiK
 6fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733217604; x=1733822404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEtONwicdleHEYgZ+zS5glyvGmPXjpZPRzU/fEMJ38w=;
 b=tGNZKa+JXcY/shdPsQIwiYhN13d4fHpxSSn6wDlIgfoEx+GSKo2JIgAUtgHvPrFnZc
 TnFALpqac/hLHFmVaLvdZyJ9ve755Z/XB5VhlxaP+G/2oZb77rZj/pmrUEr7S/h552oq
 xs5oWRH+RV2q9+ryE9nIYV9yKpInWFGkpH4aMEhHEk8vucNzo9whEA+xCcpvdexsPdyH
 Q79mo8z4sqBCA9LAAehMdNn+DDxHUlImbhs2n7izqai0TVhGQoIXiw+puCJtpzyx4/N9
 SNTFZfyp5TTFuIwGqCRjgJlN51x59LKWrl7NA0qQSPYz3LwSVXgo1/peRuLy+5PtYPR3
 a0iQ==
X-Gm-Message-State: AOJu0Yyz3h2qA83trLriOynPYA/C+cVZcRPe4avztBLf5+UTy0tcaLHi
 TuKNsGZUtmkoe7skVf0LcBRcn9U7G8EylrY3Ap0Gb+xYuT0e9HYs0ZC/Detk
X-Gm-Gg: ASbGnculWPX08sWxxifTHUtfSGXhnv+da8b4A/nzk2l/OMOAqJigeZaA4iFoc3ZnXv+
 SYdE7so/CyxrSvk+4a9JOVrPzQUvS5ScdoYeS5nX0c5Rn2Xx2ionL+l2MkGZBJJB0Dc2B2OhsoG
 wHN+wmRr/cM7UIWjjwuhfhpR7joQizXesU4RuNIsYU9APEV3BzHkXTKrvWJE7HbGqplnAt0V6f1
 S3fAdRT+4DrESYt9qrqJ5pufy7iB+8e18DybfFURfCKrlhYCs0Oa+8=
X-Google-Smtp-Source: AGHT+IEwPWJvnJvFPT/G3CJOf2pwih+ZvERp4LFePG8NaZgD9OJabh4M0UiQ3TfT+cO8ejlC9s7Nbg==
X-Received: by 2002:a17:902:e810:b0:215:9d29:9724 with SMTP id
 d9443c01a7336-215bd11c71cmr22740945ad.38.1733217603555; 
 Tue, 03 Dec 2024 01:20:03 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215898c3b7bsm37350655ad.173.2024.12.03.01.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:20:03 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_pm: Add helpers for hibernating kernel
Date: Tue,  3 Dec 2024 11:24:17 +0200
Message-ID: <20241203092418.3454357-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
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

Here added

igt_pm_check_hibernation_support()
igt_pm_ensure_grub_boots_same_kernel()

to check if kernel is configured for resuming from hibernation
and helper to set grub booting currently run kernel on next reboot.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_pm.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |   2 +
 2 files changed, 157 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1a5d9c42b..2055996bc 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1470,3 +1470,158 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
 	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
 }
+
+/**
+ * igt_pm_check_hibernation_support:
+ *
+ * Return: True if kernel is configured with resume point for hibernate.
+ */
+bool igt_pm_check_hibernation_support(void)
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
+ * igt_pm_ensure_grub_boots_same_kernel:
+ *
+ * Return: True if kernel was found and set for next reboot.
+ */
+bool igt_pm_ensure_grub_boots_same_kernel(void)
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
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 6b428f53e..7cc774e85 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -97,5 +97,7 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
+bool igt_pm_check_hibernation_support(void);
+bool igt_pm_ensure_grub_boots_same_kernel(void);
 
 #endif /* IGT_PM_H */
-- 
2.45.2


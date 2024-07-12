Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5E5C3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 03:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAD410E82A;
	Fri, 12 Jul 2024 03:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9MN84Ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192110E82A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720754054; x=1752290054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kppSPbXmJVMUxiaWhu07F/Hb2+RVpTrHafdCD1vjpDE=;
 b=N9MN84Ec1H0+QIolGJCkWXuS1G3e5MHEDiDnoraE1R45ARH3a5eW7tCs
 CH4ATMK+OJwwSH8mZFXo2V7zhUcV3EfwequRj37PnPDuwN0PlMXRsEzHM
 6DXWOA+qFt7mi60srZb83Mz0xHxl5lKWYbuBkX6KMkhtrlK6n3/tVQiR5
 2w2b5FhNGol8pzriKBaJeaVuY2dzM3URaHog0uH7ZwX8Kgn/tPQAteK2F
 XoDgSczwAQzSPWE7Hs9W7P1aRZ95YlQRQ9dqMOOLUhUH9tRBKldlB4S4t
 WqV1NTtMS6aju3Omt6BRNZFkmd4rCQY5pNME7aOSpaHBfjoOXot/GEAF7 g==;
X-CSE-ConnectionGUID: PieN+piCSRCjoJsvuWU01w==
X-CSE-MsgGUID: gKhejBYSSl6YE+JnGsBe1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29574138"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="29574138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 20:14:14 -0700
X-CSE-ConnectionGUID: 1aKFFSrMQx+m2m6ipkGcgw==
X-CSE-MsgGUID: hhOdeydeSQmd02vpreYJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48665353"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 11 Jul 2024 20:14:10 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v5 1/2] lib/igt_sysfs: Implement dynamic adjustment of
 debug log level
Date: Fri, 12 Jul 2024 08:44:17 +0530
Message-Id: <20240712031418.762175-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712031418.762175-1-pranay.samala@intel.com>
References: <20240712031418.762175-1-pranay.samala@intel.com>
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

Adjust debug log levels dynamically to prevent machine
disk overflow during excessive test debug logs.

Introduce function to modify log levels as needed,
with an exit handler restoring default settings post-test.

v2:
- Using proper function name to represent its
  functionality (Bhanu)
- Added Documentation for each functions (Bhanu)
- Removed the magic number and instead reading the
  default value first (Bhanu)
- Using recommended apis for better handling (Bhanu)

v3:
- Adding module drm_open_param function to open
  the sysfs directory (Bhanu)
- Reducing the current drm loglevel by step value
  to make it more robust (Bhanu)

v4:
- Remove all the extra new lines (Bhanu)
- Remove the unused declaration (Bhanu)
- Edit API to only update the requested drm debug
  log value from the caller (Bhanu)

v5:
- Add TODO for multiple exit handler installation (Bhanu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |   5 +++
 2 files changed, 113 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ffeec1ca2..42b2af41a 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -412,6 +412,114 @@ int igt_sysfs_get_num_gt(int device)
 	return num_gts;
 }
 
+/**
+ * igt_sysfs_drm_module_params_open:
+ *
+ * This opens the sysfs directory corresponding to drm module
+ * parameters.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_sysfs_drm_module_params_open(void)
+{
+	char path[] = "/sys/module/drm/parameters";
+
+	if (access(path, F_OK))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
+static int log_level = -1;
+
+/**
+ * igt_drm_debug_level_get:
+ *
+ * This reads the current debug log level of the machine on
+ * which the test is currently executing.
+ *
+ * Returns:
+ * The current log level, or -1 on error.
+ */
+int igt_drm_debug_level_get(int dir)
+{
+	char buf[20];
+
+	if (log_level >= 0)
+		return log_level;
+
+	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
+		return -1;
+
+	return atoi(buf);
+}
+
+/**
+ * igt_drm_debug_level_reset:
+ *
+ * This modifies the current debug log level of the machine
+ * to the default value post-test.
+ *
+ */
+void igt_drm_debug_level_reset(void)
+{
+	char buf[20];
+	int dir;
+
+	if (log_level < 0)
+		return;
+
+	dir = igt_sysfs_drm_module_params_open();
+	if (dir < 0)
+		return;
+
+	igt_debug("Resetting DRM debug level to %d\n", log_level);
+	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_assert(igt_sysfs_set(dir, "debug", buf));
+
+	close(dir);
+}
+
+static void igt_drm_debug_level_reset_exit_handler(int sig)
+{
+	igt_drm_debug_level_reset();
+}
+
+/**
+ * igt_drm_debug_level_update:
+ * @debug_level: new debug level to set
+ *
+ * This modifies the current drm debug log level to the new value.
+ */
+void igt_drm_debug_level_update(unsigned int new_log_level)
+{
+	char buf[20];
+	int dir;
+
+	dir = igt_sysfs_drm_module_params_open();
+	if (dir < 0)
+		return;
+
+	log_level = igt_drm_debug_level_get(dir);
+	if (log_level < 0) {
+		close(dir);
+		return;
+	}
+
+	igt_debug("Setting DRM debug level to %d\n", new_log_level);
+	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	igt_assert(igt_sysfs_set(dir, "debug", buf));
+
+	close(dir);
+
+	/*
+	 * TODO: Check whether multiple exit handlers will get installed,
+	 * if we call this api multiple times
+	 */
+	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 6c604d939..5d050c786 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -138,6 +138,11 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
+void igt_drm_debug_level_update(unsigned int new_log_level);
+void igt_drm_debug_level_reset(void);
+int igt_drm_debug_level_get(int dir);
+int igt_sysfs_drm_module_params_open(void);
+
 /**
  * igt_sysfs_rw_attr:
  * @dir: file descriptor for parent directory
-- 
2.34.1


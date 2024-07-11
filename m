Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B6C3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 04:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAF410E27F;
	Thu, 11 Jul 2024 04:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBvPrrbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670D910E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 04:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720671235; x=1752207235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K99s9AduGBntowaeuh98XEsaze0fypxfLykOOnhKuy8=;
 b=cBvPrrbft3eg2Kc6CSByOInbb4+Le+xdEWpvbeDa8TCPSVrnhbDJPBpe
 TnW9YFGGJiS8iKnchWXCyk9fx5oG5833qu6xyuzQghQniGeADmYse+c+l
 0uePGAME76fqmUdeI48PuHC8E3Qp3eb+ldoG9qReUsMtpdiAXVGbkbMP5
 6qR9XhoY+cv4crC4FKtFdDDIuTozG0ucuvwX/eM1YCzn0fAPNy+wZ+3jV
 f0ZEDh1Hg9oF7iZua5T2wvUn9AuNaOpZe2SKpVxzr7qy/KCEKRAIgmFb3
 NuJnohNm9wHQwKJ8qAXfsGUAI0pHftuv9T0l4TWBQ7qzwmvneQleS4YxQ g==;
X-CSE-ConnectionGUID: p+QXDMGmRcSMvv9J/v5sfw==
X-CSE-MsgGUID: IMkZiPJLSoi4Q2jw/v6RZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17645490"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17645490"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 21:13:55 -0700
X-CSE-ConnectionGUID: NN7qfE+8SG2c7gFuflC8tw==
X-CSE-MsgGUID: 2gSg3tiHRGOzHnRmugfgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48404920"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 21:13:52 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/3] lib/igt_sysfs: Implement dynamic adjustment of
 debug log level
Date: Thu, 11 Jul 2024 09:43:53 +0530
Message-Id: <20240711041355.749937-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711041355.749937-1-pranay.samala@intel.com>
References: <20240711041355.749937-1-pranay.samala@intel.com>
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

v3:
- Adding module drm_open_param function to open
  the sysfs directory (Bhanu)
- Reducing the current drm loglevel by step value
  to make it more robust (Bhanu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |   5 +++
 2 files changed, 114 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ffeec1ca2..d29e0299c 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -49,6 +49,8 @@
 #include "igt_io.h"
 #include "intel_chipset.h"
 
+#define PATH "/sys/module/drm/parameters/debug"
+
 /**
  * SECTION:igt_sysfs
  * @short_description: Support code for sysfs features
@@ -412,6 +414,113 @@ int igt_sysfs_get_num_gt(int device)
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
+
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
+
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
+
+void igt_drm_debug_level_update(unsigned int step)
+{
+	char buf[220];
+	int dir, new_log_level;
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
+	new_log_level = log_level - step;
+	igt_debug("Setting DRM bebug level to %d\n", new_log_level);
+	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	igt_assert(igt_sysfs_set(dir, "debug", buf));
+
+	close(dir);
+	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 6c604d939..a276c6ed1 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -138,6 +138,11 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
+void igt_drm_debug_level_update(unsigned int debug_level);
+void igt_drm_debug_level_reset(void);
+int igt_drm_debug_level_get(int dir);
+int igt_sysfs_drm_module_params_open(void);
+
 /**
  * igt_sysfs_rw_attr:
  * @dir: file descriptor for parent directory
-- 
2.34.1


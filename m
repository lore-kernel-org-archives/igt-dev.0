Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC26C3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 08:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7710E6E9;
	Wed, 10 Jul 2024 08:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCwH+Ubg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29F10E6E9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720601250; x=1752137250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OcZpcobaJ+rP5jPAW1gejCQz11FHTi70fHOqMd1sbwU=;
 b=NCwH+UbgWMVLoQjTQZnQHp7XeQ2QjGknob16ZrufCTbWd4CZz/HvnX5z
 FKS3mobNsKnx3F5FP4vcgfukGNVVkePndLCF0tY5aU/VwgexVUgmtXsdz
 tAPqDDCMcH6iWImAvlGqyD9wq4T089WPlhkIZxrXrv+BJxRPGj9LhBlUX
 xcgUz1u0WSWZqeJWaU9nd/o2a26GLv4mPWxR3G/P7WMQCBuZ6TGVRoTJK
 AHlJfLfioWoV6wq7kDNNPUXNiBcYpJCNmqj/uTlsFvHpBB8i6/CH+z6Rn
 dkfKuMXHOhSyHAeuvpctKaPKGbmRR20pqIm4VJNiUnYKmCbGQLn12Z/xh g==;
X-CSE-ConnectionGUID: kegd+3LEQbuPPmm1fomekg==
X-CSE-MsgGUID: GCcNayyXSjq+JY4/lTJ2ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35341110"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="35341110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 01:43:54 -0700
X-CSE-ConnectionGUID: GSRSiRF3SK+oU5j9ulXK5A==
X-CSE-MsgGUID: G6N/Yq+qTDeB4ojbv80M9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48120795"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 01:43:51 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] lib/igt_sysfs: Implement dynamic adjustment of
 debug log level
Date: Wed, 10 Jul 2024 14:13:57 +0530
Message-Id: <20240710084358.744278-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710084358.744278-1-pranay.samala@intel.com>
References: <20240710084358.744278-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  4 +++
 2 files changed, 79 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ffeec1ca2..a3e833798 100644
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
@@ -412,6 +414,79 @@ int igt_sysfs_get_num_gt(int device)
 	return num_gts;
 }
 
+static int log_level = -1;
+
+/**
+ * igt_debug_level_init:
+ *
+ * This reads the current debug log level of the machine on
+ * which the test is currently executing.
+ *
+ * Returns:
+ * The current log level, or -errno on error.
+ */
+
+int igt_debug_level_init(void)
+{
+	char buf[20];
+	int dir = open(PATH, O_WRONLY);
+
+	if (dir < 0)
+		return -errno;
+
+	igt_assert(igt_sysfs_read(dir, PATH, buf, sizeof(buf) - 1) > 0);
+	log_level = atoi(buf);
+	close(dir);
+	return log_level;
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
+	int debug_dir = open(PATH, O_WRONLY);
+
+	if (debug_dir < 0)
+		return;
+
+	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Resetting Debug value\n");
+	igt_assert_eq(igt_sysfs_write(debug_dir, PATH, buf, strlen(buf)), strlen(buf));
+}
+
+static void igt_debug_exit_handler(int sig)
+{
+	igt_drm_debug_level_reset();
+}
+
+void igt_drm_debug_level_decrement(unsigned int step)
+{
+	char buf[220];
+	int debug_dir = open(PATH, O_WRONLY);
+	int new_log_level;
+
+	if (debug_dir < 0)
+		return;
+
+	if (log_level == -1)
+		return;
+
+	new_log_level = log_level - step;
+	igt_debug("Setting Debug value to %d\n", new_log_level);
+	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	igt_assert_eq(igt_sysfs_write(debug_dir, PATH, buf, strlen(buf)), strlen(buf));
+
+	close(debug_dir);
+	igt_install_exit_handler(igt_debug_exit_handler);
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 6c604d939..2c4e34714 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -138,6 +138,10 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
+void igt_drm_debug_level_decrement(unsigned int step);
+void igt_drm_debug_level_reset(void);
+int igt_debug_level_init(void);
+
 /**
  * igt_sysfs_rw_attr:
  * @dir: file descriptor for parent directory
-- 
2.34.1


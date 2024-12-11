Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32063E77182
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 11:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54B210E3E2;
	Wed, 11 Dec 2024 11:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AciQMB8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC82910E3E2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733917271; x=1765453271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MBrjzyxI/kZiLWHrUuGpV8TgqApQ/Umz5FiAVYEIcqY=;
 b=AciQMB8CErjA4oL2/w2q/3rysOYE7cm9AIzsDUPTMfYpWPBl60RdsN4G
 Y14VLgkIRshVFndR4ehkR023fS+AVno95XulwSctdOy4V/uuj7uLn73It
 0G4fgF8Mi7zGP+b2TfUD69jRP08dIxyTUyoPC3VAF5y++2d0cQGcw3eEL
 jmMEGqjXmYssl5vNu/yKIIcOknRwu/bPRKelf/sBE9szSlvArFNLOdUQO
 YUES1MvJFrRQXEei4g5fJhWui7wzPQ9y0pONQGrHXevLiWBXtaOj8J0IT
 x6tORlYtmc2SkuLTgGdVqWLwV/xylXZ5SMEICiTJJQGZsliT1osEdUaR+ w==;
X-CSE-ConnectionGUID: xOJc/hdtR62ClZN9V6VrVA==
X-CSE-MsgGUID: on8Y0am1SXGWgM9L09MTWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33625087"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33625087"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:11 -0800
X-CSE-ConnectionGUID: MYVyCra/RD+Bw+MKLTuhIg==
X-CSE-MsgGUID: 2qkQtkMBTB26cKQjQDcBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99857035"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:40:59 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/4] lib: Export xe_engine_class_to_str function
Date: Wed, 11 Dec 2024 12:40:42 +0100
Message-Id: <20241211114044.210562-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
References: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
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

Define xe_engine_class_to_str as library function in xe_query.h and change its name to
xe_engine_class_short_string so it matches already defined xe_engine_class_string.
Replace all uses of xe_engine_class_to_str within igt_sysfs.c.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/igt_sysfs.c   | 30 ++++++++----------------------
 lib/xe/xe_query.c | 25 +++++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index eaf8fd882..2e4c2ee63 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -48,6 +48,7 @@
 #include "igt_device.h"
 #include "igt_io.h"
 #include "intel_chipset.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:igt_sysfs
@@ -291,22 +292,6 @@ bool xe_sysfs_gt_has_node(int xe_device, int gt, const char *node)
 	return has_node;
 }
 
-static const char *xe_engine_class_to_str(__u16 class)
-{
-	static const char * const str[] = {
-		[DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
-		[DRM_XE_ENGINE_CLASS_COPY] = "bcs",
-		[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
-		[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
-		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
-	};
-
-	if (class < ARRAY_SIZE(str))
-		return str[class];
-
-	return "unk";
-}
-
 /**
  * xe_sysfs_engine_path:
  * @xe_device: fd of the device
@@ -331,7 +316,8 @@ xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
 		return NULL;
 
 	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
-		 major(st.st_rdev), minor(st.st_rdev), tile, gt, xe_engine_class_to_str(class));
+		 major(st.st_rdev), minor(st.st_rdev), tile, gt,
+		 xe_engine_class_short_string(class));
 
 	if (!access(path, F_OK))
 		return path;
@@ -1567,14 +1553,14 @@ bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, c
 	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
 
 	if (engines_fd == -1) {
-		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_short_string(class), gt);
 
 		return false;
 	}
 
 	if (!__igt_sysfs_get_u32(engines_fd, property, value)) {
 		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
-			  xe_engine_class_to_str(class), gt);
+			  xe_engine_class_short_string(class), gt);
 		close(engines_fd);
 
 		return false;
@@ -1606,14 +1592,14 @@ bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, c
 	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
 
 	if (engines_fd == -1) {
-		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_short_string(class), gt);
 
 		return false;
 	}
 
 	if (old_value && !__igt_sysfs_get_u32(engines_fd, property, old_value)) {
 		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
-			  xe_engine_class_to_str(class), gt);
+			  xe_engine_class_short_string(class), gt);
 		close(engines_fd);
 
 		return false;
@@ -1621,7 +1607,7 @@ bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, c
 
 	if (!__igt_sysfs_set_u32(engines_fd, property, new_value)) {
 		igt_debug("Failed to write %s property of %s on gt%d.\n", property,
-			  xe_engine_class_to_str(class), gt);
+			  xe_engine_class_short_string(class), gt);
 		close(engines_fd);
 
 		return false;
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 73d2734e2..6a7b08006 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -241,6 +241,31 @@ const char *xe_engine_class_string(uint32_t engine_class)
 	}
 }
 
+/**
+ * xe_engine_class_short_string:
+ * @engine_class: engine class
+ *
+ * Returns short name for engine class or 'unknown' otherwise.
+ */
+const char *xe_engine_class_short_string(uint32_t engine_class)
+{
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return "unknown";
+	}
+}
+
 static struct xe_device_cache {
 	pthread_mutex_t cache_mutex;
 	struct igt_map *map;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 30ea5ad41..a84a6bfa5 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -114,6 +114,7 @@ uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
+const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
-- 
2.34.1


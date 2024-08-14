Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707ADC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 09:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFDB10E43E;
	Wed, 14 Aug 2024 09:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3aAs16B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6685610E43E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723626117; x=1755162117;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yRnVvujGtTfO8lepnKlapIR5D//UPvirpydxM67MjJ4=;
 b=U3aAs16BrWxeorMlT2zC9ZOIc4XlW8fkeEvkrVq7dOLPU/hOEFeKl/Wg
 S9VeJfwkv7R2d394AuMflruXgL1U6FL9cgdW//i+HhZFVxwz0Z9+YA8TS
 T4p0ISgnZC7TYaQl57XVCzGMg7peDBGWixtm7VR2QOcWZ6SzqstsZSwIT
 sy3tTu4DeUuEMiL/hCmojAYwL5FdLmOoiluu74Nyzmt3FRgyv3ZF+s4JS
 w0dNHMpd72+8h07sdI2yDWUVjFpiZUpSQrW0R4+OqAuvlbfe7DFURNFz0
 wlQrmMcFNa+myvHENWveWVXb+MMF0mW6nEUK5HP5YQGw6R7zf1/PmgSVM w==;
X-CSE-ConnectionGUID: Unqy7jZ2RLmO377jr+Fxmg==
X-CSE-MsgGUID: I2NbCL4LRUWK3SOoTPFHFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21686408"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="21686408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:01:56 -0700
X-CSE-ConnectionGUID: 2nBcGb54QTSQDtcbVZAEQA==
X-CSE-MsgGUID: Gq7M8N72TeW0D11bDIHPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58904507"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa009.jf.intel.com with ESMTP; 14 Aug 2024 02:01:54 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH v2] lib/igt_sysfs: update igt_sysfs_engines to run dynamic
 tests with its associated engine class.
Date: Wed, 14 Aug 2024 14:31:52 +0530
Message-Id: <20240814090152.21793-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Correlate updates in sysfs engines queried and the work load submitted
to a engine, enhancing igt_sysfs_engines so that each update in sysfs
engine will corelates to it corresponding engine class.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/igt_sysfs.c                      | 39 +++++++++++++++++++++++++---
 lib/igt_sysfs.h                      |  4 +--
 tests/intel/xe_exec_queue_property.c |  7 ++---
 tests/intel/xe_sysfs_defaults.c      |  5 ++--
 tests/intel/xe_sysfs_scheduler.c     | 10 ++++---
 5 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2863e22b5..aec0bb53d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1210,6 +1210,32 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert(!ret);
 }
 
+/**
+ * xe_get_engine_class:
+ * @name: de_d_name that we get from igt_sysfs_engine.
+ *
+ * It returns engine class corresponding to the engine dir from igt_sysfs_engines.
+ *
+ */
+static uint16_t xe_get_engine_class(char *name)
+{
+	uint16_t class;
+
+	if (strcmp(name, "rcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_RENDER;
+	} else if (strcmp(name, "bcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_COPY;
+	} else if (strcmp(name, "vcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	} else if (strcmp(name, "vecs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	} else if (strcmp(name, "ccs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_COMPUTE;
+	}
+
+	return class;
+}
+
 /**
  * igt_sysfs_engines:
  * @xe: fd of the device
@@ -1220,11 +1246,12 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
  * It iterates over sysfs/engines and runs a dynamic engine test.
  *
  */
-void igt_sysfs_engines(int xe, int engines, const char **property,
-		       void (*test)(int, int, const char **))
+void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
+		       void (*test)(int, int, const char **, uint16_t, int))
 {
 	struct dirent *de;
 	DIR *dir;
+	uint16_t class;
 
 	lseek(engines, 0, SEEK_SET);
 
@@ -1251,7 +1278,13 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 				igt_require(fstatat(engine_fd, property[2], &st, 0) == 0);
 			}
 			errno = 0;
-			test(xe, engine_fd, property);
+
+			if (all) {
+				class = xe_get_engine_class(de->d_name);
+				test(xe, engine_fd, property, class, gt);
+			} else {
+				test(xe, engine_fd, property, 0, 0);
+			}
 		}
 		close(engine_fd);
 	}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 27031a015..2a1e3b1bf 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -163,8 +163,8 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
-void igt_sysfs_engines(int xe, int engines, const char **property,
-		       void (*test)(int, int, const char **));
+void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
+		       void (*test)(int, int, const char **, uint16_t, int));
 
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
 int xe_sysfs_gt_open(int xe_device, int gt);
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 3edab0af5..25a7e7abb 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -64,7 +64,8 @@ static void test_set_property(int xe, int property_name,
 					     &exec_queue_id), err_val);
 }
 
-static void test_property_min_max(int xe, int engine, const char **property)
+static void test_property_min_max(int xe, int engine, const char **property,
+				  uint16_t class, int gt)
 {
 	unsigned int max;
 	unsigned int min;
@@ -198,7 +199,7 @@ igt_main
 {
 	static const struct {
 		const char *name;
-		void (*fn)(int, int, const char **);
+		void (*fn)(int, int, const char **, uint16_t, int);
 	} tests[] = {{"property-min-max", test_property_min_max}, {} };
 
 	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
@@ -257,7 +258,7 @@ igt_main
 						engines_fd = openat(gt_fd, "engines", O_RDONLY);
 						igt_require(engines_fd != -1);
 
-						igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+						igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
 						close(engines_fd);
 						close(gt_fd);
 					}
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 1777158d5..393e56651 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -28,7 +28,8 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
-static void test_defaults(int xe, int engine, const char **property)
+static void test_defaults(int xe, int engine, const char **property,
+			  uint16_t class, int gt)
 {
 	struct dirent *de;
 	uint64_t property_value;
@@ -81,7 +82,7 @@ igt_main
 			engines_fd = openat(gt_fd, "engines", O_RDONLY);
 			igt_require(engines_fd != -1);
 
-			igt_sysfs_engines(xe, engines_fd, NULL, test_defaults);
+			igt_sysfs_engines(xe, engines_fd, 0, 0, NULL, test_defaults);
 
 			close(engines_fd);
 			 close(gt_fd);
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 979ce95d2..947dbdbc9 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -37,7 +37,8 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
-static void test_invalid(int xe, int engine, const char **property)
+static void test_invalid(int xe, int engine, const char **property,
+			 uint16_t class, int gt)
 {
 	unsigned int saved, set;
 	unsigned int min, max;
@@ -57,7 +58,8 @@ static void test_invalid(int xe, int engine, const char **property)
 	igt_assert_eq(set, saved);
 }
 
-static void test_min_max(int xe, int engine, const char **property)
+static void test_min_max(int xe, int engine, const char **property,
+			 uint16_t class, int gt)
 {
 	unsigned int default_max, max;
 	unsigned int default_min, min;
@@ -113,7 +115,7 @@ igt_main
 {
 	static const struct {
 		const char *name;
-		void (*fn)(int, int, const char **);
+		void (*fn)(int, int, const char **, uint16_t, int);
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
@@ -150,7 +152,7 @@ igt_main
 					engines_fd = openat(gt_fd, "engines", O_RDONLY);
 					igt_require(engines_fd != -1);
 
-					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+					igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
 					close(engines_fd);
 					close(gt_fd);
 				}
-- 
2.39.1


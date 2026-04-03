Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E7ED3940A
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 01:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B110B10E3E8;
	Fri,  3 Apr 2026 01:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cqtis+Sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFB510E43C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775180444; x=1806716444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckhbvDiCOFlkSThIbttxu+EI5ohSmqb3k9mxbRn7luo=;
 b=Cqtis+Sh4VgCbstBPkXiUqdNSVVWlaDMS74i7VhThrT8pt2seMMo64X5
 EWgBqjXtGtmfLuUsixtODvRWbIGd4lQaYKEPoiCaEoFTh+h6MECsAjEkM
 afe3t3Ry+yl9uKD6w8Kr1X4UNxNM6mwSf/qowcUScYL/rF+r0S8e/SuMI
 GiOZ9O2UMwuIAfhJdBYY+Hp2msAizSYn9oNH4A6tfJso9s2u/lcDaZtiJ
 v4BUwGIny/vxs6CKzaWwdldLQNzkr7C2LFt3g5zfLl901O3LVVQgR218b
 tf9tx2gzFBA4GMVc2WQDmAUCNv0dOsgBxCYcqKBTe3C3x+2n8/mSiU4Tf Q==;
X-CSE-ConnectionGUID: VI1J1rD7Rb60RM8RDlaM5Q==
X-CSE-MsgGUID: 88UjaqDkR8GBtzG0jFzeCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="98861872"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="98861872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:40:42 -0700
X-CSE-ConnectionGUID: 5H6pqcHgSjCUKfJBXUyqdA==
X-CSE-MsgGUID: TnPu5Te6RnSWkpwKWZRFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="224291582"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2026 18:40:41 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 3/5] lib/xe: use debugfs info to implement
 xe_engine_class_supports_multi_queue()
Date: Thu,  2 Apr 2026 18:40:38 -0700
Message-ID: <20260403014040.310758-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
References: <20260403014040.310758-1-x.wang@intel.com>
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

Update xe_engine_class_supports_multi_queue() to take a device fd and
use the kernel-reported multi_queue_engine_classes bitmask from debugfs
when available, with a fallback to the hardcoded default for older KMD.

Propagate the new fd argument through the xe_for_each_multi_queue_engine
and xe_for_each_multi_queue_engine_class macros and all their call sites.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_query.c                 | 52 ++++++++++++++++++-------------
 lib/xe/xe_query.h                 |  8 ++---
 tests/intel/xe_exec_multi_queue.c |  4 +--
 tests/intel/xe_exec_threads.c     |  4 +--
 4 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index e13d5e143..3286a3b37 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -215,28 +215,6 @@ static uint16_t xe_device_query_engine_class_mask(int fd, const char *key)
 	return mask;
 }
 
-/**
- * xe_engine_class_supports_multi_queue:
- * @engine_class: engine class
- *
- * Returns true if multi queue supported by engine class or false.
- */
-bool xe_engine_class_supports_multi_queue(uint32_t engine_class)
-{
-	switch (engine_class) {
-		case DRM_XE_ENGINE_CLASS_COPY:
-		case DRM_XE_ENGINE_CLASS_COMPUTE:
-			return true;
-		case DRM_XE_ENGINE_CLASS_RENDER:
-		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
-		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
-			return false;
-		default:
-			igt_warn("Engine class 0x%x unknown\n", engine_class);
-			return false;
-	}
-}
-
 /**
  * xe_engine_class_string:
  * @engine_class: engine class
@@ -338,6 +316,36 @@ bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
 	}
 }
 
+/**
+ * xe_engine_class_supports_multi_queue:
+ * @fd: xe device fd
+ * @engine_class: engine class
+ *
+ * Returns true if multi queue supported by engine class or false.
+ * Uses the kernel-reported bitmask from debugfs when available, otherwise
+ * falls back to the hardcoded per-class default.
+ */
+bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class)
+{
+	struct xe_device *xe_dev = find_in_cache(fd);
+
+	if (xe_dev && xe_dev->multi_queue_engine_class_mask != UINT16_MAX)
+		return !!(xe_dev->multi_queue_engine_class_mask & BIT(engine_class));
+
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_COPY:
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return true;
+	case DRM_XE_ENGINE_CLASS_RENDER:
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return false;
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return false;
+	}
+}
+
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 5c26a3e88..8815c6c66 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -113,10 +113,10 @@ struct xe_device {
 
 #define xe_for_each_multi_queue_engine(__fd, __hwe)	\
 	xe_for_each_engine(__fd, __hwe)			\
-		for_if(xe_engine_class_supports_multi_queue((__hwe)->engine_class))
-#define xe_for_each_multi_queue_engine_class(__class)			\
+		for_if(xe_engine_class_supports_multi_queue(__fd, (__hwe)->engine_class))
+#define xe_for_each_multi_queue_engine_class(__fd, __class)		\
 	xe_for_each_engine_class(__class)				\
-		for_if(xe_engine_class_supports_multi_queue(__class))
+		for_if(xe_engine_class_supports_multi_queue(__fd, __class))
 
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
@@ -161,7 +161,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
-bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
+bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class);
 bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index f987f8d6a..b5ded0633 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -1052,7 +1052,7 @@ int igt_main()
 
 	igt_subtest_f("sanity")
 		xe_for_each_gt(fd, gt)
-			xe_for_each_multi_queue_engine_class(class)
+			xe_for_each_multi_queue_engine_class(fd, class)
 				test_sanity(fd, gt, class);
 
 	igt_subtest_f("exec-sanity")
@@ -1061,7 +1061,7 @@ int igt_main()
 
 	igt_subtest_f("virtual")
 		xe_for_each_gt(fd, gt)
-			xe_for_each_multi_queue_engine_class(class)
+			xe_for_each_multi_queue_engine_class(fd, class)
 				test_exec_virtual(fd, gt, class);
 
 	igt_subtest_f("priority")
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f082a0eda..ab9565beb 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1141,7 +1141,7 @@ static void threads(int fd, int flags)
 	int gt;
 
 	xe_for_each_engine(fd, hwe) {
-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
 			continue;
 		++n_engines;
 	}
@@ -1170,7 +1170,7 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
 			continue;
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A3AD730AF
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 07:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8510E43B;
	Fri,  3 Apr 2026 07:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXU0Xtug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65F010E3D6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775200406; x=1806736406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckhbvDiCOFlkSThIbttxu+EI5ohSmqb3k9mxbRn7luo=;
 b=BXU0XtugopiHAy5Wi6ZJIGh1/exVYflVNAdiohzkOzFgzfI7dmID3hL/
 Bp8WPIyScQavgOsbR9q09brj9ex+rk/DRuARtG7P4A4CiSun0HsudsHic
 3MTPBVlccaNwwv2PxMCpwlleA/ArQ2WndUKhr1h1i0Gx/MU5oU4TxlZW4
 rkghFNUgYx7rXSGS0zH9IoWw10FDp2Nfm1pGnVsfhTdXVFuqGcpYDe3tv
 nb86SJLWMU8/jSzUOhmvH99gNmYgfkn5zB6kaVMcGvo+r3ujrZ2At/MWR
 mIuicXELMilIG01CTxvL83aCfer43Y7t3q7C/os0KlR2sXqhLDUaXwdgP Q==;
X-CSE-ConnectionGUID: 5pQg81OpSmyQw/M5X1Es5Q==
X-CSE-MsgGUID: weLKZmVfTVaZ8XTxJkwj4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76151711"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76151711"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:13:26 -0700
X-CSE-ConnectionGUID: ZDr0+y3kR+++AiJr2eSROA==
X-CSE-MsgGUID: Xfa9RsYZQzGdpVHK9l/UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228819968"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 00:13:25 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 3/4] lib/xe: use debugfs info to implement
 xe_engine_class_supports_multi_queue()
Date: Fri,  3 Apr 2026 00:13:21 -0700
Message-ID: <20260403071322.366766-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403071322.366766-1-x.wang@intel.com>
References: <20260403071322.366766-1-x.wang@intel.com>
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


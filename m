Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C576CFA46C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4484F10E7F7;
	Fri, 21 Nov 2025 03:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMj73+OW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6B510E7F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697447; x=1795233447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZd+C6Ha8kHjuxibZYLLZP6ccVdw0OWPESg4ZQMpffI=;
 b=EMj73+OWrmx3+rACIXCU/0GwKwX0nodr+3XMsbkOPxhPTOcYjzAFSPvo
 v0Dr53DASCWAayars2qjDVzdvsxjqXBahdS3DH/cDJK3d6OvOhE7fo/ja
 9xRjp9LAxcCDdvebl3nwOwo/i7/ZPQ9gp++ZExGyOnK6ETORrtxpqqu6Z
 ablMaIESYpWBNueWdp2HQ9YsI12Dzho4nh+QsbW69Bz2pYKmiDL+LXxcN
 Bi8zd+ovw0zxsF6w0cPuGIPGLt1SIzMWbkwK+49QSTrW/CufbkDAogIuK
 LW32NHDY2MRXP9aSB8qSjr8lLW/XpIL1/kC/v8NmsedxwzYr4YTnq7FmS w==;
X-CSE-ConnectionGUID: E+rMHnkJRjmY+LFUCO50fg==
X-CSE-MsgGUID: DkMo9PkjQH+64kngjimpwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484664"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:26 -0800
X-CSE-ConnectionGUID: Z+lrGYd9RJalVDjedoPbsA==
X-CSE-MsgGUID: lvw1gaaURGCMwQh6fCxs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433467"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 02/19] lib/xe: Add multi-queue helper routines
Date: Thu, 20 Nov 2025 19:57:14 -0800
Message-ID: <20251121035715.767226-23-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add xe_engine_class_supports_multi_queue() function to determine if an
engine class supports multi-queue operations.
Add xe_for_each_multi_queue_engine() helper macro for iterating over
engines that support multi-queue.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_query.c | 22 ++++++++++++++++++++++
 lib/xe/xe_query.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53af86a99..8a67db6a9 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -264,6 +264,28 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
 	return alignment;
 }
 
+/**
+ * xe_engine_class_supports_multi_queue:
+ * @engine_class: engine class
+ *
+ * Returns true if multi queue supported by engine class or false.
+ */
+bool xe_engine_class_supports_multi_queue(uint32_t engine_class)
+{
+	switch (engine_class) {
+		case DRM_XE_ENGINE_CLASS_COPY:
+		case DRM_XE_ENGINE_CLASS_COMPUTE:
+			return true;
+		case DRM_XE_ENGINE_CLASS_RENDER:
+		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			return false;
+		default:
+			igt_warn("Engine class 0x%x unknown\n", engine_class);
+			return false;
+	}
+}
+
 /**
  * xe_engine_class_string:
  * @engine_class: engine class
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 6a97d384a..43db89617 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -94,6 +94,13 @@ struct xe_device {
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
 
+#define xe_for_each_multi_queue_engine(__fd, __hwe)	\
+	xe_for_each_engine(__fd, __hwe)			\
+		for_if(xe_engine_class_supports_multi_queue((__hwe)->engine_class))
+#define xe_for_each_multi_queue_engine_class(__class)			\
+	xe_for_each_engine_class(__class)				\
+		for_if(xe_engine_class_supports_multi_queue(__class))
+
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
 
@@ -131,6 +138,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
+bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84941D3B7F8
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3099D10E49D;
	Tue,  9 Dec 2025 03:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErMqXfBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3CE10E1AC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250544; x=1796786544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8gB2AggHiYI6kWrZ6JwUywIQJOWWcRHBHH9O0quo5Q=;
 b=ErMqXfBQ7YuoWDrOuzeeM7SHMgm1/cfpXQQF712DmBxm4GF2BFOdnPTg
 pNBFdvW9umgYusBKM1B22Mb5ZUj38FSSeiRWwAbNs4bNDvtNBg7Ykdsay
 etUkU4hVfNPr9Nhxc49ik8yLLXy5Wj13oPP0R8C+9nSFYBYNgFlhURci/
 rGOItxWjXckYOrK68dOzJpEOG9uOlgtxAVm+cjyKh7l53zGLg7QPypNOj
 AEFxYK5REAkS8stT6bT4/xG2qGgLqLFIevgO3DmLToO8qaYGRfVz3OXM1
 rsmKKXI2WTiJH6twNhwumrrJf0i6/AgLnLc5eq5wbaQuI37U5LgM3X6Sz Q==;
X-CSE-ConnectionGUID: 7sEnsc21TVqz3q7G1KL8Gg==
X-CSE-MsgGUID: iv0WCmkyRo+fzAJDb/ESCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164317"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:23 -0800
X-CSE-ConnectionGUID: 1668Cd0AQgGN8vTbBhNeQw==
X-CSE-MsgGUID: /x4sm8JESheJZCg9WkPwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570894"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 02/18] lib/xe: Add multi-queue helper routines
Date: Mon,  8 Dec 2025 19:22:08 -0800
Message-ID: <20251209032208.1540217-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_query.c | 22 ++++++++++++++++++++++
 lib/xe/xe_query.h |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 38f8f5595..981d76948 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -133,6 +133,28 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
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
index 8c57bb21d..d7a9f95f9 100644
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
 
@@ -137,6 +144,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
+bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
-- 
2.43.0


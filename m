Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDB9D3B9B8
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E8810E655;
	Wed, 10 Dec 2025 00:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSmAcod1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6D10E646
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327184; x=1796863184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K8gB2AggHiYI6kWrZ6JwUywIQJOWWcRHBHH9O0quo5Q=;
 b=RSmAcod1vh8r2KvfvKaH19NPQEZ2XRBJuO7OlJDiVQhPpYIKCHiYM/tF
 mt2xpDaFGQopKxVF3EA1UNodMxyC/X2QSTrMHb0Q7r+lfDG29ZzANHC7N
 /Wh4CQwkuUMJBYNV+hJwkH9HEmjooldSe3YpwOu8i0FoqmQ7T2I3PGTnV
 EAYblf4d8z4szCNynrnCr3Mxiuvu4q9IZldj/RZb2IzGzUKq2CrEALXYI
 WPm3dAhIl9OLMQzh4syslIYfY6NIgGJFArihwTtAUcx7YV55D4gVHxIhV
 shTkTFPNYu53/6DzgTviCRk4q4qJY2AZbu85b1QAXaTDljeCN6/ln0xpC w==;
X-CSE-ConnectionGUID: eJrE4wyRTo6H//hdW/AfrQ==
X-CSE-MsgGUID: xKlkXs/hSDuka0a40jgKFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180395"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
X-CSE-ConnectionGUID: sXjXss6RRvaJ5LqJkHY+CA==
X-CSE-MsgGUID: jjo6gDftQPymapTEwwDOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421600"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 02/18] lib/xe: Add multi-queue helper routines
Date: Tue,  9 Dec 2025 16:39:37 -0800
Message-ID: <20251210003936.1613078-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6FCCFA02
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18E10E32F;
	Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQOsRm+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8230C10E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935762; x=1793471762;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y61xvAd2YBB1mPXv+wOb2Nry+W8QM1qnXTs7oPKcR7Y=;
 b=VQOsRm+AiGWrZmhlGOPpK0L10EF7wOLtjW3m3jfFnBfmdYhaltx9snTD
 PfWCSwGz7GMl/XCL3KBteVaCjO/wkxHHBX2jxJ36JR29k2SsD7ITjd0P5
 RdbhhY4DKOJJrLMk8D+mAv32tj7CZ67kCEJuIuVGGly1aVWClvv7KXSty
 lJZwXTX2RX/Nqhj2efKOI2KTAZkNpcd4WhSwkP7ONYSVfk2LxxLbwAbBF
 83FzZkRqJItQaSWYZkqYK2fwg6tToi3vE1SoD5IJAPJdamel0GLwjPwsd
 2wL4L7dSoXPBprM0KlJOKURteP64Uxs+ztXo2c/dmJujfWyqshXwGwjNl A==;
X-CSE-ConnectionGUID: M0viW1y0QU+c4GS9MoQ2FQ==
X-CSE-MsgGUID: xNFct28ZS+a6uESRI5M8HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144723"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
X-CSE-ConnectionGUID: fGWhIduGQ0qxtKqPw6NgFQ==
X-CSE-MsgGUID: uiY7YLw5RwSfP0oHks++WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650013"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 02/18] lib/xe: Add multi-queue helper routines
Date: Fri, 31 Oct 2025 11:35:39 -0700
Message-ID: <20251031183555.1882721-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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
index a89e0b980..653a3d9e6 100644
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
index 715b64e2f..1debc96d5 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -90,6 +90,13 @@ struct xe_device {
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
 
@@ -126,6 +133,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
+bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
-- 
2.43.0


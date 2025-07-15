Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31C3C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 22:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B710E38B;
	Tue, 15 Jul 2025 22:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWA5PS4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3710E38B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752617283; x=1784153283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yQuhU/oU+RUBkv76ICpHAwON/esSgZOzyu5tAFIDSkA=;
 b=mWA5PS4kvHuQNol2SoX0CqXOZckvpSLfqbOXSGndhPnj32AYbqjDvseV
 1s/I6OIUP+JeHNMODK3woaTc0zigYiXX3W5huVpewaiqIasprExYyOuHX
 1EIl5u7y+iJJSNa0cXtidwI9tuV/YQmOhOtCIS9m2HbJRGTAMtL3qR9zz
 qYhtU7PfDJS9qgsQJzPMnbO3fBTZ2wKBCEK9N3Qi9W0lzEL8bQTlKw53z
 v0noraGj3kkMXeLrmXnDzyXdc2Cwn+tCCKS2e6kgysrXgIq35NkjPjDJ8
 DgXC4tDjHq5Q/uKmG62c0m4rJwJaT0uYyCJSabzrkPb3k7aET7wnhepOs Q==;
X-CSE-ConnectionGUID: L9akyh/RT9qfa9BMSExsEw==
X-CSE-MsgGUID: 7L1SS8PgQXmttdM0y3Ga+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58507228"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58507228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:08:02 -0700
X-CSE-ConnectionGUID: +gFTgG1wQqWmuYWfZOaVyQ==
X-CSE-MsgGUID: DfuZnMb6TG+KIM/kH55rOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="158060589"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:07:59 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar and
 packed YUV formats
Date: Wed, 16 Jul 2025 03:38:09 +0530
Message-ID: <20250715220810.287204-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
References: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
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

Add new helper logic to distinguish between planar/semi-planar and
packed YUV formats. This classification enables more efficient test
coverage by reducing iterations in IGT, allowing tests to focus on
relevant format groups based on their memory layout.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_fb.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  2 ++
 2 files changed, 59 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9fc1bfc65..f68aeaf42 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5044,6 +5044,63 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	}
 }
 
+/**
+ * igt_format_is_planaryuv:
+ * @drm_format: drm fourcc
+ *
+ * This functions returns if @drm_format is planar/semi-planar YUV formats.
+ */
+
+bool igt_format_is_planaryuv(uint32_t drm_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * igt_format_is_yuv:
+ * @drm_format: drm fourcc
+ *
+ * This functions returns if @drm_format is packed YUV formats.
+ */
+
+bool igt_format_is_packedyuv(uint32_t drm_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
+	case DRM_FORMAT_XVYU2101010:
+	case DRM_FORMAT_XVYU12_16161616:
+	case DRM_FORMAT_XVYU16161616:
+	case DRM_FORMAT_Y410:
+	case DRM_FORMAT_Y412:
+	case DRM_FORMAT_Y416:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_XYUV8888:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * igt_format_is_fp16
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d5aa1e88a..ace02a960 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -220,6 +220,8 @@ const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
 bool igt_format_is_yuv_semiplanar(uint32_t format);
+bool igt_format_is_planaryuv(uint32_t drm_format);
+bool igt_format_is_packedyuv(uint32_t drm_format);
 
 uint32_t igt_drm_format_str_to_format(const char *drm_format);
 
-- 
2.43.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A0AD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F5310E357;
	Mon, 19 Jan 2026 04:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtLeKfkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82510E357
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798091; x=1800334091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8S6j3oIs4+U4gZgcHSr9nkf+s3Vo60HedKSE+nb2Vg=;
 b=RtLeKfkBxZAgD6hLakls9i6EYDY4E+NegxFe3ftwaMTkhqZiuoFCscH4
 XyYd8BBFXjNCGKGPhz/Vb+rvicLnhwykxK62XnSbVrmffgTZ7wEmPnSxy
 S6uvQvVO/L2imMYfZ3TiWFa+xVqS93W2vdUE1qO5wUTGTR4etuC8oN+d5
 RW0mKRQwfS3CGTSQi+meQaNa8HO2ePGiD0XQ1s+HdvTaY6XzakrJW+2nU
 9AsxZu031kNXjIsL0dFXrzIi1Po/0c61yc0cvIbF9EuDo+MKs38duMLc/
 zIhuEhd40N4FrKjkIvO39kLsm37Gz5C4HeVAUD42NOy0mSoiNTetXNue+ w==;
X-CSE-ConnectionGUID: 0Q5nAIt7TkK82zscHEIJyw==
X-CSE-MsgGUID: CswAfIblQjGV1hO3Xzbbdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581736"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:10 -0800
X-CSE-ConnectionGUID: ovo1g+rxTaGHCjMfdKsiRQ==
X-CSE-MsgGUID: c7hRxyavRx+3pW6x2Gb2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271084"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:09 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 4/8] lib/igt_fb: Add helper to get bpc from DRM fourcc
Date: Mon, 19 Jan 2026 10:37:28 +0530
Message-ID: <20260119050732.110985-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119050732.110985-1-sowmiya.s@intel.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
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

Introduce igt_drm_format_get_bpc, which returns
the nominal bits per color channel (BPC) for
common RGB DRM fourcc formats.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_fb.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 3a1553d48..b3575d266 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5083,6 +5083,39 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	return 0;
 }
 
+/**
+ * igt_drm_format_get_bpc: Return bits-per-channel for a DRM fourcc format
+ * @drm_format: drm fourcc code
+ *
+ * Returns the nominal bits-per-color-channel (BPC) for the given @drm_format.
+ * This helper is intended for RGB formats and currently covers common packed
+ * and planar RGB(A/X) variants. Non-RGB formats are not yet handled.
+ * Extend as needed to cover additional FOURCCs (including YUV) by
+ * adding explicit cases.
+ */
+int igt_drm_format_get_bpc(uint32_t drm_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return 8;
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return 10;
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		return 16;
+	default:
+		return -1;
+	}
+}
+
 /**
  * igt_format_is_yuv:
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dab..844b27ff2 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -222,6 +222,7 @@ int igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
 /* helpers to handle drm fourcc codes */
 uint32_t igt_bpp_depth_to_drm_format(int bpp, int depth);
 uint32_t igt_drm_format_to_bpp(uint32_t drm_format);
+int igt_drm_format_get_bpc(uint32_t drm_format);
 const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
-- 
2.43.0


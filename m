Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00784C36011
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 20:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFB910E184;
	Thu, 27 Mar 2025 20:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETIW16Dz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41510E086
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 20:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743108807; x=1774644807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ZOnRIt+4MPWAraP2AjzY9pqJ+Pu2yN5Uo6q1Xxr4To=;
 b=ETIW16DziAxf721Ro3MvjR3tqKicvyPxhCDd7SBw8w7INGZ+9bIZv5QE
 qInf/by+OThS5TtRnhZ4OZ2o9e2e5MBnmI2OPzXopxThF0NTzEwMaB5Y8
 C2gnOr3irFPc1Ar/4x2F7MBVmCeTRG2P1RIRs516x8Z2GfBIazyMO9p4j
 wLGjTFBIFGDT0beb2GnRHt8LG58Ti/UxC4oOKyYcYHLKzxNeilOGniNvv
 i1yC2p7Tvs4egl5qBwVpI56FzZg2mOwiZnpwzuvJDEj68Ik+mdcj1vM2V
 2Re6jPrKl8CY2LACRixpddzaT7tcBxeNF1u3B706txGcM0KhmQrKRjEYe w==;
X-CSE-ConnectionGUID: k9w/Ll+DSyqO+MAY5elnnw==
X-CSE-MsgGUID: 7fd2SZCNTmGAj1Ooxhzveg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44478173"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44478173"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:26 -0700
X-CSE-ConnectionGUID: E6csM+y5SIi7DinHvEr4VA==
X-CSE-MsgGUID: Latfo8rgREak9+aYQ767OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125012290"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:24 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for
 Intel scaling
Date: Fri, 28 Mar 2025 02:22:59 +0530
Message-ID: <20250327205301.3400440-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
References: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
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

Add function to verify display mode parameters (horizontal
resolution, vertical resolution, refresh rate) within 4K
limits for scaling operation.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99c8707c7..332f6dbf3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,10 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 
+#define HDISPLAY_SCALING_MAX 3840
+#define VDISPLAY_SCALING_MAX 2160
+#define VREFRESH_SCALING_MAX 60
+
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
 struct igt_connector_attr {
@@ -6998,6 +7002,25 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 	return num_scalers;
 }
 
+/**
+ * is_intel_support_scaling:
+ * @drmModeModeInfo *mode: Pointer to a structure with display mode information.
+ *
+ * Finds the display mode's horizontal resolution, vertical resolution, and refresh
+ * rate are within the specified maximum limits.
+ *
+ * Returns: true on success, false  on failure
+ */
+bool is_intel_support_scaling(drmModeModeInfo *mode)
+{
+	if ((mode->hdisplay <= HDISPLAY_SCALING_MAX) &&
+	    (mode->vdisplay <= VDISPLAY_SCALING_MAX) &&
+	    (mode->vrefresh <= VREFRESH_SCALING_MAX))
+		return true;
+
+	return false;
+}
+
 /**
  * igt_parse_marked_value:
  * @buf: Buffer containing the content to parse
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0381c82ad..0e3d1297d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+bool is_intel_support_scaling(drmModeModeInfo *mode);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0


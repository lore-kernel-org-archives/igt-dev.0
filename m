Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79457C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 17:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316B710E26F;
	Tue,  8 Apr 2025 17:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTprgM3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2AE10E23D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744131856; x=1775667856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwCeiJS7SsFLcXbb/Tq/0HI1FtP/3uSdp7FHX/jh4hU=;
 b=dTprgM3qWyRRTiYylAALwc1VeOvSxkEwAvIweoa+C5bjhb+ZnUAvd9jx
 z4KwpEmkVtWH5JCVBNK/bbm+ASxEMbvD54QXFOeX3WJZEqKESSWQ36jWn
 7sJyrjsVJJsFoOwAUiqna4vauKyC0Lnu5sp6DNwA60mJTpgjApzfQoQed
 nQU5zyRBaVBJFcc4FrePtj+wijLvKknIEACkAsZk+G9AYqQiSjD3rV5DL
 Ku8h+FMXeTuj6OWZ3I0nbYlS8oY5BMQCNV7XpwMfvZI5uW6hXcQtGgNlS
 v2ySmOu6yj5lN1X+9QR1oCVZN+bA+rTQZQXTJJlsQ+uBaNNCQOTcezVkC Q==;
X-CSE-ConnectionGUID: P3UkmBiBQmi5WVrFtTJEgQ==
X-CSE-MsgGUID: cvAjhhnaRy+gr65+KoyRDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45742048"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45742048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:03:53 -0700
X-CSE-ConnectionGUID: SHKFVlOvSKmFlfCdCnNOkw==
X-CSE-MsgGUID: ENeZt3f+S6eHCS2RhXlyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128226574"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 10:03:50 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/3] lib/igt_kms: Add mode restriction check for
 Intel scaling
Date: Tue,  8 Apr 2025 22:33:27 +0530
Message-ID: <20250408170329.523539-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408170329.523539-1-ramanaidu.naladala@intel.com>
References: <20250408170329.523539-1-ramanaidu.naladala@intel.com>
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

Bspec: 49199

v2: Add Bspec number. (Jeevan)

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


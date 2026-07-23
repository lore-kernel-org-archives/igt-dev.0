Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B7C531CF
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 13:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC6210E586;
	Thu, 23 Jul 2026 13:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqJju/aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C599510E589
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784814248; x=1816350248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VSuExhsDc1xbf/FHbiIHyo+UVSiQlydha96wct1DRcw=;
 b=TqJju/awX3OzU2nVlJQBpRkFS5SFeRn1ClJWYhR+QMW+uslzYYYwr1xP
 FEr1YnUW82h+cRfGtL/ruZ9iWkDkd7nQiMiZR4J18JkujPGki7dFSSB/J
 1QBm9ayTI7XolBXvF2TgAfjoa4P+qPncCbfddbnT9Ke4HVOJ3d6NMzc07
 dX8RmXFhRnRXFyARi5sneG/WuDQkh6uJcTKtX+WHDqhL3saJvflXXIagW
 eOTtFA1YzDZcd8MEkm7W4VKgPumg1VPFV63BfyCrWkfvOEXeyDo32S59W
 2VpyjIkjuz12PH5mCvjckrkoy5/rfA2DgSSJixIeQqAxHir2WMB7Lfjry Q==;
X-CSE-ConnectionGUID: Wy6DO9IYS8GnicOXIRwN9A==
X-CSE-MsgGUID: MBjB1qtJTJuV3JD+b5rmkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95823293"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95823293"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:08 -0700
X-CSE-ConnectionGUID: JMIrOJ6qR92dCpn3lMPrtA==
X-CSE-MsgGUID: PBbbvqDXT1atmu8ULVweWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255041855"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:06 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Add platform-specific joiner
 exception mode handling
Date: Thu, 23 Jul 2026 19:13:53 +0530
Message-ID: <20260723134355.337709-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723134355.337709-1-sowmiya.s@intel.com>
References: <20260723134355.337709-1-sowmiya.s@intel.com>
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

On NVL (display_ver=35), a higher max_dotclock causes modes like
6144x3456@60 to pass the standard igt_bigjoiner_possible() checks,
yet the kernel still enables joiner for them. Introduce per-platform
exception mode lists (e.g. nvl_joiner_exception_modes[]) dispatched
via IS_NOVALAKE() in a new mode_needs_joiner_exception() helper, and
wire it into igt_bigjoiner_possible(). Also add IS_NOVALAKE() to
intel_chipset.h as a combined IS_NOVALAKE_S() || IS_NOVALAKE_P() macro.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eefb773b..bfa6dfc0e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7058,6 +7058,52 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
 						   HDISPLAY_5K_PER_PIPE;
 }
 
+struct joiner_mode_exception {
+	uint16_t hdisplay, vdisplay;
+	uint32_t clock;
+};
+
+static bool match_joiner_exception(drmModeModeInfo *mode,
+				   const struct joiner_mode_exception *list,
+				   int count)
+{
+	for (int i = 0; i < count; i++) {
+		if (mode->hdisplay == list[i].hdisplay &&
+		    mode->vdisplay == list[i].vdisplay &&
+		    mode->clock == list[i].clock)
+			return true;
+	}
+
+	return false;
+}
+
+/* NVL: higher max_dotclock allows clocks that still need joiner */
+static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
+	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
+};
+
+/*
+ * mode_needs_joiner_exception - check if a mode requires joiner via explicit exception
+ * @drm_fd: drm file descriptor
+ * @mode: libdrm mode
+ *
+ * On some platforms, a higher max_dotclock means certain modes won't trigger
+ * the standard clock or hdisplay checks even though the kernel enables joiner
+ * for them. Each platform has its own exception list.
+ *
+ * Returns: True if the mode is a known joiner exception, else False.
+ */
+static bool mode_needs_joiner_exception(int drm_fd, drmModeModeInfo *mode)
+{
+	uint16_t dev_id = intel_get_drm_devid(drm_fd);
+
+	if (IS_NOVALAKE_P(dev_id) || IS_NOVALAKE_S(dev_id))
+		return match_joiner_exception(mode, nvl_joiner_exception_modes,
+					      ARRAY_SIZE(nvl_joiner_exception_modes));
+
+	return false;
+}
+
 /**
  * igt_bigjoiner_possible:
  * @drm_fd: drm file descriptor
@@ -7066,13 +7112,15 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
  *
  * Bigjoiner is required when the requested mode exceeds single-pipe
  * platform limits, i.e. hdisplay is above the platform threshold or
- * clock is above @max_dotclock.
+ * clock is above @max_dotclock. On NVL, the higher max_dotclock means
+ * some modes (e.g. 6144x3456@60) need an explicit exception check.
  *
  * Returns: True if mode requires Bigjoiner, else False.
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
+	return (mode_needs_joiner_exception(drm_fd, mode) ||
+		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > max_dotclock);
 }
 
-- 
2.43.0


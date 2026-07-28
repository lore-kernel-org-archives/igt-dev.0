Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0666C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C010E52A;
	Tue, 28 Jul 2026 06:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mep5Mydc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978F910E522
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218422; x=1816754422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oF+N6eevCcMK2YjUlHm5JN0wPstIEgwlE9663w4yYog=;
 b=Mep5Mydc8l1WQNXRFjwrDfbGV+fAcjZzNHwkV602B1/UHLE8ZufnlZZW
 O4I6V9+3Vq642/yfFx4Mv4kyw2VZAXpvWLpeyJNofJDnbNef0WonMKRa2
 9Mywqk8TNH/ZDvazM/i0OSqH3qQ2ADDj5B3n2r3TISn0SIWBJhftNYqFb
 jepND9y0L/IYTm1i6g/McE9597PelPnkzCsO541hnd1c1U3CVBfPetp8z
 YzLmeuLVDUKxwIbcYnVYr09+QVhLrqSt0/+oJhTyZuH+fbnw2BZDTC7Yv
 Dxd4Tl3mQCW+YTKqPEOXAazViP4lTYVG1eXyWZAvjA/3lgnStrKNtip+H Q==;
X-CSE-ConnectionGUID: bquk2fg/RYyiIwwUnzaeZA==
X-CSE-MsgGUID: 8zAjNmHRT4Sxe9EQmVE54A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84921061"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="84921061"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:00:22 -0700
X-CSE-ConnectionGUID: YY4rVuysRYaMoR80UU4Hyw==
X-CSE-MsgGUID: mElwZjw4Rna+g0pCVNZxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="255670892"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:00:19 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add platform-specific joiner
 exception mode handling
Date: Tue, 28 Jul 2026 11:30:02 +0530
Message-ID: <20260728060003.392870-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060003.392870-1-sowmiya.s@intel.com>
References: <20260728060003.392870-1-sowmiya.s@intel.com>
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
via novalake check in a new mode_needs_joiner_exception() helper, and
wire it into igt_bigjoiner_possible().

v2: Replace with display version and add FIXME comments (Santhosh)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5dd4b0c14..d591e696d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7065,6 +7065,60 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
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
+/*
+ * TODO: IGT cannot compute the DSC bubble overhead the driver adds to the
+ * effective pixel rate, since it cannot estimate the DSC parameters -
+ * whether DSC is used and how many slices. On NVL this lets modes like
+ * 6144x3456@60 pass igt_bigjoiner_possible()'s clock/hdisplay checks,
+ * yet the kernel still enables bigjoiner for them.
+ *
+ * Add mode_needs_joiner_exception() as a stopgap.
+ */
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
+	unsigned int disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	if (disp_ver == 35) /* NVL */
+		return match_joiner_exception(mode, nvl_joiner_exception_modes,
+					      ARRAY_SIZE(nvl_joiner_exception_modes));
+
+	return false;
+}
+
 /**
  * igt_bigjoiner_possible:
  * @drm_fd: drm file descriptor
@@ -7079,7 +7133,12 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
+	/**
+	 * FIXME: remove mode_needs_joiner_exception() once IGT can estimate
+	 * DSC parameters accurately
+	 */
+	return (mode_needs_joiner_exception(drm_fd, mode) ||
+		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > max_dotclock);
 }
 
-- 
2.51.0


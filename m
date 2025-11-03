Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C8CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E5D10E3A7;
	Mon,  3 Nov 2025 10:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3HG9U7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEACB10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165275; x=1793701275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVP6lLXMv6pR6u6bq+R+J/LdooKvcDGc99Ngx6mzSIY=;
 b=L3HG9U7kJdfWl1LQa5Z5XfYWWSCaao8GKU3J6Bt83O3V8XonnBVDQFeD
 o08FuABDuF2TKXXHWq4ueI2s2iTq5i1PTPjEfg4m6HmtSlKOhhJ8FPSf4
 qrX59OVnbk2D5o6xHCpXjE7x//SNZxxQlUOiz6sl5SlOxSNr3GYgUkXhl
 qofwX8iT3BzrNY7jqJ4zRGWTTeJ24x0Ja+Z2HTFMXE+6UyXs6DwO6KbQC
 i7uRgU8xSwRRxygzh/yx4v2LWtQvgMRXcAbIuIaJXb+XjjOhp9ku1SZps
 NmtJQZjZonJNu2O6vVo/N5TN13Tt8T0V0mnN2KAFOPT/pb+R0S0HkMDub g==;
X-CSE-ConnectionGUID: 9PNPhSuLQz2Nc7ETNZcNRA==
X-CSE-MsgGUID: lJ1SPYU2RDmpXIvYy5B49Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64162519"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64162519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:15 -0800
X-CSE-ConnectionGUID: d7Y0o95eR/emz6EaMfVw1Q==
X-CSE-MsgGUID: YCwrnhTuR42EoXZvRMpAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120228"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:13 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 5/8] tests/kms_writeback: Add utility function for
 shared logic
Date: Mon,  3 Nov 2025 16:08:39 +0530
Message-ID: <20251103103842.3025204-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
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

Extracted framebuffer creation logic into a separate
function to enable reuse across multiple subtests

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 72d52d694..8f434b3b5 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -507,6 +507,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
+static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_fb_t *output_fb,
+		       uint32_t format, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      input_fb);
+	igt_assert(fb_id >= 0);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      output_fb);
+	igt_assert(fb_id >= 0);
+}
+
 static igt_output_t *list_writeback_modes(igt_display_t *display)
 {
 	for (int i = 0; i < display->n_outputs; i++) {
-- 
2.43.0


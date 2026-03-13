Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B895105F782
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900110EB6A;
	Fri, 13 Mar 2026 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2rTsaqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E32210EB6B
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394377; x=1804930377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m7K4f8kFbRSsH9bFSPAW/a+F7OnMkQIPMCn9Ru7hbok=;
 b=d2rTsaqGq8gFB3G1pFgHB5OJMTZEkLNlp9J4r5OJ85+D08ptGj3oFk+p
 dDh95GAUKOvgMBo1iaK4vSgXDm0qcUhvH0PQQu62ZcIjg7u/OHzn7lrw2
 mjSfKJYWDM7BKGvyJksLJFpYvBH+RY2RlaE9cmx5fzQMwph8O5NqAb/GU
 xCgv5m+wElibZZjmqt92NyVMPyO59i3x2fABTXpWV6sFLftZxMnS4X5TZ
 IxjaDBPncicJoY1IXpqEQbct3VjYEcVda60QJrLJUaeUYPe7Pinf+nnWy
 +K+BrzwgnfyTw1n1dNGcbW3fqjhxKvIPq+pbSQh3dcxIG3LL88tmEgNdd Q==;
X-CSE-ConnectionGUID: 0taEnRL/SHiAD1S46PwO9w==
X-CSE-MsgGUID: HCb2vgOzSuy0zGHYiZtc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85854336"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="85854336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:57 -0700
X-CSE-ConnectionGUID: D8JGvFzXQMK223pJ8OhuQQ==
X-CSE-MsgGUID: o9gdtwmHR7ucTJ9r13gsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="220374213"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 6/8] lib/i915/fbc: pass display to
 intel_fbc_plane_size_supported()
Date: Fri, 13 Mar 2026 11:31:58 +0200
Message-ID: <e682a9813cc0718f199e7cf4a7c9157a47fd2b41.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Converge towards using igt structures instead of plain file descriptors
for clarity and ease of use.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c      | 11 ++++++-----
 lib/i915/intel_fbc.h      |  2 +-
 tests/intel/kms_dirtyfb.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 9e5f91ddaaff..1e0da2cf8cd9 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -101,7 +101,7 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc)
 /**
  * intel_fbc_max_plane_size
  *
- * @fd: fd of the device
+ * @display: display pointer
  * @width: To get the max supported width
  * @height: To get the max supported height
  *
@@ -110,8 +110,9 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc)
  * Returns:
  * None
  */
-static void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
+static void intel_fbc_max_plane_size(igt_display_t *display, uint32_t *width, uint32_t *height)
 {
+	int fd = display->drm_fd;
 	const uint32_t dev_id = intel_get_drm_devid(fd);
 	const struct intel_device_info *info = intel_get_device_info(dev_id);
 	int ver = info->graphics_ver;
@@ -135,7 +136,7 @@ static void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
 /**
  * intel_fbc_plane_size_supported
  *
- * @fd: fd of the device
+ * @display: display pointer
  * @width: width of the plane to be checked
  * @height: height of the plane to be checked
  *
@@ -144,11 +145,11 @@ static void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
  * Returns:
  * true if plane size is within the range as per the FBC supported size restrictions per platform
  */
-bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
+bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height)
 {
 	unsigned int max_w, max_h;
 
-	intel_fbc_max_plane_size(fd, &max_w, &max_h);
+	intel_fbc_max_plane_size(display, &max_w, &max_h);
 
 	return width <= max_w && height <= max_h;
 }
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index b4ba541b908b..2e2786733c5f 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -16,7 +16,7 @@ enum psr_mode;
 bool intel_fbc_supported(igt_crtc_t *crtc);
 bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
-bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
+bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
 
 #endif
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 4c6a787efa8c..3d0ad84aac26 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -105,7 +105,7 @@ static bool check_support(data_t *data)
 			return false;
 		}
 
-		if (!intel_fbc_plane_size_supported(data->drm_fd,
+		if (!intel_fbc_plane_size_supported(&data->display,
 						    data->mode->hdisplay,
 						    data->mode->vdisplay)) {
 			igt_info("Plane size not supported as per FBC size restrictions\n");
-- 
2.47.3


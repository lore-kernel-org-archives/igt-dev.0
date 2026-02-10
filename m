Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53982EA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D335C10E5AD;
	Tue, 10 Feb 2026 15:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeMH6G/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776D10E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737060; x=1802273060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kbxaUW7+5peUEMvP2owkBWsFLk8KFiHoRGiBYBtV2MI=;
 b=ZeMH6G/XIQ8dM77KpbPCevq8hnUM7D9bP0X6x0YvUXfFwEh/eCQDgEyJ
 TFrRIsoCabhPD/q00RDwzIbsEJWilDNS6AMMM9KwNjzQeQ5jbG3vmZsP7
 0mAC3TC3KVDcmTyFRDZPIaKYloeZCakvXxXA5r0m0h2sBxWLZ2l4xHcFp
 tJoIsOCDtt1p1HfZy2AmHkB9PY5nCnu5wl8s+EkiXot9ITbzUZNQxGhPf
 qyF+/XjaISTloAXh4Cl4BMTMBarkyt43PD8pnaxWSSm5RnixguODoP8F+
 2CYtSlHzFVo603ANvAbly+dS7s2UA7TxlBdv/BHyo6X34Ng/31MwWnlu3 w==;
X-CSE-ConnectionGUID: HNxYv+yLRZOgGeJ1Tbqu8Q==
X-CSE-MsgGUID: /lxq0K52QKmMloDR/OSuHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491800"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491800"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:19 -0800
X-CSE-ConnectionGUID: ApehMeWcQeu1Ac1VUnzdEg==
X-CSE-MsgGUID: CwkWfoQ6TJ+aUDh8dGfBjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434352"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 01/11] lib/igt_kms: rename igt_crtc_t crtc_offset member
 to crtc_index
Date: Tue, 10 Feb 2026 17:23:42 +0200
Message-ID: <c252d9f40a620f2e405967d037e6718281a627f2.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
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

The CRTC index is more accurate, and prevailing. Also change the i to
crtc_index in the igt_display_require() initialization loop for
consistency.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 22 +++++++++-------------
 lib/igt_kms.h |  7 ++-----
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1a8bf19c2bd4..d6b47f55ea6c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3143,7 +3143,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
 	igt_crtc_t *crtc;
-	int i;
+	int i, crtc_index;
 	bool is_intel_dev;
 
 	memset(display, 0, sizeof(igt_display_t));
@@ -3190,16 +3190,15 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     "Failed to allocate memory for %d CRTCs\n",
 		     igt_display_n_crtcs(display));
 
-	for (i = 0; i < resources->count_crtcs; i++) {
-		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
+	for (crtc_index = 0; crtc_index < resources->count_crtcs; crtc_index++) {
+		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
 
 		crtc = igt_crtc_for_pipe(display, pipe_enum);
 		crtc->pipe = pipe_enum;
 
 		crtc->valid = true;
-		crtc->crtc_id = resources->crtcs[i];
-		/* offset of a pipe in crtcs list */
-		crtc->crtc_offset = i;
+		crtc->crtc_id = resources->crtcs[crtc_index];
+		crtc->crtc_index = crtc_index;
 	}
 
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -5278,15 +5277,12 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
 
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source)
 {
-	return igt_pipe_crc_new(crtc->display->drm_fd, crtc->crtc_offset,
-				source);
+	return igt_pipe_crc_new(crtc->display->drm_fd, crtc->crtc_index, source);
 }
 
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
 {
-	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd,
-					 crtc->crtc_offset,
-					 source);
+	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd, crtc->crtc_index, source);
 }
 
 const char *igt_crtc_name(igt_crtc_t *crtc)
@@ -5855,7 +5851,7 @@ static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
  */
 void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
 {
-	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, count) == 0);
+	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, count) == 0);
 }
 
 /**
@@ -5869,7 +5865,7 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
  */
 void igt_wait_for_vblank(igt_crtc_t *crtc)
 {
-	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, 1) == 0);
+	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, 1) == 0);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ca039a6bb9e5..087a4fed79f3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -469,9 +469,6 @@ typedef struct igt_plane {
 
 /*
  * This struct represents a hardware pipe
- *
- * DRM_IOCTL_WAIT_VBLANK notion of pipe is confusing and we are using
- * crtc_offset instead (refer people to #igt_wait_for_vblank_count)
  */
 struct igt_crtc {
 	igt_display_t *display;
@@ -497,8 +494,8 @@ struct igt_crtc {
 
 	/* ID of KMS CRTC object */
 	uint32_t crtc_id;
-	/* offset of a pipe in drmModeRes.crtcs */
-	uint32_t crtc_offset;
+	/* CRTC index in drmModeRes.crtcs */
+	uint32_t crtc_index;
 
 	int32_t out_fence_fd;
 };
-- 
2.47.3


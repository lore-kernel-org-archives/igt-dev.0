Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C1C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 06:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FB910E6D5;
	Mon,  4 Mar 2024 06:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9tm8VH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2E10E6D5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709532915; x=1741068915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AayAMf2u30fma8PXVAyYkFJg3GIYcn7IMrCDfnicFcg=;
 b=m9tm8VH6G9LPSk7acsM0FwxmK8CIuZxWaYWnt2EC0/HPc1fX45B3xYyE
 frXY2+XrpqPcZPGJodigZ70ruyHGmoeY+OC2KUHldzZp4s35yQ85vUFKa
 GyQkzIQ21f8mCs3rqPNNqMvak3wDLNFlqj8FGdmPdCPLKyFofpKX2O8Pk
 ipDnXbdTzxSGqn0FJwuzLcO3VBJPzdVXvN72F/PM4wghlBf6aEMTglesY
 8m92fg9aU5oKJzBbBUED17if8h0lOW4duI/jx4QLGYxM/v65ArhqgbCTu
 3EEi8XltsdNutQlIEm8gg5+UAkdPzw7wWQJkOBEXDzoT2raBhc1o6X8Ym Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15414959"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15414959"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 22:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8952689"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 22:15:12 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] HAX:lib/igt_fb: Fix CCS tests
Date: Mon,  4 Mar 2024 11:39:03 +0530
Message-ID: <20240304060903.3184524-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

On Xe device legacy blitter size rules don't need to be applied

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c                             | 18 +++++++++++----
 tests/intel-ci/fast-feedback.testlist    | 28 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 28 ++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 65e0638c2..7316a601d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2513,6 +2513,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	     is_gen12_mc_ccs_modifier(fb->modifier))
 		return false;
 
+	if (is_xe_device(fb->fd))
+		return true;
+
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
 
@@ -2560,8 +2563,7 @@ static bool use_blitter(const struct igt_fb *fb)
 	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
-	       is_xe_device(fb->fd);
+	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
@@ -3058,7 +3060,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 		igt_nouveau_delete_bo(&linear->fb);
 	} else if (is_xe_device(fd)) {
 		gem_munmap(linear->map, linear->fb.size);
-		blitcopy(fb, &linear->fb);
+
+		if (blit->ibb)
+			copy_with_engine(blit, fb, &linear->fb);
+		else
+			blitcopy(fb, &linear->fb);
+
 		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
@@ -3138,7 +3145,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
 		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
 	} else if (is_xe_device(fd)) {
-		blitcopy(&linear->fb, fb);
+		if (blit->ibb)
+			copy_with_engine(blit, &linear->fb, fb);
+		else
+			blitcopy(&linear->fb, fb);
 
 		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
 					     linear->fb.size, PROT_READ | PROT_WRITE);
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0f6a3b882 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -55,6 +55,34 @@ igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs
+igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
+igt@kms_flip_tiling@flip-change-tiling
+igt@kms_plane@pixel-format
+igt@kms_plane@pixel-format-source-clamping
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 17863b6b1..9f65d0995 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -164,6 +164,34 @@ igt@xe_pat@pat-index-xe2
 igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
+igt@kms_async_flips@async-flip-with-page-flip-events
+igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs
+igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs
+igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs
+igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs
+igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs
+igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs
+igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
+igt@kms_flip_tiling@flip-change-tiling
+igt@kms_plane@pixel-format
+igt@kms_plane@pixel-format-source-clamping
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.43.0


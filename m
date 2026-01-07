Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4578CF6C1B
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6335B10E57D;
	Wed,  7 Jan 2026 09:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q78nve7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CBB10E57D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778039; x=1799314039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5r1eul4Qe2t9dzZ2EtQG37G+JqQiScm4MPY4NAV7Tjo=;
 b=Q78nve7P4oULQkFUc7LBUWqct6cWrHk+H70DxzW+/tXyOypOOfutBpgZ
 etSWBsbVdDM5TpT6+bjbe+BRa16wMjpY/G8EFb+9+Lox0480R2RnEX3Dk
 XgMm9e8dbI9LQvBWaitdPRhlESfrY5VEysf6PxdEXWsM0D91FvLMbclP9
 rtSl5vXgGn+QFYb+14bHj0IUZ6C+bbOlRDuk6sI7luujhu52zP693mu2K
 fVcCkGk6tY9cAOUM6NyLFvyNuGKaIjIGhDtwSlZH4fnLzZy2VHPtR0VrG
 C1XRJ6PkrmLN/LD7Ysv4S71b2Qmee/5srdaenzENikJb/xGyEsZR1+KGN Q==;
X-CSE-ConnectionGUID: iid/Cy5uTmekkI5JtkXP5A==
X-CSE-MsgGUID: YTJse6LtQEGO+xa2bJwFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337765"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:16 -0800
X-CSE-ConnectionGUID: +Yfv/U73Skyqg4TD74EhUw==
X-CSE-MsgGUID: 3O+zhpkjRQOoEo1jetdruA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412536"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:14 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH i-g-t,
 v2 1/7] tests/intel/kms_big_fb: NVL supports horizontal flip with
 linear surfaces
Date: Wed,  7 Jan 2026 15:05:29 +0530
Message-Id: <20260107093535.70116-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Starting NVL (display version 35), horizontal flip is supported with
linear surfaces, thus don't skip that case.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/kms_big_fb.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 8a9ed8042..595611c31 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -82,23 +82,24 @@
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation
  *
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with H-flip mode
+ *
  * arg[1]:
  *
  * @4-tiled:            TILE-4 modifier
  * @x-tiled:            TILE-X modifier
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
+ * @linear:             LINEAR modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
  */
 
 /**
- * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
- * Description: Test maximum hardware supported stride length for given combination
- *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
- *              and %arg[3]-rotation with H-flip mode
- *
  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
@@ -1106,15 +1107,18 @@ int igt_main()
 				for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
 					data.rotation = rotations[k].rotation | fliptab[l].flip;
 
-					// this combination will never happen.
-					if (igt_rotation_90_or_270(data.rotation) ||
-					    (fliptab[l].flip == IGT_REFLECT_X && modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR))
+					if (igt_rotation_90_or_270(data.rotation))
 						continue;
 
 					igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
 					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s", modifiers[i].name,
 						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
 						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
+
+						if(fliptab[l].flip == IGT_REFLECT_X &&
+						   modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR)
+							igt_require(intel_display_ver(data.devid) >= 35);
+
 						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 
 						test_scanout(&data);
-- 
2.25.1


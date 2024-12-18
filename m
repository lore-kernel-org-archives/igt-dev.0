Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C002CE7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7968910EC5A;
	Wed, 18 Dec 2024 21:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3UMPhAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8410E6BD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557820; x=1766093820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yp4KjloujhOVQk/RYG0A6ARo8bZJDyE+v9fxBQZauvI=;
 b=Y3UMPhAK2IFK88dQzFX3/mfyEdU28OrlcJDmqX4M1IdRC8f48Qf94Xn7
 Xo3rDYZDp5vm/PZ2IYpiXapVX9W94wk03ZsNppTvQ6jdf6+1nDX3vxZO1
 ByEZBbVQg91v6QbPfNzAB2onnu6yRj1+sWogkDgyhqOSmlPmUDOuzhZfv
 qZei4O7kGuECkLrkiOH2I18i538kVxPmdAqx1eimR25D21eBTFODMsd0x
 uawwao4ymESni+pHK7Mxi/27V0V/mbeWeO0MgGsA4ZK+6TAiib++qeppI
 9cKLVWaR9H4Z1qf2LUNp+wwknwCmbYAy0K4OOJ28GrKaSFXIslz8R52Uz g==;
X-CSE-ConnectionGUID: T+88Y/YpT7aKLBPjqddGyQ==
X-CSE-MsgGUID: YkFVs8tgRPaqcLWgkGDW/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379761"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: lAHYXHEYTFWKh8MtOtuXxw==
X-CSE-MsgGUID: 1hpAZ5bmQNG7JX/SHIkGtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973921"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 6/7] tests/kms_cursor_legacy: flip_vs_cursor_busy_crc
 was requiring any driver but used intel x-tile
Date: Wed, 18 Dec 2024 13:36:53 -0800
Message-Id: <20241218213654.2734573-7-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

switch flip_vs_cursor_busy_crc to use linear framebuffer instead of x-tile. Xe3 not longer supports x-tiled modifier.

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 4e2cfde17..1f082df2d 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1679,7 +1679,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	set_fb_on_crtc(display, pipe, output, &fb_info[0]);
 	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
-				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-- 
2.25.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B7AD6A229
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E379610E2BD;
	Thu, 14 Nov 2024 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kikhlV6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15AB10E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611045; x=1763147045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4gnAqMY4qOGnGJACbKd2MZYLNYVPQJL8mI0reoKpeCA=;
 b=kikhlV6GREqOKTT2/opmCqFvs6NvsAfWElSXLybuPU89c+odtmPodljU
 54nZWl2hxMtqIGCVTOytORd7TsiC/PGOc8o+lFqBuAqhLVUTzIJfQ4Ddp
 9EmzPcno8trVOi1IOAXkjsyuybLRGZr1KuoOlRl6uaOn1vdym2wfkpQRi
 VelGFqbxabzCGhN9LcZhmXCb6tGlnWaWEvftq+/g9heDtOjZY4WTld+NF
 omi8PTa63F7tocu80jcmgzP8+0BuoW4XuMaLZm0sK1w4CpplC+hnKsfJV
 wb3utctklafKvebTrAqtB15Pw3m9LI0dJsgGep0+lnBc3R7bpI8dg7y6Y A==;
X-CSE-ConnectionGUID: cIVkaOIdQD+obUjyse+q4Q==
X-CSE-MsgGUID: x4vfn9B0RG2vbKfTfp6O1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442574"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: wjcMAB6eQyGxazaH2IYu8A==
X-CSE-MsgGUID: EVAq6rcRQyar3qtYxZNpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242110"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 7/9] XE3: tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Date: Thu, 14 Nov 2024 11:03:37 -0800
Message-Id: <20241114190339.3885752-8-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

switch flip_vs_cursor_busy_crc to use linear framebuffer instead of x-tile

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
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


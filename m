Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED977D637D0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CB810E779;
	Wed, 13 Nov 2024 23:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFWr7+5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C264E10E29C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4gnAqMY4qOGnGJACbKd2MZYLNYVPQJL8mI0reoKpeCA=;
 b=RFWr7+5bCk5Mpm0q3/DCeI4z3SuQY5jq1mNc2uy1zflWBU3PvPmKSUVi
 y7NdK96/AkaAIuWooQfpJwJ7PeEvv7OxHQ9hxXyyaCeGBbZnUYqMVm+IF
 w4GoC8W8lrQRFXYzK/ZYtDSfWnq1ONs8t5vL2RXgddyErS00EjQ8WGxcb
 SzlhQPs6iailgUintcV3DWR2D3BVCOKziyljEofkYzV9AMU5ZF/8RWHq1
 CXbTpStskup7qX4VlUxiry2V57FVO/hP7iOdDj9cX4zisd4x18/T0AR1I
 SPLxaw02mAjax751NiACoOkm28StafvI2Vretrjp6rAG1oG6nF0EZLZmZ w==;
X-CSE-ConnectionGUID: EE5GV7XhRru3zuwxutWK/w==
X-CSE-MsgGUID: usuvpQbZSmWrHgtIZ4JieA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999379"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:06 -0800
X-CSE-ConnectionGUID: KLJChCe1SGyAj724GihS/g==
X-CSE-MsgGUID: KZIX9AWmS7+9wiqSo7Y3uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074718"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/9] XE3: tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Date: Wed, 13 Nov 2024 15:02:59 -0800
Message-Id: <20241113230301.655499-9-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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


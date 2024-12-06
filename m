Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1CAE77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711E710F1D8;
	Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IID6ky9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955E10F1D3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520604; x=1765056604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4gnAqMY4qOGnGJACbKd2MZYLNYVPQJL8mI0reoKpeCA=;
 b=IID6ky9jZgeIBRhKDfNAeLLf/NViNYXxwtBzuMQQMDjvKXyRu4FEhCpf
 MUSZcL2+xUeAaacU26Jp2ynrUziKh+ompT7Hyc6oKEZekB0RH7ksmECh3
 Y1miumGQ2lfKjQdHAuXUZC8vhe1JHmjESjQAT9hGCWFtuGbrGkyM4FUgC
 u26mxBv6bcGGx5Jpi2wofZ1ZaEAznog68O4ksPgo7HO31otqTeO5t3bNo
 5J4OwTtz6jc6qEpgVbPqnUUniHKKfBZR+TnN9f2o0PEKXBnRooXs6YCtW
 Vsh8iknXqpVutakch93FUYLR1276R5MGoelniEl95/lURRFFsNLIvjozH w==;
X-CSE-ConnectionGUID: tO8SVUL0QrK1exehqcRLXA==
X-CSE-MsgGUID: uEvPkQSNS5uqqfSRpVGqkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304475"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304475"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: nxJvY8NSSxW3Tjx8Og5xsw==
X-CSE-MsgGUID: ihmhQydGS52NVQYvB4mlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306727"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 6/8] XE3: tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Date: Fri,  6 Dec 2024 13:27:46 -0800
Message-Id: <20241206212748.2101217-7-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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


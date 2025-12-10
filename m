Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A919D3C525
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E05610E654;
	Wed, 10 Dec 2025 03:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsRLvO/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FD010E658
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337011; x=1796873011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49WvTg/k4HJ2UgZaiujnRVGYG8TFoa8wmjIdbGg7qqE=;
 b=BsRLvO/PGaWJVQwkfpePoapOb2QaGP/vM+jeB0QchcZ//+WKnDPN9Tfr
 f8EpruBXG4gOTZw0mcfhRJj2m74PunNJw9HcHexS0dgm/lVBDlzedMniY
 kCWffIZQMYT+Qj4PTJWkOfF7uc8Ji/B3OLu/0m6eE7zXNkHQZO4DX91Yu
 YYJr4tPijUec8BOwoG+gBoXf6kMkS/MKqHb7J5xCsNo1S7v/NAPl/I4B7
 ZFcpLImzjLs9GOs89hSNT6gKNEJDks6G3G5hAlO7DhyI2HwS/nld2wHLQ
 LPfJL/tcaEL1aCKk9IE4hkZRMO2fRz3o7K4w0+wPVQTTHOCh8u/xx0UE3 A==;
X-CSE-ConnectionGUID: JoRJc6xERjiVtWW9OkdOVQ==
X-CSE-MsgGUID: Db4Atr2tSvaV16ZmIuv6Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66481260"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66481260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:31 -0800
X-CSE-ConnectionGUID: QFDcltX+QvCKivLClkubmw==
X-CSE-MsgGUID: I0u9w4hyRHOaiReJexMkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200822748"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:30 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	Stylon Wang <stylon.wang@amd.com>
Subject: [PATCH i-g-t 4/4] tests/amdgpu/amd_assr: Use lib function to paint fb
Date: Wed, 10 Dec 2025 08:53:49 +0530
Message-ID: <20251210032349.2781106-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210032349.2781106-1-karthik.b.s@intel.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
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

Use the lib function igt_paint_test_pattern_fb to paint the fb instead of
doing it locally in the test binary.

Cc: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/amdgpu/amd_assr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 8a42baa0b..95c1e3061 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -163,7 +163,6 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 	igt_pipe_t *pipe;
 	drmModeModeInfo *mode;
 	igt_fb_t fb;
-	cairo_t *cr;
 
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
@@ -175,10 +174,8 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 
 	igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888, 0, &fb);
-	cr = igt_get_cairo_ctx(fb.fd, &fb);
-	igt_paint_test_pattern(cr, fb.width, fb.height);
 
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(data->fd, &fb);
 
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.43.0


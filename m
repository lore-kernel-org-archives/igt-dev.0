Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AD7D4415F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFF110E5A6;
	Fri, 12 Dec 2025 09:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdpAdG63";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2110E5A6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531896; x=1797067896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ual97JUklNiH3Xs36WUFCAtauVN4lmTqdfRPccdp8oM=;
 b=LdpAdG63FusanG5DsabSeguuGyjK2DebGHXvyvh2Zwx8mh7oZqe6E4ZE
 X5kBBn6UMcrZMIoadrFNOjaW1DdRvlVMmV3H9LKWPzRqpozUuUAAQLfy2
 r5sxXUHwwB3ZeaPSG5P+buEIZoj/+vPqOja8t/7vGX5gEqHfe7jZ26Wjv
 MPcv6hXzrQf1HR89HevIzxOWpkMt1xAVuqCDLL/O74UZu+IEfuEtHwlke
 t5LpaR2jtq7lRjS4FH9SKsmeHvjgq2gxp07AG0ZamrwaXlKASDFw09Zrq
 QML0zAM6xVs1/nNX6RUX6vZ/0/h7UEy01a6FLwejj5lIAmo7BU8Sq/wMF g==;
X-CSE-ConnectionGUID: JeIWEQZSSZKT8pu8ATHJjg==
X-CSE-MsgGUID: zdm/dhCHQdKKYB8mW46mKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84932436"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="84932436"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:36 -0800
X-CSE-ConnectionGUID: oJRpV8lgR+ylaQBBD9n+1A==
X-CSE-MsgGUID: qngMe2FmSye/gKc2Gfbz0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197301266"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:34 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>, Stylon Wang <stylon.wang@amd.com>
Subject: [PATCH i-g-t v2 4/4] tests/amdgpu/amd_assr: Use lib function to paint
 fb
Date: Fri, 12 Dec 2025 15:01:46 +0530
Message-ID: <20251212093146.2881962-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212093146.2881962-1-karthik.b.s@intel.com>
References: <20251212093146.2881962-1-karthik.b.s@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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


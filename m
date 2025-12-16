Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A0AD5C0F2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E38F10E735;
	Tue, 16 Dec 2025 08:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwDEwvSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812D10E789
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765875145; x=1797411145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIgp3aQmeWjtOdsOt/GOvsDQ0XtCaLg8z+NOYhk31JI=;
 b=IwDEwvSG/rCcLjjj7wHv2CGiAjXZPzDDqYxzfahKQBNJqxly6l4vPPMn
 JBgWDS1aB/dHLm9IoXuli5zm+gKUXZxG/Te+oNDeFf7+KPmFtibCTrJpg
 VJW5bZu3du+GLCW95UPZXYWqPCsgi9OipVvN3vQ4y6YuI1oP9j6EaKAOl
 j/FDKe3qtcdnGTrVnuoD7rYnnaaO1jmW62CFCvPXUhQX1ZzTEEjir9pwd
 XAqDnC/uGGyHjAAHsyrVx3h6v5bG0Y7luRBoqqzY1/YfsLSZoAoUwpi8L
 Ori3+vtZVHv2/yWC1/1xequdx6piCWLv8ugZQlVRPiahWyyk327fE8ZHk w==;
X-CSE-ConnectionGUID: yMFawBGKT26XyRNzYti5xQ==
X-CSE-MsgGUID: YEKLlgo0QnaIECamGb6ZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67670059"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67670059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:25 -0800
X-CSE-ConnectionGUID: ABZC3PRBSDe9IRJvWLab+g==
X-CSE-MsgGUID: XrLWXZ4jRc+6aFfqHDgG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197710631"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:23 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>, Stylon Wang <stylon.wang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v3 4/4] tests/amdgpu/amd_assr: Use lib function to paint
 fb
Date: Tue, 16 Dec 2025 14:22:42 +0530
Message-ID: <20251216085242.2916476-5-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216085242.2916476-1-karthik.b.s@intel.com>
References: <20251216085242.2916476-1-karthik.b.s@intel.com>
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
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


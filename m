Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31BC3ABAC
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 03:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599F210E23E;
	Mon,  5 May 2025 03:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVK7ZT/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3171210E236
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 03:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746415658; x=1777951658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DW8fXutkYz8vfV9Tie6Dni2UEm3XBudd66BSRo1NwJI=;
 b=XVK7ZT/zEYLrsJggTR6u22mmKlf096MD6N2nUsy/7qsT1jZlB44qfhpk
 wvMAbu+JZZ/RcqKdxMdBbhIB7/9fEoCedXJgFJXTKgI8y3H/sCdpiWxOm
 WPKCZwSyppVCasR485ceUSsGxNlsH1EPr+ORw00INpkigTJ+TTc9Er14f
 CuEULXbfs2sFnhkE90aGCaGt81BGpqHnZQPjJYKL1UEXfxdLG3DGMoV+V
 pxTtjlOdbOJwfRBTFZGQqYm2L5PZf2I2G+g/13bAqXuinFP8TY/XMYsEs
 mDhM2oFlr3a1tGu4M3ZJuUkDEPL9A75a/KPHpBc8j9bGMdssB3e4hJP1z A==;
X-CSE-ConnectionGUID: zNNFix7bRIqZ8y/bTouSFA==
X-CSE-MsgGUID: gwkXvW1QQMixwjCgRdKeJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65412743"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="65412743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 20:27:38 -0700
X-CSE-ConnectionGUID: muiWkHRoQ1aN2PkpEiDYCg==
X-CSE-MsgGUID: yR5blpTgS+Ko+qcFq2hayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="166038730"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa002.jf.intel.com with ESMTP; 04 May 2025 20:27:36 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/kms_plane_multiple: Add clear skip message
 for skips
Date: Mon,  5 May 2025 09:04:34 +0530
Message-Id: <20250505033435.929953-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505033435.929953-1-pranay.samala@intel.com>
References: <20250505033435.929953-1-pranay.samala@intel.com>
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

Add a check to skip the subtest when the required DRM modifier
is not supported. This avoids unnecessary test skips and
improves clarity by providing a proper skip message.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_multiple.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index ebb026726..5767318e4 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -510,8 +510,8 @@ static void run_2_display_test(data_t *data, uint64_t modifier)
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
-	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
-		return;
+	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
+		      "%s modifier is not supported\n", name);
 
 	igt_display_reset(display);
 
@@ -553,8 +553,8 @@ static void run_test(data_t *data, uint64_t modifier)
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
-	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
-		return;
+	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
+		      "%s modifier is not supported\n", name);
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_display_reset(display);
-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3538FCD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 06:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD2B10E07A;
	Wed, 27 May 2026 06:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsmyqlJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DF610E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779862232; x=1811398232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LpvsPo2njfa5EkGKPUX3XhNNLRvCLZEd4/ZLv65XF5Y=;
 b=TsmyqlJMq8473qVfTeZ/8SA6D61CvwxBEsBqDWTyPWgvI3LeqlmjXlOx
 qmerNtrdU5hWz2yh/M8USsO05n1Ng3yfFjyHkByNVs10necxVBF3EzUDz
 7VcuFAd+/Og3P8iPGphXQxO74rAAvqt1NB5rxd21VA/lBYaxqtEHmCmgN
 afiLDzK84R5BhqUXtUPu5LizBnD3VCIxexiwBGdqYm6wz2bTDL5La0UJx
 yrM+i/Cbsl57e+GWxhL6wta5Ihe7TPoCtkWs06fPmhkIT37XREs02K92K
 5bE7rRGVPcIoOXF9Oyf0kHXDBJVvFznisGa7zXJY2uwWtywPitjpqGTL/ w==;
X-CSE-ConnectionGUID: iX/hJd+TRCClJkDpWTNfcw==
X-CSE-MsgGUID: 2CJ6g3zfSSC8kKuEEtDeCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91375051"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91375051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:10:31 -0700
X-CSE-ConnectionGUID: spal2k8iQIijtkIkpV+lxg==
X-CSE-MsgGUID: A8KzRi4ER1ibicVGDXbIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="280263864"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:10:30 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] igt/kms_plane: fix NV12 Tile4 test to run on i915
 platforms
Date: Wed, 27 May 2026 11:41:04 +0530
Message-ID: <20260527061104.520609-1-ramanaidu.naladala@intel.com>
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

Tile4 is supported on MTL platforms, which are driven by the i915
driver. The existing igt_require_xe() check unnecessarily restricts
the test to xe platforms, causing it to be skipped on valid i915
configurations.

Remove this restriction to allow the test to run on all
platforms supporting NV12 Tile4, including i915.

Fixes: af4230819267 ("tests/kms_plane: Add test_nv12_tile4_src_y planar settings test")

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f21006784..dca9e26ad 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1558,7 +1558,6 @@ test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 	const int fb_w = 1280, fb_h = 768;
 	int ret;
 
-	igt_require_xe(data->drm_fd);
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(output, crtc);
 
-- 
2.43.0


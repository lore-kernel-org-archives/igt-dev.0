Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A4AEA4FCF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFC910E400;
	Mon, 23 Feb 2026 14:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Td2uYbQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771858648; x=1803394648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jynKyNtm12EvA8Syt2fDJrtH7ywIei5iIxbVaXlDnjU=;
 b=Td2uYbQvUmMXnPDgKIBNbXeQZjHktjfcFYLnc1xlbRR7BsIydpzRFc30
 NyRkZFQ9I9blOAEn3eUQttGYdTBb6VQLZ3EmhoTLesd8KevK28u8F0B1J
 KFadrvwhHhMjgIp/zkbQz4BYywPWx41FmStJudS/GNlqMlBJsC2RVHBTH
 zmvHrs+nCNzgFp/fy+U1ZU1YdsybvHccWtLjWRVzgIS5wF8jxWn56e3yT
 TVRl4cdMqqZ4+6dcdx1SOaxKoEOOBdtmHJYZL5uYoW4PLInYez1iwPCpZ
 cQSm8dt/RMoCVm1oxYhKgW9CqHMVCu8+P+8D5JCjb4vzgfsrjrjv0LdlK g==;
X-CSE-ConnectionGUID: 5vkNEIFFT5CsrAj8jLifsw==
X-CSE-MsgGUID: Ijg2Fii7SLW+pQf9oEJ2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84215230"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="84215230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:57:28 -0800
X-CSE-ConnectionGUID: pBafc/RsSV2ajCVqm2B5kQ==
X-CSE-MsgGUID: aphyIWMbSsOo+DXkGmfB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213518189"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 06:57:27 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v3 3/4] tests/kms_color_pipeline: Disable pipe color
 properties in test setup
Date: Mon, 23 Feb 2026 20:02:20 +0530
Message-Id: <20260223143221.807474-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223143221.807474-1-chaitanya.kumar.borah@intel.com>
References: <20260223143221.807474-1-chaitanya.kumar.borah@intel.com>
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

Move disabling of pipe-level color properties (CTM, degamma, gamma)
from the individual plane color tests into the common test setup.

v2:
 - Rebase

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index e5914e2cc..41808718f 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -61,6 +61,11 @@ static void test_setup(data_t *data, igt_crtc_t *crtc)
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	/* Disable Pipe color props. */
+	disable_ctm(crtc);
+	disable_degamma(crtc);
+	disable_gamma(crtc);
+
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
@@ -103,10 +108,6 @@ static void _test_plane_colorops(data_t *data,
 				 &fb));
 	igt_plane_set_fb(plane, &fb);
 
-	/* Disable Pipe color props. */
-	disable_ctm(plane->crtc);
-	disable_degamma(plane->crtc);
-	disable_gamma(plane->crtc);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* Reference (software-equivalent) CRC */
-- 
2.25.1


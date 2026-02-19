Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EFCE9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BE610E1FB;
	Thu, 19 Feb 2026 09:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItMpvFEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4FD10E1FB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771493454; x=1803029454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1xMk77PuX8G/Epf+ziYsYlyj/7jl5YPC1X7BXm7iWM=;
 b=ItMpvFEYgMgKVB0KyKfgm05OJv3r0JhcY+T5dkA6nTZgczPbRH7bgNT5
 Z9/ipRgIPPwxjCpB2e8iUJJf+aQJ8qE5aNh2ONByM0hCI8rEWKGSpc3Dx
 NvKn4MJKU5eAwxPeHRzQenM2SZGyR/au3s9Yyj3flvRJ3ZmsFQc1UZB+2
 Qyah3SgVsHppfCDkaQKdttvTun1q4YzC2KlbtxzDU5F+NM57qsI7Sesnx
 lvgQSAhcge37T6C2/sR5EW2JAARf7xhe862SZVutmwcdnqghuxynrFt6g
 p7pt7pq+cPVznn7IuEfqQr/l1JlFIUMN5W3lSa0n+5LWEQO9PifCeywaV g==;
X-CSE-ConnectionGUID: bpV/6LKCRiKehe8gFGGARQ==
X-CSE-MsgGUID: GXVYVaVUSLOXY2yOCmjqaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="84025250"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="84025250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:30:54 -0800
X-CSE-ConnectionGUID: I6LbpuGFRiOxW37jTjrPEA==
X-CSE-MsgGUID: lVhiBlI6QDC6pHANdooFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218989884"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 19 Feb 2026 01:30:53 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t v2 3/4] tests/kms_color_pipeline: Disable pipe color
 properties in test setup
Date: Thu, 19 Feb 2026 14:35:44 +0530
Message-Id: <20260219090545.340383-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
References: <20260219090545.340383-1-chaitanya.kumar.borah@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index d12874f98..4ba4ea605 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -64,6 +64,11 @@ static void test_setup(data_t *data, enum pipe p)
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	/* Disable Pipe color props. */
+	disable_ctm(crtc);
+	disable_degamma(crtc);
+	disable_gamma(crtc);
+
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
@@ -106,10 +111,6 @@ static void _test_plane_colorops(data_t *data,
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


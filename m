Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7FDF531EF
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 05:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDA610E10A;
	Tue, 14 Apr 2026 05:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWVQPoFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9D110E10A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776146320; x=1807682320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uEDr/90Jc1MxaRaKmgdsoEuAR5KnS5VdqraRtO5D1CM=;
 b=aWVQPoFqg3SXB3AsRxSLplVQCXB+eGIe8wtuKQMpVjJATIs/5NBP2Sl4
 cqS2rhuIUARtnX0YCpit/5n5Qw9DfmMw2hjnv2hL55A3PkI7yvaRNPXB3
 MlykBJ9Su0Zjuw/KXkrDEYn08+lzLhp1gTLuqotUbWG1E1pCDNC9bMPQI
 6QcRXSCy/EF6/DdVs5FNItCfjpUnhHnyWWyQfj+fIAxeC/7+0TsLiEJir
 vZyPDB7DE9dDDOf2TiOCluzuFPYp85Jqduj2DEav0r26MIZ5no2AOvALj
 wu+RFxB7GwROvBVt9TFuGwKqMTfKTkMqe7pzgkO+UWHdGZhQJjNV11xHt Q==;
X-CSE-ConnectionGUID: BxpWRH4AS+qnWJ8ETLOf7Q==
X-CSE-MsgGUID: 9IQL1Ep2RHiATq4/oyI7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88171175"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88171175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 22:58:39 -0700
X-CSE-ConnectionGUID: tb2wnK/hT8y8d0W/QSRLwQ==
X-CSE-MsgGUID: N0ablkhBRTeIdQtC2bp2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234957105"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa005.jf.intel.com with ESMTP; 13 Apr 2026 22:58:38 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix redundant mode
 override
Date: Tue, 14 Apr 2026 11:39:27 +0530
Message-Id: <20260414060927.3182287-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move override mode into if block to avoid redundancy.

Fixes: 15663498141b ("tests/intel/kms_sharpness_filter: Fix stale mode pointer in joiner bypass")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 15c5e6006..bdfdf1d08 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -453,6 +453,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 					continue;
 				}
 
+				igt_output_override_mode(data->output, data->mode);
+
 				igt_info("Executing on non-joiner mode %dx%d@%d\n",
 					 data->mode->hdisplay,
 					 data->mode->vdisplay,
@@ -461,8 +463,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				data->mode = igt_output_get_mode(data->output);
 			}
 
-			igt_output_override_mode(data->output, data->mode);
-
 			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				igt_crtc_name(data->crtc));
-- 
2.34.1


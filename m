Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C09C282DC
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 10:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DD810E739;
	Wed,  5 Mar 2025 10:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVaImDEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC7A10E739
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741170745; x=1772706745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vxCGjc4rbtQixyc+xEfvsbB8VIMqXY1hM1dxpE45PwA=;
 b=NVaImDEFtCpKoRQZAWkIF/S7R8Q1p5xkBmoL3RSikVpqAXubIH1jRiEa
 Bvay4A1u30MCFREfJ5ofC9lGQEWfHk70wmu/0hbqZmIclISL5pQt+ZR44
 K/LHwKb69pSRcKxrbWJ31faqoVsNLiuUKZXXhQbtiumVdG/rXuRY/UCeP
 7PG0LUx6fVLkthAMudUbpPlDTGqESIWb2EJSt5l3Ew3ndJcqwgmMyyI81
 4OPMOBBC8w/yz8WzNm26FrLh04rObn/BeN3kVyMHg1FtJyFaJnZucCoMm
 jdqzc1xz0Ki9g+YwREdmUtna1rpb63MIap+eGLXPb4jeeQA8c2njkmXnP Q==;
X-CSE-ConnectionGUID: w8TrJu8/RlSYOnQn4nULuA==
X-CSE-MsgGUID: dc7WHlyHSIWa0zyq8miCfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42327889"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42327889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:32:25 -0800
X-CSE-ConnectionGUID: SDbf6FnsSHCcJ0k+8+J23w==
X-CSE-MsgGUID: JbTnRJFGTfK928ehGi/AUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119562996"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.55])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:32:23 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: fix the log level in
 fbc enabled check
Date: Wed,  5 Mar 2025 12:32:07 +0200
Message-ID: <20250305103207.137714-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Even if FBC is enabled and test is successfull, using warn level
to print the info will make the CI treat this as a failure. In
case FBC is not enabled, the assert will be triggered and print
the error case.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 1e3fc1d33..ea7a73124 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -130,7 +130,7 @@ set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *fb,
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
 	igt_pipe_crc_stop(data->pipe_crc);
 	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
-					  IGT_LOG_WARN),
+					  IGT_LOG_INFO),
 					  "FBC is not enabled\n");
 }
 
-- 
2.43.0


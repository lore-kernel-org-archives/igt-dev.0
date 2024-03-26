Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC5CCD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 13:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9238710E9E2;
	Tue, 26 Mar 2024 13:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYcKX6AC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B4010EE3E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711459244; x=1742995244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ViXYX+cC2WJZrVHEIDda/MfneA6nzg4Jzy4bDiCJ10=;
 b=OYcKX6ACO2Hhy/laMQl9rL1Ub/gg+8AzRSZ+eH/SwXnAE68UTXCpHahc
 Wp5Q1nSaW9hQh4AFQMFu1mTr0ziLtxgmFjQW9CUaJflrOCS8XwPnQPSrt
 DwiOEuahIhNa57VX0HoTeeiC57j2DeBc3i/hG0XOtUkweCq3XxJIF8nDR
 V3O1LPg9jVzByIxTAl07tl12AtvoMvBfqmiil/EUHlwOw+3cc4eTccuoL
 E4XCECIgljaHkGtdCg7EVc8Ncxq40qLv++iPgIEzdPEwXcxc5nJpG6VTN
 V7gwmbgcNX8ugq8eBv6JMMyCJt6XYA22izEMBlH/E4vZyAfQXXArhB8zZ A==;
X-CSE-ConnectionGUID: sobBUNkXROedH59btgiEjw==
X-CSE-MsgGUID: CSzHjZU4SrWmwp0DV8pcDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10302176"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10302176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20508290"
Received: from rvuia-mobl.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.55.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:20:43 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/2]  tests/kms_dirtyfb: Ensure PSR is enabled
Date: Tue, 26 Mar 2024 15:20:12 +0200
Message-Id: <20240326132012.3747302-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326132012.3747302-1-jouni.hogander@intel.com>
References: <20240326132012.3747302-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In certain cases PSR support is informed, but it doesn't get enabled
due to some limitations. This is causing failures which are actually just
expected behaviour. Fix this by checking PSR is really enabled and skip in
case it is not

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9735
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_dirtyfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 9e4832929..6121599ec 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -151,6 +151,7 @@ static void check_feature(data_t *data)
 			     "FBC still disabled\n");
 		break;
 	case FEATURE_PSR:
+		igt_require(!psr_disabled_check(data->debugfs_fd));
 		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, NULL),
 			     "PSR still disabled\n");
 		break;
-- 
2.34.1


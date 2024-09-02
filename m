Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B6CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 08:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E669710E252;
	Mon,  2 Sep 2024 08:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zjg0u6dI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13C610E252
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725265965; x=1756801965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DlNy2amU32kvjVKnx48lGD2Q9uiTf+uArXEXGrrCh1c=;
 b=Zjg0u6dIcgDfpscfloEYA7ri/j9T7/CT507wS5/OMtR9ZKjHQL0EdJQt
 BtDnLwE8noi5YfK04E4FgzSKxstIOeHKlpM4MR6GR2RG2q/ap4AkEzpgv
 2aR0NG482vupWLqTahq+W588yjw4hHEJNmf7jrL5cVXhQBIB5rsYWuJYr
 Rf19RivCjA3SghwZD2IsOFQn0c/LUG6/KabxHy8xTjbNTO59nYk8D6JtC
 d0mU5qJPvG1jP9zYS7e+6Fnu39YCPQLLtqg/fEF3/Aid/AIof11HacV3k
 WpNVcQ5Weq/BDwd9SgoRkqLTN64NOmwJDXgX9ahn3jw8ywSA2R3TNuqe8 g==;
X-CSE-ConnectionGUID: wyMbZgTzQAmy6tsahaT+0A==
X-CSE-MsgGUID: gxJYV9G1T5ynO20ydmrMow==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34994548"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="34994548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 01:32:45 -0700
X-CSE-ConnectionGUID: ni6g4wG9T62xIt3ypyi4Sg==
X-CSE-MsgGUID: nmaUraVMSqqqNUsqp+UadQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69333388"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 vgovind2-mobl3..) ([10.245.244.61])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 01:32:43 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 matthew.d.roper@intel.com, swati2.sharma@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_cdclk: skip cdclk tests for bmg
Date: Mon,  2 Sep 2024 11:32:32 +0300
Message-Id: <20240902083232.21871-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
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

As there is only one cdclk option in BMG, these cdclk tests
which look for change in cdclk frequency when changing
between high and low resolution mode will fail. So skip
these tests for bmg

v2: Add WA info as a comment (Matt Roper)
    fix commit header description (Swati)

Acked-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_cdclk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 6fe6e6c3f..382b3e9d1 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -402,6 +402,9 @@ igt_main
 			      "Hardware doesn't support crawling/squashing.\n");
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+
+		/* Wa_15015413771: Only single possible cdclk value in XE2_HPD */
+		igt_require(!IS_BATTLEMAGE(data.devid));
 	}
 
 	igt_describe("Plane scaling test to validate cdclk frequency change.");
-- 
2.34.1


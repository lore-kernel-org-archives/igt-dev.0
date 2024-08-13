Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71F2C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 11:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343B89DA5;
	Tue, 13 Aug 2024 11:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx9tOV6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A998189DA5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723547271; x=1755083271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y429HiNor7gof+ktofDKQKwC+UsWEAUbwhK9kJFofQM=;
 b=Cx9tOV6nZrPdc2NNZRQaBXeLY56NR3DHoRYR8B4o+lLFAHLRS19xhg/S
 dYHoR+TwekJcoVc+0n1FBqIn/qX9MnZQ6t1N7ktsn3ffph4Rd4bsvvbXK
 EUbRgmwoXvmFrXzm1pqFIPpJA1FKUKa8cFV+pMgMhWIzbwn+15BAWf3FN
 TBZwGejWZJz7ZF7tG9+bBaR2g/pdIndEgbb84ewohTeAxL47+xSRZY2iv
 pCQFKbvXUvjbtkp86dbibFFz1VTNrOZ79b4/NTS5sPtCeOrrpJfcAEgsZ
 zDI5PMxtCRGJysQP/WE9W1f5IA8D95M9Tolo2AN32VIkqICZlHKkmkpJJ Q==;
X-CSE-ConnectionGUID: PBPEJlSyQb6xy3j4HTKy/w==
X-CSE-MsgGUID: cn6bWEc3TCGvKjv5L0kPMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21571436"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21571436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:07:50 -0700
X-CSE-ConnectionGUID: pjxnBX8wQdertDYcATjLCw==
X-CSE-MsgGUID: TgPZc0dKSty0D6Wzq2lnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96167153"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.244.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:07:49 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	juha-pekka.heikkila@intel.com
Subject: [PATCH i-g-t] tests/intel/kms:cdclk: skip cdclk tests for bmg
Date: Tue, 13 Aug 2024 14:07:36 +0300
Message-Id: <20240813110736.68690-1-vinod.govindapillai@intel.com>
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

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_cdclk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 6fe6e6c3f..24a0c4547 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -402,6 +402,9 @@ igt_main
 			      "Hardware doesn't support crawling/squashing.\n");
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+
+		/* Only one cdclk option in bmg. Skip all these tests for BMG? */
+		igt_require(!IS_BATTLEMAGE(data.devid));
 	}
 
 	igt_describe("Plane scaling test to validate cdclk frequency change.");
-- 
2.34.1


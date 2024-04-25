Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B53C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E6810FF30;
	Thu, 25 Apr 2024 10:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3DvqoKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F60710FF30
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042064; x=1745578064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0S3qWIlOrR9/EbRXk/F8f59lEePx6S8PSu8pnlJi1vo=;
 b=N3DvqoKUqCqgM44eB4K+sEcTNAg4rbDOVV3OPekmOpo9frwWb/EgRTxw
 FS7AxBLv9B5Eao9tRhLgU/xPuC2V29xrc1Uv2SuqgJmFO0iwDC0lfF+P3
 kqXDCvne2XXc2C91YMncRUYxmDAJ6xHnjbCpxoq9Ec4ppSyY2h3xCTpmp
 qpREw0F9yLKBMaL81szvJEj6GTO+qqcB5mcAtC5RSYSwG5oPZPQFf4Pbk
 WhM6/v8pNb/baLp8rqkgCMLgmj8h73I0ArBikvq6K2MMGyyKlGVkDL3Qp
 bCMLon73Aiek0STp5UtQi0oC9GR7eHO49phEpu6O7ZKf0/D1SR2z+gRVH A==;
X-CSE-ConnectionGUID: qjW1V7mURoq1TZEs+XgQMA==
X-CSE-MsgGUID: tk4kFlY5QyGnIXVt6Oab2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9645796"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9645796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:44 -0700
X-CSE-ConnectionGUID: BYGnCLNtRjC6EsWMTbcXcQ==
X-CSE-MsgGUID: QSuV0btvT0eDvrWHk0ibXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="55977739"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 4/7] lib/intel_bufops: Drop tilings restrictions
Date: Thu, 25 Apr 2024 12:47:18 +0200
Message-Id: <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Different platforms supports different tilings so instead of asserting
on buffer creation path move responsibility of passing valid data
to the test. It can use intel_cmds_info to iterate over supported
tilings so this is better extendible and requires fewer changes.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 007ccdb953..b96275e485 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	if (compression) {
 		igt_require(bops->intel_gen >= 9);
-		igt_assert(req_tiling == I915_TILING_Y ||
-			   req_tiling == I915_TILING_Yf ||
-			   req_tiling == I915_TILING_4);
 		/*
 		 * On GEN12+ we align the main surface to 4 * 4 main surface
 		 * tiles, which is 64kB. These 16 tiles are mapped by 4 AUX
-- 
2.34.1


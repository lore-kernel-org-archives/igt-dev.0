Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC36CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A143F10E463;
	Mon, 10 Nov 2025 19:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnkA6neC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1469C10E463
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802714; x=1794338714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AL+3OUza11c3HNhCRI5Zb6IFAkIH2UpGo554ePJ8kI8=;
 b=jnkA6neCyJdJkRoF6hpFk50fvqnOa+g3uhhT8OAU0HSjNeHSfCQs5Hrk
 cxzDB+KjsBcQooJT10z4f757UgHEmNSRNXBH/xFObgWh54mKjL+tVyrcO
 fnhXMY8Z9Vv8wrgbR3GnSVzlH+zmcerXZ1x2cAqGTX8xKDE6RCN7iqRxL
 iPCFgZXH0S/pOK3Jbmsw5iJGKzP9ivuf7TrxBKbVc+tGSrfgLZIo5zx58
 dlcUqgbrdL7laIGqGEXimeDs7mBPZWfLiEX3uFgT7uf4lwcHdmtf/3V9y
 UiV58bXLI2bCywaW9hOPSGtqkUVA6Wzb3IxrTSIuhjV6k1vhuXNRzuUYM w==;
X-CSE-ConnectionGUID: WZRQNFRSSmKndFLMKGlVKg==
X-CSE-MsgGUID: ZYMH0sypSci0dRKOpUZO2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900261"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:13 -0800
X-CSE-ConnectionGUID: 6LNaq9iURruN9Us4uP01dQ==
X-CSE-MsgGUID: Rquov0biRKKDW9HHZ8JJ5g==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:11 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 5/8] Revert "tests/intel/kms_psr2_sf: Enable the tests
 support variations based on the WAs"
Date: Tue, 11 Nov 2025 00:54:51 +0530
Message-ID: <20251110192454.44385-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

This reverts commit eda8fda9f9451878cb16a4dab496fc2e9128a751.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 12c5b4fdc..68842b020 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -561,11 +561,6 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
-		      intel_is_fbc_disabled_by_wa(data->drm_fd),
-		      "WA has disabled FBC on BMG\n");
-
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.48.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5780CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 04:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C7110E108;
	Tue, 19 May 2026 04:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTGaKkTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2310E108
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 04:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779164277; x=1810700277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZ9XTFAcoL8tdpLb6o+7PGB8d1ZVksB8kPjj+YTkt6s=;
 b=dTGaKkTIqREBNHi3IVPiFPGnwrR02Uio+85429UK9S3/7Nl0mtgNSZ38
 bYuSX8dXoQA64oBwz2g2KmYm8PHcHKCwzTjN+HUg4p5zFcDUbuS7bai/P
 pPGkASwb3KmW7AdtySGMDen7vNrk74Hui0wEy2Avaz76+4BolqJ5wR0Lx
 9g6l6df//9PiEXTNOxQ1z3uE9tYzbxuZ6sUCBFcb8zsoGHDRPvgCqQ8oj
 nBrSw+rBZ/wXV23Bda+rE1K0Bk7dltjNf3IbhUI+BSwxQlHWW9i+9Togi
 qwsxzqSclJdRCKkycQrLr/FECBOHOYhnBLVpghGUQa+NJDL3OHRPtT2TJ g==;
X-CSE-ConnectionGUID: Q//zWHk7Q/Ol8HV9b9TzNg==
X-CSE-MsgGUID: boB9AQ5fTfK7igK4lkooFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="105491889"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="105491889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 21:17:57 -0700
X-CSE-ConnectionGUID: SLSMLG+dRPqVQ8+Ofxan6Q==
X-CSE-MsgGUID: E46VqM7uR2KfkxnyST1Tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="277749598"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 21:17:55 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dsc: Fix retry loop for non-RGB case
Date: Tue, 19 May 2026 09:44:09 +0530
Message-ID: <20260519041409.2479630-1-karthik.b.s@intel.com>
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

When the first selected mode is invalid, the non-RGB retry loop can
re-test the same mode repeatedly because the mode index does not advance
on the first retry path.

Advance mode selection on each non-RGB retry so the test walks connector
modes until it finds a valid mode or exhausts the list.

Fixes: 93a5298ac980 ("tests/intel/kms_dsc: Use high resolution mode for output format subtests")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 605ad2d5c..4c41c6a3b 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -178,7 +178,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	mode = &output->config.connector->modes[0];
 
 	do {
-		if (data->output_format != DSC_FORMAT_RGB && index > 0)
+		if (data->output_format != DSC_FORMAT_RGB)
 			mode = get_next_mode(output, index++);
 
 		if (mode == NULL)
-- 
2.43.0


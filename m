Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72CCCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 08:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E67510E75F;
	Wed, 15 Oct 2025 08:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQRJeBn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DED10E171
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429202; x=1791965202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJR2j0DyPxdCKwE4TznY/mg4Shhjc/2ssXe04r31fio=;
 b=IQRJeBn1UHbwkMyNXVh/lnJdo6AoSicS6ml/uzAApES1qI3SYf5gbggs
 Gzb4oFh6ou933AgA+UYC5JnaN8tBC5YsFs2sFls6Oq3WvSn7PtfyG539W
 xZ28hFMO3h62Cfu6yWNL741gQnhMqiVmnUtyG0RegbjEmBTR/cE/L2HwP
 0f+Zv/z/vbkqoOx3ZGl57opDOMWmqS8lzkYeWv1Ztmq0IAW7U6s5Es5Jb
 pafhyeS+ZY2O2XF+Nsfw8ar/tCM8t4VMZMV9m7Cly8Uq8kZycydOJPMpg
 H94+5uXDvyO2nk5lXdhIXxmT8Htgv/n/JU+BMMaeXebkj60WxUPzhkKTP w==;
X-CSE-ConnectionGUID: 4mBgPpYGTGylTXGojRc5xQ==
X-CSE-MsgGUID: bUkagoRTSXOwWjY0leXl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61792777"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61792777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:39 -0700
X-CSE-ConnectionGUID: xBiQDqmBTBqmgq3FgufPgA==
X-CSE-MsgGUID: IUbbT4yTQE2FMsfdo6JiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212794451"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:06:33 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/intel/kms_dp_linktrain_fallback: Change
 debug mask to reduce log
Date: Tue, 14 Oct 2025 13:53:30 +0530
Message-ID: <20251014082330.2936489-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014082330.2936489-1-sowmiya.s@intel.com>
References: <20251014082330.2936489-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 08:58:12 +0000
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

Lower log level for subtests failing due to disk
limit when more than two displays are active.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index fa58999e8..122118836 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -617,8 +617,12 @@ igt_main
 	}
 
 	igt_subtest("dp-fallback") {
+		if (igt_get_connected_output_count(&data.display) > 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
 		igt_require_f(run_lt_fallback_test(&data),
 			      "Skipping test as no output found or none supports fallback\n");
+		if (igt_get_connected_output_count(&data.display) > 2)
+			update_debug_mask_if_ci(DRM_UT_KMS);
 	}
 
 	igt_subtest("dsc-fallback") {
-- 
2.43.0


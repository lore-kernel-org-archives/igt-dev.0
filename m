Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD00C282D3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 11:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5410E59C;
	Tue,  4 Mar 2025 11:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCvxQ1/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E585C10E59C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741088360; x=1772624360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K4IJCRxRlt6FkvQBe2PDoxhUixRK47QwkTDGD6IqPh4=;
 b=NCvxQ1/wIVCsN5I1e7nO2nQVMvWqdTEdLRYBaQncIMdHE318ACgDtjcG
 Rst8/gXvjDxXItK9o/raodPELlI8/EmVAXZyQv9MPa3z+Tnnev72ng0zP
 V7dPDrwHXLbxEdLsRYINU0NbKUgmMf83N4wRgMMRnQ3A+DK2GuZSuCDTM
 NOaidds7XeR4q25HqRfljFq8oTZ6GnsaCoTsjVDX+HyxJX/fmeeN15QKU
 geEUSDrn5UsGTm7SDS8wveM5R3Yr2cZKqA4eZJutOxLoX3flZn3xwhUoS
 LXUZ8VYoy016e8I5Uy/2dyuGyi42Yf/BRO8JtAChjUDjPfH8TYAGfco5v A==;
X-CSE-ConnectionGUID: a69sxOOPRIaSrUPSAAnNiw==
X-CSE-MsgGUID: gGSVkSkKR9uRFhJRF+0f/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53404547"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="53404547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:39:19 -0800
X-CSE-ConnectionGUID: c0txc25PRA2d6U+AkkPPNg==
X-CSE-MsgGUID: 1lTK6adCSBCQA/gxsSURag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118357672"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.186])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:39:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Compare floats with
 igt_assert_eq_double()
Date: Tue,  4 Mar 2025 12:39:09 +0100
Message-ID: <20250304113909.279579-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Using igt_assert_eq() to compare floats was incorrect and led to
false positives, replace it with the appropriate assert.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4818c0ff7..dd9c83c9c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -754,7 +754,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
 		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq(output, expected_output);
+			igt_assert_eq_double(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
@@ -1035,7 +1035,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
 		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq(output, expected_output);
+			igt_assert_eq_double(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
@@ -1246,7 +1246,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
 		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq(output, expected_output);
+			igt_assert_eq_double(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
@@ -1613,7 +1613,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
 		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq(output, expected_output);
+			igt_assert_eq_double(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
@@ -1706,7 +1706,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
 		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq(output, expected_output);
+			igt_assert_eq_double(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
@@ -2048,7 +2048,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		igt_assert_eq_double(output, expected_output);
 	}
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-- 
2.43.0


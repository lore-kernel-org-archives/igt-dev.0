Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABCAC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 05:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5063D10F681;
	Thu, 21 Mar 2024 05:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5mBbALq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D4910F681
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 05:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710999097; x=1742535097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WKQYaRa4XJFOibfsK0CojjCoT7ReMJYPuj0dPK0rHuc=;
 b=M5mBbALqkLKAhJwWP/eP02rkZ3UvXfs6F/1nrtTN1BfvifYorhosBMl7
 oO7OBa3prDJvHkvBJ71tP6nSdGaK+wIDKlVLI7OFC67eRCRFcrJt4Lzsy
 KN08ldWY11P/2BDopRjm9vb8D3SzToEyIJUgY8YZu37chxVEIIAtvYvvx
 CmRMe6QSHQHLSf8XvQWPHwVHQdRo+T4D1cJyVAgLDliuNVyXPwQ3HqS2/
 Wf+jdY+dXGPYJe4qHw1Dn0IkhSCTKRlh8/NYLMieIeiwFIperKVq+xVhX
 Wxg+qaCw+fn+aA1eiPPrND3DXiyBMoTBbRlwsNNaQDU7lggOqyi2TngFF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5818929"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5818929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 22:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19108834"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 22:31:34 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/kms_bw: Fix the condition check for max pipe count
Date: Thu, 21 Mar 2024 10:54:54 +0530
Message-ID: <20240321052454.377561-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Fix the condition check to skip the subtest if ASIC doesn't
have the requested number of pipes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 96b19199d..05f7e79ad 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -186,7 +186,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
 	for_each_pipe(display, p) num_pipes++;
 
-	igt_skip_on_f(pipe > num_pipes,
+	igt_skip_on_f(pipe >= num_pipes,
                       "ASIC does not have %d pipes\n", pipe);
 
 	test_init(data);
-- 
2.43.2


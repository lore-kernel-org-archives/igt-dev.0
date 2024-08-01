Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0576C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9114B10E89D;
	Thu,  1 Aug 2024 06:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOnrC/Yf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AB710E89D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722492328; x=1754028328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nPIv+OhqivgTrpaXA134pPR25nzi5DEKmd74Fnhv73c=;
 b=DOnrC/YfWKa4BUyapVpCbzdNI4OvxKgyib7WAoN8LHb0oAyXKg6XQhmb
 9Cu9c15c7sebvxPxFE76wB1R59AzT4N1QZEBi1HfoQ6WeanYIP13yz0WD
 kQ7mc3Z5Cp9F0vq64oADbhZFC+VjuRwedG7vadrEBlxm2wEDvhvjyRR3a
 fnce0olHUKR8u4On2XaLp+STi17Url1sBrkGU7zmwS22ej6JQSRhK8m6k
 qIW1ZGOaAsdAd6+ZbuGb3ajZkOVONrFamIVeHRY7to35B6b+VbzYBgDIL
 QETag6kVeLE4bmxhwF853q4YpRv9ql7qVWItpqkSLEsDBy//8sVTl+VEr g==;
X-CSE-ConnectionGUID: eaxPBZCqRnCVjMaARrZNEQ==
X-CSE-MsgGUID: 6s/1XkXQSiqY3KJFSPBnLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31821102"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31821102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:05:28 -0700
X-CSE-ConnectionGUID: wXuXR/kdQ3G4wadLCUuVmg==
X-CSE-MsgGUID: EngOhXBlQvixRvvc9YanSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="85836582"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:05:26 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_vrr: Grammatical correction in
 igt_describe
Date: Thu,  1 Aug 2024 11:46:08 +0530
Message-Id: <20240801061608.2983058-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801061608.2983058-1-jeevan.b@intel.com>
References: <20240801061608.2983058-1-jeevan.b@intel.com>
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

grammatical correction in igt describe.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9ddb56cbc..18e7331b8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1077,7 +1077,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly matches with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
-- 
2.25.1


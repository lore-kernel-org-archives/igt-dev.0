Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02E0C369A2
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 18:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4374810EC4C;
	Fri, 11 Apr 2025 18:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFvTjWNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605E10EC4C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744394601; x=1775930601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YMfVPrDBUt+gYmWO8fxsMU0rPWH5njfwsbl/Spslusw=;
 b=AFvTjWNjWPsUrCKoYnjUHnE9oZ3SpuAzXXrS8eUGKYCm//0clTVgtgrE
 qcPudjCEJI+tjYba+cvor3gNTLi7cJyluDxLW+5BMr4U/bYFTWObWUIOd
 xf+YV0oaUaV/9TqeVbrYeljZsSdbFdxaV4fJlo0PZBr9tdQDsgNHLMzHl
 3fk74CQyWyITnBDrvVriiHX4Yq+envxdpbAfzMyyrBboHI0HJHmoNcLks
 KZVyT8DiEJUfP0FDb0qQgjlQBVudB7Wurj2zjb/Y+Acem3P1eTJvn8pH4
 Sb43KWQEAG+1XZvj49kfQ73oX0iE9p7jDfPRHIu3U2B99KeCDqe82ubiE Q==;
X-CSE-ConnectionGUID: Zb7EMUsPTTOUFnjYRtEHJA==
X-CSE-MsgGUID: BD1Wh/bnTIqwMNYyFURtRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45858591"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45858591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 11:03:19 -0700
X-CSE-ConnectionGUID: ECDHLs7cTKyu++MpFElsMw==
X-CSE-MsgGUID: iyBpPawYRbawC+k6ATohfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134363583"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 11:03:19 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Check for
 DRM_XE_OA_CAPS_OA_BUFFER_SIZE
Date: Fri, 11 Apr 2025 11:03:14 -0700
Message-ID: <20250411180314.1095215-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Tests which use DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE should check for
DRM_XE_OA_CAPS_OA_BUFFER_SIZE and skip if the capability is not available.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4678
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 67acc74b32..891ce24518 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4736,9 +4736,11 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_oa_exponents(hwe);
 
-	igt_subtest_with_dynamic("buffer-fill")
+	igt_subtest_with_dynamic("buffer-fill") {
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
+	}
 
 	/**
 	 * SUBTEST: buffer-size
@@ -4747,13 +4749,16 @@ igt_main
 	igt_subtest_with_dynamic("buffer-size") {
 		long k = random() % num_buf_sizes;
 
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
 			test_non_zero_reason(hwe, buf_sizes[k].size);
 	}
 
-	igt_subtest_with_dynamic("non-zero-reason")
+	igt_subtest_with_dynamic("non-zero-reason") {
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag(hwe)
 			test_non_zero_reason(hwe, 0);
+	}
 
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
-- 
2.48.1


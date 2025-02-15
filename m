Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546F2C021AD
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA3E10ED58;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI4Ia+hG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8397210E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581590; x=1771117590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oPWZjVzY1lXtmEPfGp99ohBfXBAN2MpLOo62+V6w8ds=;
 b=NI4Ia+hG3mvVe65oCF9x7iVZD5vmxL4n7Jm2W5iyVzJh66s6cGBaFIa+
 fQUfnIZYioOYQnFFwagNQ+8DLIvSrdoQM4V1GbMr/jByprP5mVUv90J0f
 vHllFmhrkQPo6OtpHf2csCC9cutRDT0bhAnOA19CAv0WjQTCbQGaFI3SK
 6GOkoA0FcpWKFXFoOlPHbhQGMw2hkJd0MzNQx6mCWabdbhz/CGKkYSO/X
 OJbmACoM485zKMk/1MMtO18nLAnvEhGe/GduILWrEurOmMdiyTYej+mj3
 ClfW5CfIRvSRRA7h7NTxi1iQb+52uNZZ1JX1Wog16M6JbZW9Yd6PEBarZ A==;
X-CSE-ConnectionGUID: Q8Q1d021Qp6WRcFqXKtKHQ==
X-CSE-MsgGUID: pMdsyIF8T4q/5VsUidIB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555116"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:30 -0800
X-CSE-ConnectionGUID: ZgoymEfZQbaM1ZYLFgh3fg==
X-CSE-MsgGUID: bN5VxcJeR7uzK2h3Pci6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711256"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 08/13] tests/intel/xe_oa: Use default buffer size for non-zero
 reason
Date: Fri, 14 Feb 2025 17:06:23 -0800
Message-Id: <20250215010628.1639986-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

Use a default buffer size for non-zero-reason for and strip
out testing buffer size in the same test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index fc03b74af..03d223df4 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2447,7 +2447,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
-		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4805,15 +4805,9 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
 
-	igt_subtest_with_dynamic("non-zero-reason") {
-		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
-			__for_one_hwe_in_oag_w_arg(hwe, "16M")
-				test_non_zero_reason(hwe, SZ_16M);
-		} else {
-			__for_one_hwe_in_oag_w_arg(hwe, "default")
-				test_non_zero_reason(hwe, 0);
-		}
-	}
+	igt_subtest_with_dynamic("non-zero-reason")
+		__for_one_hwe_in_oag(hwe)
+			test_non_zero_reason(hwe, 0);
 
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
-- 
2.34.1


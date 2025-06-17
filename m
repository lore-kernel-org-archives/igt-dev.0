Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F721C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327EE10E799;
	Tue, 17 Jun 2025 19:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDFNv5N+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0335B10E15F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188416; x=1781724416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XISU1gvRjMOl0GEI1cfwB2rcwUhvtMt4ZPM55lBFCKE=;
 b=IDFNv5N+TPf9fwmV56bHELVWIeWfJpyPM1rvhA54Hg5YrdzEObuupO+L
 c/0eyGC1BKtQVKvAyDptk0ZSI1S1jh9WHqhb7MFdn98/zP4m636Px5z5m
 j8a+22yt+DXQ09kBJMVFKaJ30i1Yz3X7u/fVwp1iVSr08N4ZhoUZOmFHn
 jW+7mJHXuQ21EE26B/CRGCA8fFpUrWu4cmWDMwOFOhPvPFgFQ3Ha0CITL
 U+54bX/pwpdndrvKBqJt4ul/gaGMEcD+lXGAeBQzLM4gQPnAjZUep77Kb
 HN1cZ0x7ZUDfB3vlQn3pixTFHRwQ00ecvlnXD8Tu8/NBBzexErR3nG4TU Q==;
X-CSE-ConnectionGUID: hRIzufEbTmCSHLJ4ucMx6A==
X-CSE-MsgGUID: gTxWE2HmTRGQkgAnzRGHvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52524002"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52524002"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:56 -0700
X-CSE-ConnectionGUID: FJkiq6zhRoGH7LYcUyvDJg==
X-CSE-MsgGUID: cJnrkAA+SEeA/8gQjeJKYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807939"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:56 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
Date: Wed, 18 Jun 2025 01:00:28 +0530
Message-Id: <20250617193028.107483-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..3c328923e 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -179,6 +179,8 @@ IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by sending multiple"
 
 #define MAX_SCREEN_CHANGES 5
 
+#define WA_FBC_DISABLED "16023588340"
+
 enum operations {
 	PLANE_UPDATE,
 	PLANE_UPDATE_CONTINUOUS,
@@ -561,6 +563,11 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_supported(data->drm_fd, WA_FBC_DISABLED),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.34.1


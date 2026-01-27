Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F946D340B2
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 16:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BB110E5B0;
	Tue, 27 Jan 2026 16:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO3tWoMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77D210E5A1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769532026; x=1801068026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8dZ+DxQ9N4/oEU6Q/vwgiHoqcyljbMc/TU3WKaEwbWo=;
 b=fO3tWoMSvfMzlwdaRXXj0hlwt06/I9s2yUjLPswxZYWMa7opkRiX1ZOS
 qS0/gEKxUZGBE4JeDlUxa+pCERMkvPcRMNwEakIPbK07FW/dnpP6yqEjx
 yflV51YDuW8J+BkUKdcsd1XFTzTILnwtVILiCGzxAnbdvg6qEnTOXpF/q
 YTykKt38i+yx27ZXA4ciTOdpK/iFmEuryGjZleLVKYagWVzqfgf8q0E74
 PbA2Apbs5r3FeASfb60vpZ4PFhgfRnf7aLfk9vxMK1dAL9973BjeSHqLX
 D+lZDUf//wovRPqmqIE2+MELHIlPD+hZDBFpSztI0fi/Xiv6409agIOnE A==;
X-CSE-ConnectionGUID: uJI84RkVRROWh5ARIRPyBA==
X-CSE-MsgGUID: JAwVEgySS968JNBECOB8CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93390946"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93390946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:40:25 -0800
X-CSE-ConnectionGUID: xQugmvNaT9OmCWp0b34g+Q==
X-CSE-MsgGUID: MVjZrjIRQEuLK22re8velg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207261202"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 08:40:24 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Fix var usage
Date: Tue, 27 Jan 2026 17:40:18 +0100
Message-ID: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Var ultra_joiner_supported is declared and later on used in
subtest switch-modeset-ultra-joiner-big-joiner without previous
setting, which could lead to unpredictable skips or fails.

Fix it by removing its definition from a function and replace its
usage with proper check.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Fixes: 319db2ffba41 ("tests/intel/kms_joiner: Add function for pretest checks")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_joiner.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index bf817a453..1f8d6600b 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -581,7 +581,7 @@ static void test_basic_max_non_joiner(data_t *data)
 
 int igt_main()
 {
-	bool ultra_joiner_supported, is_dgfx;
+	bool is_dgfx;
 	int i, j, display_ver;
 	igt_output_t *output;
 	drmModeModeInfo mode;
@@ -755,7 +755,7 @@ int igt_main()
 
 	igt_describe("Verify modeset switch between ultra joiner and big joiner");
 	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
-		igt_require_f(ultra_joiner_supported,
+		igt_require_f(data.ultra_joiner_supported,
 			      "Ultra joiner not supported on this platform\n");
 		igt_require_f(data.ultra_joiner_output_count > 0 ||
 			      data.non_ultra_joiner_output_count > 0,
-- 
2.52.0


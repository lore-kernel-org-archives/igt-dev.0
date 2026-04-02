Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159BACC6B01
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C91110ED59;
	Thu,  2 Apr 2026 04:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5v+tfhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7836A10ED59
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775103358; x=1806639358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+qXon2L2tBipkZ9MCglNUAQd71DWOc6JWWy+ymHn5uQ=;
 b=F5v+tfhhi4d420sIaWa5btN1ebXNcE7AGJdeMXyn+y6SXFuC4qoFH5We
 3l4jDRBLU2kTfCjOxFkITsg2Jh6QBtNniK1SRt35VoTRCjCcJP/2Fk1Hu
 KG29hNmWxwD6Mtu5HgaCAV4NySMrbSnjU+Q5DmGZPMwCxWf+rvXKca+pE
 8/+M6Kw7DmEGP0Q5oOiicO6s3r/Wn84R4g8ODzJs6pwrage+8bvCmxCgO
 Hwx7rUsi70v/D/EdSMlmnNtTs50+2EsrUuaydnm4UUXb8uB2E+G1tZj1u
 r/hkb2NPHrAAHFEgD9rfULFBjxb/Piql3cFilr0759WrPFePSjGxp68Eu g==;
X-CSE-ConnectionGUID: RNsjy0/2TdC8RwyKLufYZg==
X-CSE-MsgGUID: dpHGs0MdQ1yvfRvkpGkEpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76120223"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76120223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:15:57 -0700
X-CSE-ConnectionGUID: wlYraneJTKCfU44MFZbG8Q==
X-CSE-MsgGUID: urCxr3wtTfe3bg19/HXvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="250073351"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:15:55 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_frontbuffer_tracking: Improve skip
 message
Date: Thu,  2 Apr 2026 10:07:02 +0530
Message-ID: <20260402043702.914845-1-sowmiya.s@intel.com>
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

Replace vague or negative skip messages with standardized,
explicit descriptions that clearly state why a test is
being skipped.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..6a7017256 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2548,20 +2548,20 @@ static void check_test_requirements(const struct test_mode *t)
 {
 	if (t->pipes == PIPE_DUAL)
 		igt_require_f(scnd_mode_params.output,
-			    "Can't test dual pipes with the current outputs\n");
+			      "no valid secondary output available for dual-pipe tests\n");
 
 	if (t->feature & FEATURE_FBC)
 		igt_require_f(fbc.can_test,
-			      "Can't test FBC with this chipset\n");
+			      "feature not supported (feature: fbc)\n");
 
 	if (t->feature & FEATURE_PSR) {
 		igt_require_f(psr.can_test,
-			      "Can't test PSR with the current outputs\n");
+			      "feature not supported (feature: psr)\n");
 	}
 
 	if (t->feature & FEATURE_DRRS)
 		igt_require_f(drrs.can_test,
-			      "Can't test DRRS with the current outputs\n");
+			      "feature not supported (feature: drrs)\n");
 
 	/*
 	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
@@ -2569,7 +2569,7 @@ static void check_test_requirements(const struct test_mode *t)
 	 */
 	igt_require_f(!((t->feature & FEATURE_PSR) &&
 		      (t->feature & FEATURE_DRRS)),
-		      "Can't test PSR and DRRS together\n");
+		      "incompatible features (feature: psr & drrs)\n");
 
 	if (opt.only_pipes != PIPE_COUNT)
 		igt_require(t->pipes == opt.only_pipes);
-- 
2.43.0


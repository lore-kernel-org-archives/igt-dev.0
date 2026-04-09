Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35614E98FA8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 05:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D2710E0B0;
	Thu,  9 Apr 2026 05:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxFVdfLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650910E0B0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 05:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775711136; x=1807247136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=duW4IFVryJS6lrlFj94tg4Lu+hXYD3QWMkj+rUlm0VQ=;
 b=OxFVdfLjgLbJSGHD27gwOckJVt9YQ8vKw+viRPHVbDTFkaO40rMyZIGf
 YuI5rf3Oa3wQ8Zq7Dx7TyyMdnLRd/Am6desS6qP1cTFK9Ql8MuheMsmKj
 ppw0Qv+tgEUn0AJvQApkP/HCY6AYeVVnlbXIUWPCDRVRQ+nT/tIIr/dgC
 CB/C7lKe+xSAs2gYL3vVQwTqgnBZjZEetLMDf9TcgOOgXMLGcAy95uCVO
 w11HWptrS3j4eV2cl3RidDaTh1shugBJ5Vf4XdhYkGHuA6mQtHdmGjs0i
 ark5puEKjFLikjctIyOh3jpM6WK38lKQq5ym83gIxetIMKS+S1ytpohBp w==;
X-CSE-ConnectionGUID: 42fN3dNqR9Wn5Xs8hJZaHA==
X-CSE-MsgGUID: yEypFMOkQYax7DU9WpsItA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75880121"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="75880121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 22:05:36 -0700
X-CSE-ConnectionGUID: BPKgtzD6TBaVuO3CFmlACA==
X-CSE-MsgGUID: 57dvxkoRSC+mNFZ3q/575A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="259112251"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 22:05:34 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_frontbuffer_tracking: Improve skip
 message
Date: Thu,  9 Apr 2026 10:56:14 +0530
Message-ID: <20260409052614.1036375-1-sowmiya.s@intel.com>
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

Improve skip message when igt can't find two
outputs.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..8b73e8505 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2548,7 +2548,7 @@ static void check_test_requirements(const struct test_mode *t)
 {
 	if (t->pipes == PIPE_DUAL)
 		igt_require_f(scnd_mode_params.output,
-			    "Can't test dual pipes with the current outputs\n");
+			      "no valid secondary output available for dual-pipe tests\n");
 
 	if (t->feature & FEATURE_FBC)
 		igt_require_f(fbc.can_test,
-- 
2.43.0


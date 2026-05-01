Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A212CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 10:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FBD10E1A8;
	Fri,  1 May 2026 10:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVbKVoqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025C110E1A8
 for <igt-dev@lists.freedesktop.org>; Fri,  1 May 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777631270; x=1809167270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2YewBnTOQI0bU7vgHm7yyZCWYWk4iMMxoh3jwrjvNwU=;
 b=dVbKVoqv7hNO931l2AnRWU7MVHdvfw3w9BFjsmJZ+/2CEfziORX15Tio
 dZoi7V5BlB2sVCv8zw6yUJfXRTwe6XY5fKzqEafaP7La8XE1REm9JOBlP
 1RJnztW2OxRagzGJr2z/8GmkEmE2LX1JVEBe0oZu/tmBEsynaMUaHGdu9
 NxPeGbJ15LMFsvN1ZWQYdDBQ7buWtWxWVnvvoIgxju4QaxIz2m0BvN3Xq
 6500fCckFh1fsoUsPXs+jzEV9DvbYXQWKGLqfJMleCxmr2LPRKfyeji42
 dwneeFJ4C4F7t55fq51myduJ7sAwBYEaFiHXKlXfBTEJabBIbYx0Ke/Pm g==;
X-CSE-ConnectionGUID: HqwkR+BlSYaZk83bbIkSCQ==
X-CSE-MsgGUID: 4NH41+2sS3G/TZFeCaAVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78521377"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; d="scan'208";a="78521377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 03:27:50 -0700
X-CSE-ConnectionGUID: dO9vCvTASIiy6NxqJ2xoYg==
X-CSE-MsgGUID: pp5szmhPROii7k61lzVUJQ==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 03:27:48 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip non-4K outputs instead of
 skipping the test
Date: Fri,  1 May 2026 16:06:34 +0530
Message-Id: <20260501103634.2360004-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The mode-transition-all-outputs subtest currently skips the entire
test as soon as any single connected output lacks a >= 4K mode. On
typical setups (e.g. an eDP panel limited to 2880x1800 alongside
multiple 4K external displays), this prevents the test from running
even though enough 4K-capable outputs are available to exercise the
CDCLK transition.

Replace the igt_require_f() check with a per-output skip: outputs
without a >= 4K mode are simply omitted from the valid_outputs list
and the test continues with the remaining ones. The existing
igt_skip_on_f(count < 2) guard still ensures we only run when at
least two valid outputs are present.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 48bd7276f..070fba400 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -271,8 +271,11 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 
 	for_each_connected_output(display, output) {
 		mode_highres[count] = *igt_output_get_highres_mode(output);
-		igt_require_f(is_4k(mode_highres[count]), "Mode >= 4K not found on output %s.\n",
-			      igt_output_name(output));
+		if (!is_4k(mode_highres[count])) {
+			igt_info("Mode >= 4K not found on output %s; skipping\n",
+				 igt_output_name(output));
+			continue;
+		}
 
 		mode_lowres[count] = *get_lowres_mode(output);
 
-- 
2.25.1


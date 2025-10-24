Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E328CCD1BF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 23:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B0710E0B8;
	Fri, 24 Oct 2025 23:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNJesI+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C35F10E060
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 23:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761349060; x=1792885060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dS4YClw2w1itiB7LykXwMCTDTQKOnvX/ctKaeVruiGs=;
 b=YNJesI+GVev65mq83U8R7dTJ5BvWWDOGjPFxGZ6arHtpQzUy+7w4S8gc
 U7KPxYtYiyyxhw5BS2mM8rlAA0eKrmU4Mgkhq0NmaOV8oqrZD7z6MIC47
 6+mAGk0bJOZMrZer28WHOnPkrjFLIOSb9mN/DTNtuMzJPzl2lLZ6zGlo6
 //vOnD2CsVbRdEFg+2dBbXF4DK28DWpe7RMchISBai/XPv/7NTP9FmuT+
 EiZhIfOSQhnCMXcX6VKgEEtheDPOqqdDlxLQVSlIw04LMIEWQqg+WIfPR
 h+oHLPA8tZtLinPQ/FJfYsJi71Wm52fdcc1FT/iVawVVeJxLfaLYjZaP5 g==;
X-CSE-ConnectionGUID: +Xuml2OSTRCujeYVjqxU2A==
X-CSE-MsgGUID: zk+cfLWhRwa4UpnINZ0d5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63567225"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63567225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:37:40 -0700
X-CSE-ConnectionGUID: 79rhDfCaSuGeBjlpIn8GkA==
X-CSE-MsgGUID: vjRk+dhPTReOmWXs2OTMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184158275"
Received: from nkwan-gpu-0.jf.intel.com ([10.88.27.158])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:37:40 -0700
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Fix dynamic subtest
Date: Fri, 24 Oct 2025 16:37:28 -0700
Message-ID: <20251024233732.55832-1-ngai-mint.kwan@linux.intel.com>
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

Fix Segmentation Fault when calling igt_pipe_crc_free() due to double-freeing a
dangling pointer.

This occurs when a system connected to multiple displays executes a test with
"1x-outputs" dynamic subtest.

Example:
kms_atomic_transition --run-subtest modeset-transition --dynamic-subtest 1x-outputs

Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
---
 tests/kms_atomic_transition.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a13830965..a7d8d88b4 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1065,8 +1065,7 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 		return;
 	}
 
-	igt_dynamic_f("%ix-outputs", requested_outputs)
-		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
+	run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 
 	/* Cleanup */
 	unset_output_pipe(&data->display);
@@ -1259,9 +1258,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe_f("%s", modeset_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
 			for (j = 1; j <= count; j++) {
-				run_modeset_transition(&data, j,
-						       modeset_tests[i].nonblocking,
-						       modeset_tests[i].fencing);
+				igt_dynamic_f("%ix-outputs", j)
+					run_modeset_transition(&data, j,
+							       modeset_tests[i].nonblocking,
+							       modeset_tests[i].fencing);
 			}
 		}
 	}
-- 
2.43.0


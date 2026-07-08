Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C442C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 08:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172B10E57C;
	Wed,  8 Jul 2026 08:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHxPOvmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9107310E57C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783497648; x=1815033648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TWQTx93jpkAltaePSHprwx+wGndymlU+vECgFSMlopM=;
 b=RHxPOvmv8PFbXmND6E96zZbBQigL0AAmI3lujZQsisJi77a00d0PTLoj
 xKLhTnnCbWuO+XVxj4tS3Fh7hoj9F9911qzW8Pgba73nCkxFQY0J0l8HW
 uhZkIKXMN3Zg3rXjNjhHJ9cU7V9SAG1elFLFbxGsoAT+bEfKUQ5TH5C6j
 vFsmqoUJOSH2zwUTAIhcL8kk2B1t35QVJcGnIaHBAOPXgg8kn/CRjzZG3
 57zlisRi/ca+NnSipPxCEaUUFsyftmo/x0Qdb8lke6axEfP9wnK6eTf5N
 MTCojHeLCZPq4h1ZjpWw/Y5jt8G08mTrPJR8/jrvwRubkN4EDTklSXpQ8 g==;
X-CSE-ConnectionGUID: sGYS7hZqQWC5dTualp9cDw==
X-CSE-MsgGUID: E3qcghfyTtu8335gkKa94g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71672288"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="71672288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:00:46 -0700
X-CSE-ConnectionGUID: TRtLVkBWTpe84PYB7FKVgg==
X-CSE-MsgGUID: tUL3QKhNQHitlO2YPGBzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258096227"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:00:44 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_joiner: Fix mixed_output subtest
 skips
Date: Wed,  8 Jul 2026 13:28:22 +0530
Message-Id: <20260708075822.96872-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

In the mixed output case, mixed_output[1] is a non-big-joiner output,
but bigjoiner_mode_found() was unconditionally called for both outputs,
causing the subtest to skip. Only require a big joiner mode for the
first output (j=0); the second uses its default mode.

V2: Split compound statements by replacing with variables (Karthik)

cc: Karthik B.S <karthik.b.s@intel.com>
cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index d26eb3b01..dfcb24004 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -382,10 +382,17 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
 			igt_crtc_t *crtc;
 			enum pipe pipe = data->pipe_seq[i + j];
+			/*
+			 * In the mixed case only the first output (j == 0) is a
+			 * big joiner output; the second is a non-big-joiner output.
+			 * In all other cases every output is a big joiner output.
+			 */
+			bool is_big_joiner_output = !mixed || j == 0;
+			bool needs_big_joiner_mode = !force_joiner && is_big_joiner_output;
 
 			output = outputs[j];
 
-			if (!force_joiner) {
+			if (needs_big_joiner_mode) {
 				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
 							  "No big joiner mode found on output %s\n", output->name);
 				igt_output_override_mode(output, &mode);
-- 
2.34.1


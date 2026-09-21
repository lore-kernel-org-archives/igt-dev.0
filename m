Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0139C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EAA10E151;
	Mon, 21 Sep 2026 12:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RL5GbVFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619C10E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994652; x=1821530652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9ltuodTzS7TOMurSKsNb2kFFpmxAZIFONEHsEWDjnY=;
 b=RL5GbVFMwhiqAGcH8l9siEia64bV/OZIWqa9zybeBNODCl8ZBDdehxh5
 OaJOA4hj5hCLJV6aAC8EkWRjmhIkeWxQdiux2uxj8k5xKw0l0aINCYpb/
 vhOGoEiSq0DozcQbxLX11UcN+KN6tgehA9MwblQtdupWcoGwTD4/fpEEB
 58nzpb0M5dOHNzbKd6kPmCcnGJYIW1OKBwsiwSZm8Yi/zil1wlR2HQxy2
 nJlhgThOHeOUUnkZc+1QZobmt/P2kj1eegZPvZFd3kO5hJuETXZiipQfA
 +ZS2YtgXS4YRPGOqYev4+5hI7wsX0rJoWbOJUn3YvWnDLYRjoBrkmKPvi w==;
X-CSE-ConnectionGUID: kjTb7+gMSUarGr9P0qo8Ng==
X-CSE-MsgGUID: mgc1PR0pRXiHtrTS7AmfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1007026"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1007026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:44:12 -0700
X-CSE-ConnectionGUID: pHdhGfBeTyKYQS5Q9FPrEg==
X-CSE-MsgGUID: uJCK+QmGQFG5MenBxfaMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272798014"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 05:44:10 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_joiner: Pass output array into
 test_single_joiner()
Date: Mon, 21 Sep 2026 12:44:06 +0000
Message-ID: <20260921124408.358774-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921124408.358774-1-mika.kahola@intel.com>
References: <20260921124408.358774-1-mika.kahola@intel.com>
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

Take the igt_output_t array directly instead of a force_joiner bool,
so the caller picks the array instead of test_single_joiner() doing
it internally.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_joiner.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index dfcb24004..2f069db67 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -275,18 +275,16 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	}
 }
 
-static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
+static void test_single_joiner(data_t *data, igt_output_t **outputs, int output_count)
 {
 	int i;
 	enum pipe pipe, master_pipe;
 	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
 	igt_output_t *output;
 	igt_plane_t *primary;
-	igt_output_t **outputs;
 	igt_fb_t fb;
 	drmModeModeInfo *mode;
 
-	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
@@ -708,7 +706,7 @@ int igt_main()
 	igt_subtest_with_dynamic("basic-big-joiner") {
 		require_big_joiner(&data, FORCE_JOINER_DISABLE);
 		igt_dynamic_f("single-joiner")
-			test_single_joiner(&data, data.big_joiner_output_count, false);
+			test_single_joiner(&data, data.big_joiner_output, data.big_joiner_output_count);
 		if (data.big_joiner_output_count > 1)
 			igt_dynamic_f("multi-joiner")
 				test_multi_joiner(&data, data.big_joiner_output_count, false);
@@ -753,7 +751,7 @@ int igt_main()
 		require_big_joiner(&data, FORCE_JOINER_ENABLE);
 		igt_dynamic_f("single") {
 			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-			test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			test_single_joiner(&data, data.non_big_joiner_output, data.non_big_joiner_output_count);
 			igt_reset_connectors();
 		}
 
-- 
2.43.0


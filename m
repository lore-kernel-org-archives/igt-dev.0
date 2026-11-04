Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13A6606A32D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HWOkmxgb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BC510E130;
	Wed,  4 Nov 2026 13:09:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5910E5A5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797663; x=1825333663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S7/kCAaGcUUDYx1RIVr6h0CiiYSYHo5QhlicQUExDzM=;
 b=HWOkmxgbQryZ65F0KEQMzLPGjbVXi1K3JsNd4+L5ywx8c6nM1FWXvGEG
 lJxkSW5uk2Qpq7/m2upFLFLiDyzdk4UO+So9KFa9ADk8cLwiOR06mVEBG
 OSSTEVv8CuZPoXswdus7rPptNkSBeoSHiZNuxwT53n9MOfNNO69UYF2EE
 xz45eEWXjXvuGnJdI0T7f0gZhRgR75eAJcaid8fpFNthZSXwkVHRwEwuO
 hr8qnHCAucUInxFy5IvkX5Z0LSj6xrAo4zq3PFWXoTTX/avPJ4jXTKnCB
 BLMmYiwVby8+xSstXOH5e6v8kL4MNXGxD/wGjsIm3C/XKajBwo+V+gGWa A==;
X-CSE-ConnectionGUID: FoA94GyVT7y16/ktS3+TsA==
X-CSE-MsgGUID: nQoBqXgwSjuNUZCN9yWcDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424639"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:07:42 -0800
X-CSE-ConnectionGUID: 3aoYXgmrQeSio+UYSWXNvA==
X-CSE-MsgGUID: 9r4QuEJRQyqcUKiL4iyclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6565699"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa008.jf.intel.com with ESMTP; 04 Nov 2026 05:07:41 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/kms_joiner: Pass output array into
 test_single_joiner()
Date: Wed,  4 Nov 2026 13:07:35 +0000
Message-ID: <20261104130737.2549248-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104130737.2549248-1-mika.kahola@intel.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Take the igt_output_t array directly instead of a force_joiner bool,
so the caller picks the array instead of test_single_joiner() doing
it internally.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_joiner.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index fce24f2bd..0a04f7ca8 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -275,18 +275,16 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	}
 }
 
-static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
+static void test_single_joiner(data_t *data, igt_output_t **outputs, int output_count)
 {
 	int i;
 	enum hardware_pipe pipe, master_pipe;
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


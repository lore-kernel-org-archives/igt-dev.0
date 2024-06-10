Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD98C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A8210E417;
	Mon, 10 Jun 2024 16:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7v6ZkBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DD510E417
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037770; x=1749573770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7nbu411YHTBR87K7q2G1eivTYepQZYvlXpr2+LtanXM=;
 b=M7v6ZkBvdNfzyz70Dpl0pnkUzNa97bz2Tu2uqSOPylp8zL5jLSoJ9oXy
 IamkpCPKCVmmj7CRog3o04++WtimxvMeGPa5kCGJRfVUgTwsH6ZK40dw1
 safACVHRbDJj8Cd2i4j1yBZsnhQ94A16szXAzYJt3sgdQ9b8VCYVQZvhR
 w89iCrzpai2HZ3Wb7o1JkVvxUhaE/4C6/DfNssvQm/IVapJtDzNgoX9x5
 +23w2389Tm4pT+F+vitacpytalm55sXucfOlAwNd2aIehjxMSVkDuN7Ep
 8uQ1/tbGgEZ52bL/jbHCODZbb4QNp9EVUMkc9UxTI+bFec4vXCLATlMxJ g==;
X-CSE-ConnectionGUID: SWit9gORQgGGvBoiXtrrlQ==
X-CSE-MsgGUID: CiiX54R8Txy0tj96U5KtDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819693"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:50 -0700
X-CSE-ConnectionGUID: f+hw/KxJS/WmqTHemh/kUA==
X-CSE-MsgGUID: GmI2oLx8T2KqyFRvTCiK8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681329"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/9] tests/intel/kms_pipe_b_c_ivb: Test cleanup
Date: Mon, 10 Jun 2024 22:04:50 +0530
Message-ID: <20240610163457.3711476-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

v2:
- Corrected commit subject. (Swati)
- Removed comments (Swati)

v3: (Bhanu)
- Rebase

CC: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pipe_b_c_ivb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 71699e792..73083408a 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -164,7 +164,7 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 		if (pipe == PIPE_C && output != *output1 && !*output2)
 			*output2 = output;
 
-		igt_output_set_pipe(output, PIPE_ANY);
+		igt_output_set_pipe(output, PIPE_NONE);
 	}
 
 	igt_skip_on_f(!*output1 || !*output2, "Not enough connected outputs\n");
@@ -176,6 +176,7 @@ test_dpms(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -198,6 +199,8 @@ test_lane_reduction(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
+
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -221,6 +224,7 @@ test_disable_pipe_B(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -247,6 +251,7 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -270,6 +275,7 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 	igt_output_t *output1, *output2;
 	int ret;
 
+	igt_display_reset(&data->display);
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
@@ -296,6 +302,7 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
-- 
2.43.2


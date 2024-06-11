Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C495C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1847810E3D3;
	Tue, 11 Jun 2024 05:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnU7FQ06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0CB10E392
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082096; x=1749618096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7nbu411YHTBR87K7q2G1eivTYepQZYvlXpr2+LtanXM=;
 b=ZnU7FQ06/0Di6oMvkkFGWUMF2E9zL37hk1J9CP4WmMy6hMmZFKpjW45p
 smVoHLuTqD8Un9315PlBqbfCPUoEUB2UpUsb4Cv8cU930qksnzVjW30aw
 Y84eqj/7WcSNqW8ZozjFPs+rc+ncfxTsJJaWPYESP3hhWrqdVLuVu85wo
 n7A0zCHobLxnOUpmahTyl9ncNTcN3x15PUh4HGZvEkWlF4pSKHQcWYe9d
 tpcu5P4A5ghScPxfT3gXIuU9DygwKBEt4dhhtXaOoVBocbA7ecyXkrbqR
 +mTt0q+yWDUQllgXNiIAWy8+lwqUyvTLZNCDhZKM5mBVXO/EEepvKLJI/ g==;
X-CSE-ConnectionGUID: pYcipWSMSxa3P1hri2uLfw==
X-CSE-MsgGUID: 5p60migRSKmcnO456+yJEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997482"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:36 -0700
X-CSE-ConnectionGUID: DqSp7mZEQbaTov4AlTaqNw==
X-CSE-MsgGUID: s43OdhC1S/ucaD1hcKUSCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981185"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:35 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/8] tests/intel/kms_pipe_b_c_ivb: Test cleanup
Date: Tue, 11 Jun 2024 10:23:42 +0530
Message-ID: <20240611045348.3727239-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4253DC0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01F710E73B;
	Tue, 11 Feb 2025 17:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIqqaiVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94EC10E254
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296207; x=1770832207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fb7AMJ8Cbt+ACFrRF26oyNNVYcVxJtmQAfNgHxDAMbk=;
 b=jIqqaiVGxjuIdiJIdys9PEiVcn1RPMMH9pcqsg1uZFmynzL8k7HH5pzk
 OTdGfzngdzz481kVy1bV3lQjlH484bFKXhxmqd51fxNMc2yH0076rWoe6
 y36OgUY3k1z2j0GRjgvpvjc83pVoQVZTH45P2UW3FR55iQzOSWUT8g9Ge
 WuFc9RtCYcL+nPAvLUYux3J1/lYufiI7IG02F125oPWV4zk5X1y4c85Gb
 xhSooQLabkr7/H5wgp/RMKUhfdJYD2WQnL1Ckkba2J1SEsOjFEbTMI0Pj
 qmpy0HqAcGqmyWpjZmaf34TtqRliUCQLY58s1UdQw7gs+d67FBmw3lpY3 Q==;
X-CSE-ConnectionGUID: joofoyTqRGGiavoA4L9FZQ==
X-CSE-MsgGUID: 5vktTk37QHOG5Oy9zLcZJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339096"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:07 -0800
X-CSE-ConnectionGUID: hjfe8e1dRritIPw2xUXDIQ==
X-CSE-MsgGUID: bSObCVZWQBqF+B7GI9XHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767470"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/7] tests/intel/kms_dp_linktrain_fallback: refactor
 find_mst_outputs
Date: Tue, 11 Feb 2025 23:35:36 +0530
Message-Id: <20250211180542.1430676-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

refactor find_mst_outputs to improve error handling

v2: change return type to int (Ankit)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 415005774..edf9409b6 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -47,26 +47,33 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
 
 IGT_TEST_DESCRIPTION("Test link training fallback");
 
-static void find_mst_outputs(int drm_fd, data_t *data,
-			     igt_output_t *output,
-			     igt_output_t *mst_outputs[],
-			     int *num_mst_outputs)
+static int find_mst_outputs(int drm_fd, igt_display_t *display,
+			    igt_output_t *output,
+			    igt_output_t *mst_outputs[],
+			    int *num_mst_outputs)
 {
 	int output_root_id, root_id;
 	igt_output_t *connector_output;
 
+	if (!igt_check_output_is_dp_mst(output))
+		return -EINVAL;
+
 	output_root_id = igt_get_dp_mst_connector_id(output);
+	if (output_root_id == -EINVAL)
+		return -EINVAL;
 	/*
 	 * If output is MST check all other connected output which shares
 	 * same path and fill mst_outputs and num_mst_outputs
 	 */
-	for_each_connected_output(&data->display, connector_output) {
+	for_each_connected_output(display, connector_output) {
 		if (!igt_check_output_is_dp_mst(connector_output))
 			continue;
+
 		root_id = igt_get_dp_mst_connector_id(connector_output);
 		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
 			mst_outputs[(*num_mst_outputs)++] = connector_output;
 	}
+	return 0;
 }
 
 static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
@@ -83,8 +90,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
 			return false;
 
-	find_mst_outputs(data->drm_fd, data, data->output,
-			 mst_output, output_count);
+	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
+				      data->output, mst_output,
+				      output_count) == 0,
+				      "Unable to find mst outputs or given optput is not mst\n");
 
 	for (i = 0; i < *output_count; i++) {
 		output = mst_output[i];
-- 
2.25.1


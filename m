Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1C0CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE91110F59D;
	Thu,  1 Oct 2026 07:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYleyj7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88B10F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838998; x=1822374998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTkZVzsuUzfe97b9QC7klPNZ0pF1JszmoujjX/0PwNM=;
 b=eYleyj7sYSTskcBBsSm7rAJ18RvKAl79B33QAQFOH0yVfHC1PffxfPvX
 HjkNfMZCj1vlXuD9eGF2q/ajIWGt/vVNtsXsQI2dlXzIXzb6lqh6XQ3vP
 3Ojwil6ARiwJLMrbC0ZDFSycApDx9XtZ5NmHiqjFiqxxkaA2hg+BR7rap
 kKm9FnsghyDBA4s3CeIwq7Hr4AJWRb9vNLr38X8T67vivRyHJBWI3HILz
 aiHU02zOtdi8ohzDqJF+18dNe5HceRJ+lwj7VFzW7/6Nf3uTp/iiYjG3Y
 0yLdZFNx24WvI8pWy5eMkBeR9pf6aa2Qj5GY9dScyMiaTRYKCFXM8G9cw A==;
X-CSE-ConnectionGUID: ubF616fIT76C9g8RgvYj1g==
X-CSE-MsgGUID: tQBPCRb5R4GRAxOCTQu6RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605996"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:55 -0700
X-CSE-ConnectionGUID: i0Gb+PhzSde1TvGh9BFULA==
X-CSE-MsgGUID: EIhige59Sx6B1dZ8wEU1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138333"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:54 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 09/13] tests/intel/kms_dp_link_training: train each MST
 topology only once
Date: Thu,  1 Oct 2026 13:06:59 +0530
Message-Id: <20261001073703.5067-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

The test loops over the connected outputs, so an MST topology gets
trained once per stream. The link params are forced for the whole
topology, so it's the same link trained over and over again.

Collect the DP outputs into links first, one per MST topology, and
record SST/MST and the Type-C port mode once per link. The dynamic
subtests for the other streams of a topology go away.

This prepares for selecting links by Type-C port mode.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_link_training.c | 111 +++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 22 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 9105570d1..477dc03ba 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -39,6 +39,8 @@
  */
 #define LINK_RECOVERY_TIMEOUT	5.0
 
+#define MAX_LINKS		16
+
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
@@ -46,6 +48,18 @@ typedef struct {
 	igt_output_t *output;
 } data_t;
 
+/*
+ * struct dp_link - One trainable DP link.
+ *
+ * @output is the output the link is driven through, which for MST is the first
+ * of the topology's streams. The classification is discovered, never chosen.
+ */
+struct dp_link {
+	igt_output_t *output;
+	bool mst;
+	enum i915_dp_tc_mode tc_mode;
+};
+
 /*
  * check_condition_with_timeout - Polls check_fn until it returns 0
  * or until 'timeout' seconds elapse.
@@ -535,42 +549,95 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
  * early, then calls run_link_rate_test(). Returns true if it ran on at
  * least one matching output.
  */
-static bool test_link_rate(data_t *data, bool mst, bool uhbr)
+/*
+ * discover_links - Collapse the connected DP outputs into links.
+ *
+ * One link is one trainable DP link, so a whole MST topology becomes a single
+ * entry, represented by the first of its streams. Forcing link parameters on
+ * one stream affects every stream in the topology, so training a topology once
+ * per stream would train the same link repeatedly.
+ */
+static int discover_links(data_t *data, struct dp_link *links, int max_links)
 {
-	bool ran_any_output = false, is_mst = false;
-	igt_output_t *tmp_output;
+	igt_output_t *output;
+	int num_links = 0;
+	int i;
 
-	igt_skip_on_f(!is_intel_device(data->drm_fd),
-		      "Test supported only on Intel platforms.\n");
+	for_each_connected_output(&data->display, output) {
+		bool mst, seen = false;
 
-	for_each_connected_output(&data->display, tmp_output) {
-		if (tmp_output->config.connector->connector_type !=
+		if (output->config.connector->connector_type !=
 		    DRM_MODE_CONNECTOR_DisplayPort) {
 			igt_info("Skipping non-DisplayPort output %s\n",
-					tmp_output->name);
-			igt_info("----------------------------------------------------\n");
+				 igt_output_name(output));
 			continue;
 		}
 
-		/* Early skip if MST vs. SST does not match. */
-		is_mst = igt_check_output_is_dp_mst(tmp_output);
-		if (mst && !is_mst) {
-			igt_info("Skipping %s: MST requested but it's SST.\n",
-					tmp_output->name);
-			igt_info("----------------------------------------------------\n");
+		mst = igt_check_output_is_dp_mst(output);
+
+		if (mst) {
+			int root = igt_get_dp_mst_connector_id(output);
+
+			for (i = 0; i < num_links; i++)
+				if (links[i].mst &&
+				    igt_get_dp_mst_connector_id(links[i].output) == root) {
+					seen = true;
+					break;
+				}
+		}
+
+		if (seen) {
+			igt_info("Skipping %s: same MST topology as %s\n",
+				 igt_output_name(output),
+				 igt_output_name(links[i].output));
+			continue;
+		}
+
+		if (num_links == max_links) {
+			igt_info("Skipping %s: more than %d DP links connected\n",
+				 igt_output_name(output), max_links);
 			continue;
-		} else if (!mst && is_mst) {
-			igt_info("Skipping %s: SST requested but it's MST.\n",
-					tmp_output->name);
+		}
+
+		links[num_links].output = output;
+		links[num_links].mst = mst;
+		links[num_links].tc_mode = i915_dp_get_tc_mode(data->drm_fd,
+							       output, NULL, NULL);
+		num_links++;
+	}
+
+	return num_links;
+}
+
+static bool test_link_rate(data_t *data, bool mst, bool uhbr)
+{
+	struct dp_link links[MAX_LINKS];
+	bool ran_any_link = false;
+	int num_links;
+	int i;
+
+	igt_skip_on_f(!is_intel_device(data->drm_fd),
+		      "Test supported only on Intel platforms.\n");
+
+	num_links = discover_links(data, links, ARRAY_SIZE(links));
+
+	for (i = 0; i < num_links; i++) {
+		if (links[i].mst != mst) {
+			igt_info("Skipping %s: %s requested but it's %s.\n",
+				 igt_output_name(links[i].output),
+				 mst ? "MST" : "SST",
+				 links[i].mst ? "MST" : "SST");
 			igt_info("----------------------------------------------------\n");
 			continue;
 		}
-		data->output = tmp_output;
+
+		data->output = links[i].output;
 		igt_info("Running link training test for %s\n",
-			 data->output->name);
-		ran_any_output = ran_any_output | run_link_rate_test(data, mst, uhbr);
+			 igt_output_name(data->output));
+		ran_any_link |= run_link_rate_test(data, mst, uhbr);
 	}
-	return ran_any_output;
+
+	return ran_any_link;
 }
 
 IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
-- 
2.25.1


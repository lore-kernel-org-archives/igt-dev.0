Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19778C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC68710E0B0;
	Wed, 16 Sep 2026 04:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9CW4ynt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C710E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532803; x=1821068803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Uj/WRAKQQLMWbSuJ3Kz9fiKcpfF+CwPrwdjNb0EGMQ=;
 b=I9CW4yntlSleeevSk0Ag4EldWBx3/udshWDGEt+n3zTea14Ct5N+RMlf
 ww0Db6x/gLpygiScS4NplQO7DoopF7rphbpvlRRtUVa/+PANjFYMwiLvy
 ipQCOZYjpzTv2mFvXrJzVXrxyNgoqypAuEdNeC4+ZIKVYLBWe/bbiIS0c
 ZySPpS8YDu0CiBKnK9+ohNU9nG5Uk4W8r+U88Xuum81yAifgAH+i+Gqfp
 aHO0rf299b5jUMBoXW44lgF0p/Sp4oDnHLDhAcbkEk6t95qNqW7kA1k3R
 2emknc62gUp9l7E/z4mbR9TTe4udwVXNbum5F+Op9bqSK+sVw3DAornTI A==;
X-CSE-ConnectionGUID: goRWghJ8RVyXdymPn4xPeg==
X-CSE-MsgGUID: iNQZs0nLQV2b5AD6FkwsXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503249"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:43 -0700
X-CSE-ConnectionGUID: ZlcfuWMpRmibNLnYS+7cuw==
X-CSE-MsgGUID: J+NoZtbwTS2x2SeHwk1RUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765059"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:43 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 09/13] tests/intel/kms_dp_link_training: Group the
 outputs into links
Date: Wed, 16 Sep 2026 10:17:57 +0530
Message-Id: <20260916044801.1279102-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

The output loop walks connectors and decides SST or MST for each one,
so an MST topology is visited once per stream: the classification is
redone every time and the same link is trained once per stream, since
forcing link parameters on one stream affects the whole topology.

Collect the connected DP outputs into a list of links, where one link
is one trainable DP link and a whole MST topology is a single entry
represented by the first of its streams, and record the protocol and
the connector mode once per link.

Stop collecting rather than fail when more links are connected than the
list holds. Discovery runs in a igt_subtest_with_dynamic() container,
where explicit failure is not allowed.

An MST topology is now trained once instead of once per stream, so the
dynamic subtests named after the other streams go away. They were
training the same link at the same configurations.

Prep for subtests that select links by connector mode.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 111 +++++++++++++++++++++++------
 1 file changed, 89 insertions(+), 22 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 812c4b6bc..e6160cee5 100644
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
@@ -532,42 +546,95 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
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


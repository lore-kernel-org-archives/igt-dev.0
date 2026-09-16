Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD521C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BF610E03E;
	Wed, 16 Sep 2026 04:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNSL8Z4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A8710E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532799; x=1821068799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zhd3vwAVjcj7QLN7ISHx40T8/vpkIbPzTW7kjqV9Ko=;
 b=QNSL8Z4JgLmFqZIQ4olNYsU+zokgMDJyD33Ja3iP5Xj2irHrgAUZork/
 1s4gMC4+dHX4OzNVDqRlP33n0+iglfH3mhMI444jByjDMeeGpFfIvV4Oj
 si84ph3T0MmR+IGyl4+embzrFEB4qy3HaNq70ABC7irzTRKSixbPBcWbh
 EuheJkipisdgpq3PGmbr8M5uUKzFxToMlDTq/X2bXBU0CblwLPfqQU2BV
 IAkwDDnJ/PD6Wj+wW0f/NsvHrxCqCbAtvQzbvnpfVlf34s5W386TZajmF
 yEou9xTi+OufBjuyXjeQi60xxNhtQVkMZwP+CbHFKJc0Tg0ZQJ7BqA5w/ A==;
X-CSE-ConnectionGUID: ePG6qLxZQ/2GSXFKBDN7lA==
X-CSE-MsgGUID: DPbRaEvORpiWjDTb3b3oZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503243"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503243"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:38 -0700
X-CSE-ConnectionGUID: K51xQjYlRemEG5wmLu3hMA==
X-CSE-MsgGUID: YGQf7zwvQpK1eX3nsFMcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765041"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:38 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/13] tests/intel/kms_dp_link_training: Drive the
 smallest mode the sink offers
Date: Wed, 16 Sep 2026 10:17:53 +0530
Message-Id: <20260916044801.1279102-6-kunal1.joshi@intel.com>
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

The test modesets the output's preferred mode, which on a modern
monitor needs most of the link. The driver picks the lowest
configuration that carries the mode, so a large mode leaves most of the
link configurations below the threshold where they can be used at all.

Override the smallest mode the sink offers instead. That keeps the
largest number of configurations usable, and it stays out of the
compressed regime, where the bpp the driver picks rather than the link
configuration absorbs the difference.

The override is cleared by the igt_display_reset() each run starts
with, so it needs no explicit teardown.

Prep for training every allowed configuration.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index b2d686f28..6a174da88 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -183,6 +183,25 @@ static void train_link_config(data_t *data, bool mst,
 	assert_link_recovery_idle(data, config);
 }
 
+/*
+ * override_lowest_mode - Drive the mode with the lowest pixel clock, so that
+ * the largest number of link configurations can carry it.
+ */
+static void override_lowest_mode(data_t *data, igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *mode = NULL;
+	int i;
+
+	for (i = 0; i < connector->count_modes; i++)
+		if (!mode || connector->modes[i].clock < mode->clock)
+			mode = &connector->modes[i];
+
+	igt_assert_f(mode, "No mode on output %s\n", igt_output_name(output));
+
+	igt_output_override_mode(output, mode);
+}
+
 /*
  * setup_planes_fbs - Create solid-color FBs and attach them to the primary plane.
  */
@@ -222,6 +241,7 @@ static void do_modeset(data_t *data, bool mst)
 	int n_pipes = 0;
 	int out_count = 0;
 	igt_crtc_t *crtc;
+	int i;
 
 	for_each_crtc(&data->display, crtc) {
 		valid_pipes_mask |= BIT(crtc->hardware_pipe);
@@ -241,6 +261,9 @@ static void do_modeset(data_t *data, bool mst)
 
 	igt_assert_f(out_count > 0, "Require at least one output\n");
 
+	for (i = 0; i < out_count; i++)
+		override_lowest_mode(data, outs[i]);
+
 	igt_set_all_master_pipes_for_platform(&data->display, &master_pipes_mask);
 
 	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
-- 
2.25.1


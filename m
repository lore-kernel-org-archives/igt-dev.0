Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA38CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AB410F59D;
	Thu,  1 Oct 2026 07:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKmu+C4b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662F710F59F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838997; x=1822374997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDQTbUC+zjlLBTMR9s+FiBKvvIIrpsoECDboeD+hXCQ=;
 b=WKmu+C4bCduyrNHvDobqP6sirJdEVGk37Pr6fmiFUJ29k8KjtGCNJLtO
 QixjkJskQ2O6rf3V9MVeDLT99Oh6gHeLx6egeSjliOPUvZXJtxJRIqMMl
 058aFFCzsvxGeQygSN/7liU/FETGzqZzR5IA+WpiGk2oTLFGNjfJpmGAT
 C2vDSYl2FbP1QQLudKAxoovL+FD3mF/Y/I7xR6knigAo9OqFgI6Z8Tcxl
 E1mgf3O9A0UO08IHheRo1U+4EVnfiQcyRVRK1szSGKheHoUKvuGu0S9hD
 mzOxAKN+u1TdafCmsk7YzQmQumnGqXV+JRV4M+DMiPjrgqiOp4/M2dWsE w==;
X-CSE-ConnectionGUID: dGIJkxhaQxaijbL7tcWq5Q==
X-CSE-MsgGUID: 1ThL51aDQRyCnNk93LoXKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605991"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:49 -0700
X-CSE-ConnectionGUID: sDYoW0luTuCHa9RAutqkmQ==
X-CSE-MsgGUID: jfMc7NQoTg6DlQoyV+w1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138318"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:49 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 05/13] tests/intel/kms_dp_link_training: use the lowest
 pixel clock mode
Date: Thu,  1 Oct 2026 13:06:55 +0530
Message-Id: <20261001073703.5067-6-kunal1.joshi@intel.com>
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

The preferred mode of a modern monitor may need most of the link
bandwidth, leaving the lower link configs unusable. Use the mode with
the lowest pixel clock instead, so that as many configs as possible can
carry it. This should also keep DSC out of the picture.

The override is cleared by igt_display_reset(), so there's no need to
clean up.

This prepares for training all the allowed link configs.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_link_training.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 8d079ffb0..76bbe3733 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -185,6 +185,25 @@ static void train_link_config(data_t *data, bool mst,
 	assert_link_retrain_not_disabled(data, config);
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
@@ -224,6 +243,7 @@ static void do_modeset(data_t *data, bool mst)
 	int n_pipes = 0;
 	int out_count = 0;
 	igt_crtc_t *crtc;
+	int i;
 
 	for_each_crtc(&data->display, crtc) {
 		valid_pipes_mask |= BIT(crtc->hardware_pipe);
@@ -243,6 +263,9 @@ static void do_modeset(data_t *data, bool mst)
 
 	igt_assert_f(out_count > 0, "Require at least one output\n");
 
+	for (i = 0; i < out_count; i++)
+		override_lowest_mode(data, outs[i]);
+
 	igt_set_all_master_pipes_for_platform(&data->display, &master_pipes_mask);
 
 	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
-- 
2.25.1


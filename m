Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002C109C046
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 16:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A73B10E820;
	Wed, 25 Mar 2026 16:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QluH2djF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7169610E822
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774457589; x=1805993589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YY0U5yG08Y3FSmq2d+hZi/96JYGcieLCluFpLt6OPoQ=;
 b=QluH2djFtFdV30wmrfLzhnuLB81GJmQj6C/aCaJvgSC/ZEnPo9NiVLTm
 myz98U/c2ml8EseQG+TNCT5ZLCIxarZZCiF1wZBc4py6ZSFyyGHkB4FUb
 xsYVk0bWivsJ5l3ikRewivW+HJ3urJ+Q2slyE05mkb9N1K1ZMnaqiUMFX
 Bj4VtAV/qqDNwasHsrAwqbvf44JR7rr8fLl0KAIC+T/uX85cyIRjm3vvX
 0Oo8VINfHBIOEhG7BfbPxXd7UOw2Wb9GBBxvwdG3Ot7gza70RruqiX9W1
 B+UFHY986gTwXQF8VY2GSHZC28LhZuvkJZwUFodpCN5VTlaAWfqaUq4nk g==;
X-CSE-ConnectionGUID: tnbISyJtSKuta09rsm50iw==
X-CSE-MsgGUID: AEdsil5JTVGWytIL8fQGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92880605"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="92880605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:53:09 -0700
X-CSE-ConnectionGUID: NrfdIYAnSeqN57orBINQSA==
X-CSE-MsgGUID: a25XeBSER3e0Ep10eMBHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224991845"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:53:08 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/kms_fbc_dirty_rect: Use per-output
 PSR check before disabling
Date: Wed, 25 Mar 2026 22:21:37 +0530
Message-ID: <20260325165140.115520-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325165140.115520-1-jeevan.b@intel.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
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

Pass output to psr_sink_support so PSR/PR is disabled only when
the sink supports it. Using NULL performs a global check and can
be incorrect on multi-eDP systems.

v2: Update title, include PR and output name in log, check
    psr_disable return value.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index efbd46985..c58ab3465 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -414,11 +414,15 @@ static bool prepare_test(data_t *data)
 	igt_require_f(intel_fbc_supported(data->crtc),
 		      "FBC not supported by the chipset on pipe\n");
 
-	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
-	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
-		igt_info("PSR is supported by the sink. Disabling PSR to test Dirty FBC functionality.\n");
-		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, data->output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, data->output)) {
+		igt_info("PSR/PR supported on %s, disabling for dirty FBC test\n",
+			 igt_output_name(data->output));
+
+		igt_require_f(psr_disable(data->drm_fd, data->debugfs_fd, data->output),
+			      "Failed to disable PSR/PR on %s\n",
+			      igt_output_name(data->output));
 	}
 
 	if (data->feature & FEATURE_FBC)
-- 
2.43.0


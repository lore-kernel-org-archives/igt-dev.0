Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B8AD58CB1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 06:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77910E30D;
	Mon, 23 Mar 2026 06:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PspLBEM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3710E30D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 06:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247688; x=1805783688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HtCVpeRF52I4uM9wWNlOWtluxWQIg3B3sEuSo2NXo9k=;
 b=PspLBEM9/JMbXglRnpt/RtchHCr9QtahM6ZjTwijFfOBgVAicZPNMoKm
 7+t3+s3ejp4jk+oeiwApkWmS4SQuC6MiXtUHSiLJqYyDRZkJXC2+ZXq4h
 Zx46BLapVUrsnbnVR0V6OKxugCjFKdpjaLzD51QwENhNucYxVDOzIJwYF
 jdYaQnTUFR192GUPFYWZBcZn628iGZlW31SAnjdg/5ybTa/8SxhyBQMli
 v/TBf0KvsTCViw7zdB2ALNN4+Ll831wS47TIiu+V8lqh4Fjf39+3a0Y/6
 VqBJIto1xtWOy96sja5RjCAjaADrVD7DT5KXJyvFnU6ajYM5F3ejgh6iM g==;
X-CSE-ConnectionGUID: S/0Qil2DQUeQS9HHancN9A==
X-CSE-MsgGUID: sqoriPK2S1yns8bvWs9p3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75123223"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75123223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:34:41 -0700
X-CSE-ConnectionGUID: k08N3M0PQGmCPLQJ5lZGBQ==
X-CSE-MsgGUID: 3/67m7srQw+LD5KGE/XPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228008453"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:34:40 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/kms_fbc_dirty_rect: Avoid unnecessary
 PSR disable
Date: Mon, 23 Mar 2026 12:03:07 +0530
Message-ID: <20260323063309.99649-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323063309.99649-1-jeevan.b@intel.com>
References: <20260323063309.99649-1-jeevan.b@intel.com>
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

Pass output to psr_sink_support so PSR is disabled only when the
sink supports it. Using NULL performs a global check, which is
unnecessary and can be incorrect on multi-eDP systems.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index efbd46985..e7634dbab 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -414,9 +414,9 @@ static bool prepare_test(data_t *data)
 	igt_require_f(intel_fbc_supported(data->crtc),
 		      "FBC not supported by the chipset on pipe\n");
 
-	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, NULL) ||
-	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)) {
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, data->output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, data->output)) {
 		igt_info("PSR is supported by the sink. Disabling PSR to test Dirty FBC functionality.\n");
 		psr_disable(data->drm_fd, data->debugfs_fd, data->output);
 	}
-- 
2.43.0


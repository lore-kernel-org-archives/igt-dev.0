Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F4DF433C7
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560EC10E172;
	Thu, 16 Apr 2026 03:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euh6f6Ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AA810E172
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776311734; x=1807847734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X2CVJpGIcqLicOdzrcL0cnkhA2QPmuZ3gQArOAhuoFY=;
 b=euh6f6EyoHlYgk2bWs3ezpXl2oCqou97g1H7eq7eTM6NgvvsUKyTnA3w
 LILtpkCBqGB1OCH17oti4FwZGnJguyUNLfQDMEPe33zMRMu0c5m93rrOG
 q/od8LT2rtLlr8vcIaWwp15Hgu0rDno1ctIt+sbZ1YpllHI/Ctkwi+9Gd
 ZjGgj7QVmWqdzZx9+2qjwtUxj9ejcapgx+Y02gf1urX3fX1+9HV/J1qi0
 KXH6g6XKZBmgeGE/fLJTNhJc9RQtYTQBN4Q96BIODH5FMthO5upL4ysOO
 b0IYNA7Oo+wCOYGqbaXM+y0ZzRiRr/mpthfCKyArnjF6tUb+ZaoNR5Zg1 g==;
X-CSE-ConnectionGUID: fV4kgFl1SH2RSBBa1nL5ZA==
X-CSE-MsgGUID: 9mvKOTDYQ+WcysraPwTL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77002042"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77002042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:55:34 -0700
X-CSE-ConnectionGUID: RZemjHuNRfywYEgE2ts+wQ==
X-CSE-MsgGUID: oijSbs8GTu+OyKmnzsk5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253867757"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:55:32 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 1/4] tests/intel/kms_fbc_dirty_rect: Use per-output
 PSR check before disabling
Date: Thu, 16 Apr 2026 09:23:30 +0530
Message-ID: <20260416035333.69004-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416035333.69004-1-jeevan.b@intel.com>
References: <20260416035333.69004-1-jeevan.b@intel.com>
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
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index ee13e95dd..4187ee072 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -429,11 +429,15 @@ static bool prepare_test(data_t *data)
 
 	igt_require_f(check_fbc_supported(data), "FBC is not supported with this configuration\n");
 
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


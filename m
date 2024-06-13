Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF51DC27C7B
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F24E10E9B9;
	Thu, 13 Jun 2024 09:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPF8nCK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31E210E9BE
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270761; x=1749806761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zjqqY1jqAXrBdJ1Is0wNetpgn0P4dYJLD0EYwQjhQLI=;
 b=hPF8nCK3ywZ9YqAER2AchTeHCSdkgdr6/6M2S6nKtgxcNZlnA1BLODUc
 4Iy8S038PZuS59CCTQS2uPbGVp658XYbleyUjKAjMA1CD/vqJf5V5YDqk
 6V8lpFXu1/it1901nCHhOoT5u7a/3e4EgbYZMGmGS4eVUguvq0hWUf+sr
 lYoKdsjFroVuFYGEDyCFFCToxfqeoPvM/rsY6xRFzmnmJwCz0QYU0iTTd
 OfneDFFlPdJZtFeJ3QipJBlGDp4Ke+gF9FLuVHNszYYlPWt+NrT2/ZVjF
 tP5crXmnR5xJpY565d9YizhktMbhoAX4uyiOkiCkJf/M3F3RwO7NFIKMx Q==;
X-CSE-ConnectionGUID: MbsjtJ3rSA6HCrYMr2UiOA==
X-CSE-MsgGUID: hVWa7DTyR+m/b37K20CCww==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004697"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:58 -0700
X-CSE-ConnectionGUID: iIQjRHACQaOcSa0aoCmnxA==
X-CSE-MsgGUID: w6khQ1kvRj+5eUL5gL6qQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045501"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:31 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 3/6] lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP
 PR_* in psr active check
Date: Thu, 13 Jun 2024 12:25:11 +0300
Message-Id: <20240613092514.1288801-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613092514.1288801-1-jouni.hogander@intel.com>
References: <20240613092514.1288801-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Panel Replay expected state is always SRDENT for DP2.0 Panel Replay.
For eDP1.5 Panel Replay it is SLEEP. Due to this output is now mandatory
parameter to psr_active_check if PSR mode is Panel Replay.

Bspec: 68920, 68934

v2: fix mode checks

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index d1286276c..012521fc5 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -57,9 +57,25 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 {
 	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
-	const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ? "SRDENT" : "DEEP_SLEEP";
+	drmModeConnector *c;
+	const char *state;
 	int ret;
 
+	if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH) {
+		igt_assert_f(output, "Output not given\n");
+		c = output->config.connector;
+	}
+
+	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
+	    c && c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		state = "SLEEP";
+	else if (mode == PSR_MODE_1 || mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
+		state = "SRDENT";
+	else if (mode == PSR_MODE_2 || mode == PSR_MODE_2_SEL_FETCH)
+		state = "DEEP_SLEEP";
+	else
+		igt_assert_f(false, "Invalid psr mode\n");
+
 	SET_DEBUGFS_PATH(output, debugfs_file);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
 				     buf, sizeof(buf));
-- 
2.34.1


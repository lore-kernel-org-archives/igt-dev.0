Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DC0C27C7B
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE310EC33;
	Fri, 14 Jun 2024 05:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHZgD5oD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6810E055
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343540; x=1749879540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zjqqY1jqAXrBdJ1Is0wNetpgn0P4dYJLD0EYwQjhQLI=;
 b=fHZgD5oDNWf4UTTL3XzIfUgtBK9TypRt4jIB3Xe//9igh+h7uWAamChB
 OTRbPAefLP4XiNbv9cTtDa3blRG+vpODMob08QPEou1NsvOqJ743DlG+o
 VT9AlI8MVeNIN4t0aX3LuxMaFgo5igH9nacCX1T/l9uFQvAmaeYk/X2a2
 dWjXBHWd0pyaJL4HjMDgNFyTBT3W2LGNgBvOdQoxd56XEtaWPzn/zQBh1
 Q9Mnn+FHXdzKCYuWDgK87MVDMEPQIXmaQR6+41obPoY0EWYUYCiFSNT2H
 tfPiHgA6zI04vRolLrgBGbcEdzIZ/WwFqPR1Co8L5okWLbAr3IMdayX72 A==;
X-CSE-ConnectionGUID: FU3vuCthSy6BnVJGJe5Ixg==
X-CSE-MsgGUID: 4SoBN278Rbq1K9903Rnf/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331588"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:59 -0700
X-CSE-ConnectionGUID: O7LjGoJEQ4agBDR7E1X3qA==
X-CSE-MsgGUID: zepB57i1SJW2OoBjmB/ZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864044"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:58 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 3/7] lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP
 PR_* in psr active check
Date: Fri, 14 Jun 2024 08:38:35 +0300
Message-Id: <20240614053839.1822879-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
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


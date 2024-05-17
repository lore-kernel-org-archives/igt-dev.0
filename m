Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9426EC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69510EE82;
	Fri, 17 May 2024 11:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxzyYAgb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ABF10EE82
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715945511; x=1747481511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ObOleV5f/0aSzkOgYj8BXNGMSXxddSgom25ro+NR160=;
 b=QxzyYAgbnIGKysG+h1EvYiXCZnWNMUOzDYRtLi8SfvYPTDrkTtyyUZ37
 7v8SADSWGcLCZJK/lLENCwROdkkNJMbUjjh6DUfcIVDY8tYKwJyC8kn1I
 P7tS1bynxohdyCB433zwwXaGaLy6KlXHtcDvpq7BxJyDijZRttCwhuOjg
 j/q0hSqfauQq5Xl3EvI8L/OmmdlCiC8O8GxYP4fS6XDeX8woDAktXEg4V
 Al3mETwu1G/jhC4IztsMF8b6J51GymAsooAv1538ENCP7KdnIM1B/LK6g
 GPfRJQ71bZMgyIC6zHZWlnwgUb4nTFitxIDP/1DfuZBA2PxzM3g72I8u+ A==;
X-CSE-ConnectionGUID: n8f7umFfQKGClo22xF2H7Q==
X-CSE-MsgGUID: ImdGfVkjRFyht6UAYGXIUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11958438"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11958438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:31:50 -0700
X-CSE-ConnectionGUID: nfy0cGm2SCiCvre5u2IsSA==
X-CSE-MsgGUID: IYPyzsQBTim+KpzI8zi/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="69210689"
Received: from mspitkan-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.210.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:31:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in
 psr active check
Date: Fri, 17 May 2024 14:31:38 +0300
Message-Id: <20240517113138.2579843-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
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
For eDP1.5 Panel Replay it is SLEEP.

Bspec: 68920, 68934

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..9a8650024 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -57,9 +57,20 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 {
 	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
-	const char *state = (mode == PSR_MODE_1 || mode == PR_MODE) ? "SRDENT" : "DEEP_SLEEP";
+	drmModeConnector *c = output->config.connector;
+	const char *state;
 	int ret;
 
+	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
+	    c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		state = "SLEEP";
+	else if (mode == PSR_MODE_1 || mode == PR_MODE || PR_MODE_SEL_FETCH)
+		state = "SRDENT";
+	else if (mode == PSR_MODE_2 || PSR_MODE_2_SEL_FETCH)
+		state = "DEEP_SLEEP";
+	else
+		igt_assert_f(false, "Invalid psr mode\n");
+
 	SET_DEBUGFS_PATH(output, debugfs_file);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
 				     buf, sizeof(buf));
-- 
2.34.1


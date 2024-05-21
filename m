Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB77C41513
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9510E5AB;
	Tue, 21 May 2024 09:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYA7m4XZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6B10E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282189; x=1747818189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ocVn6ymBiu+Vh3oT0GSRfXPRY+ncHKVUxikHBFFAlk=;
 b=AYA7m4XZpP6m/XqsIXlxoEY/rfQzF/hB+8sbQOsngLBNTnG6kJ+CV1VS
 hgwpawRVJ/ZXdb/YX1N/+hrd2UE+jRtnqWTLzYI5azyFV3yX1radbhqIm
 iQLTF8X18BdB6IvM4WcPH0rrraQRQ3cYnQP7D+dmtt6unSs3rXqB5YS+b
 570F755k7L2D814/wZIIt9d8AyR7JZdAs43+4eUCOlkXTsx49piEAtFh4
 kDMtryZLnvsL+1d8cE7BwFdtQ9/kbprwnijsxNT3WQZyxP4IzfeyKpGfn
 7ZShkSQYnl9xpx3wOLyte0zMkz6Jkol24I+iwTjDnG3B1pXaa4oZ/aRo2 g==;
X-CSE-ConnectionGUID: x/7Tm0OcRg+lO4ql1xF7eg==
X-CSE-MsgGUID: fh3FJs9uRBmchnvmxf0PHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12327360"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12327360"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:54 -0700
X-CSE-ConnectionGUID: wXS1tl2zRVerlHIJfiqLtg==
X-CSE-MsgGUID: XCEafQnZSJyjADcvisUBjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37804268"
Received: from mathiasj-mobl.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:51 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 3/4] lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_*
 in psr active check
Date: Tue, 21 May 2024 12:02:32 +0300
Message-Id: <20240521090233.1998323-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521090233.1998323-1-jouni.hogander@intel.com>
References: <20240521090233.1998323-1-jouni.hogander@intel.com>
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


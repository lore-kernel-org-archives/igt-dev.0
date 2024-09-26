Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12096CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 07:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3510EAA2;
	Thu, 26 Sep 2024 07:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX4CzwNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5794210EAA2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 07:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727334335; x=1758870335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GJvf3ThmhPEVdwdHecNvXA6hb5tn7zYLWf7qu875Rkg=;
 b=UX4CzwNMD4+O45GM87eneM3EKUmCONap63kid58cZe25ecioXKNKH5Xh
 3QMG5QkwF+Gk2bEjOcPxCHX0ARu4IySr6HfDkvZN523hUxd3dxbPUXWCI
 faRYFWsNBxWP2XZ3WPWpg0nouisgXUZ0H1Er5BdyW+1BfCG0OBymgFf9I
 KK8GB6fVQka8N+7Yw9uvQOMDLIJ4W45Cc2eRHNEpp1jwt2Ek4B0WBluqy
 xoQA71LEcRE9m1YcopVZfz7Ud2skSqb4DFXo+xVJAolgigFSTL8xQlfFG
 IwZZPC5nLR0PjdMCj2GuQLHHQC6MwhkIoU6ehWxyCBdxKz2ZHQ73eo4rU Q==;
X-CSE-ConnectionGUID: 0GivHQ/MTFivKPoi5nRP4A==
X-CSE-MsgGUID: WWbJ/5HmSRGs7lbUMAjq2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26225155"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26225155"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:05:34 -0700
X-CSE-ConnectionGUID: wfNoY+56QVGOwHxML9R2NA==
X-CSE-MsgGUID: M2whBo1wQjeC/qfW1fFFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76812865"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.145])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 00:05:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking sink
 status
Date: Thu, 26 Sep 2024 10:05:16 +0300
Message-Id: <20240926070517.1326936-1-jouni.hogander@intel.com>
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

We are currently seeing problems with DP2.1 display emulator devices as
sink Panel Replay status is not updating as expected. For this purpose use
environment variable (IGT_PSR_IGNORE_SINK_STATUS) to disable checking sink
status completely.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index d14a93534..963385967 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -85,6 +85,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	char buf[PSR_STATUS_MAX_LEN];
 	drmModeConnector *c;
 	const char *state;
+	const char *env;
 	bool active;
 	int ret;
 
@@ -114,7 +115,9 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
 	active = strstr(buf, state);
-	if (active && output)
+
+	env = getenv("IGT_PANEL_REPLAY_IGNORE_SINK_STATUS");
+	if (active && output && (!env || !atoi(env)))
 		active = psr_active_sink_check(debugfs_fd, output);
 
 	return active;
-- 
2.34.1


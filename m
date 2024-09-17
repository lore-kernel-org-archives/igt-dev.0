Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CFFC36002
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 09:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F47E10E456;
	Tue, 17 Sep 2024 09:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcNmpQiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04610E208
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726566842; x=1758102842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcux2tdZRSRIK5k/nMlzwcVxB4Z/JIaMyC0+Ssm0Q2Q=;
 b=dcNmpQiGwzDEHw2jB85rEV5i4qEVGxHYsWuxav6LvKn/xly0Wx4XZdSF
 F/sFuLhcITcDcUeKqek3uegHwPiYKj0ZfWlKWMw+zFDSz8j83sFEeLgPb
 r/Sassb/KFOmk+vpN+Z1A2bif3ILfLMFGNAdG0pH8R69WrSO3cY4rw6FR
 m8c6Y1BhcxQ5XBYH/n3F6MM0qYGvChDe7sS/clIcJhj1YcHM7rjfJKuIm
 OI0ZRWqaC7Nx6bXEHMyT6I9+FB43JfutVhexsVrk9vpVY8S5+2N2VmwEC
 cAxEuu8T5us5CQbnIJLYJIc17UGvP0AiQD3fuOZXxvi6o/963MH0gw5mz w==;
X-CSE-ConnectionGUID: QS8c1GaxQPmK+aj4BaOnBw==
X-CSE-MsgGUID: uR3fYKbLRx+OalpNTHxcIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47923419"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="47923419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:54:01 -0700
X-CSE-ConnectionGUID: uxToNyd0Qzm9qtX7m38lgw==
X-CSE-MsgGUID: J1GI7zmYSt+segO43Tk6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69012348"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:54:00 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 1/2] lib/igt_kms: Add a debug log for invalid pipe/output combo
Date: Tue, 17 Sep 2024 15:14:21 +0530
Message-ID: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add some meaningful logs in case of invalid pipe/output combo.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd530dbab..9313e4c27 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6585,8 +6585,13 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 		if (output->pending_pipe == PIPE_NONE)
 			continue;
 
-		if (!igt_pipe_connector_valid(output->pending_pipe, output))
+		if (!igt_pipe_connector_valid(output->pending_pipe, output)) {
+			igt_info("Output %s is disconnected (or) pipe-%s & %s cannot be used together\n",
+				 igt_output_name(output),
+				 kmstest_pipe_name(output->pending_pipe),
+				 igt_output_name(output));
 			return false;
+		}
 
 		combo++;
 	}
-- 
2.43.0


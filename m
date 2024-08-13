Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA136C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 05:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A106410E2A8;
	Tue, 13 Aug 2024 05:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7/aPUx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7D210E2A7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723528121; x=1755064121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VPD8spzbve9SOC2O9ARfOs9s1HZQbnS0kNSZNfzKsDk=;
 b=m7/aPUx9cwD2gWlTolZpSSX+f5FqGpLN0W/KAb0+nH2c1Xatvpmkfclr
 8ILgMKhl0JlqM8jecpMAlgkKhhsNOzwOTnwupuSe1zeAFQmI2NCPGmpS2
 nd2hd/2xCNbuynG0vMXWYm2Th8heqQurLtPCbbcCObyis6W1eZuh2xR6r
 Ayizn9V/KkTLF9dLCpJuyhOzyKtOKBnKyyVNojPJRe1CaCmeIS6Yc808O
 D7Qv1cPsf/OUoMXP1mfzlcujYtgqfAhpKCrjqX4Lm7tfm3EfRPZ3yBBu6
 luYDm31DTv04w6+PUT+efPoLvOsWrntC0GD+3/6nlZUI75UrDRnL4OioH Q==;
X-CSE-ConnectionGUID: N4PZdd7iQbis/IECgAvyyA==
X-CSE-MsgGUID: Yk3DQtVFQ+CUo2F4KttNpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25459923"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25459923"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:27 -0700
X-CSE-ConnectionGUID: kdfGe42lQfOWYUXzwFbSbQ==
X-CSE-MsgGUID: FwUCI77gRFSHzvK8M5HjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58623779"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:25 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 3/4] tests/kms_vblank: Add more logs to skips
Date: Tue, 13 Aug 2024 11:08:44 +0530
Message-ID: <20240813053845.2567954-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch adds print statements
at crucial points to provide better insights.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vblank.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 696bc0b71..c53741b62 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -520,8 +520,10 @@ static void run_subtests(data_t *data)
 						continue;
 
 					if (!all_pipes && data->pipe != active_pipes[0] &&
-					    data->pipe != active_pipes[last_pipe])
+					    data->pipe != active_pipes[last_pipe]) {
+						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
 						continue;
+					}
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 						data->flags = m->flags | NOHANG;
@@ -544,8 +546,10 @@ static void run_subtests(data_t *data)
 						continue;
 
 					if (!all_pipes && data->pipe != active_pipes[0] &&
-					    data->pipe != active_pipes[last_pipe])
+					    data->pipe != active_pipes[last_pipe]) {
+						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
 						continue;
+					}
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 						data->flags = m->flags;
@@ -656,8 +660,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				continue;
 
 			if (!all_pipes && data.pipe != active_pipes[0] &&
-					  data.pipe != active_pipes[last_pipe])
+					  data.pipe != active_pipes[last_pipe]) {
+				igt_info("Skipping pipe %s\n", kmstest_pipe_name(data.pipe));
 				continue;
+			}
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
 				crtc_id_subtest(&data, fd);
-- 
2.43.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC07C3601B
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529E710E9A1;
	Thu,  3 Apr 2025 10:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nW8vVVeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4EF10E9A1
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675972; x=1775211972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGzepxbngoJ34fbTp4CQ0dWiC3oXmiOrLGzeUAvuWvU=;
 b=nW8vVVePCU9Owz+Wc1V8P7yfd/wk+EtV7xRWfkoX3hz/I2huo1vuocSg
 nxvNWk5caUG084mNxgtpMX6zwnPHeX4hRikZUMMiMey1MxP0jnCsOGLXi
 uGBILJT427sNaLGRLCU2/m6VTXlm5zCfds3f+sXXOLP7+6sb1VzGP74jK
 t83Z6Nub7SWKEiOuQebMzxLVb+F9CzSvC2KMNzuaEC8K+ouamS0ZFOkA1
 WQoqnNj4f59WLOSxvCsQ8bIMVlVahm90s63MkqCJkVzinDyHupFjtVS7X
 PXbXDgaSzjpuGZio4kBBGB9LYIakT2uEtZWjZ89xr4TUWXeS8lMp/vAZ2 Q==;
X-CSE-ConnectionGUID: vxPQoMKfR6+iD7Nqm6KpHQ==
X-CSE-MsgGUID: WDe0ZEItTq+M8hK3Gz0Ptw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475594"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:26:12 -0700
X-CSE-ConnectionGUID: Z0GukQ0zQZyEsqloLSYGIw==
X-CSE-MsgGUID: WEGHmTfATDqDFOTAYuWF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126768360"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:26:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] Revert "tests/kms_display_modes: Skip test if
 joiner display is connected"
Date: Thu,  3 Apr 2025 16:11:49 +0530
Message-Id: <20250403104149.2033579-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403104149.2033579-1-jeevan.b@intel.com>
References: <20250403104149.2033579-1-jeevan.b@intel.com>
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

bigjoiner realted checks should be handled in igt_check_bigjoiner_support
which is now added so removing the checks which is no more valid.

This reverts commit 5f7cde6a98783c97649bdb3879bc016b3bf38297

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 588820170..d53b83a86 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -184,11 +184,6 @@ static void run_extendedmode_test(data_t *data) {
 	for_each_pipe(display, pipe1) {
 		for_each_valid_output_on_pipe(display, pipe1, output1) {
 
-			if (is_joiner_mode(data->drm_fd, output1)) {
-				igt_info("Skipping joiner output %s", output1->name);
-				continue;
-			}
-
 			for_each_pipe(display, pipe2) {
 				if (pipe1 == pipe2)
 					continue;
@@ -238,10 +233,6 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
-			if (is_joiner_mode(data.drm_fd, output)) {
-				igt_info("Skipping joiner output %s", output->name);
-				continue;
-			}
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1


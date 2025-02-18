Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61175C021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 14:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E53810E6FF;
	Tue, 18 Feb 2025 14:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5w+4IV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F2910E711
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739889943; x=1771425943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iGgz/Us7hl0TZf4t/QwZTELsAs77hcOma2MS6EJTL4=;
 b=X5w+4IV+CpKhr4H+inLAx2U+4muhlk1VWBjr0MaeKc6HiDJW1PEhcrb4
 MID4Bt8cophd7xMTrQKVNF0JYSVmzFIg/rRojwWWhpqtCW7d6crhK42dv
 l8EEWptSgVChDQ7qGewaPSTGLVZqPlM1rwzQmXM3JuTfqBve/lC/V29ja
 FiSVEueX3F8nrykINKNAJgHNDNehDzlQv9nULxY/H0/8XAiQI2KSSXi27
 sg0HpJMhv/0HOL/tnOHddbglI/sdSbC7GE29jZuynF0v6Xsa7KjDkHH1A
 X614tFiOGrT9rkKRrEzUUJJesuUDWPQfBIHLQGx0Sz3lm8CleFhbSOpil g==;
X-CSE-ConnectionGUID: JHyN0EpZTGS/G8xQheeZcQ==
X-CSE-MsgGUID: 6IbWTDoHSq2fV5c0XIaSTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40296290"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40296290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:45:43 -0800
X-CSE-ConnectionGUID: jPGxRBKWT4Grh0hU1MWPbw==
X-CSE-MsgGUID: YVjMfMpARn2LIzD+urdxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="145268922"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 06:45:42 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/kms_joiner: refactor
 set_all_master_pipes_for_platform
Date: Tue, 18 Feb 2025 20:31:18 +0530
Message-Id: <20250218150121.2132934-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218150121.2132934-1-kunal1.joshi@intel.com>
References: <20250218150121.2132934-1-kunal1.joshi@intel.com>
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

refactor set_all_master_pipes_for_platform for readable code
movement.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_joiner.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 062a0e49d..080e8ff52 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -106,13 +106,13 @@ typedef struct {
 
 static int max_dotclock;
 
-static void set_all_master_pipes_for_platform(data_t *data)
+static void set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
 {
 	enum pipe pipe;
 
 	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
-		if (data->display.pipes[pipe].enabled && data->display.pipes[pipe + 1].enabled) {
-			data->master_pipes |= BIT(pipe);
+		if (display->pipes[pipe].enabled && display->pipes[pipe + 1].enabled) {
+			*master_pipes |= BIT(pipe);
 			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
 		}
 	}
@@ -561,7 +561,7 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
-		set_all_master_pipes_for_platform(&data);
+		set_all_master_pipes_for_platform(&data.display, &data.master_pipes);
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
-- 
2.25.1


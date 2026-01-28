Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9DED3F071
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 14:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89410E6F7;
	Wed, 28 Jan 2026 14:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXeswrAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229210E6E1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769611414; x=1801147414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y6PMNOL3FVozO1iBnDzXNWBAy0DUm/OmqjZujzwPOW0=;
 b=aXeswrAEZyNzJJCxn+8yEOgsfOcR8R+H2cMetUUkNo09+gU6Gs/Fjzq5
 IO+3TybEBEQjimuboZFW0IrLraZAaOlTDDMmfVAgz2UKgrlNOWdvggPZ+
 mv+MBDFQ4KP3fKm47XZ7F+mdg6SPbrKzA8b7mHZxM2Fzcn0asco1sXvbB
 omMthmZo9cciUAvWiuUCzJo7nfOVP90R98ysPupUD0rvGzNgvT7puIJ7U
 wYfAtG3MiHsCzf7AUOKPMzA7f/p9iRzVMhCyQb3Kz/Pr8HVhVJyBrraYc
 9ZEs+A3LFvW9qEyXQ210rhmvUg/PrP9CGXi7PvSHbqK8lPBqfUJaE5uNq A==;
X-CSE-ConnectionGUID: sBGGjC6VSB2U2Hg3DK8GEQ==
X-CSE-MsgGUID: 8g6IG6qWTdC21iJ+mbMMow==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93482113"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="93482113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:33 -0800
X-CSE-ConnectionGUID: +w6DBmclQSmV5MnhR3SMZw==
X-CSE-MsgGUID: Rl6N7qi6Rz2jXHTyfya7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207903719"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:33 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
Date: Wed, 28 Jan 2026 15:46:29 +0100
Message-ID: <20260128144626.452925-6-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128144626.452925-4-piotr.rudnicki@intel.com>
References: <20260128144626.452925-4-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The test was incorrectly waiting for debugee completion when the first
client should complete due to the reset. Fix the test to wait for the
correct client after reset and properly cleanup the debugee.

Verify waitpid() return value to ensure the process was successfully
reaped before marking as done. Verify second workload started before
cleanup and skip session validation as SIGKILL causes incomplete event log.

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
V1 -> V2: 
 - Split into separate library and test commits
 - Use wait_for_workload_start helper to verify second workload started

 tests/intel/xe_eudebug_online.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 084bdeb77..39ecca479 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -21,6 +21,7 @@
 #include "intel_pat.h"
 #include "intel_mocs.h"
 #include "gpgpu_shader.h"
+#include <sys/wait.h>
 
 #define SHADER_NOP			(0 << 0)
 #define SHADER_BREAKPOINT		(1 << 0)
@@ -2066,15 +2067,29 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 
 	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
 
-	xe_eudebug_client_wait_done(debugee);
+	/* First client should complete because of the reset */
+	xe_eudebug_client_wait_done(s->client);
+
+	/* Check if second workload was started and is running */
+	wait_for_workload_start(debugee_data);
+
+	/* Terminate debugee and mark it as cleaned up */
+	igt_assert_eq(kill(debugee->pid, 0), 0);
+	igt_assert_eq(debugee->done, 0);
+	kill(debugee->pid, SIGKILL);
+	igt_assert_eq(waitpid(debugee->pid, NULL, 0), debugee->pid);
+	debugee->done = 1;
+	debugee->pid = 0;
+
 	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(debugee->log, true);
 
-	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
-				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
-				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+	/*
+	 * Skip xe_eudebug_session_check() because we forcibly killed the debugee
+	 * with SIGKILL, so its event log is incomplete and validation would fail.
+	 */
 
 	xe_eudebug_client_destroy(debugee);
 	xe_eudebug_session_destroy(s);
-- 
2.43.0


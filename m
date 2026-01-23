Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C3D7236C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 11:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31F10EAC5;
	Fri, 23 Jan 2026 11:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geazObK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEA310E00D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769167948; x=1800703948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/g9bo9BJB4jnDgqWNWUeUy2zu80/gRmytR4JtK20qT0=;
 b=geazObK9NmIwjgb7/2ochvzQeY36HKvY4dz1knS6P0kqVI1o1zhTPYsa
 VX8W7x3wc0hl+pMheL73D8M6NSeMYdi5BF1Wp9cOiG6qpoHutaG/d39mn
 k0jhx8fMkfhltDTJJ0+xwoJxv3Dp/pyU9sQL9WG+B2yNq1RwxdscCaWWs
 PqXaKKB1GwdbJ5yC5jpI6RS9bj2N5+tD36qr8D1v9ehCGFY+dI/FC/fWg
 8phoAzJE+yzZNGl6Vy7B7/j3vwpl5fB1jArq4MALI+FWFrh6V76BvAhmU
 g/VJGUVOfefPRUdpNhxpfpywSvCja45ZVfVYqoMven20yDa9t3Rldqtek Q==;
X-CSE-ConnectionGUID: fwV5kRzRQCKXU8vDLRUQdg==
X-CSE-MsgGUID: zz5K0GdwSlem+ofgjwYTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73008519"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73008519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:32:28 -0800
X-CSE-ConnectionGUID: 3gDq8OfxSlC916eTZJ9+OA==
X-CSE-MsgGUID: azAzuMRTSEa6ZOmog0+AMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="229966634"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:32:26 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: test_interrupt_other
 wait fix
Date: Fri, 23 Jan 2026 12:35:25 +0100
Message-ID: <20260123113523.262544-4-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123113523.262544-3-piotr.rudnicki@intel.com>
References: <20260123113523.262544-3-piotr.rudnicki@intel.com>
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

The test was incorrectly waiting for debugee completion when the first
client should complete due to the reset. Fix the test to wait for the
correct client after reset and properly cleanup the debugee.

Add pipe validation in pipe_signal() to prevent writes to closed pipes
after SIGKILL. Update pipe_close() to set descriptors to -1 after closing
to ensure the guard condition works correctly.

Verify waitpid() return value to ensure the process was successfully
reaped before marking as done. Verify second workload started before
cleanup and skip session validation as SIGKILL causes incomplete event log.

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
 lib/xe/xe_eudebug.c             | 16 ++++++++-----
 tests/intel/xe_eudebug_online.c | 40 +++++++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2abee7ba2..9f981d226 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -304,16 +304,22 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 
 static void pipe_signal(int pipe[2], uint64_t token)
 {
-	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
+	/* Skip signaling if pipe is closed (e.g., after SIGKILL) */
+	if (pipe[1] >= 0)
+		igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
 }
 
 static void pipe_close(int pipe[2])
 {
-	if (pipe[0] != -1)
-		close(pipe[0]);
+	if (pipe[0] >= 0) {
+		igt_assert_eq(close(pipe[0]), 0);
+		pipe[0] = -1;
+	}
 
-	if (pipe[1] != -1)
-		close(pipe[1]);
+	if (pipe[1] >= 0) {
+		igt_assert_eq(close(pipe[1]), 0);
+		pipe[1] = -1;
+	}
 }
 
 #define DEAD_CLIENT 0xccccdead
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ff6c5ff19..1093df133 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -21,6 +21,7 @@
 #include "intel_pat.h"
 #include "intel_mocs.h"
 #include "gpgpu_shader.h"
+#include <sys/wait.h>
 
 #define SHADER_NOP			(0 << 0)
 #define SHADER_BREAKPOINT		(1 << 0)
@@ -2014,7 +2015,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_eudebug_debugger_start_worker(s->debugger);
 	xe_eudebug_client_start(s->client);
 
-	/* wait for workload to start */
+	/* wait for the first client workload to start */
 	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
 		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
 			continue;
@@ -2034,6 +2035,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, debugee), 0);
 	xe_eudebug_client_start(debugee);
 
+	/* wait for the second client */
 	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
 		if (READ_ONCE(debugee_data->vm_fd) == -1 || READ_ONCE(debugee_data->target_size) == 0)
 			continue;
@@ -2044,8 +2046,8 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	igt_assert(debugee_data->exec_queue_handle != -1);
 
 	/*
-	 * Interrupting the other client should return invalid state
-	 * as it is running in runalone mode
+	 * Interrupting the first client (currently running)
+	 * should return invalid state as it is running in runalone mode
 	 */
 	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data->client_handle,
 		      debugee_data->exec_queue_handle, debugee_data->lrc_handle, NULL, 0,
@@ -2054,15 +2056,39 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 
 	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
 
-	xe_eudebug_client_wait_done(debugee);
+	/* First client should complete because of the reset */
+	xe_eudebug_client_wait_done(s->client);
+
+	/* Check if second workload was started and is running */
+	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
+		if (READ_ONCE(debugee_data->vm_fd) == -1 ||
+		    READ_ONCE(debugee_data->target_size) == 0)
+			continue;
+
+		if (pread(debugee_data->vm_fd, &val, sizeof(val),
+			  debugee_data->target_offset) == sizeof(val))
+			if (val != 0)
+				break;
+	}
+	igt_assert_f(val != 0, "Debugee workload execution is not yet started\n");
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA23AE9A049
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AC210E10E;
	Sat, 21 Feb 2026 03:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR1W8O5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA1410E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644054; x=1803180054;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/exknYkrOkGXFqPiGnFS8YIcdRjoav/D7cWqHxGdLJE=;
 b=KR1W8O5xSYUNKgIj0bpDDHnqxmoGKfyoH7S616Kig07IuOWC2iT0jzQC
 dapmYPDhrRoRs1lIpLU0EmDcVB3/SDNaA1uHVJxv6EShuaL+YH1MER2rB
 E48rbMk5U95zsag0n+f5ehO/nQBnDhInbJu+6xlvtHrTDXsobX/UyS5jZ
 vXAWNjp3CWwY3bll+2FLSg2r7dZT1mrGaJi1WiaZEbPYHxfh+JdweFIwT
 fx3mLEgISUQrsEpt3+3dUHfTKxeoLMmWSLnGI7ciijK2C/xXASTMxtBjH
 nEpfTsAN0hAavSJUiBcCbcF2QGUgxHwIBP2q/uNPkPQWWDd71qg3EDn/A A==;
X-CSE-ConnectionGUID: 5pHz6zooSuuPdnGPc311jg==
X-CSE-MsgGUID: ObklT3HtTU2HNyZpkNTg8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84187206"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84187206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:54 -0800
X-CSE-ConnectionGUID: Dx8bULMDSjmCNP7/x/3IGw==
X-CSE-MsgGUID: VFgyUAs2SACvo2ucMQSAiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214256398"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:53 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 12/23] tests/drm_read: Use igt_crtc_t instead of enum
 pipe
Date: Sat, 21 Feb 2026 05:19:51 +0200
Message-ID: <20260221032003.30936-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert drm_read from 'enum pipe' to 'igt_crtc_t'.

The pipe usage in igt_main() creates a slight complication
is this one.

 #include "scripts/iterators.cocci"

@clean_igt_main@
identifier PIPE;
identifier CRTC;
@@
- enum pipe PIPE;
+ igt_crtc_t *CRTC;
...
igt_fixture() {
...
- igt_crtc_t *CRTC;
<...
(
- PIPE = CRTC->pipe;
|
- PIPE
+ CRTC->pipe
)
...>
}
<...
- PIPE
+ CRTC->pipe
...>

@func1@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC, PIPE, CRTC;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *CRTC
	,...)
{
...
(
- igt_crtc_t *CRTC = igt_crtc_for_pipe(..., PIPE);
|
- igt_crtc_t *CRTC;
... when != PIPE = ...
- CRTC = igt_crtc_for_pipe(..., PIPE);
)
<... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...>
}

@depends on func1@
identifier func1.FUNC;
expression list[func1.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@func2@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *crtc
	,...)
{
<+... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...+>
}

@depends on func2@
identifier func2.FUNC;
expression list[func2.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/drm_read.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index e745e98534bd..23b9ebe0faa3 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -77,9 +77,9 @@ static void assert_empty(int fd)
 	do_or_die(poll(&pfd, 1, 0));
 }
 
-static void generate_event(int fd, enum pipe pipe)
+static void generate_event(int fd, igt_crtc_t *crtc)
 {
-	igt_assert(kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT));
+	igt_assert(kmstest_get_vblank(fd, crtc->pipe, DRM_VBLANK_EVENT));
 }
 
 static void wait_for_event(int fd)
@@ -132,7 +132,7 @@ static void test_invalid_buffer(int in)
 	teardown(fd);
 }
 
-static void test_fault_buffer(int in, enum pipe pipe)
+static void test_fault_buffer(int in, igt_crtc_t *crtc)
 {
 	int fd = setup(in, 0);
 	struct drm_mode_map_dumb arg;
@@ -146,7 +146,7 @@ static void test_fault_buffer(int in, enum pipe pipe)
 	buf = mmap(0, 4096, PROT_WRITE, MAP_SHARED, fd, arg.offset);
 	igt_assert(buf != MAP_FAILED);
 
-	generate_event(fd, pipe);
+	generate_event(fd, crtc);
 
 	alarm(1);
 
@@ -168,13 +168,13 @@ static void test_empty(int in, int nonblock, int expected)
 	teardown(fd);
 }
 
-static void test_short_buffer(int in, int nonblock, enum pipe pipe)
+static void test_short_buffer(int in, int nonblock, igt_crtc_t *crtc)
 {
 	char buffer[1024]; /* events are typically 32 bytes */
 	int fd = setup(in, nonblock);
 
-	generate_event(fd, pipe);
-	generate_event(fd, pipe);
+	generate_event(fd, crtc);
+	generate_event(fd, crtc);
 
 	wait_for_event(fd);
 
@@ -214,7 +214,7 @@ static void *thread_short_buffer_wakeup(void *arg)
 	return NULL;
 }
 
-static void test_short_buffer_wakeup(int in, enum pipe pipe)
+static void test_short_buffer_wakeup(int in, igt_crtc_t *crtc)
 {
 	const int nt = sysconf(_SC_NPROCESSORS_ONLN) + 1;
 	struct short_buffer_wakeup w = {
@@ -243,7 +243,7 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 		sched_yield();
 
 		/* One event should wake all threads as none consume */
-		generate_event(w.fd, pipe);
+		generate_event(w.fd, crtc);
 
 		clock_gettime(CLOCK_REALTIME, &tv);
 		tv.tv_sec += 5; /* Let's be very generous to the scheduler */
@@ -274,13 +274,12 @@ int igt_main()
 {
 	igt_display_t display;
 	struct igt_fb fb;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_fd_t(fd);
 
 	igt_fixture() {
 		struct sigaction alarm_action = {};
 		igt_output_t *output;
-		igt_crtc_t *crtc;
 
 		igt_assert_neq(sigaction(SIGALRM, NULL, &alarm_action), -1);
 		alarm_action.sa_flags &= ~SA_RESTART;
@@ -302,20 +301,18 @@ int igt_main()
 
 			igt_output_set_crtc(output, crtc);
 			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &fb);
-
-			pipe = crtc->pipe;
 			break;
 		}
 
 		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-		igt_require(kmstest_get_vblank(fd, pipe, 0));
+		igt_require(kmstest_get_vblank(fd, crtc->pipe, 0));
 	}
 
 	igt_subtest("invalid-buffer")
 		test_invalid_buffer(fd);
 
 	igt_subtest("fault-buffer")
-		test_fault_buffer(fd, pipe);
+		test_fault_buffer(fd, crtc);
 
 	igt_subtest("empty-block")
 		test_empty(fd, 0, EINTR);
@@ -324,11 +321,14 @@ int igt_main()
 		test_empty(fd, 1, EAGAIN);
 
 	igt_subtest("short-buffer-block")
-		test_short_buffer(fd, 0, pipe);
+		test_short_buffer(fd, 0,
+				  crtc);
 
 	igt_subtest("short-buffer-nonblock")
-		test_short_buffer(fd, 1, pipe);
+		test_short_buffer(fd, 1,
+				  crtc);
 
 	igt_subtest("short-buffer-wakeup")
-		test_short_buffer_wakeup(fd, pipe);
+		test_short_buffer_wakeup(fd,
+					 crtc);
 }
-- 
2.52.0


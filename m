Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E1DC5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534010E865;
	Sat, 21 Feb 2026 03:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdfVFGfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8438F10E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644061; x=1803180061;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kediEAQYExbERGUa1zqjICnoB6BYw9UBMLlCTY5Kf4g=;
 b=EdfVFGfbFx/s/jr+LRMdphRuVb7u2Z7l5MCD6ByH58Tluk8IK6KarmWa
 P4V5ABuiZEKnTZB91Mu8IuO0YavLGD+hevb8NI0zcX5JurSRZDTN4z131
 6uJMY5LFnSwBwBgUiJKRQecYBP5/b8L4LOcslppfeO0LSthoPeGc3wfkA
 DV5LDjkdemiaSDMbA7NbeaDU4g22uU1bq+HoA/s7L9uD1qGa2yfY8GsYd
 AkYuk6ugpl7yo490b4qEDibRMpWcmrS4MRKKbC5hWJJXCGTEoJ/j+2NSP
 L94DD29PfFAQDosTaMhb608zTYZd3IoHyuJfpOk5t+QUYC6RkTnnFE1vf A==;
X-CSE-ConnectionGUID: KymoHCNWSXKNav2dhhq4gQ==
X-CSE-MsgGUID: V5kU13B4TmSreFxReyl5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84187210"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84187210"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:01 -0800
X-CSE-ConnectionGUID: oDFRzxl5TOqeDiDTsxm67A==
X-CSE-MsgGUID: lie5BQJKSnq1rTcHWHFmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214256415"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:00 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 14/23] tests/kms_vblank: Use igt_crtc_t instead of
 enum pipe
Date: Sat, 21 Feb 2026 05:19:53 +0200
Message-ID: <20260221032003.30936-15-ville.syrjala@linux.intel.com>
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

Convert kms_vblank from 'enum pipe' to 'igt_crtc_t'.

The data.pipe member gets directly replaced with data.crtc.

Also note that the local 'enum pipe p' in crtc_id_subtest()
needs a bit of extra cleanup.

 #include "scripts/iterators.cocci"

@find_data@
typedef igt_crtc_t;
identifier DISPLAY, PIPE;
type T;
@@
T {
  ...
  igt_display_t DISPLAY;
  ...
-  enum pipe PIPE;
+  igt_crtc_t *crtc;
  ...
};

@depends on find_data@
find_data.T S;
find_data.T *P;
expression E;
@@
(
- S.pipe = E
+ S.crtc = igt_crtc_for_pipe(&S.display, E)
|
- P->pipe = E
+ P->crtc = igt_crtc_for_pipe(&P->display, E)
|
- igt_crtc_for_pipe(..., S.pipe)
+ S.crtc
|
- igt_crtc_for_pipe(..., P->pipe)
+ P->crtc
|
- kmstest_pipe_name(S.pipe)
+ igt_crtc_name(S.crtc)
|
- kmstest_pipe_name(P->pipe)
+ igt_crtc_name(P->crtc)
)

@depends on find_data@
find_data.T S;
find_data.T *P;
@@
(
- S.pipe
+ S.crtc->pipe
|
- P->pipe
+ P->crtc->pipe
)

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

@depends on find_data@
find_data.T S;
find_data.T *P;
@@
(
- igt_crtc_for_pipe(..., S.crtc->pipe)
+ S.crtc
|
- igt_crtc_for_pipe(..., P->crtc->pipe)
+ P->crtc
)

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

@clean_pipe@
identifier PIPE;
expression CRTC;
@@
- enum pipe PIPE = CRTC->pipe;
<+...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- PIPE
+ CRTC->pipe
)
...+>

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_vblank.c | 55 +++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index add8b7ec3cbf..970eb4d9a6a7 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -97,7 +97,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb primary_fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	unsigned int flags;
 #define IDLE	0x1
 #define BUSY	0x2
@@ -130,7 +130,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+			    data->crtc);
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
@@ -144,7 +144,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
+	igt_wait_for_vblank(data->crtc);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
@@ -192,7 +192,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type =
 			DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
-		vbl.request.type |= kmstest_get_vbl_flag(data->pipe);
+		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->pipe);
 		vbl.request.sequence = 120 + 12;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
 	}
@@ -225,14 +225,14 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display,
-			enum pipe pipe, igt_output_t *output)
+pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+			igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -243,15 +243,14 @@ pipe_output_combo_valid(igt_display_t *display,
 static void crtc_id_subtest(data_t *data, int fd)
 {
 	igt_display_t *display = &data->display;
-	enum pipe p = data->pipe;
 	igt_output_t *output = data->output;
 	struct drm_event_vblank buf;
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(p);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
 	unsigned crtc_id, expected_crtc_id;
 	uint64_t val;
 	union drm_wait_vblank vbl;
 
-	crtc_id = igt_crtc_for_pipe(display, p)->crtc_id;
+	crtc_id = data->crtc->crtc_id;
 	if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
 		expected_crtc_id = crtc_id;
 	else
@@ -291,7 +290,7 @@ static void crtc_id_subtest(data_t *data, int fd)
 
 static void accuracy(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
 	union drm_wait_vblank vbl;
 	unsigned long target;
 	int total = 120 / nchildren;
@@ -330,7 +329,7 @@ static void accuracy(data_t *data, int fd, int nchildren)
 
 static void vblank_query(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -359,7 +358,7 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 
 static void vblank_wait(data_t *data, int fd, int nchildren)
 {
-	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->pipe);
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(data->crtc->pipe);
 	union drm_wait_vblank vbl;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
@@ -388,12 +387,12 @@ static void vblank_wait(data_t *data, int fd, int nchildren)
 		 elapsed(&start, &end, count));
 }
 
-static int get_vblank(int fd, enum pipe pipe, unsigned flags)
+static int get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
 {
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc->pipe) | flags;
 	do_or_die(igt_ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
 
 	return vbl.reply.sequence;
@@ -412,7 +411,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 	int vrefresh = igt_output_get_mode(output)->vrefresh;
 	double time_elapsed;
 
-	seq1 = get_vblank(fd, data->pipe, 0);
+	seq1 = get_vblank(fd, data->crtc, 0);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 
 	if (data->flags & DPMS) {
@@ -436,7 +435,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 		/* Attempting to do a vblank while disabled should return -EINVAL */
 		memset(&vbl, 0, sizeof(vbl));
 		vbl.request.type = _DRM_VBLANK_RELATIVE;
-		vbl.request.type |= kmstest_get_vbl_flag(data->pipe);
+		vbl.request.type |= kmstest_get_vbl_flag(data->crtc->pipe);
 		igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	}
 
@@ -447,11 +446,11 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 
 	if (data->flags & MODESET) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe));
+				    data->crtc);
 		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
-	seq2 = get_vblank(fd, data->pipe, 0);
+	seq2 = get_vblank(fd, data->crtc, 0);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 
 	time_elapsed = igt_time_elapsed(&start, &end);
@@ -519,8 +518,8 @@ static void run_subtests(data_t *data)
 				for_each_crtc_with_valid_output(&data->display,
 								crtc,
 								data->output) {
-					data->pipe = crtc->pipe;
-					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->output))
+					data->crtc = crtc;
+					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
 					if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -551,8 +550,8 @@ static void run_subtests(data_t *data)
 				for_each_crtc_with_valid_output(&data->display,
 								crtc,
 								data->output) {
-					data->pipe = crtc->pipe;
-					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->output))
+					data->crtc = crtc;
+					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
 					if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -650,7 +649,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc) {
-			data.pipe = crtc->pipe;
+			data.crtc = crtc;
 			active_pipes[last_pipe++] = crtc->pipe;
 		}
 		last_pipe--;
@@ -660,8 +659,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("invalid") {
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
-			data.pipe = crtc->pipe;
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
+			data.crtc = crtc;
+			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -676,8 +675,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("crtc-id") {
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
-			data.pipe = crtc->pipe;
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
+			data.crtc = crtc;
+			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
-- 
2.52.0


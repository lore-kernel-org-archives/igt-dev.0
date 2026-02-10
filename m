Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC1EA8128
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF32910E5AB;
	Tue, 10 Feb 2026 15:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2t5nKid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABB110E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737078; x=1802273078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qGPCAQZnhni7r9PaIVpbPLZ6c5XV8F8lSuQ1BuMxJA8=;
 b=V2t5nKidqShAa4g5wtyPpzpiPWIgwd3t7FeqHaWFPooPnLhrq7nuyrMP
 0GSUBGA+ANWu1MXgtFI2Q8XM8WozoR1Wx1BM0nCgeLHJBzg62i765j3N1
 ccjP6ngdkPPcqwBDfFuqwWh0snnPRROnq2GUmwzLfop3vG/diRioqq81X
 VueXay1MDNwmY7eQzqIKuIocA63pvhq3Dd5cusYYqcfFOcG8mZWTkigFt
 3QVShCPj/K3a3Z9S59SuzchKgTRg3wrrTloM8+MWpuW8mwCbFI3NysrC8
 mFkMz8UmDNyQCKuyPnk5IlAy+n+IIDkJhjghmAIBk0mZCt2Sdfe81ePCv g==;
X-CSE-ConnectionGUID: 9gacle9ZRe+m1+rhukoiAw==
X-CSE-MsgGUID: IC+2+wtBT72+AShPA5gmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75491843"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75491843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:38 -0800
X-CSE-ConnectionGUID: rZkgrPxDShaWp3Od2JiATA==
X-CSE-MsgGUID: 8shwm8lmRpars6gXK/g0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211434692"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 05/11] tests/kms_flip: switch to CRTC index terminology
Date: Tue, 10 Feb 2026 17:23:46 +0200
Message-ID: <a7e2a53440e8280060101e22eae828b7f2bcc5d9.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Everything about the test operates on CRTC indexes. Switch from pipe to
CRTC index terminology.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_flip.c | 56 +++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index eb878ee15b11..49a5f4ed185f 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -267,7 +267,7 @@
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
-static bool all_pipes = false;
+static bool all_crtcs = false;
 
 drmModeRes *resources;
 int drm_fd;
@@ -382,10 +382,10 @@ struct test_output {
 	drmModeConnector *kconnector[4];
 	uint32_t _connector[4];
 	uint32_t _crtc[4];
-	int _pipe[4];
+	int _crtc_index[4];
 	int count; /* 1:1 mapping between crtc:connector */
 	int flags;
-	int pipe; /* primary pipe for vblank */
+	int crtc_index; /* primary CRTC index for vblank */
 	unsigned int current_fb_id;
 	unsigned int fb_width;
 	unsigned int fb_height;
@@ -528,13 +528,11 @@ static int __wait_for_vblank(unsigned int flags, int crtc_idx,
 {
 	drmVBlank wait_vbl;
 	int ret;
-	uint32_t pipe_id_flag;
 	bool event = !(flags & TEST_VBLANK_BLOCK);
 
 	memset(&wait_vbl, 0, sizeof(wait_vbl));
-	pipe_id_flag = kmstest_get_vbl_flag(crtc_idx);
 
-	wait_vbl.request.type = pipe_id_flag;
+	wait_vbl.request.type = kmstest_get_vbl_flag(crtc_idx);
 	if (flags & TEST_VBLANK_ABSOLUTE)
 		wait_vbl.request.type |= DRM_VBLANK_ABSOLUTE;
 	else
@@ -557,7 +555,7 @@ static int __wait_for_vblank(unsigned int flags, int crtc_idx,
 	return ret;
 }
 
-static int do_wait_for_vblank(struct test_output *o, int pipe_id,
+static int do_wait_for_vblank(struct test_output *o, int crtc_index,
 			      int target_seq, struct vblank_reply *reply)
 {
 	int ret;
@@ -567,7 +565,7 @@ static int do_wait_for_vblank(struct test_output *o, int pipe_id,
 	if (!(o->vblank_state.count > 0))
 		flags &= ~TEST_VBLANK_ABSOLUTE;
 
-	ret = __wait_for_vblank(flags, pipe_id, target_seq, (unsigned long)o,
+	ret = __wait_for_vblank(flags, crtc_index, target_seq, (unsigned long)o,
 				reply);
 	if (ret == 0 && !(o->flags & TEST_VBLANK_BLOCK))
 		set_flag(&o->pending_events, EVENT_VBLANK);
@@ -637,7 +635,7 @@ static void *vblank_wait_thread_func(void *data)
 
 	for (i = 0; i < 32; i++) {
 		unsigned long start = gettime_us();
-		__wait_for_vblank(TEST_VBLANK_BLOCK, o->pipe, 20, (unsigned long)o, &reply);
+		__wait_for_vblank(TEST_VBLANK_BLOCK, o->crtc_index, 20, (unsigned long)o, &reply);
 		if (gettime_us() - start > 2 * mode_frame_time(o))
 			return (void*)1;
 	}
@@ -864,7 +862,7 @@ static int set_mode(struct test_output *o, uint32_t fb, int x, int y)
 			return ret;
 
 		if (is_intel_device(drm_fd))
-			intel_drrs_disable(drm_fd, o->pipe);
+			intel_drrs_disable(drm_fd, o->crtc_index);
 	}
 
 	return 0;
@@ -921,7 +919,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 		exp_seq = o->flip_state.current_seq;
 		start = gettime_us();
 		do_or_die(__wait_for_vblank(TEST_VBLANK_ABSOLUTE |
-					    TEST_VBLANK_BLOCK, o->pipe, exp_seq,
+					    TEST_VBLANK_BLOCK, o->crtc_index, exp_seq,
 					    0, &reply));
 		end = gettime_us();
 		igt_debug("Vblank took %luus\n", end - start);
@@ -944,7 +942,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 		igt_assert_eq(do_page_flip(o, new_fb_id, false), expected_einval);
 
 	if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
-		igt_assert_eq(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply), -EINVAL);
+		igt_assert_eq(do_wait_for_vblank(o, o->crtc_index, target_seq, &vbl_reply), -EINVAL);
 
 	if (o->flags & TEST_VBLANK_RACE) {
 		spawn_vblank_wait_thread(o);
@@ -970,7 +968,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 
 		/* modeset/DPMS is done, vblank wait should work normally now */
 		start = gettime_us();
-		igt_assert(__wait_for_vblank(TEST_VBLANK_BLOCK, o->pipe, 2, 0, &reply) == 0);
+		igt_assert(__wait_for_vblank(TEST_VBLANK_BLOCK, o->crtc_index, 2, 0, &reply) == 0);
 		end = gettime_us();
 
 		if (!should_skip_ts_checks()) {
@@ -1003,7 +1001,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 	/* try to make sure we can issue two flips during the same frame */
 	if (do_flip && (o->flags & TEST_EBUSY)) {
 		struct vblank_reply reply;
-		igt_assert(__wait_for_vblank(TEST_VBLANK_BLOCK, o->pipe, 1, 0, &reply) == 0);
+		igt_assert(__wait_for_vblank(TEST_VBLANK_BLOCK, o->crtc_index, 1, 0, &reply) == 0);
 	}
 
 	if (do_flip)
@@ -1013,7 +1011,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 		emit_fence_stress(o);
 
 	if (do_vblank) {
-		do_or_die(do_wait_for_vblank(o, o->pipe, target_seq,
+		do_or_die(do_wait_for_vblank(o, o->crtc_index, target_seq,
 					     &vbl_reply));
 		if (o->flags & TEST_VBLANK_BLOCK) {
 			event_handler(&o->vblank_state, vbl_reply.sequence,
@@ -1061,7 +1059,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 					      SUSPEND_TEST_NONE);
 
 	if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
-		igt_assert(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply)
+		igt_assert(do_wait_for_vblank(o, o->crtc_index, target_seq, &vbl_reply)
 			   == -EINVAL);
 
 	if (do_flip && (o->flags & TEST_EINVAL))
@@ -1104,11 +1102,11 @@ static void connector_find_preferred_mode(uint32_t connector_id, int crtc_idx,
 		return;
 	}
 
-	o->pipe = config.crtc_index;
+	o->crtc_index = config.crtc_index;
 	o->kconnector[0] = config.connector;
 	o->kencoder[0] = config.encoder;
 	o->_crtc[0] = config.crtc->crtc_id;
-	o->_pipe[0] = config.crtc_index;
+	o->_crtc_index[0] = config.crtc_index;
 	o->kmode[0] = config.default_mode;
 	o->mode_valid = 1;
 
@@ -1178,20 +1176,20 @@ static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
 	o->mode_valid = get_compatible_modes(&mode[0], &mode[1],
 					     config[0].connector, config[1].connector);
 
-	o->pipe = config[0].crtc_index;
+	o->crtc_index = config[0].crtc_index;
 	o->fb_width = mode[0].hdisplay;
 	o->fb_height = mode[0].vdisplay;
 
 	o->kconnector[0] = config[0].connector;
 	o->kencoder[0] = config[0].encoder;
 	o->_crtc[0] = config[0].crtc->crtc_id;
-	o->_pipe[0] = config[0].crtc_index;
+	o->_crtc_index[0] = config[0].crtc_index;
 	o->kmode[0] = mode[0];
 
 	o->kconnector[1] = config[1].connector;
 	o->kencoder[1] = config[1].encoder;
 	o->_crtc[1] = config[1].crtc->crtc_id;
-	o->_pipe[1] = config[1].crtc_index;
+	o->_crtc_index[1] = config[1].crtc_index;
 	o->kmode[1] = mode[1];
 
 	drmModeFreeCrtc(config[0].crtc);
@@ -1748,7 +1746,7 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 			return;
 		snprintf(test_name, sizeof(test_name),
 			 "%s-%s%d",
-			 kmstest_pipe_name(o->_pipe[0]),
+			 kmstest_pipe_name(o->_crtc_index[0]),
 			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
 			 o->kconnector[0]->connector_type_id);
 		break;
@@ -1758,8 +1756,8 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 			return;
 		snprintf(test_name, sizeof(test_name),
 			 "%s%s-%s%d-%s%d",
-			 kmstest_pipe_name(o->_pipe[0]),
-			 kmstest_pipe_name(o->_pipe[1]),
+			 kmstest_pipe_name(o->_crtc_index[0]),
+			 kmstest_pipe_name(o->_crtc_index[1]),
 			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
 			 o->kconnector[0]->connector_type_id,
 			 kmstest_connector_type_str(o->kconnector[1]->connector_type),
@@ -1842,7 +1840,7 @@ static void run_test(int duration, int flags)
 	for (i = 0; i < resources->count_connectors; i++) {
 		for (n = 0; n < resources->count_crtcs; n++) {
 			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-			if ((flags & TEST_HANG) && !all_pipes &&
+			if ((flags & TEST_HANG) && !all_crtcs &&
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
@@ -1874,7 +1872,7 @@ static void run_test(int duration, int flags)
 			int crtc_idx;
 
 			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-			if ((flags & TEST_HANG) && !all_pipes &&
+			if ((flags & TEST_HANG) && !all_crtcs &&
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
@@ -1966,7 +1964,7 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[1] = m;
 
 					/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-					if ((flags & TEST_HANG) && !all_pipes &&
+					if ((flags & TEST_HANG) && !all_crtcs &&
 					    ((n != 0 && n != resources->count_crtcs) ||
 					    m != resources->count_crtcs - 1))
 						continue;
@@ -2030,7 +2028,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
 		case 'e':
-			all_pipes = true;
+			all_crtcs = true;
 			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
@@ -2040,7 +2038,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n";
 
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
-- 
2.47.3


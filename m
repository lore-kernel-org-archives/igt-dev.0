Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E2606A326
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IPVBcbOc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387010E74A;
	Wed,  4 Nov 2026 06:36:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54C310E216
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793774077; x=1825310077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nb/3jn9i49ezIyt8QKNJirjKC4kiriYPY21/3vZd0Dc=;
 b=IPVBcbOc30TxEBlj2vYOrV5iOycAsLE6P0vcV+8jh016dQGvkH1h11Oz
 gUeQBKaRUpP9npMnk4xMNd/OJ007OA05gTvH6HhjYrZlAZreYdv7kkvq2
 +ohL03l0RzytNsnMjXLhgPimTA7rkUwiesgGMvfwhsDnAdS4SBdyvGRSV
 PeBn75ZqQdTxnPDveABPAJjgnZ0Z7YUIYTDhtmSbpUSEYdYtlMyRy++Fe
 5LGDeCUXPRQQJNewxQ/xORlg6xSNK7++/z/tH4C4iFjHHl6HGRhXHjcJ/
 iB/kK59Ywdl4ZrIl32uVR503BRUw3qug1TbUK8VYxByWE2wRbEB77ZMK8 w==;
X-CSE-ConnectionGUID: fRLakMVsQ/G+bXY8Q7Lszw==
X-CSE-MsgGUID: BuP8+x6nQi+CS2ehZb2psg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403893"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:37 -0800
X-CSE-ConnectionGUID: 1Z+3IB2+SuGV0L6oH0A6Pg==
X-CSE-MsgGUID: hTbtpUq7SB+LZxCcEXTS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6956466"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:36 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Convert to igt_display atomic API
Date: Wed,  4 Nov 2026 12:04:41 +0530
Message-ID: <20261104063442.2208555-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104063442.2208555-1-jeevan.b@intel.com>
References: <20261104063442.2208555-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the legacy drmModeSetCrtc() based modeset path and the direct
drmModeRes/drmModeConnector walking with the igt_display atomic API:

- enumerate connected outputs with for_each_connected_output() and
  look up each CRTC once with igt_crtc_for_crtc_index(), storing the
  igt_crtc_t in struct crtc_config instead of crtc ids and pipes
- program all CRTCs and outputs in a single atomic commit using
  igt_output_set_crtc(), igt_output_override_mode() and
  igt_plane_set_fb(), and disable everything with igt_display_reset()
  plus an atomic commit instead of kmstest_unset_all_crtcs()
- use igt_crtc_connector_valid() for the CRTC/connector compatibility
  check, igt_crtc_name() for names, igt_crtc_get_vbl_flag() for vblank
  waits and igt_display_n_crtcs() for the CRTC count
- pass igt_display_t *display as the first parameter and keep it local
  to igt_main_args() rather than global

The old struct crtc_config variables are renamed to crtc_conf, so that
crtc is only used for igt_crtc_t pointers, as is the convention.

drmModeRes is kept only for the encoder possible_clones checks, which
have no igt_kms equivalent.

Also fix the bigjoiner check indexing the single-entry crtc pointer
with [i - 1] instead of crtcs[i - 1], and stop leaking the fb that was
created in setup_crtcs() and recreated in test_crtc_config().

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 300 ++++++++++++++++++++++----------------------
 1 file changed, 150 insertions(+), 150 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 6398e7224..4594d8c3c 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -122,19 +122,21 @@ enum test_flags {
 struct test_config {
 	const char *name;
 	enum test_flags flags;
+	igt_display_t *display;
+	/* Only used for encoder clone validity checks */
 	drmModeRes *resources;
 };
 
 struct connector_config {
+	igt_output_t *output;
 	drmModeConnector *connector;
 	int crtc_idx;
 	drmModeModeInfo default_mode;
 };
 
 struct crtc_config {
+	igt_crtc_t *crtc;
 	int crtc_idx;
-	int crtc_id;
-	int pipe_id;
 	int connector_count;
 	struct connector_config *cconfs;
 	struct igt_fb fb_info;
@@ -181,13 +183,13 @@ static bool hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector
 	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
 }
 
-static bool mode_compatible_with_connectors(struct crtc_config *crtc,
+static bool mode_compatible_with_connectors(struct crtc_config *crtc_conf,
 					    drmModeModeInfo *mode)
 {
 	int i;
 
-	for (i = 0; i < crtc->connector_count; i++) {
-		drmModeConnector *conn = crtc->cconfs[i].connector;
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		drmModeConnector *conn = crtc_conf->cconfs[i].connector;
 
 		/* Check HDMI 2.0 clock + per-connector compatibility */
 		if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
@@ -197,12 +199,12 @@ static bool mode_compatible_with_connectors(struct crtc_config *crtc,
 	return true;
 }
 
-static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
+static bool crtc_supports_mode(struct crtc_config *crtc_conf, drmModeModeInfo *mode)
 {
 	int i;
 
-	for (i = 0; i < crtc->connector_count; i++) {
-		if (!connector_supports_mode(crtc->cconfs[i].connector, mode))
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		if (!connector_supports_mode(crtc_conf->cconfs[i].connector, mode))
 			return false;
 	}
 
@@ -241,7 +243,7 @@ static int paint_fb(struct igt_fb *fb, const char *test_name,
 	return 0;
 }
 
-static void create_fb_for_crtc(struct crtc_config *crtc,
+static void create_fb_for_crtc(struct crtc_config *crtc_conf,
 			       struct igt_fb *fb_info)
 {
 	int bpp;
@@ -250,15 +252,15 @@ static void create_fb_for_crtc(struct crtc_config *crtc,
 
 	bpp = 32;
 	depth = 24;
-	fb_id = igt_create_pattern_fb(drm_fd, crtc->mode.hdisplay,
-				      crtc->mode.vdisplay,
+	fb_id = igt_create_pattern_fb(drm_fd, crtc_conf->mode.hdisplay,
+				      crtc_conf->mode.vdisplay,
 				      igt_bpp_depth_to_drm_format(bpp, depth),
 				      DRM_FORMAT_MOD_LINEAR,
 				      fb_info);
 	igt_assert_lt(0, fb_id);
 }
 
-static void get_mode_for_crtc(struct crtc_config *crtc,
+static void get_mode_for_crtc(struct crtc_config *crtc_conf,
 			      drmModeModeInfo *mode_ret)
 {
 	drmModeModeInfo *mode;
@@ -268,9 +270,9 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * First try to select a default mode that is supported by all
 	 * connectors.
 	 */
-	for (i = 0; i < crtc->connector_count; i++) {
-		mode = &crtc->cconfs[i].default_mode;
-		if (crtc_supports_mode(crtc, mode)) {
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		mode = &crtc_conf->cconfs[i].default_mode;
+		if (crtc_supports_mode(crtc_conf, mode)) {
 			*mode_ret = *mode;
 			return;
 		}
@@ -280,9 +282,9 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * Then just fall back to find any that is supported by all
 	 * connectors.
 	 */
-	for (i = 0; i < crtc->cconfs[0].connector->count_modes; i++) {
-		mode = &crtc->cconfs[0].connector->modes[i];
-		if (crtc_supports_mode(crtc, mode)) {
+	for (i = 0; i < crtc_conf->cconfs[0].connector->count_modes; i++) {
+		mode = &crtc_conf->cconfs[0].connector->modes[i];
+		if (crtc_supports_mode(crtc_conf, mode)) {
 			*mode_ret = *mode;
 			return;
 		}
@@ -293,8 +295,8 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * dictate the clone mode and may have HRR support, making them
 	 * incompatible with modes supported by external displays.
 	 */
-	for (i = 0; i < crtc->connector_count; i++) {
-		drmModeConnector *conn = crtc->cconfs[i].connector;
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		drmModeConnector *conn = crtc_conf->cconfs[i].connector;
 
 		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
 			mode = &conn->modes[0];
@@ -303,7 +305,7 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 					mode = &conn->modes[j];
 			}
 
-			if (mode_compatible_with_connectors(crtc, mode)) {
+			if (mode_compatible_with_connectors(crtc_conf, mode)) {
 				*mode_ret = *mode;
 				return;
 			}
@@ -315,10 +317,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * with the smallest clock, hope the other connectors can support it by
 	 * scaling etc.
 	 */
-	mode = &crtc->cconfs[0].default_mode;
-	for (i = 1; i < crtc->connector_count; i++) {
-		if (crtc->cconfs[i].default_mode.clock < mode->clock)
-			mode = &crtc->cconfs[i].default_mode;
+	mode = &crtc_conf->cconfs[0].default_mode;
+	for (i = 1; i < crtc_conf->connector_count; i++) {
+		if (crtc_conf->cconfs[i].default_mode.clock < mode->clock)
+			mode = &crtc_conf->cconfs[i].default_mode;
 	}
 
 	*mode_ret = *mode;
@@ -334,7 +336,7 @@ static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 	igt_assert(0);
 }
 
-static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
+static void get_crtc_config_str(struct crtc_config *crtc_conf, char *buf,
 				size_t buf_size)
 {
 	int pos;
@@ -342,12 +344,12 @@ static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
 
 	pos = snprintf(buf, buf_size,
 		       "CRTC[%d] [Pipe %s] Mode: %s@%dHz Connectors: ",
-		       crtc->crtc_id, kmstest_pipe_name(crtc->pipe_id),
-		       crtc->mode.name, crtc->mode.vrefresh);
+		       crtc_conf->crtc->crtc_id, igt_crtc_name(crtc_conf->crtc),
+		       crtc_conf->mode.name, crtc_conf->mode.vrefresh);
 	if (pos > buf_size)
 		return;
-	for (i = 0; i < crtc->connector_count; i++) {
-		drmModeConnector *connector = crtc->cconfs[i].connector;
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		drmModeConnector *connector = crtc_conf->cconfs[i].connector;
 
 		pos += snprintf(&buf[pos], buf_size - pos,
 			"%s%s-%d[%d]", i ? ", " : "",
@@ -363,18 +365,21 @@ static void setup_crtcs(const struct test_config *tconf,
 			int connector_count, struct crtc_config *crtcs,
 			int *crtc_count_ret, bool *config_valid_ret)
 {
-	struct crtc_config *crtc;
+	struct crtc_config *crtc_conf;
 	int crtc_count;
 	bool config_valid;
 	int i;
+	igt_display_t *display = tconf->display;
 	drmModeRes *resources = tconf->resources;
 	int encoder_usage_count[resources->count_encoders];
 
-	kmstest_unset_all_crtcs(drm_fd, resources);
+	/* Start from a clean state with all CRTCs disabled */
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	i = 0;
 	crtc_count = 0;
-	crtc = crtcs;
+	crtc_conf = crtcs;
 	config_valid = true;
 
 	while (i < connector_count) {
@@ -383,28 +388,26 @@ static void setup_crtcs(const struct test_config *tconf,
 
 		igt_assert_lt(crtc_count, MAX_CRTCS);
 
-		crtc->crtc_idx = cconf[i].crtc_idx;
-		crtc->crtc_id = resources->crtcs[crtc->crtc_idx];
+		crtc_conf->crtc_idx = cconf[i].crtc_idx;
+		crtc_conf->crtc = igt_crtc_for_crtc_index(display,
+							  crtc_conf->crtc_idx);
+		igt_assert(crtc_conf->crtc);
 
-		/* FIXME: avoid __intel_get_pipe_from_crtc_index() */
-		crtc->pipe_id = is_intel_device(drm_fd) ?
-			__intel_get_pipe_from_crtc_index(drm_fd, crtc->crtc_idx) : crtc->crtc_idx;
-
-		crtc->connector_count = 1;
+		crtc_conf->connector_count = 1;
 		for (j = i + 1; j < connector_count; j++)
-			if (cconf[j].crtc_idx == crtc->crtc_idx)
-				crtc->connector_count++;
+			if (cconf[j].crtc_idx == crtc_conf->crtc_idx)
+				crtc_conf->connector_count++;
 
-		crtc->cconfs = malloc(sizeof(*crtc->cconfs) *
-				      crtc->connector_count);
-		igt_assert(crtc->cconfs);
+		crtc_conf->cconfs = malloc(sizeof(*crtc_conf->cconfs) *
+				      crtc_conf->connector_count);
+		igt_assert(crtc_conf->cconfs);
 
 		encoder_mask = 0;
-		for (j = 0; j < crtc->connector_count; j++) {
+		for (j = 0; j < crtc_conf->connector_count; j++) {
 			drmModeConnector *connector;
 			drmModeEncoder *encoder;
 
-			crtc->cconfs[j] = cconf[i + j];
+			crtc_conf->cconfs[j] = cconf[i + j];
 			connector = cconf[i + j].connector;
 
 			/* Intel connectors have only a single encoder */
@@ -415,14 +418,14 @@ static void setup_crtcs(const struct test_config *tconf,
 				igt_assert_eq(connector->connector_type,
 					      DRM_MODE_CONNECTOR_DisplayPort);
 
-				igt_assert(connector->count_encoders >= crtc->crtc_idx);
+				igt_assert(connector->count_encoders >= crtc_conf->crtc_idx);
 				encoder = drmModeGetEncoder(drm_fd,
 					connector->encoders[crtc_count]);
 			}
 			igt_assert(encoder);
 
-			config_valid &= !!(encoder->possible_crtcs &
-					  (1 << crtc->crtc_idx));
+			config_valid &= igt_crtc_connector_valid(crtc_conf->crtc,
+								 cconf[i + j].output);
 
 			encoder_mask |= 1 << get_encoder_idx(resources,
 							     encoder);
@@ -431,12 +434,12 @@ static void setup_crtcs(const struct test_config *tconf,
 
 			drmModeFreeEncoder(encoder);
 		}
-		get_mode_for_crtc(crtc, &crtc->mode);
-		create_fb_for_crtc(crtc, &crtc->fb_info);
+		get_mode_for_crtc(crtc_conf, &crtc_conf->mode);
+		memset(&crtc_conf->fb_info, 0, sizeof(crtc_conf->fb_info));
 
-		i += crtc->connector_count;
+		i += crtc_conf->connector_count;
 		crtc_count++;
-		crtc++;
+		crtc_conf++;
 	}
 
 	memset(encoder_usage_count, 0, sizeof(encoder_usage_count));
@@ -462,13 +465,16 @@ static void setup_crtcs(const struct test_config *tconf,
 	*config_valid_ret = config_valid;
 }
 
-static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
+static void cleanup_crtcs(igt_display_t *display, struct crtc_config *crtcs,
+			  int crtc_count)
 {
 	int i;
 
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
 	for (i = 0; i < crtc_count; i++) {
 		igt_remove_fb(drm_fd, &crtcs[i].fb_info);
-		drmModeSetCrtc(drm_fd, crtcs[i].crtc_id, 0, 0, 0, NULL, 0, NULL);
 
 		free(crtcs[i].cconfs);
 	}
@@ -477,7 +483,7 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
 #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
 #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
 
-static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
+static bool check_timings(igt_crtc_t *crtc, const drmModeModeInfo *kmode)
 {
 #define CALIBRATE_TS_STEPS 120 /* ~2s has to be less than 128! */
 	drmVBlank wait;
@@ -491,7 +497,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	int n;
 
 	memset(&wait, 0, sizeof(wait));
-	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
+	wait.request.type = igt_crtc_get_vbl_flag(crtc);
 	wait.request.type |= DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMISS;
 	do_or_die(drmWaitVBlank(drm_fd, &wait));
 
@@ -501,7 +507,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	last_timestamp += wait.reply.tval_usec;
 
 	memset(&wait, 0, sizeof(wait));
-	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
+	wait.request.type = igt_crtc_get_vbl_flag(crtc);
 	wait.request.type |= DRM_VBLANK_ABSOLUTE | DRM_VBLANK_EVENT;
 	wait.request.sequence = last_seq;
 	for (n = 0; n < CALIBRATE_TS_STEPS; n++) {
@@ -511,7 +517,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 		do_or_die(drmWaitVBlank(drm_fd, &wait));
 
 		/* Double check that haven't already missed the vblank */
-		check.request.type = kmstest_get_vbl_flag(crtc_idx);
+		check.request.type = igt_crtc_get_vbl_flag(crtc);
 		check.request.type |= DRM_VBLANK_RELATIVE;
 		do_or_die(drmWaitVBlank(drm_fd, &check));
 
@@ -603,7 +609,7 @@ static void test_crtc_config(const struct test_config *tconf,
 {
 	char str_buf[MAX_CRTCS][1024];
 	const char *crtc_strs[MAX_CRTCS];
-	struct crtc_config *crtc;
+	struct crtc_config *crtc_conf;
 	static int test_id;
 	bool config_failed = false;
 	bool retry = false;
@@ -619,7 +625,7 @@ static void test_crtc_config(const struct test_config *tconf,
 
 retry:
 	if (retry) {
-		kmstest_unset_all_crtcs(drm_fd, tconf->resources);
+		igt_display_reset(tconf->display);
 
 		for (i = 0; i < crtc_count; i++) {
 			/* Sort the modes in asending order by clock freq. */
@@ -642,40 +648,47 @@ retry:
 	}
 
 	for (i = 0; i < crtc_count; i++) {
-		uint32_t *ids;
+		igt_plane_t *primary;
 
-		crtc = &crtcs[i];
+		crtc_conf = &crtcs[i];
 
 		igt_info("    %s\n", crtc_strs[i]);
 
-		create_fb_for_crtc(crtc, &crtc->fb_info);
-		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, i);
+		/* The mode may have changed on retry, so recreate the fb */
+		igt_remove_fb(drm_fd, &crtc_conf->fb_info);
+		create_fb_for_crtc(crtc_conf, &crtc_conf->fb_info);
+		paint_fb(&crtc_conf->fb_info, tconf->name, crtc_strs, crtc_count, i);
 
-		ids = malloc(sizeof(*ids) * crtc->connector_count);
-		igt_assert(ids);
-		for (int j = 0; j < crtc->connector_count; j++)
-			ids[j] = crtc->cconfs[j].connector->connector_id;
+		for (int j = 0; j < crtc_conf->connector_count; j++) {
+			igt_output_t *output = crtc_conf->cconfs[j].output;
 
-		ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
-				     crtc->fb_info.fb_id, 0, 0, ids,
-				     crtc->connector_count, &crtc->mode);
+			igt_output_set_crtc(output, crtc_conf->crtc);
+			igt_output_override_mode(output, &crtc_conf->mode);
+		}
 
-		if (is_intel_device(drm_fd))
-			intel_drrs_disable_crtc_index(drm_fd, crtc->crtc_idx);
+		primary = igt_crtc_get_plane_type(crtc_conf->crtc,
+						  DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &crtc_conf->fb_info);
+	}
 
-		free(ids);
+	ret = igt_display_try_commit_atomic(tconf->display,
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-		if (ret < 0) {
-			if (errno == ENOSPC) {
-				igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
+	if (ret == 0 && is_intel_device(drm_fd)) {
+		for (i = 0; i < crtc_count; i++)
+			intel_drrs_disable(crtcs[i].crtc);
+	}
 
-				retry = true;
-				goto retry;
-			}
+	if (ret < 0) {
+		if (ret == -ENOSPC) {
+			igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
 
-			igt_assert_eq(errno, EINVAL);
-			config_failed = true;
+			retry = true;
+			goto retry;
 		}
+
+		igt_assert_eq(ret, -EINVAL);
+		config_failed = true;
 	}
 
 	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
@@ -684,7 +697,7 @@ retry:
 		bool status = false;
 
 		for (int attempt = 1; attempt <= 2; attempt++) {
-			status = check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
+			status = check_timings(crtcs[0].crtc, &crtcs[0].mode);
 			if (status)
 				break;
 			igt_info("Timing check failed on attempt %d, retrying...\n", attempt);
@@ -696,16 +709,16 @@ retry:
 	return;
 }
 
-static int get_test_name_str(struct crtc_config *crtc, char *buf,
+static int get_test_name_str(struct crtc_config *crtc_conf, char *buf,
 				size_t buf_size)
 {
 	int pos;
 	int i;
 
-	pos = snprintf(buf, buf_size, "pipe-%s-", kmstest_pipe_name(crtc->pipe_id));
+	pos = snprintf(buf, buf_size, "pipe-%s-", igt_crtc_name(crtc_conf->crtc));
 
-	for (i = 0; i < crtc->connector_count; i++) {
-		drmModeConnector *connector = crtc->cconfs[i].connector;
+	for (i = 0; i < crtc_conf->connector_count; i++) {
+		drmModeConnector *connector = crtc_conf->cconfs[i].connector;
 
 		pos += snprintf(&buf[pos], buf_size - pos,
 			"%s%s-%d", i ? "-" : "",
@@ -734,14 +747,15 @@ static void test_one_combination(const struct test_config *tconf,
 		for (i = 0; i < crtc_count; i++) {
 			if (i > 0)
 				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
-			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
+			pos += get_test_name_str(&crtcs[i], &test_name[pos],
+						 ARRAY_SIZE(test_name) - pos);
 		}
 
 		if (!is_intel_device(drm_fd))
 			goto test;
 
 		for (i = 0; i < crtc_count; i++) {
-			struct crtc_config *crtc = &crtcs[i];
+			struct crtc_config *crtc_conf = &crtcs[i];
 			char conn_name[24], prev_conn_name[24];
 
 			snprintf(conn_name, sizeof(conn_name),
@@ -768,12 +782,12 @@ static void test_one_combination(const struct test_config *tconf,
 			 *   - current & previous crtcs are consecutive
 			 */
 			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
-			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
-			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
+			      igt_bigjoiner_possible(drm_fd, &crtc_conf->mode, max_dotclock)) &&
+			     ((crtc_conf->crtc_idx >= (igt_display_n_crtcs(tconf->display) - 1)) ||
+			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc_conf->crtc_idx) <= 1)))) ||
 			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
-			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
+					 igt_bigjoiner_possible(drm_fd, &crtcs[i - 1].mode, max_dotclock)) &&
+			     (abs(crtc_conf->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
 			}
@@ -784,7 +798,7 @@ test:
 	}
 
 out:
-	cleanup_crtcs(crtcs, crtc_count);
+	cleanup_crtcs(tconf->display, crtcs, crtc_count);
 }
 
 static int assign_crtc_to_connectors(const struct test_config *tconf,
@@ -814,63 +828,32 @@ static int assign_crtc_to_connectors(const struct test_config *tconf,
 	return 0;
 }
 
-static int get_one_connector(drmModeRes *resources, int connector_id,
-			     struct connector_config *cconf)
+static int get_one_output(igt_output_t *output,
+			  struct connector_config *cconf)
 {
-	drmModeConnector *connector;
-
-	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
-	igt_assert(connector);
-	cconf->connector = connector;
-
-	if (connector->connection != DRM_MODE_CONNECTED) {
-		drmModeFreeConnector(connector);
-		return -1;
-	}
+	drmModeConnector *connector = output->config.connector;
 
 	if (!kmstest_get_connector_default_mode(drm_fd, connector,
-						&cconf->default_mode)) {
-		drmModeFreeConnector(connector);
+						&cconf->default_mode))
 		return -1;
-	}
+
+	cconf->output = output;
+	cconf->connector = connector;
 
 	return 0;
 }
 
-static int get_connectors(drmModeRes *resources, int *connector_idxs,
+static int get_connectors(igt_output_t **outputs, int *output_idxs,
 			  int connector_count, struct connector_config *cconfs)
 {
 	int i;
 
 	for (i = 0; i < connector_count; i++) {
-		int connector_idx;
-		int connector_id;
-
-		connector_idx = connector_idxs[i];
-		igt_assert_lt(connector_idx, resources->count_connectors);
-		connector_id = resources->connectors[connector_idx];
-
-		if (get_one_connector(resources, connector_id, &cconfs[i]) < 0)
-			goto err;
-
+		if (get_one_output(outputs[output_idxs[i]], &cconfs[i]) < 0)
+			return -1;
 	}
 
 	return 0;
-
-err:
-	while (i--)
-		drmModeFreeConnector(cconfs[i].connector);
-
-	return -1;
-}
-
-static void free_connectors(struct connector_config *cconfs,
-			    int connector_count)
-{
-	int i;
-
-	for (i = 0; i < connector_count; i++)
-		drmModeFreeConnector(cconfs[i].connector);
 }
 
 struct combination {
@@ -929,38 +912,47 @@ static int get_crtc_count(int count_crtcs, bool extend)
 static void test_combinations(const struct test_config *tconf,
 			      int connector_count)
 {
+	igt_display_t *display = tconf->display;
 	struct combination_set connector_combs;
 	struct combination_set crtc_combs;
 	struct connector_config *cconfs;
+	igt_output_t *output, **outputs;
+	int n_outputs = 0;
 	int i;
-	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
+	int crtc_count = get_crtc_count(igt_display_n_crtcs(display), extended);
 
-	igt_assert(tconf->resources);
+	for_each_connected_output(display, output)
+		n_outputs++;
 
-	connector_combs.capacity = pow(tconf->resources->count_connectors,
-				       crtc_count + 1);
+	outputs = calloc(n_outputs, sizeof(*outputs));
+	igt_assert(outputs);
+
+	n_outputs = 0;
+	for_each_connected_output(display, output)
+		outputs[n_outputs++] = output;
+
+	connector_combs.capacity = pow(n_outputs, crtc_count + 1);
 	crtc_combs.capacity = pow(crtc_count,
 				  crtc_count + 1);
 	connector_combs.items = malloc(connector_combs.capacity * sizeof(struct combination));
 	crtc_combs.items = malloc(crtc_combs.capacity * sizeof(struct combination));
 
-	get_combinations(tconf->resources->count_connectors, connector_count,
-			 false, &connector_combs);
+	get_combinations(n_outputs, connector_count, false, &connector_combs);
 	get_combinations(crtc_count, connector_count, true, &crtc_combs);
 
 	igt_info("Testing: %s %d connector combinations\n", tconf->name,
 		 connector_count);
 	for (i = 0; i < connector_combs.count; i++) {
-		int *connector_idxs;
+		int *output_idxs;
 		int ret;
 		int j;
 
 		cconfs = malloc(sizeof(*cconfs) * connector_count);
 		igt_assert(cconfs);
 
-		connector_idxs = &connector_combs.items[i].elems[0];
-		ret = get_connectors(tconf->resources, connector_idxs,
-				     connector_count, cconfs);
+		output_idxs = &connector_combs.items[i].elems[0];
+		ret = get_connectors(outputs, output_idxs, connector_count,
+				     cconfs);
 		if (ret < 0)
 			goto free_cconfs;
 
@@ -975,19 +967,20 @@ static void test_combinations(const struct test_config *tconf,
 			test_one_combination(tconf, cconfs, connector_count);
 		}
 
-		free_connectors(cconfs, connector_count);
 free_cconfs:
 		free(cconfs);
 	}
 
 	free(connector_combs.items);
 	free(crtc_combs.items);
+	free(outputs);
 }
 
 static void run_test(const struct test_config *tconf)
 {
 	int connector_num;
-	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
+	int crtc_count = get_crtc_count(igt_display_n_crtcs(tconf->display),
+					extended);
 
 	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
 	for (; connector_num <= crtc_count; connector_num++)
@@ -1040,6 +1033,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
 					"clone-exclusive-crtc" },
 	};
+	igt_display_t display;
 	int i;
 
 	igt_assert_f(!(dry_run && filter_test_id),
@@ -1050,6 +1044,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		if (!dry_run)
 			kmstest_set_vt_graphics_mode();
 
+		igt_display_require(&display, drm_fd);
+		igt_require(display.is_atomic);
+
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
 
@@ -1062,6 +1059,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 			struct test_config tconf = {
 				.flags		= tests[i].flags,
 				.name		= tests[i].name,
+				.display	= &display,
 				.resources	= drm_resources,
 			};
 			run_test(&tconf);
@@ -1083,6 +1081,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		struct test_config tconf = {
 			.flags		= TEST_TIMINGS,
 			.name		= "basic-no-cpu-idle",
+			.display	= &display,
 			.resources	= drm_resources,
 		};
 
@@ -1094,6 +1093,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture() {
 		drmModeFreeResources(drm_resources);
+		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
 	}
 }
-- 
2.43.0


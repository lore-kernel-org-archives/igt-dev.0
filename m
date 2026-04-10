Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36994F45A01
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 17:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9010E9A0;
	Fri, 10 Apr 2026 17:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNX+piOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9B010E9A0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775840767; x=1807376767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ExABpRQeXZAZA9C/crXvGXBWGg32SRY/pO7wPd0VeCM=;
 b=nNX+piOCx/hy+2z3qyqUw4f76td7igyeklh6SmG3IQcV89munfWW5Y7Q
 mSzuETvHV52k+EBAkokLILpSA2mr9WU3zgkDhXJOBVU16VUeAAnTHmLUM
 QRiKjXoD/FE2405/k/E3G2IsaiwyV3BhsrP7RDCddBFOSEZD3UFEp0HBZ
 QtD+iH9qBnobl0Ar/9X0i2//A0AvmpakjrTY/S59Fk3arS0eh6oNd/6GO
 ZXncoNj3So0JCpFp5GusoI++ebeNic0oUQYj0Yc+sbfMGH+sxw/PiSaj8
 IaAglthYD4Q7N7xOINE/N/MMwttDbNESmz2YyYiEL6z+wKZCcbY1eBkYa w==;
X-CSE-ConnectionGUID: 8m5kp9tCTAyvO1YQJ0jCLA==
X-CSE-MsgGUID: 6K2hvC/pTB2696A3OuIaGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76937706"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76937706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 10:06:07 -0700
X-CSE-ConnectionGUID: ZdH463m4Q72r3rMafU7U4w==
X-CSE-MsgGUID: b+pugJ9bQl+IhuwaaZ80mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229022379"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 10:06:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Jani Nikula <jani.nikula@intel.com>
Subject: [RFC] lib/kms: rename enum pipe to vendor_pipe,
 crtc->pipe to crtc->vendor_pipe
Date: Fri, 10 Apr 2026 20:05:58 +0300
Message-ID: <20260410170558.471150-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Historically, CRTCs and CRTC indexes have been called "pipes" in IGT,
due to IGT's Intel origins. This has been increasingly confusing, and
downright wrong with the idea of not having 1:1 mapping between pipes
and CRTC indexes. While CRTC indexes are always consecutive in the order
the CRTCs were created in the kernel, you could be missing pipes in
between, or create them in different order.

This conflation has been largely fixed in IGT recently (which is
evidenced by the relatively small footprint of this change). But the
idea of "pipe" is still there.

Rename enum pipe to vendor_pipe, and crtc->pipe member to
crtc->vendor_pipe to further emphasize that they're not generic but
rather GPU vendor specific concepts, and should be avoided in generic
code.

The vendor pipe usage remains in some generic lib/kms code for legacy
reasons, but works due to it matching CRTC index by default for
non-Intel.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

"hardware pipe" is another alternative, but I think "vendor pipe" leaves
the door open for a more generic interpretation and application for
non-Intel devices.
---
 lib/igt_kms.c                          | 22 +++++++++---------
 lib/igt_kms.h                          | 20 ++++++++++------
 tests/intel/kms_busy.c                 | 16 ++++++-------
 tests/intel/kms_dp_link_training.c     |  2 +-
 tests/intel/kms_dsc_helper.c           |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_joiner.c               | 32 +++++++++++++-------------
 tests/intel/kms_joiner_helper.c        |  6 ++---
 tests/intel/kms_pipe_b_c_ivb.c         |  4 ++--
 tests/intel/kms_pipe_stress.c          | 22 +++++++++---------
 tests/intel/kms_pm_dc.c                |  8 +++----
 tests/intel/kms_pm_lpsp.c              |  2 +-
 tests/intel/kms_psr2_sf.c              |  4 ++--
 tests/intel/perf_pmu.c                 |  2 +-
 tests/kms_cursor_crc.c                 |  2 +-
 tests/kms_cursor_edge_walk.c           |  2 +-
 tests/kms_panel_fitting.c              |  2 +-
 tests/kms_plane_scaling.c              |  2 +-
 18 files changed, 79 insertions(+), 73 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2dbf9ec38458..f0364d5c723a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1050,7 +1050,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
  *
  * Returns: A string representing @pipe, e.g. "A".
  */
-const char *kmstest_pipe_name(enum pipe pipe)
+const char *kmstest_pipe_name(enum vendor_pipe pipe)
 {
 	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H\0I\0J\0K\0L\0M\0N\0O\0P";
 
@@ -3111,7 +3111,7 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
 {
 	const igt_crtc_t *a = _a, *b = _b;
 
-	return a->pipe - b->pipe;
+	return a->vendor_pipe - b->vendor_pipe;
 }
 
 /**
@@ -3182,7 +3182,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 		crtc->crtc_id = resources->crtcs[crtc_index];
 		crtc->crtc_index = crtc_index;
-		crtc->pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
+		crtc->vendor_pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
 	}
 
 	/* For Intel, sort the CRTCs in pipe order */
@@ -3602,7 +3602,7 @@ static int output_crtc_pipe_compare(const void *_a, const void *_b)
 
 	/* pipe order for valid output/crtc combos */
 	if (a->crtc && b->crtc)
-		return a->crtc->pipe - b->crtc->pipe;
+		return a->crtc->vendor_pipe - b->crtc->vendor_pipe;
 
 	/* valid combos before empty elements */
 	return !b->crtc - !a->crtc;
@@ -5295,7 +5295,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc)
 	if (crtc == NULL)
 		return "None";
 
-	return kmstest_pipe_name(crtc->pipe);
+	return kmstest_pipe_name(crtc->vendor_pipe);
 }
 
 /**
@@ -7009,7 +7009,7 @@ bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
  *
  * Returns: True if joiner is enabled, false otherwise.
  */
-bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum vendor_pipe pipe)
 {
 	char buf[16384], master_str[64], slave_str[64];
 	int dir, res;
@@ -7229,7 +7229,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 	struct {
-		enum pipe idx;
+		enum vendor_pipe idx;
 		drmModeModeInfo *mode;
 		igt_output_t *output;
 		bool force_joiner;
@@ -7248,7 +7248,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 		if (!output->pending_crtc)
 			continue;
 
-		pipes[pipes_in_use].idx = output->pending_crtc->pipe;
+		pipes[pipes_in_use].idx = output->pending_crtc->vendor_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
 		pipes[pipes_in_use].output = output;
 		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
@@ -8088,12 +8088,12 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
 	return NULL;
 }
 
-igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
+igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum vendor_pipe pipe)
 {
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		if (crtc->pipe == pipe)
+		if (crtc->vendor_pipe == pipe)
 			return crtc;
 	}
 
@@ -8155,7 +8155,7 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
 	igt_crtc_t *next;
 
 	for_each_crtc(display, next) {
-		if (!crtc || next->pipe > crtc->pipe)
+		if (!crtc || next->vendor_pipe > crtc->vendor_pipe)
 			return next;
 	}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9a3fa980d89d..f2720490ae7f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -49,7 +49,13 @@
 #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
 /**
- * pipe:
+ * vendor_pipe:
+ *
+ * GPU vendor-specific hardware pipe, which may be different from the CRTC
+ * index. Only code and tests that specifically need to know the pipe should use
+ * this, and conditional to the device in question. Defaults to matching the
+ * CRTC index, but do not rely on it.
+ *
  * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a pipe.
  * @PIPE_A: First crtc.
  * @PIPE_B: Second crtc.
@@ -69,7 +75,7 @@
  * @PIPE_P: Sixteenth crtc.
  * @IGT_MAX_PIPES: Max number of pipes allowed.
  */
-enum pipe {
+enum vendor_pipe {
         PIPE_NONE = -1,
         PIPE_A = 0,
         PIPE_B,
@@ -89,7 +95,7 @@ enum pipe {
         PIPE_P,
         IGT_MAX_PIPES
 };
-const char *kmstest_pipe_name(enum pipe pipe);
+const char *kmstest_pipe_name(enum vendor_pipe pipe);
 const char *kmstest_plane_type_name(int plane_type);
 
 enum port {
@@ -472,8 +478,8 @@ typedef struct igt_plane {
  */
 struct igt_crtc {
 	igt_display_t *display;
-	/* ID of a hardware pipe */
-	enum pipe pipe;
+	/* ID of a hardware pipe. This may be vendor specific. Use crtc_index instead. */
+	enum vendor_pipe vendor_pipe;
 
 	int n_planes;
 	int num_primary_planes;
@@ -573,7 +579,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc);
 
 igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index);
-igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe);
+igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum vendor_pipe pipe);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
@@ -1246,7 +1252,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 			       int max_dotclock, drmModeModeInfo *mode);
-bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum vendor_pipe pipe);
 bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index e82380276666..e1864117d907 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -419,7 +419,7 @@ const char *help_str =
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	igt_display_t display = { .drm_fd = -1, .n_crtcs = IGT_MAX_PIPES };
-	enum pipe active_pipes[IGT_MAX_PIPES];
+	enum vendor_pipe active_pipes[IGT_MAX_PIPES];
 	igt_output_t *output;
 	uint32_t last_pipe = 0;
 	igt_crtc_t *crtc;
@@ -452,7 +452,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		/* Get active pipes. */
 		for_each_crtc(&display, crtc)
-			active_pipes[last_pipe++] = crtc->pipe;
+			active_pipes[last_pipe++] = crtc->vendor_pipe;
 		last_pipe--;
 	}
 
@@ -484,8 +484,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (!crtc_output_combo_valid(&display, output, crtc))
 				continue;
 
-			if (!all_pipes && crtc->pipe != active_pipes[0] &&
-					  crtc->pipe != active_pipes[last_pipe])
+			if (!all_pipes && crtc->vendor_pipe != active_pipes[0] &&
+					  crtc->vendor_pipe != active_pipes[last_pipe])
 				continue;
 
 			igt_dynamic_f("flip-pipe-%s", igt_crtc_name(crtc))
@@ -509,8 +509,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (!crtc_output_combo_valid(&display, output, crtc))
 				continue;
 
-			if (!all_pipes && crtc->pipe != active_pipes[0] &&
-					  crtc->pipe != active_pipes[last_pipe])
+			if (!all_pipes && crtc->vendor_pipe != active_pipes[0] &&
+					  crtc->vendor_pipe != active_pipes[last_pipe])
 				continue;
 
 			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc))
@@ -544,8 +544,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if (!crtc_output_combo_valid(&display, output, crtc))
 					continue;
 
-				if (!all_pipes && crtc->pipe != active_pipes[0] &&
-						  crtc->pipe != active_pipes[last_pipe])
+				if (!all_pipes && crtc->vendor_pipe != active_pipes[0] &&
+						  crtc->vendor_pipe != active_pipes[last_pipe])
 					continue;
 
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index d859db64b4ff..e580a535f2c9 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -154,7 +154,7 @@ static void do_modeset(data_t *data, bool mst)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(&data->display, crtc) {
-		valid_pipes_mask |= BIT(crtc->pipe);
+		valid_pipes_mask |= BIT(crtc->vendor_pipe);
 		n_pipes++;
 	}
 
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 29b998c2f1d9..3eed7afed2fe 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -91,7 +91,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t *output,
 	drmModeConnector *connector = output->config.connector;
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
-	    (crtc->pipe == PIPE_A) && IS_GEN11(devid)) {
+	    (crtc->vendor_pipe == PIPE_A) && IS_GEN11(devid)) {
 		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n",
 			 igt_crtc_name(crtc), output->name);
 		return false;
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199bdd..f7cac20c1257 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1171,7 +1171,7 @@ static bool find_connector(bool edp_only, bool pipe_a,
 		if (edp_only && c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-		if (pipe_a && crtc->pipe != PIPE_A)
+		if (pipe_a && crtc->vendor_pipe != PIPE_A)
 			continue;
 
 		if (output == forbidden_output || crtc == forbidden_crtc) {
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba689..3d8d74141e0c 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -99,7 +99,7 @@ typedef struct {
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
 	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
-	enum pipe pipe_seq[IGT_MAX_PIPES];
+	enum vendor_pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 	bool ultra_joiner_supported;
 } data_t;
@@ -132,7 +132,7 @@ static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
 	}
 }
 
-static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
+static enum vendor_pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
 {
 	if ((data->master_pipes & available_pipe_mask) == 0)
 		return PIPE_NONE;
@@ -140,17 +140,17 @@ static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask
 	return ffs(data->master_pipes & available_pipe_mask) - 1;
 }
 
-static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t available_pipe_mask)
+static enum vendor_pipe setup_pipe(data_t *data, igt_output_t *output, enum vendor_pipe pipe, uint32_t available_pipe_mask)
 {
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
-	enum pipe master_pipe;
+	enum vendor_pipe master_pipe;
 	uint32_t attempt_mask;
 
 	crtc = igt_crtc_for_pipe(display, pipe);
 	igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
-	attempt_mask = BIT(crtc->pipe);
+	attempt_mask = BIT(crtc->vendor_pipe);
 	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
 	if (master_pipe == PIPE_NONE)
@@ -158,7 +158,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_info("Using pipe %s as master and %s slave for %s\n",
 		 igt_crtc_name(crtc),
-		 kmstest_pipe_name(crtc->pipe + 1), output->name);
+		 kmstest_pipe_name(crtc->vendor_pipe + 1), output->name);
 	igt_output_set_crtc(output, crtc);
 
 	return master_pipe;
@@ -168,7 +168,7 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 {
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
-	enum pipe pipe = PIPE_A;
+	enum vendor_pipe pipe = PIPE_A;
 	igt_plane_t *primary;
 	igt_fb_t fb;
 
@@ -224,7 +224,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	drmModeModeInfo uj_mode;
 	int status;
 	bool ultrajoiner_found;
-	enum pipe pipe;
+	enum vendor_pipe pipe;
 	bool force_joiner_supported;
 
 	drmModeConnector *connector = output->config.connector;
@@ -279,7 +279,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
-	enum pipe pipe, master_pipe;
+	enum vendor_pipe pipe, master_pipe;
 	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
 	igt_output_t *output;
 	igt_plane_t *primary;
@@ -314,7 +314,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i, cleanup;
 	uint32_t available_pipe_mask;
-	enum pipe pipe, master_pipe;
+	enum vendor_pipe pipe, master_pipe;
 	igt_output_t **outputs;
 	igt_output_t *output;
 	igt_plane_t *primary[output_count];
@@ -360,7 +360,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 	int i, j, ret;
 	uint32_t available_pipe_mask;
 	uint32_t attempt_mask;
-	enum pipe master_pipe;
+	enum vendor_pipe master_pipe;
 	igt_output_t **outputs;
 	igt_output_t *output;
 	igt_plane_t *primary[INVALID_TEST_OUTPUT];
@@ -382,7 +382,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 
 		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
 			igt_crtc_t *crtc;
-			enum pipe pipe = data->pipe_seq[i + j];
+			enum vendor_pipe pipe = data->pipe_seq[i + j];
 
 			output = outputs[j];
 
@@ -435,7 +435,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 
 	for (i = 0; i < len; i++) {
 		igt_crtc_t *crtc;
-		enum pipe pipe = data->pipe_seq[data->n_pipes - 1];
+		enum vendor_pipe pipe = data->pipe_seq[data->n_pipes - 1];
 
 		igt_display_reset(&data->display);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -502,7 +502,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 		for (j = 0; j < data->n_pipes; j++) {
 			igt_crtc_t *crtc;
-			enum pipe pipe;
+			enum vendor_pipe pipe;
 
 			/* Ultra joiner is only valid on PIPE_A */
 			if (invalid_pipe && j == PIPE_A)
@@ -573,7 +573,7 @@ static void test_basic_max_non_joiner(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int count;
-	enum pipe pipe;
+	enum vendor_pipe pipe;
 	igt_output_t **outputs, *output;
 	igt_fb_t fb;
 	igt_plane_t *primary;
@@ -695,7 +695,7 @@ int igt_main()
 		data.n_pipes = 0;
 		for_each_crtc(&data.display, crtc) {
 			data.n_pipes++;
-			data.pipe_seq[j] = crtc->pipe;
+			data.pipe_seq[j] = crtc->vendor_pipe;
 			j++;
 		}
 	}
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index e24d7ce94f00..a629eed70175 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -75,7 +75,7 @@ static int find_consecutive_pipes(int n_pipes,
 	return -1;
 }
 
-static enum pipe get_next_master_pipe(uint32_t pipe_mask)
+static enum vendor_pipe get_next_master_pipe(uint32_t pipe_mask)
 {
 	int i;
 
@@ -101,7 +101,7 @@ static enum pipe get_next_master_pipe(uint32_t pipe_mask)
  */
 void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
 {
-	enum pipe pipe;
+	enum vendor_pipe pipe;
 
 	*master_pipes = 0;
 	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
@@ -137,7 +137,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 {
 	int i = 0, idx  = 0, needed = 0, start = 0;
 	uint32_t available_pipes_mask = 0;
-	enum pipe mp = PIPE_NONE;
+	enum vendor_pipe mp = PIPE_NONE;
 	igt_output_t *out;
 
 	for (idx = 0; idx < num_outputs; idx++) {
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index a39b46ca23e0..54cfd8c61dae 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -160,10 +160,10 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 	*output2 = NULL;
 
 	for_each_crtc_with_valid_output(&data->display, crtc, output) {
-		if (crtc->pipe == PIPE_B && !*output1 && output != *output2)
+		if (crtc->vendor_pipe == PIPE_B && !*output1 && output != *output2)
 			*output1 = output;
 
-		if (crtc->pipe == PIPE_C && output != *output1 && !*output2)
+		if (crtc->vendor_pipe == PIPE_C && output != *output1 && !*output2)
 			*output2 = output;
 
 		igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 36e3842c6195..29d5ec50fc9a 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -386,8 +386,8 @@ static void cleanup_plane_fbs(struct data *data, igt_crtc_t *crtc, int start,
 
 	while (i < end) {
 		igt_remove_fb(data->display.drm_fd,
-			      &data->fb[crtc->pipe * MAX_PLANES + i]);
-		data->fb[crtc->pipe * MAX_PLANES + i].fb_id = 0;
+			      &data->fb[crtc->vendor_pipe * MAX_PLANES + i]);
+		data->fb[crtc->vendor_pipe * MAX_PLANES + i].fb_id = 0;
 		i++;
 	}
 }
@@ -407,14 +407,14 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 	if (!mode)
 		mode = igt_output_get_mode(output);
 
-	if (data->last_mode[crtc->pipe] != mode) {
+	if (data->last_mode[crtc->vendor_pipe] != mode) {
 		ret = commit_mode(data, output,
 				  crtc, mode);
 
 		if (!ret)
 			return ret;
 
-		data->last_mode[crtc->pipe] = mode;
+		data->last_mode[crtc->vendor_pipe] = mode;
 		new_mode = true;
 	}
 
@@ -422,7 +422,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 	 * Looks like we can't have planes on that pipe at all
 	 * or mode hasn't changed
 	 */
-	if (!data->num_planes[crtc->pipe] || !new_mode)
+	if (!data->num_planes[crtc->vendor_pipe] || !new_mode)
 		return 0;
 
 	for_each_plane_on_crtc(crtc,
@@ -430,13 +430,13 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 		int plane_width, plane_height;
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			cursor_plane_set_fb(plane,
-					    &data->cursor_fb[crtc->pipe],
+					    &data->cursor_fb[crtc->vendor_pipe],
 					    cursor_width, cursor_height);
 			plane_width = cursor_width;
 			plane_height = cursor_height;
 		} else {
 			universal_plane_set_fb(plane,
-					       &data->fb[crtc->pipe * MAX_PLANES + i],
+					       &data->fb[crtc->vendor_pipe * MAX_PLANES + i],
 					       mode->hdisplay, mode->vdisplay);
 
 			plane_width = (mode->hdisplay * 3) / 4;
@@ -458,10 +458,10 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 			}
 			if (ret) {
 				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
-					 crtc->pipe);
-				data->num_planes[crtc->pipe] = i;
+					 crtc->vendor_pipe);
+				data->num_planes[crtc->vendor_pipe] = i;
 				igt_info("Max num planes for pipe %d set to %d\n",
-					 crtc->pipe, i);
+					 crtc->vendor_pipe, i);
 				/*
 				 * We have now determined max amount of full sized planes, we will just
 				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
@@ -474,7 +474,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 						  MAX_PLANES);
 			}
 
-			if (++i >= data->num_planes[crtc->pipe])
+			if (++i >= data->num_planes[crtc->vendor_pipe])
 				break;
 		}
 	}
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8138933d43b1..7c09e43d3f29 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -122,7 +122,7 @@ static void set_output_on_pipe_b(data_t *data)
 		drmModeConnectorPtr c = output->config.connector;
 
 		/* DC5 with PIPE_B transaction */
-		if (crtc->pipe != PIPE_B)
+		if (crtc->vendor_pipe != PIPE_B)
 			continue;
 
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
@@ -150,11 +150,11 @@ static void setup_output(data_t *data)
 
 		if (disp_ver >= 13) {
 			if (disp_ver == 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
-				is_low_power = (crtc->pipe == PIPE_A);
+				is_low_power = (crtc->vendor_pipe == PIPE_A);
 			else
-				is_low_power = (crtc->pipe == PIPE_A || crtc->pipe == PIPE_B);
+				is_low_power = (crtc->vendor_pipe == PIPE_A || crtc->vendor_pipe == PIPE_B);
 		} else {
-			is_low_power = (crtc->pipe == PIPE_A);
+			is_low_power = (crtc->vendor_pipe == PIPE_A);
 		}
 
 		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the DC5 transaction.\n");
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 6d4e64da01fe..e7dd10a80983 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -234,7 +234,7 @@ int igt_main()
 					continue;
 
 				/* LPSP is low power single pipe usages i.e. PIPE_A */
-				if (crtc->pipe != PIPE_A)
+				if (crtc->vendor_pipe != PIPE_A)
 					continue;
 
 				if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 1cc57ad35a1c..4d60dee8f3be 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1039,11 +1039,11 @@ static void cleanup(data_t *data)
 
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
-	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->pipe != PIPE_A)
+	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->vendor_pipe != PIPE_A)
 		return false;
 
 	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    data->crtc->pipe != PIPE_A && data->crtc->pipe != PIPE_B)
+	    data->crtc->vendor_pipe != PIPE_A && data->crtc->vendor_pipe != PIPE_B)
 		return false;
 
 	return true;
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 661ead32dc29..240279d85e36 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1173,7 +1173,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
 		uint64_t val[2];
 
 		batch[6] = MI_WAIT_FOR_EVENT;
-		switch (crtc->pipe) {
+		switch (crtc->vendor_pipe) {
 		case PIPE_A:
 			batch[6] |= MI_WAIT_FOR_PIPE_A_VBLANK;
 			batch[5] = ~(1 << 3);
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 1e062c38b668..78fda7b53246 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -240,7 +240,7 @@ static bool chv_cursor_broken(data_t *data, int x)
 	if (x >= 0)
 		return false;
 
-	return IS_CHERRYVIEW(devid) && data->crtc->pipe == PIPE_C;
+	return IS_CHERRYVIEW(devid) && data->crtc->vendor_pipe == PIPE_C;
 }
 
 static bool cursor_visible(data_t *data, int x, int y)
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 8036d43d5eef..98934076c2b5 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -123,7 +123,7 @@ static void cursor_move(data_t *data, int x, int y, int i)
 	 * fails). So let's accept a failure from the ioctl in that case.
 	 */
 	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) == 0 ||
-		   (IS_CHERRYVIEW(data->devid) && data->crtc->pipe == PIPE_C &&
+		   (IS_CHERRYVIEW(data->devid) && data->crtc->vendor_pipe == PIPE_C &&
 		    x < 0 && x > -data->curw));
 	igt_wait_for_vblank(data->crtc);
 }
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index bc78d9a6f41d..36884d817e92 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -170,7 +170,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display, igt_crtc_t *crtc,
 		 */
 		if (IS_GEN8(devid) ||
 			(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
-			(IS_GEN9(devid) && crtc->pipe == PIPE_C)) {
+			(IS_GEN9(devid) && crtc->vendor_pipe == PIPE_C)) {
 			is_plane_scaling_active = false;
 		}
 	}
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index fde8b8370c9f..90b2982d49d8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,7 +695,7 @@ static bool test_crtc_iteration(data_t *data, igt_crtc_t *crtc, int iteration)
 	    data->extended)
 		return true;
 
-	if ((crtc->pipe > PIPE_B) && (iteration >= 2))
+	if ((crtc->vendor_pipe > PIPE_B) && (iteration >= 2))
 		return false;
 
 	return true;
-- 
2.47.3


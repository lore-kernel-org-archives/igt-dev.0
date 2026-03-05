Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C5F33A68
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 14:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB6610EBC8;
	Thu,  5 Mar 2026 14:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr9f9Df+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5C710EBC8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772719740; x=1804255740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YO80ZyYcRe2Kin/s15VDnq5b7R8tWCwxB+K8CRVVSMM=;
 b=Rr9f9Df+yz1URzwChV+FQTAKWStJUpVfLcn4fm45lEoXgLtrhSnjNtoI
 ZaLDpgnuMVCSPuIvWDwLyYRoQT1NZDhJ8QZW7ri5EQBj/jh59Zn9IR94j
 3n777G8Gj2ru3bIYj+rwhs/wcYfkxC5Ybkmn8kORl7g07slgGdYLDdm7g
 2+sIv8wadZq1R+sJGsrqttiNICcRfaCy5nFiTc+SXUtO5KOhuVCf5PqSO
 glSvDn5dXRcB++Uk4ROmhgdb7cL7I28LEuMhL4e8o3qV18ARbowPPHMXg
 Um2HBB8jjoOofCyo90uNFG2LzDXV6/XsdFpyklh+4hIFDhjJxT4nzyp2h A==;
X-CSE-ConnectionGUID: d6uexUHnS02U21ynEPouAA==
X-CSE-MsgGUID: LlqSLpacQkev/K7rT0DITg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72834547"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="72834547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:08:59 -0800
X-CSE-ConnectionGUID: /KjuDootSFOgKGJuy1OSmA==
X-CSE-MsgGUID: 7PpIaAEARuGZhflORhJHMQ==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.157])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:08:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t] lib/kms: convert output->pending_pipe to
 output->pending_crtc
Date: Thu,  5 Mar 2026 16:08:51 +0200
Message-ID: <20260305140851.2318968-1-jani.nikula@intel.com>
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

We're finally ready to convert enum pipe pending_pipe to igt_crtc_t
*pending_crtc.

igt_output_refresh() gets changed to using crtc_index instead of the
pipe for crtc index mask.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 93 ++++++++++++++++++++++++++-------------------------
 lib/igt_kms.h |  2 +-
 2 files changed, 48 insertions(+), 47 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ebf77b74d04..32f959b2bead 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2600,8 +2600,8 @@ void igt_output_refresh(igt_output_t *output)
 	igt_display_t *display = output->display;
 	unsigned long crtc_idx_mask = 0;
 
-	if (output->pending_pipe != PIPE_NONE)
-		crtc_idx_mask = 1 << output->pending_pipe;
+	if (output->pending_crtc)
+		crtc_idx_mask = 1 << output->pending_crtc->crtc_index;
 
 	kmstest_free_connector_config(&output->config);
 
@@ -2620,8 +2620,8 @@ void igt_output_refresh(igt_output_t *output)
 		igt_atomic_fill_connector_props(display, output,
 			IGT_NUM_CONNECTOR_PROPS, igt_connector_prop_names);
 
-	LOG(display, "%s: Selecting pipe %s\n", output->name,
-	    kmstest_pipe_name(output->pending_pipe));
+	LOG(display, "%s: Selecting CRTC %s\n", output->name,
+	    igt_crtc_name(output->pending_crtc));
 }
 
 static int
@@ -2741,7 +2741,7 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 
 static void igt_output_reset(igt_output_t *output)
 {
-	output->pending_pipe = PIPE_NONE;
+	output->pending_crtc = NULL;
 	output->use_override_mode = false;
 	memset(&output->override_mode, 0, sizeof(output->override_mode));
 
@@ -2932,7 +2932,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 		 * We don't assign each output a pipe unless
 		 * a CRTC is set with igt_output_set_crtc().
 		 */
-		output->pending_pipe = PIPE_NONE;
+		output->pending_crtc = NULL;
 		output->id = resources->connectors[i];
 		output->display = display;
 
@@ -3438,19 +3438,20 @@ void igt_display_fini(igt_display_t *display)
 static void igt_display_refresh(igt_display_t *display)
 {
 	igt_output_t *output;
+	unsigned int crtc_index_in_use_mask = 0;
 	int i;
 
-	unsigned long pipes_in_use = 0;
-
        /* Check that two outputs aren't trying to use the same pipe */
 	for (i = 0; i < display->n_outputs; i++) {
 		output = &display->outputs[i];
 
-		if (output->pending_pipe != PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
+		if (output->pending_crtc) {
+			unsigned int crtc_index_mask = 1 << output->pending_crtc->crtc_index;
+
+			if (crtc_index_in_use_mask & crtc_index_mask)
 				goto report_dup;
 
-			pipes_in_use |= 1 << output->pending_pipe;
+			crtc_index_in_use_mask |= crtc_index_mask;
 		}
 
 		if (output->force_reprobe)
@@ -3463,35 +3464,23 @@ report_dup:
 	for (; i > 0; i--) {
 		igt_output_t *b = &display->outputs[i - 1];
 
-		igt_assert_f(output->pending_pipe !=
-			     b->pending_pipe,
-			     "%s and %s are both trying to use pipe %s\n",
+		if (!b->pending_crtc)
+			continue;
+
+		igt_assert_f(output->pending_crtc != b->pending_crtc,
+			     "%s and %s are both trying to use CRTC %s\n",
 			     igt_output_name(output), igt_output_name(b),
-			     kmstest_pipe_name(output->pending_pipe));
+			     igt_crtc_name(output->pending_crtc));
 	}
 }
 
+/*
+ * Return the pending CRTC (i.e. the CRTC that should drive this output after
+ * the commit(), or NULL if the user hasn't specified a CRTC to use.
+ */
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output)
 {
-	igt_display_t *display = output->display;
-	enum pipe pipe;
-
-	if (output->pending_pipe == PIPE_NONE) {
-		/*
-		 * The user hasn't specified a pipe to use, return none.
-		 */
-		return NULL;
-	} else {
-		/*
-		 * Otherwise, return the pending pipe (ie the pipe that should
-		 * drive this output after the commit()
-		 */
-		pipe = output->pending_pipe;
-	}
-
-	igt_assert(pipe >= 0 && pipe < igt_display_n_crtcs(display));
-
-	return igt_crtc_for_pipe(display, pipe);
+	return output->pending_crtc;
 }
 
 static igt_plane_t *igt_crtc_get_plane(igt_crtc_t *crtc, int plane_idx)
@@ -3685,10 +3674,13 @@ static igt_output_t *igt_crtc_get_output(igt_crtc_t *crtc)
 	igt_display_t *display = crtc->display;
 	int i;
 
+	if (!crtc)
+		return NULL;
+
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
 
-		if (output->pending_pipe == crtc->pipe)
+		if (output->pending_crtc == crtc)
 			return output;
 	}
 
@@ -5285,12 +5277,21 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc)
 
 	igt_assert(output->name);
 
-	if (output->pending_pipe != PIPE_NONE)
+	if (output->pending_crtc)
 		old_crtc = igt_output_get_driving_crtc(output);
 
+	/*
+	 * Ensure pending_crtc is always valid.
+	 *
+	 * FIXME: Ensure we only have valid crtc objects around in general, so
+	 * we can remove this check.
+	 */
+	if (!crtc->valid)
+		crtc = NULL;
+
 	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
 	    igt_crtc_name(crtc));
-	output->pending_pipe = crtc ? crtc->pipe : PIPE_NONE;
+	output->pending_crtc = crtc;
 
 	if (old_crtc) {
 		igt_output_t *old_output;
@@ -5368,7 +5369,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
  * igt_override_all_active_output_modes_to_fit_bw:
  * @display: a pointer to an #igt_display_t structure
  *
- * Override the mode on all active outputs (i.e. pending_pipe != PIPE_NONE)
+ * Override the mode on all active outputs (i.e. pending_crtc != NULL)
  * on basis of bandwidth.
  *
  * Returns: True if a valid connector mode combo found, else false
@@ -5381,7 +5382,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
 	for (i = 0 ; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
 
-		if (output->pending_pipe == PIPE_NONE)
+		if (!output->pending_crtc)
 			continue;
 
 		/* Sort the modes in descending order by clock freq. */
@@ -7121,7 +7122,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
  *
- * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
+ * Get all active pipes from connected outputs (i.e. pending_crtc != NULL)
  * and check those pipes supports the selected mode(s).
  *
  * Example:
@@ -7152,10 +7153,10 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 * just before calling this function.
 	 */
 	for_each_connected_output(display, output) {
-		if (output->pending_pipe == PIPE_NONE)
+		if (!output->pending_crtc)
 			continue;
 
-		pipes[pipes_in_use].idx = output->pending_pipe;
+		pipes[pipes_in_use].idx = output->pending_crtc->pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
 		pipes[pipes_in_use].output = output;
 		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
@@ -7274,7 +7275,7 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
  *
  * Every individual test must use igt_output_set_crtc() before calling this
  * helper, so that this function will get all active pipes from connected
- * outputs (i.e. pending_pipe != PIPE_NONE) and check the selected combo is
+ * outputs (i.e. pending_crtc != NULL) and check the selected combo is
  * valid or not.
  *
  * This helper is supposed to be a superset of all constraints of pipe/output
@@ -7293,13 +7294,13 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 	igt_output_t *output;
 
 	for_each_connected_output(display, output) {
-		if (output->pending_pipe == PIPE_NONE)
+		if (!output->pending_crtc)
 			continue;
 
-		if (!igt_crtc_connector_valid(igt_crtc_for_pipe(display, output->pending_pipe), output)) {
+		if (!igt_crtc_connector_valid(output->pending_crtc, output)) {
 			igt_info("Output %s is disconnected (or) pipe-%s & %s cannot be used together\n",
 				 igt_output_name(output),
-				 kmstest_pipe_name(output->pending_pipe),
+				 igt_crtc_name(output->pending_crtc),
 				 igt_output_name(output));
 			return false;
 		}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e91c6567757e..7fcdd4b05e71 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -507,7 +507,7 @@ typedef struct {
 	struct kmstest_connector_config config;
 	char *name;
 	bool force_reprobe;
-	enum pipe pending_pipe;
+	igt_crtc_t *pending_crtc;
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
 
-- 
2.47.3


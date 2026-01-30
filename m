Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80630D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2835F10E9BD;
	Fri, 30 Jan 2026 10:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5I9LQz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5EF10E9BB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770384; x=1801306384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i6APW7UgZFr88uqozf7veUVFb/QAfcx/YrHUWstwYgY=;
 b=j5I9LQz1t8qBkFYjBsFFRuNPpDyZMgh6lyGAu0X0jU0IYJGm334fS27Z
 HOwAPDsi0zM6o0IU2U/ak1LAfFSzTnYAR9U5GXdzk719K8cVVxyc27ES/
 hnsORoTYGxUaP9iksje1OcxAwitfOHRjds0ai4cZyAdMqhyjQJxbjxqWH
 wr6c34/FPoVhBy9LSelr+ciiM3PNmSsOi3DyTgMOsaJBXfltuWCZkNlRW
 7dsyBNl11zByI8nNdOxgTAKSkR7K/cbl7+uI+IWdokUQNMtklW2uZzfdk
 1MKlk+qVJyg517HregP6szeodI9p9Frib2OVe3snBo4IiIebJ296OLoDS A==;
X-CSE-ConnectionGUID: ApLklcyKTKCb5DbH7CJCUA==
X-CSE-MsgGUID: OqEYCfz0Rrmtg6mvANvN4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593159"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:03 -0800
X-CSE-ConnectionGUID: G8scGTz8Tw2Ct82yQ0GhVQ==
X-CSE-MsgGUID: eBVevyrWQ6q7EJtqRrrlaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354767"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/15] tests/intel/kms_pm_dc: Use for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:27 +0200
Message-ID: <20260130105237.14481-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

Convert tests/intel/kms_pm_dc to use the new crtc based iterators
(over the old pipe based ones).

Another case that proved too complex for coccinelle, so the conversion
was done manually.

test_deep_pkgc_state() is sligtly tricky since it uses the last
iterator value after the loop. But the 'edp_found' check should
make sure the crtc is valid there as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_pm_dc.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4babf1341e0b..83dbac296335 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -123,20 +123,19 @@ static void set_output_on_pipe_b(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
 		/* DC5 with PIPE_B transaction */
-		if (pipe != PIPE_B)
+		if (crtc->pipe != PIPE_B)
 			continue;
 
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -151,18 +150,18 @@ static void setup_output(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	bool is_low_power;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		drmModeConnectorPtr c = output->config.connector;
 
 		if (disp_ver >= 13) {
 			if (disp_ver == 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
-				is_low_power = (pipe == PIPE_A);
+				is_low_power = (crtc->pipe == PIPE_A);
 			else
-				is_low_power = (pipe == PIPE_A || pipe == PIPE_B);
+				is_low_power = (crtc->pipe == PIPE_A || crtc->pipe == PIPE_B);
 		} else {
-			is_low_power = (pipe == PIPE_A);
+			is_low_power = (crtc->pipe == PIPE_A);
 		}
 
 		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the DC5 transaction.\n");
@@ -170,8 +169,7 @@ static void setup_output(data_t *data)
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 		data->output = output;
 		data->mode = igt_output_get_mode(output);
 
@@ -644,7 +642,7 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t start = time(NULL);
 	time_t duration = (4 * SEC);
 	time_t delay;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	bool pkgc_flag = false;
 	bool flip = true, edp_found = false;
 
@@ -652,7 +650,7 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
 
 			edp_found = true;
@@ -663,14 +661,12 @@ static void test_deep_pkgc_state(data_t *data)
 				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
 				 * when KMD allows for such capability.
 				 */
-				igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
-							    IGT_CRTC_VRR_ENABLED,
-							    false);
+				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
 				igt_assert(igt_display_try_commit_atomic(display,
 									 DRM_MODE_ATOMIC_ALLOW_MODESET,
 									 NULL) == 0);
 			}
-		break;
+			break;
 		}
 	}
 
@@ -681,7 +677,7 @@ static void test_deep_pkgc_state(data_t *data)
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, crtc);
 	for_each_connector_mode(output) {
 		data->mode = &output->config.connector->modes[j__];
 		delay = (MSEC / (data->mode->vrefresh));
@@ -700,7 +696,7 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
 	/* Wait for the vblank to sync the frame time */
-	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
+	igt_wait_for_vblank_count(crtc, 1);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
 	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
 	usleep(delay * 0.5);
-- 
2.52.0


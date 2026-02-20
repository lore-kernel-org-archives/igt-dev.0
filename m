Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0FC55ABF
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8510E7F7;
	Fri, 20 Feb 2026 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ufh7xGPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059910E7DD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596200; x=1803132200;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bZPz+KniMK6ZiYdtvxBlIing8xohyOSBpt9PVaMywzw=;
 b=Ufh7xGPzwJkVKBALBLHxw2ek/5OGFZxPZaHY+8AAu9RSy+pyNYm0XWF4
 L78JWtijPyjEphWwT47FSbw+S43K6z7CRNoWxU7aD+omHVX6RrlMDyArO
 2jFwZF52R+orrDmLQZZAl3WsrY0rNu8lN05aSSnlHv3N16/qivbLrPrpK
 Z5H7pmcjXBtkNPHXKPdLvtGAHfq/aSuVMC5/E0xezvjH0P48OSdDSWQjk
 KT6UQ4+5zjTuiOk+f218SMr7ZJDTvZrapaS03/3ywJBu8dz/9Na334PXb
 hRn9Sy1fKA3WGODTnqyjaYxugwXZbyCyT1q8OsD4rrZ6npTD+f08v4vpo g==;
X-CSE-ConnectionGUID: rx6oaAGeSIGZi19uU2OMzw==
X-CSE-MsgGUID: J77TeU1LT4WjZANHhSAVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60261844"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60261844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:15 -0800
X-CSE-ConnectionGUID: 5F0y/ouzTRq5hTC0KRB0FA==
X-CSE-MsgGUID: MbdEjpCzQbSupQeSJx6FrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213416352"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 18/21] tests/kms: Use igt_crtc_t instead of enum pipe,
 part 1
Date: Fri, 20 Feb 2026 16:01:50 +0200
Message-ID: <20260220140154.4138-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Convert several kms tests to use igt_crtc_t instead
of enum pipe. These specific tests already track the
crtc alongside the pipe in their data structure. Remove
the redundant pipe infromation and just rely on the crtc.

 #include "scripts/iterators.cocci"

@@
igt_display_t DISPLAY;
expression _PIPE;
@@
- &DISPLAY.crtcs[_PIPE]
+ igt_crtc_for_pipe(&DISPLAY, _PIPE)

@@
igt_display_t *DISPLAY;
expression _PIPE;
@@
- &DISPLAY->crtcs[_PIPE]
+ igt_crtc_for_pipe(DISPLAY, _PIPE)

@find_data@
typedef igt_crtc_t;
typedef igt_display_t;
identifier DISPLAY, PIPE, CRTC;
type T;
@@
(
T {
  ...
  igt_display_t DISPLAY;
  ...
  igt_crtc_t *CRTC;
  ...
- enum pipe PIPE;
  ...
};
|
T {
  ...
- enum pipe PIPE;
  ...
  igt_display_t DISPLAY;
  ...
  igt_crtc_t *CRTC;
  ...
};
|
T {
  ...
- enum pipe PIPE;
  ...
  igt_crtc_t *CRTC;
  ...
  igt_display_t DISPLAY;
  ...
};
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression _PIPE;
@@
(
- S.PIPE = _PIPE;
+ S.CRTC = igt_crtc_for_pipe(&S.DISPLAY, _PIPE);
|
- P->PIPE = _PIPE;
+ P->CRTC = igt_crtc_for_pipe(&P->DISPLAY, _PIPE);
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression E;
@@
(
- S.PIPE = E
+ S.CRTC = igt_crtc_for_pipe(&S.DISPLAY, E)
|
- P->PIPE = E
+ P->CRTC = igt_crtc_for_pipe(&P->DISPLAY, E)
|
- igt_crtc_for_pipe(..., S.PIPE)
+ S.CRTC
|
- igt_crtc_for_pipe(..., P->PIPE)
+ P->CRTC
|
- kmstest_pipe_name(S.PIPE)
+ igt_crtc_name(S.CRTC)
|
- kmstest_pipe_name(P->PIPE)
+ igt_crtc_name(P->CRTC)
)

@depends on find_data@
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
@@
(
- S.CRTC = S.CRTC;
|
- P->CRTC = P->CRTC;
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
@@
(
- S.PIPE
+ S.CRTC->pipe
|
- P->PIPE
+ P->CRTC->pipe
)

@depends on find_data@
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
binary operator OP = { ==, != };
@@
(
- S.CRTC->pipe OP PIPE_NONE
+ S.CRTC OP NULL
|
- P->CRTC->pipe OP PIPE_NONE
+ P->CRTC OP NULL
)

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
 tests/amdgpu/amd_abm.c             | 28 ++++++++++++++++------------
 tests/amdgpu/amd_bypass.c          |  7 +++----
 tests/amdgpu/amd_color.c           |  7 +++----
 tests/amdgpu/amd_cursor_overlay.c  | 14 +++++---------
 tests/amdgpu/amd_ilr.c             |  8 ++------
 tests/amdgpu/amd_link_settings.c   |  8 ++------
 tests/amdgpu/amd_mall.c            |  4 +---
 tests/amdgpu/amd_max_bpc.c         |  6 ++----
 tests/amdgpu/amd_mem_leak.c        |  4 +---
 tests/amdgpu/amd_odm.c             |  4 +---
 tests/amdgpu/amd_psr.c             | 23 +++++++++--------------
 tests/amdgpu/amd_replay.c          |  7 +++----
 tests/intel/kms_sharpness_filter.c | 25 +++++++++++++------------
 tests/kms_hdr.c                    |  4 +---
 tests/kms_plane_cursor.c           | 12 ++++--------
 tools/amd_hdmi_compliance.c        |  4 +---
 16 files changed, 67 insertions(+), 98 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 159f6c7c69e9..ffa73bb46865 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -45,7 +45,6 @@ typedef struct data {
 	igt_crtc_t *crtc;
 	int drm_fd;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int w, h;
 	igt_fb_t ref_fb;
 	igt_fb_t ref_fb2;
@@ -130,12 +129,12 @@ static void test_init(data_t *data)
 		igt_skip("No eDP connector found\n");
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	data->output = igt_get_single_output_for_pipe(display,
+						      data->crtc->pipe);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
@@ -172,7 +171,8 @@ static void test_fini(data_t *data)
 	igt_output_t *output;
 
 	/* Disable ABM before exit test */
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		set_abm_level(data, output, 0);
@@ -251,7 +251,6 @@ static int backlight_write_brightness(int value)
 
 static void set_abm_level(data_t *data, igt_output_t *output, int level)
 {
-	igt_display_t *display = &data->display;
 	char buf[PATH_MAX];
 	int fd;
 
@@ -268,7 +267,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 	igt_assert_eq(close(fd), 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_plane_set_fb(data->primary, &data->ref_fb);
 	igt_display_commit_atomic(&data->display, 0, 0);
 }
@@ -328,7 +327,8 @@ static void backlight_dpms_cycle(data_t *data)
 	int pwm_1, pwm_2;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -359,7 +359,8 @@ static void backlight_monotonic_basic(data_t *data)
 	int brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -392,7 +393,8 @@ static void backlight_monotonic_abm(data_t *data)
 	int brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 		ret = backlight_read_max_brightness(&max_brightness);
@@ -424,7 +426,8 @@ static void abm_enabled(data_t *data)
 	int pwm, prev_pwm, pwm_without_abm;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -457,7 +460,8 @@ static void abm_gradual(data_t *data)
 	int max_brightness;
 	igt_output_t *output;
 
-	for_each_valid_output_on_pipe(&data->display, data->pipe_id, output) {
+	for_each_valid_output_on_pipe(&data->display, data->crtc->pipe,
+				      output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 3a2bab9dcef0..6ff36ce09d3e 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -31,7 +31,6 @@ typedef struct {
 	int drm_fd;
 	int width;
 	int height;
-	enum pipe pipe_id;
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
@@ -64,12 +63,12 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	data->output = igt_get_single_output_for_pipe(display,
+						      data->crtc->pipe);
 	igt_assert(data->output);
 
 	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index ea928b326c8a..dc2a10817105 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -45,7 +45,6 @@ typedef struct data {
 	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int w;
 	int h;
@@ -179,12 +178,12 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	data->output = igt_get_single_output_for_pipe(display,
+						      data->crtc->pipe);
 	igt_require(data->output);
 
 	data->mode = igt_output_get_mode(data->output);
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 6245045d160a..8d3ef31c936f 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -77,7 +77,6 @@ typedef struct data {
 	igt_fb_t quarter_fb;
 	igt_fb_t scale_fb;
 	igt_fb_t cfb;
-	enum pipe pipe_id;
 	int drm_fd;
 	int available_overlay_planes;
 	uint64_t max_curw;
@@ -138,9 +137,8 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	int i;
 
-	data->pipe_id = crtc->pipe;
+	data->crtc = crtc;
 	data->available_overlay_planes = available_overlay_planes;
-	data->crtc = &data->display.crtcs[data->pipe_id];
 	data->output = output;
 	data->mode = igt_output_get_mode(data->output);
 	data->primary = igt_crtc_get_plane_type(data->crtc,
@@ -160,10 +158,10 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 									  i);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
+		 igt_crtc_name(data->crtc), igt_output_name(data->output));
 
 	igt_require_pipe_crc(data->drm_fd);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe_id),
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 }
 
@@ -202,7 +200,6 @@ static void test_cleanup(data_t *data)
 
 static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
-	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
 	igt_fb_t *rgb_fb = &data->rgb_fb;
@@ -298,7 +295,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	 * synchronized to the same frame on AMD hw.
 	 */
 	if(is_amdgpu_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe_id),
+		igt_wait_for_vblank_count(data->crtc,
 					  1);
 
 	/* Record the new CRC. */
@@ -346,7 +343,6 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 
 static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int scaling_factor)
 {
-	igt_display_t *display = &data->display;
 	int sw, sh;
 
 	igt_skip_on(size > data->max_curw || size > data->max_curh);
@@ -395,7 +391,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int
 	}
 
 	igt_output_set_crtc(data->output,
-		igt_crtc_for_pipe(display, data->pipe_id));
+		data->crtc);
 
 	/* Run the test for different cursor spots. */
 	test_cursor_spots(data, size, flags);
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 761ae20121a2..d6f96cc33804 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -44,7 +44,6 @@ typedef struct {
 	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc_dprx;
-	enum pipe pipe_id;
 	int connector_type;
 	int supported_ilr[MAX_SUPPORTED_ILR];
 	int lane_count[4], link_rate[4], link_spread_spectrum[4];
@@ -81,7 +80,6 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
@@ -90,16 +88,14 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	for_each_crtc(&data->display, crtc) {
 		if (igt_pipe_connector_valid(crtc->pipe, output)) {
-			data->pipe_id = crtc->pipe;
+			data->crtc = crtc;
 			break;
 		}
 	}
 
 	data->connector_type = output->config.connector->connector_type;
 
-	igt_require(data->pipe_id != PIPE_NONE);
-
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	igt_require(data->crtc != NULL);
 
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 48cb5643baa0..eaeddfb1599b 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -31,7 +31,6 @@ typedef struct
         igt_output_t *output;
         igt_fb_t fb;
 	igt_crtc_t *crtc;
-        enum pipe pipe_id;
 	int connector_type;
 	int w, h;
 	int supported_ilr[MAX_SUPPORTED_ILR];
@@ -83,7 +82,6 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
@@ -92,16 +90,14 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	for_each_crtc(&data->display, crtc) {
 		if (igt_pipe_connector_valid(crtc->pipe, output)) {
-			data->pipe_id = crtc->pipe;
+			data->crtc = crtc;
 			break;
 		}
 	}
 
 	data->connector_type = output->config.connector->connector_type;
 
-	igt_require(data->pipe_id != PIPE_NONE);
-
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	igt_require(data->crtc != NULL);
 
 	igt_output_set_crtc(output,
 			    data->crtc);
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index a8ca107578a7..b83e3b864ee4 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -42,7 +42,6 @@ typedef struct data {
 	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int w;
 	int h;
@@ -61,8 +60,7 @@ static void test_init(data_t *data)
 	bool mall_en = false;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 0c30ffbc721d..cf4de724c12c 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -34,7 +34,6 @@ typedef struct data {
 	igt_pipe_crc_t *pipe_crc;
 	igt_pipe_crc_t *pipe_crc_dither;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int w;
 	int h;
@@ -55,8 +54,7 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
@@ -76,7 +74,7 @@ static void test_init(data_t *data)
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
-	igt_assert_output_bpc_equal(data->fd, data->pipe_id,
+	igt_assert_output_bpc_equal(data->fd, data->crtc->pipe,
 				    data->output->name, 8);
 
 	data->primary =
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index ddf7c6d90b25..9e8e61aa7847 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -35,7 +35,6 @@ typedef struct data {
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int w;
 	int h;
@@ -47,8 +46,7 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index d9e48da1fa98..85873880e7a5 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -25,7 +25,6 @@ struct data {
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	drmModeModeInfoPtr mode;
-	enum pipe pipe_id;
 	int fd;
 };
 
@@ -48,8 +47,7 @@ static void test_init(struct data *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 8a9d773fff01..548e21810fb9 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -62,7 +62,6 @@ typedef struct data {
 	igt_fb_t pm_fb[2];
 	igt_fb_t cs_fb;		/* cursor framebuffer */
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int debugfs_fd;
 	int w, h;
@@ -171,12 +170,12 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	data->output = igt_get_single_output_for_pipe(display,
+						      data->crtc->pipe);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
@@ -341,7 +340,6 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 
 static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio)
 {
-	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	igt_fb_t ref_fb;	/* reference fb */
 	igt_fb_t *flip_fb;
@@ -374,7 +372,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -414,7 +412,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 	draw_color_alpha(&data->ov_fb[1], 0, 0, pm_w_scale, pm_h_scale, .5, .5, .5, .0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* multiplane overlay to emulate video playback use case */
@@ -433,7 +431,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			igt_plane_set_size(data->primary, pm_w_scale, pm_h_scale);
 		}
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(display, data->pipe_id));
+				    data->crtc);
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -470,7 +468,6 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 
 static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rect_h, int curr_x, int curr_y)
 {
-	igt_display_t *display = &data->display;
 	int ret;
 
 	/* set new position for primary plane */
@@ -493,7 +490,7 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 		igt_plane_set_fb(data->primary, rect_fb);
 		igt_plane_set_size(data->primary, rect_w, rect_h);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(display, data->pipe_id));
+				    data->crtc);
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -503,7 +500,6 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 
 static void run_check_psr_su_ffu(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	igt_fb_t ref_fb;	/* reference fb */
 
@@ -521,7 +517,7 @@ static void run_check_psr_su_ffu(data_t *data)
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -619,7 +615,6 @@ static void test_cursor_movement(data_t *data, int iters, int cs_size, enum curs
 
 static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 {
-	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	const int cs_size = 128;
 	const int delay_sec = 5; /* seconds */
@@ -660,7 +655,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	igt_plane_set_position(data->cursor, 0, 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 079916042ab3..010b3a97e775 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -26,7 +26,6 @@ struct test_data {
 	igt_fb_t ref_fb;
 	igt_fb_t ref_fb2;
 	igt_fb_t *flip_fb;
-	enum pipe pipe_id;
 	int fd;
 	int debugfs_fd;
 	int w, h;
@@ -61,12 +60,12 @@ static void test_init(struct test_data *data)
 	igt_display_t *display = &data->display;
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	data->output = igt_get_single_output_for_pipe(display,
+						      data->crtc->pipe);
 	igt_require(data->output);
 	igt_info("output %s\n", data->output->name);
 
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index eddfad6b99c4..ba325b3773d3 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -155,7 +155,6 @@ static const uint32_t scaling_modes[] = {
 typedef struct {
 	int drm_fd;
 	bool limited;
-	enum pipe pipe_id;
 	struct igt_fb fb[4];
 	igt_crtc_t *crtc;
 	igt_display_t display;
@@ -173,8 +172,7 @@ typedef struct {
 
 static void set_filter_strength_on_pipe(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
+	igt_crtc_set_prop_value(data->crtc,
 				    IGT_CRTC_SHARPNESS_STRENGTH,
 				    data->filter_strength);
 }
@@ -331,7 +329,6 @@ static int test_filter_toggle(data_t *data)
 
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	int height = mode->hdisplay;
@@ -343,7 +340,8 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	data->plane[0] = igt_crtc_get_plane_type(data->crtc,
 						 DRM_PLANE_TYPE_PRIMARY);
 	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
-		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+		      "No requested format/modifier on pipe %s\n",
+		      igt_crtc_name(data->crtc));
 
 	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
@@ -352,7 +350,8 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		if (igt_plane_has_rotation(data->plane[0], data->rotation))
 			igt_plane_set_rotation(data->plane[0], data->rotation);
 		else
-			igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+			igt_skip("No requested rotation on pipe %s\n",
+				 igt_crtc_name(data->crtc));
 	}
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
@@ -372,7 +371,7 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe_id),
+		pipe_crc = igt_crtc_crc_new(data->crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 	}
@@ -438,13 +437,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			igt_display_reset(display);
 
 			data->output = output;
-			data->pipe_id = crtc->pipe;
-			data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+			data->crtc = crtc;
 			data->mode = igt_output_get_mode(data->output);
 
 			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
-				kmstest_pipe_name(data->pipe_id));
+				igt_crtc_name(data->crtc));
 				continue;
 			}
 
@@ -473,7 +471,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 					igt_output_override_mode(data->output, data->mode);
 
 					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data->pipe_id),
+					igt_dynamic_f("pipe-%s-%s%s",
+						       igt_crtc_name(data->crtc),
 						       data->output->name, name)
 						test_sharpness_filter(data, type);
 				}
@@ -531,7 +530,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				igt_assert(0);
 			}
 
-			igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
+			igt_dynamic_f("pipe-%s-%s%s",
+				        igt_crtc_name(data->crtc),
+				      data->output->name, name)
 				test_sharpness_filter(data, type);
 
 			if (data->limited)
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f97861798085..0addd72a0472 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -114,7 +114,6 @@ typedef struct data {
 	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
-	enum pipe pipe_id;
 	int fd;
 	int w;
 	int h;
@@ -208,8 +207,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
-	data->pipe_id = crtc->pipe;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = crtc;
 	igt_assert(data->crtc);
 
 	igt_display_reset(display);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index d54b01af0e42..bf0f89844595 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -82,7 +82,6 @@ typedef struct data {
 	igt_fb_t pfb;
 	igt_fb_t ofb;
 	igt_fb_t cfb;
-	enum pipe pipe_id;
 	int drm_fd;
 	rect_t rect;
 	uint64_t max_curw;
@@ -95,8 +94,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 {
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
-	data->pipe_id = crtc->pipe;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = crtc;
 	data->output = output;
 
 	data->mode = igt_output_get_mode(data->output);
@@ -110,7 +108,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 					       DRM_PLANE_TYPE_CURSOR);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
+		 igt_crtc_name(data->crtc), igt_output_name(data->output));
 
 	igt_require_pipe_crc(data->drm_fd);
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
@@ -146,7 +144,6 @@ static void test_fini(data_t *data)
  */
 static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
-	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
 	igt_fb_t *ref_fb = &data->ref_fb;
@@ -194,7 +191,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	/* Wait for one more vblank since cursor updates are not
 	 * synchronized to the same frame on AMD hw */
 	if(is_amdgpu_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe_id),
+		igt_wait_for_vblank_count(data->crtc,
 					  1);
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
@@ -254,7 +251,6 @@ static void test_cleanup(data_t *data)
 
 static void test_cursor(data_t *data, int size, unsigned int flags)
 {
-	igt_display_t *display = &data->display;
 	int sw, sh;
 	int pad = 128;
 
@@ -284,7 +280,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 
 	igt_plane_set_fb(data->primary, &data->pfb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, data->pipe_id));
+			    data->crtc);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	test_cursor_spots(data, size, flags);
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index ccdfaa410e38..94025547f01c 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -34,7 +34,6 @@ typedef struct data {
 	igt_plane_t *primary;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
-	enum pipe pipe_id;
 	bool use_virtual_connector;
 	int timeout_seconds;
 } data_t;
@@ -384,8 +383,7 @@ static void test_init(data_t *data, int conn_id)
 {
 	igt_display_t *display = &data->display;
 
-	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 
 	igt_display_reset(display);
 
-- 
2.52.0


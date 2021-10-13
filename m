Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6ED6EA63
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 13:00:01 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:45 +0300
Message-Id: <20211013125949.19373-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/kms: Have igt_std_1024_mode_get()
 return a copy of the mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We want to provide override modes with different refresh rates.
Start by making igt_std_1024_mode_get() return a copy rather
than a pointer to the static const mode directly. And sprinkle
the necessary free() calls, and some igt_memdups() into parallel
codepaths, so we are consistnetly allocating and freeing everything.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                         |  4 +--
 lib/igt_kms.h                         |  2 +-
 tests/i915/kms_frontbuffer_tracking.c | 44 +++++++++++++--------------
 tests/kms_concurrent.c                | 25 ++++++---------
 4 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6b0639f628b9..f833785b89eb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2478,7 +2478,7 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 	return found;
 }
 
-const drmModeModeInfo *igt_std_1024_mode_get(void)
+drmModeModeInfo *igt_std_1024_mode_get(void)
 {
 	static const drmModeModeInfo std_1024_mode = {
 		.clock = 65000,
@@ -2498,7 +2498,7 @@ const drmModeModeInfo *igt_std_1024_mode_get(void)
 		.name = "Custom 1024x768",
 	};
 
-	return &std_1024_mode;
+	return igt_memdup(&std_1024_mode, sizeof(std_1024_mode));
 }
 
 /*
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b6cbf937166f..50b81f015e3b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -470,7 +470,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
 void igt_output_refresh(igt_output_t *output);
-const drmModeModeInfo *igt_std_1024_mode_get(void);
+drmModeModeInfo *igt_std_1024_mode_get(void);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index d8f08c147861..007bbdeb2b1b 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -306,51 +306,49 @@ struct {
 	.stop = true,
 };
 
-static const drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
+static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 {
 	drmModeConnector *c = output->config.connector;
 	const drmModeModeInfo *smallest = NULL;
 	int i;
 
+	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		return igt_std_1024_mode_get();
+
 	for (i = 0; i < c->count_modes; i++) {
-		drmModeModeInfo *mode = &c->modes[i];
+		const drmModeModeInfo *mode = &c->modes[i];
 
-		if (!smallest)
-			smallest = mode;
-
-		if (mode->hdisplay * mode->vdisplay <
+		if (!smallest ||
+		    mode->hdisplay * mode->vdisplay <
 		    smallest->hdisplay * smallest->vdisplay)
 			smallest = mode;
 	}
 
-	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-		smallest = igt_std_1024_mode_get();
-
-	return smallest;
+	if (smallest)
+		return igt_memdup(smallest, sizeof(*smallest));
+	else
+		return igt_std_1024_mode_get();
 }
 
-static const drmModeModeInfo *connector_get_mode(igt_output_t *output)
+static drmModeModeInfo *connector_get_mode(igt_output_t *output)
 {
-	const drmModeModeInfo *mode = NULL;
-
-	if (opt.small_modes)
-		mode = get_connector_smallest_mode(output);
-	else
-		mode = &output->config.default_mode;
-
-	 /* On HSW the CRC WA is so awful that it makes you think everything is
+	/* On HSW the CRC WA is so awful that it makes you think everything is
 	  * bugged. */
 	if (IS_HASWELL(intel_get_drm_devid(drm.fd)) &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-		mode = igt_std_1024_mode_get();
+		return igt_std_1024_mode_get();
 
-	return mode;
+	if (opt.small_modes)
+		return get_connector_smallest_mode(output);
+	else
+		return igt_memdup(&output->config.default_mode,
+				  sizeof(output->config.default_mode));
 }
 
 static void init_mode_params(struct modeset_params *params,
 			     igt_output_t *output, enum pipe pipe)
 {
-	const drmModeModeInfo *mode;
+	drmModeModeInfo *mode;
 
 	igt_output_override_mode(output, NULL);
 	mode = connector_get_mode(output);
@@ -380,6 +378,8 @@ static void init_mode_params(struct modeset_params *params,
 	params->sprite.y = 0;
 	params->sprite.w = 64;
 	params->sprite.h = 64;
+
+	free(mode);
 }
 
 static bool find_connector(bool edp_only, bool pipe_a,
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index dece615a0183..82ef0adc5e32 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -223,44 +223,38 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 	}
 }
 
-static const drmModeModeInfo *
+static drmModeModeInfo *
 get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 		igt_output_t *output)
 {
-	const drmModeModeInfo *mode = igt_std_1024_mode_get();
 	drmModeConnector *connector = output->config.connector;
 	int limit = mode_default->vdisplay - SIZE_PLANE;
-	bool found;
 
 	if (!connector)
-		return mode;
+		return igt_std_1024_mode_get();
 
-	found = false;
 	for (int i = 0; i < connector->count_modes; i++) {
-		mode = &connector->modes[i];
+		const drmModeModeInfo *mode = &connector->modes[i];
 
-		if (mode->vdisplay < limit) {
-			found = true;
-			break;
-		}
+		if (mode->vdisplay < limit)
+			return igt_memdup(mode, sizeof(*mode));
 	}
 
-	if (!found)
-		mode = igt_std_1024_mode_get();
-
-	return mode;
+	return igt_std_1024_mode_get();
 }
 
 static void
 test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
 {
-	const drmModeModeInfo *mode_hi, *mode_lo;
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int i;
 
 	i = 0;
 	while (i < iterations || loop_forever) {
+		const drmModeModeInfo *mode_hi;
+		drmModeModeInfo *mode_lo;
+
 		igt_output_set_pipe(output, pipe);
 
 		mode_hi = igt_output_get_mode(output);
@@ -268,6 +262,7 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
+		free(mode_lo);
 		if (is_amdgpu_device(data->drm_fd))
 			igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.32.0

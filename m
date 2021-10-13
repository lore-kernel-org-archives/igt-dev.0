Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6E6EA64
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 13:00:04 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:46 +0300
Message-Id: <20211013125949.19373-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/kms: Have igt_std_1024_mode_get()
 return a mode with specific refresh
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

Pass the desired refresh rate to igt_std_1024_mode_get(), and have it
return a mode that will have said refresh rate.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                         | 8 ++++----
 lib/igt_kms.h                         | 2 +-
 tests/i915/kms_frontbuffer_tracking.c | 6 +++---
 tests/kms_concurrent.c                | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f833785b89eb..b6669257f08c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2478,10 +2478,10 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
 	return found;
 }
 
-drmModeModeInfo *igt_std_1024_mode_get(void)
+drmModeModeInfo *igt_std_1024_mode_get(int vrefresh)
 {
-	static const drmModeModeInfo std_1024_mode = {
-		.clock = 65000,
+	const drmModeModeInfo std_1024_mode = {
+		.clock = 65000 * vrefresh / 60,
 		.hdisplay = 1024,
 		.hsync_start = 1048,
 		.hsync_end = 1184,
@@ -2492,7 +2492,7 @@ drmModeModeInfo *igt_std_1024_mode_get(void)
 		.vsync_end = 777,
 		.vtotal = 806,
 		.vscan = 0,
-		.vrefresh = 60,
+		.vrefresh = vrefresh,
 		.flags = 0xA,
 		.type = 0x40,
 		.name = "Custom 1024x768",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 50b81f015e3b..7e3e67efea7a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -470,7 +470,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
 void igt_output_refresh(igt_output_t *output);
-drmModeModeInfo *igt_std_1024_mode_get(void);
+drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 007bbdeb2b1b..2a1ed5f52e37 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -313,7 +313,7 @@ static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 	int i;
 
 	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get();
+		return igt_std_1024_mode_get(60);
 
 	for (i = 0; i < c->count_modes; i++) {
 		const drmModeModeInfo *mode = &c->modes[i];
@@ -327,7 +327,7 @@ static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 	if (smallest)
 		return igt_memdup(smallest, sizeof(*smallest));
 	else
-		return igt_std_1024_mode_get();
+		return igt_std_1024_mode_get(60);
 }
 
 static drmModeModeInfo *connector_get_mode(igt_output_t *output)
@@ -336,7 +336,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
 	  * bugged. */
 	if (IS_HASWELL(intel_get_drm_devid(drm.fd)) &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get();
+		return igt_std_1024_mode_get(60);
 
 	if (opt.small_modes)
 		return get_connector_smallest_mode(output);
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 82ef0adc5e32..085eaa0a630d 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -231,7 +231,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 	int limit = mode_default->vdisplay - SIZE_PLANE;
 
 	if (!connector)
-		return igt_std_1024_mode_get();
+		return igt_std_1024_mode_get(60);
 
 	for (int i = 0; i < connector->count_modes; i++) {
 		const drmModeModeInfo *mode = &connector->modes[i];
@@ -240,7 +240,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 			return igt_memdup(mode, sizeof(*mode));
 	}
 
-	return igt_std_1024_mode_get();
+	return igt_std_1024_mode_get(60);
 }
 
 static void
-- 
2.32.0

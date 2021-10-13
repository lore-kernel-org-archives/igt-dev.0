Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209FD6EA6C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 13:00:45 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:48 +0300
Message-Id: <20211013125949.19373-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] tests/i915/kms_frontbuffer_tracking:
 Use preferred modes's vrefresh
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

i915 will reject custom modes that don't match the laptop
panel's fixed mode refresh rate. Thus we must generate
our override modes with a matching refresh rate.

https://gitlab.freedesktop.org/drm/intel/-/issues/4283
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 2a1ed5f52e37..d6a884926c48 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -313,7 +313,7 @@ static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 	int i;
 
 	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get(60);
+		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 
 	for (i = 0; i < c->count_modes; i++) {
 		const drmModeModeInfo *mode = &c->modes[i];
@@ -336,7 +336,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
 	  * bugged. */
 	if (IS_HASWELL(intel_get_drm_devid(drm.fd)) &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get(60);
+		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 
 	if (opt.small_modes)
 		return get_connector_smallest_mode(output);
-- 
2.32.0

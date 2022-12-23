Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100D610E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 00:41:54 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Dec 2022 23:41:24 -0100
Message-Id: <20221223004124.36792-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: disable degamma/gamma by
 default for CTM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.vetter@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The DRM color mgmt doc states "Each of the properties are optional" so
CTM test should not depend on degamma/gamma properties to run. Also,
setting each property individually is the way that atomic degamma/gamma
tests work. However, from previous discussions around 64d0ff72 [1], i915
seems to need degamma/gamma settings around the CTM property (except for
the max CTM cases). Therefore, remove dependency on degamma/gamma
support from CTM tests and only set them for i915 (keeping the skip for
max CTM cases).

[1] https://patchwork.freedesktop.org/patch/296122/?series=58412&rev=9

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_color.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d016cefb..e0c6a8bf 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -493,12 +493,15 @@ static bool test_pipe_ctm(data_t *data,
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
 
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+
 	/*
-	 * Don't program LUT's for max CTM cases, as limitation of
+	 * Only program LUT's for i915, but not for max CTM as limitation of
 	 * representing intermediate values between 0 and 1.0 causes
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
-	if (memcmp(before, after, sizeof(color_t))) {
+	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(color_t))) {
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
@@ -507,10 +510,6 @@ static bool test_pipe_ctm(data_t *data,
 
 		set_degamma(data, primary->pipe, degamma_linear);
 		set_gamma(data, primary->pipe, gamma_linear);
-	} else {
-		/* Disable Degamma and Gamma for ctm max test */
-		disable_degamma(primary->pipe);
-		disable_gamma(primary->pipe);
 	}
 
 	disable_ctm(primary->pipe);
-- 
2.35.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EC76EE22
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:35:28 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 16 Sep 2021 18:35:12 +0300
Message-Id: <20210916153515.21369-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_invalid_mode: Move bigjoiner
 handling into the proper place
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

Since we're adding other subtests we don't want to muck around
with the dotclock unconditionally in the main test code. Move
the handling into the subtest specific adjust function.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_invalid_mode.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tests/i915/kms_invalid_mode.c b/tests/i915/kms_invalid_mode.c
index 8b24993e40a3..a1899bd52214 100644
--- a/tests/i915/kms_invalid_mode.c
+++ b/tests/i915/kms_invalid_mode.c
@@ -69,7 +69,9 @@ can_bigjoiner(data_t *data)
 static bool
 adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 {
-	igt_require(data->max_dotclock != 0);
+	int max_dotclock = data->max_dotclock;
+
+	igt_require(max_dotclock != 0);
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
@@ -82,7 +84,18 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 	if (has_scaling_mode_prop(data))
 		return false;
 
-	mode->clock = data->max_dotclock + 1;
+	/*
+	 * Newer platforms can support modes higher than the maximum dot clock
+	 * by using pipe joiner, so set the mode clock twice that of maximum
+	 * dot clock;
+	 */
+	if (can_bigjoiner(data)) {
+		igt_info("Platform supports bigjoiner with %s\n",
+			 data->output->name);
+		max_dotclock *= 2;
+	}
+
+	mode->clock = max_dotclock + 1;
 
 	return true;
 }
@@ -103,17 +116,6 @@ test_output(data_t *data)
 	if (!data->adjust_mode(data, &mode))
 		return 0;
 
-	/*
-	 * Newer platforms can support modes higher than the maximum dot clock
-	 * by using pipe joiner, so set the mode clock twice that of maximum
-	 * dot clock;
-	 */
-	if (can_bigjoiner(data)) {
-		igt_info("Platform supports bigjoiner with %s\n",
-			  output->name);
-		mode.clock *= 2;
-	}
-
 	igt_create_fb(data->drm_fd,
 		      mode.hdisplay, mode.vdisplay,
 		      DRM_FORMAT_XRGB8888,
-- 
2.32.0

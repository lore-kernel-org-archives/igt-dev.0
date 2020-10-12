Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6D6E4EA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 15:31:01 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Mon, 12 Oct 2020 21:08:28 +0530
Message-Id: <20201012153828.23491-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_addfb_basic: Renaming tests as
 legacy tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Tests require legacy get_tiling/set_tiling API's. Renaming the subtest
names to make it obvious that these are legacy-only tests.

v2: Made test name consistent (Matt)
v3: Changed test names in fastfeedback (Petri)

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 14 +++++++-------
 tests/kms_addfb_basic.c               | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index aa2eb329..c074c443 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -48,11 +48,11 @@ igt@i915_hangman@error-state-basic
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-igt@kms_addfb_basic@addfb25-x-tiled
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch
-igt@kms_addfb_basic@addfb25-yf-tiled
-igt@kms_addfb_basic@addfb25-y-tiled
-igt@kms_addfb_basic@addfb25-y-tiled-small
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
 igt@kms_addfb_basic@bad-pitch-0
 igt@kms_addfb_basic@bad-pitch-1024
 igt@kms_addfb_basic@bad-pitch-128
@@ -62,8 +62,8 @@ igt@kms_addfb_basic@bad-pitch-63
 igt@kms_addfb_basic@bad-pitch-65536
 igt@kms_addfb_basic@bad-pitch-999
 igt@kms_addfb_basic@basic
-igt@kms_addfb_basic@basic-x-tiled
-igt@kms_addfb_basic@basic-y-tiled
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@basic-y-tiled-legacy
 igt@kms_addfb_basic@bo-too-small
 igt@kms_addfb_basic@bo-too-small-due-to-tiling
 igt@kms_addfb_basic@clobberred-modifier
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 666e7165..9455909c 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -320,7 +320,7 @@ static void tiling_tests(int fd)
 		}
 
 		f.pitches[0] = 1024*4;
-		igt_subtest("basic-X-tiled") {
+		igt_subtest("basic-x-tiled-legacy") {
 			f.handles[0] = tiled_x_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -348,7 +348,7 @@ static void tiling_tests(int fd)
 		}
 
 		f.pitches[0] = 1024*4;
-		igt_subtest("basic-Y-tiled") {
+		igt_subtest("basic-y-tiled-legacy") {
 			f.handles[0] = tiled_y_bo;
 
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
@@ -506,12 +506,12 @@ static void addfb25_tests(int fd)
 			igt_require_fb_modifiers(fd);
 		}
 
-		igt_subtest("addfb25-X-tiled-mismatch") {
+		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
 			f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		}
 
-		igt_subtest("addfb25-X-tiled") {
+		igt_subtest("addfb25-x-tiled-legacy") {
 			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -570,7 +570,7 @@ static void addfb25_ytile(int fd)
 		f.handles[0] = gem_bo;
 	}
 
-	igt_subtest("addfb25-Y-tiled") {
+	igt_subtest("addfb25-y-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
@@ -581,7 +581,7 @@ static void addfb25_ytile(int fd)
 		f.fb_id = 0;
 	}
 
-	igt_subtest("addfb25-Yf-tiled") {
+	igt_subtest("addfb25-yf-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Yf_TILED;
@@ -592,7 +592,7 @@ static void addfb25_ytile(int fd)
 		f.fb_id = 0;
 	}
 
-	igt_subtest("addfb25-Y-tiled-small") {
+	igt_subtest("addfb25-y-tiled-small-legacy") {
 		igt_require_fb_modifiers(fd);
 
 		gen = intel_gen(intel_get_drm_devid(fd));
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

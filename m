Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFAF6E245
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 19:17:21 +0000 (UTC)
From: Uma Shankar <uma.shankar@intel.com>
Date: Thu,  5 Nov 2020 01:21:42 +0530
Message-Id: <20201104195142.3223-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] igt/kms_frontbuffer_tracking: PSR + FBC not
 enabled on TGL
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
List-ID: <igt-dev@lists.freedesktop.org>

On TGL, FBC doesn't work reliably with PSR. Disable the test
with such requirement and also don't assert for fbc to be
enabled in case of PSR.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 43 ++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 14f522d8..59fe9552 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1584,6 +1584,8 @@ static void do_crc_assertions(int flags)
 
 static void do_status_assertions(int flags)
 {
+	int gen = intel_gen(intel_get_drm_devid(drm.fd));
+
 	if (!opt.check_status) {
 		/* Make sure we settle before continuing. */
 		sleep(1);
@@ -1612,14 +1614,34 @@ static void do_status_assertions(int flags)
 		igt_require(!fbc_stride_not_supported());
 		igt_require(!fbc_mode_too_large());
 		if (!fbc_wait_until_enabled()) {
-			igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
-				     "FBC disabled\n");
+			/*
+			 * Don't assert for FBC if PSR enabled
+			 * This combination is not enabled
+			 */
+			if (gen == 12) {
+				if (!psr.can_test)
+					igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
+						     "FBC disabled\n");
+			} else {
+				igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
+					     "FBC disabled\n");
+			}
 		}
 
-		if (opt.fbc_check_compression)
-			igt_assert(fbc_wait_for_compression());
+		if (gen == 12) {
+			if (opt.fbc_check_compression && !psr.can_test)
+				igt_assert(fbc_wait_for_compression());
+		} else {
+			if (opt.fbc_check_compression)
+				igt_assert(fbc_wait_for_compression());
+		}
 	} else if (flags & ASSERT_FBC_DISABLED) {
-		igt_assert(!fbc_wait_until_enabled());
+		if (gen == 12) {
+			if (!psr.can_test)
+				igt_assert(!fbc_wait_until_enabled());
+		} else {
+			igt_assert(!fbc_wait_until_enabled());
+		}
 	}
 
 	if (flags & ASSERT_PSR_ENABLED)
@@ -1732,6 +1754,8 @@ static bool enable_features_for_test(const struct test_mode *t)
 
 static void check_test_requirements(const struct test_mode *t)
 {
+	int gen = intel_gen(intel_get_drm_devid(drm.fd));
+
 	if (t->pipes == PIPE_DUAL)
 		igt_require_f(scnd_mode_params.output,
 			    "Can't test dual pipes with the current outputs\n");
@@ -1757,6 +1781,15 @@ static void check_test_requirements(const struct test_mode *t)
 		      (t->feature & FEATURE_DRRS)),
 		      "Can't test PSR and DRRS together\n");
 
+	/*
+	 * In kernel for Gen12, when PSR is enabled, FBC will be disabled.
+	 * So if a test case needs FBC + PSR enabled, that will be skipped.
+	 */
+	if (gen == 12)
+		igt_require_f(!((t->feature & FEATURE_PSR) &&
+				(t->feature & FEATURE_FBC)),
+				"Can't test PSR and FBC together\n");
+
 	if (opt.only_pipes != PIPE_COUNT)
 		igt_require(t->pipes == opt.only_pipes);
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

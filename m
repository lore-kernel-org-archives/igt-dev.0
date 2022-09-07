Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBAD10E761
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 13:20:48 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 18:45:45 +0530
Message-Id: <20220907131545.31598-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC,
 i-g-t] tests/i915/i915_pm_backlight: Add new subtest to validate
 dual panel backlight
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added a new subtest as a part of i915_pm_backlight to validate
dual panel support.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/i915_pm_backlight.c | 74 +++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index cafae7f7..d4b25f3f 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -42,6 +42,7 @@ struct context {
 
 #define TOLERANCE 5 /* percent */
 #define BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+#define BACKLIGHT_PATH_DUAL "/sys/class/backlight/card0-eDP-2-backlight"
 
 #define FADESTEPS 10
 #define FADESPEED 100 /* milliseconds between steps */
@@ -94,7 +95,52 @@ static int backlight_write(int value, const char *fname)
 
 	return 0;
 }
+static int backlight_read_dual(int *result, const char *fname)
+{
+        int fd;
+        char full[PATH_MAX];
+        char dst[64];
+        int r, e;
+
+        igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH_DUAL, fname) < PATH_MAX);
+
+        fd = open(full, O_RDONLY);
+        if (fd == -1)
+                return -errno;
+
+        r = read(fd, dst, sizeof(dst));
+        e = errno;
+        close(fd);
+
+        if (r < 0)
+                return -e;
+
+        errno = 0;
+        *result = strtol(dst, NULL, 10);
+        return errno;
+}
+
+static int backlight_write_dual(int value, const char *fname)
+{
+        int fd;
+        char full[PATH_MAX];
+        char src[64];
+        int len;
+
+        igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH_DUAL, fname) < PATH_MAX);
+        fd = open(full, O_WRONLY);
+        if (fd == -1)
+                return -errno;
 
+        len = snprintf(src, sizeof(src), "%i", value);
+        len = write(fd, src, len);
+        close(fd);
+
+        if (len < 0)
+                return len;
+
+        return 0;
+}
 static void test_and_verify(struct context *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
@@ -112,7 +158,6 @@ static void test_and_verify(struct context *context, int val)
 		     "actual_brightness [%d] did not match expected brightness [%d +- %d]\n",
 		     result, val, tolerance);
 }
-
 static void test_brightness(struct context *context)
 {
 	test_and_verify(context, 0);
@@ -120,6 +165,31 @@ static void test_brightness(struct context *context)
 	test_and_verify(context, context->max / 2);
 }
 
+static void test_and_verify_dual(struct context *context, int val)
+{
+        const int tolerance = val * TOLERANCE / 100;
+        int result;
+
+        igt_assert_eq(backlight_write_dual(val, "brightness"), 0);
+        igt_assert_eq(backlight_read_dual(&result, "brightness"), 0);
+        /* Check that the exact value sticks */
+        igt_assert_eq(result, val);
+
+        igt_assert_eq(backlight_read_dual(&result, "actual_brightness"), 0);
+        /* Some rounding may happen depending on hw */
+        igt_assert_f(result >= max(0, val - tolerance) &&
+                     result <= min(context->max, val + tolerance),
+                     "actual_brightness [%d] did not match expected brightness [%d +- %d]\n",
+                     result, val, tolerance);
+}
+
+static void test_brightness_dual(struct context *context)
+{
+        test_and_verify_dual(context, 0);
+        test_and_verify_dual(context, context->max);
+        test_and_verify_dual(context, context->max / 2);
+}
+
 static void test_bad_brightness(struct context *context)
 {
 	int val;
@@ -237,6 +307,8 @@ igt_main
 
 	igt_subtest("basic-brightness")
 		test_brightness(&context);
+	igt_subtest("basic-brightness-dual")
+		test_brightness_dual(&context);
 	igt_subtest("bad-brightness")
 		test_bad_brightness(&context);
 	igt_subtest("fade")
-- 
2.36.0

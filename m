Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4456BD0BB5E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285710E8A0;
	Thu, 24 Oct 2024 04:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0i2bymb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483E110E8A1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729745691; x=1761281691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXXAzBR2HNG+i2Pjhjl6GD/0u7qaWQXAigxVj4Aury0=;
 b=X0i2bymbaA6tCkAM8Q2JbenuOedVm/+b3hDAl98gCzwJJqGVDgDxEdOG
 Fiu27P5VqKWKAMZRbUe5tAcyH+KHjyX+SeNdqZEzpLHjdwIcgmxebGjSh
 B9Q8vojtAqrwjGwDaLMr4T7WZBGBZmPXuyj230sWt0MF/UoLNGKGhWMeU
 3RuwaetZsLslq/Qq374PJS7hjJYEbxgCh3qwPDR9R4sHHHYvQ/fcP9/km
 Ar7zd1ra0/jbjRuz31eqmx3uqDHy3VMr6PbsOy4RuVnRm/t3myKh3Wut1
 1LUT1YEqUbkUK8sHeP1bTdlpKHgBRwOUTgmhrvPSFDfPTBPFkMfIykRpY g==;
X-CSE-ConnectionGUID: IhovQhBwQnGfUHXuUF0djg==
X-CSE-MsgGUID: uqQtzt4uSFuw4npE/bX3Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46823185"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46823185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:54:51 -0700
X-CSE-ConnectionGUID: ObSyjFPyTQq9WcT/wl95mg==
X-CSE-MsgGUID: 8x6iJq1UQpS/3lkx9168uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80400831"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:54:44 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 2/3] tests/intel/kms_pm_backlight: Refactor and use
 functions from lib
Date: Thu, 24 Oct 2024 10:22:11 +0530
Message-Id: <20241024045212.1697869-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
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

Refactor to use igt_backlight_read and igt_backlight_write
update struct names to maintain consistency.
move struct context to library.

V2: update backlight_dir_path with BACKLIGHT_PATH.
v3: rename intel_backlight_context_t to igt_backlight_context_t (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
 1 file changed, 28 insertions(+), 80 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 196b5af03..8b59725ac 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -72,13 +72,6 @@
  * Functionality: backlight, dpms
  */
 
-struct context {
-	int max;
-	int old;
-	igt_output_t *output;
-	char path[PATH_MAX];
-};
-
 enum {
 	TEST_NONE = 0,
 	TEST_DPMS,
@@ -96,65 +89,17 @@ enum {
 
 IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
 
-static int backlight_read(int *result, const char *fname, struct context *context)
-{
-	int fd;
-	char full[PATH_MAX];
-	char dst[64];
-	int r, e;
-
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname)
-			    < PATH_MAX);
-	fd = open(full, O_RDONLY);
-	if (fd == -1)
-		return -errno;
-
-	r = read(fd, dst, sizeof(dst));
-	e = errno;
-	close(fd);
-
-	if (r < 0)
-		return -e;
-
-	errno = 0;
-	*result = strtol(dst, NULL, 10);
-	return errno;
-}
-
-static int backlight_write(int value, const char *fname, struct context *context)
-{
-	int fd;
-	char full[PATH_MAX];
-	char src[64];
-	int len;
-
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname)
-		   < PATH_MAX);
-	fd = open(full, O_WRONLY);
-	if (fd == -1)
-		return -errno;
-
-	len = snprintf(src, sizeof(src), "%i", value);
-	len = write(fd, src, len);
-	close(fd);
-
-	if (len < 0)
-		return len;
-
-	return 0;
-}
-
-static void test_and_verify(struct context *context, int val)
+static void test_and_verify(igt_backlight_context_t *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
 	int result;
 
-	igt_assert_eq(backlight_write(val, "brightness", context), 0);
-	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
+	igt_assert_eq(igt_backlight_write(val, "brightness", context), 0);
+	igt_assert_eq(igt_backlight_read(&result, "brightness", context), 0);
 	/* Check that the exact value sticks */
 	igt_assert_eq(result, val);
 
-	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
+	igt_assert_eq(igt_backlight_read(&result, "actual_brightness", context), 0);
 	/* Some rounding may happen depending on hw */
 	igt_assert_f(result >= max(0, val - tolerance) &&
 		     result <= min(context->max, val + tolerance),
@@ -162,31 +107,31 @@ static void test_and_verify(struct context *context, int val)
 		     result, val, tolerance);
 }
 
-static void test_brightness(struct context *context)
+static void test_brightness(igt_backlight_context_t *context)
 {
 	test_and_verify(context, 0);
 	test_and_verify(context, context->max);
 	test_and_verify(context, context->max / 2);
 }
 
-static void test_bad_brightness(struct context *context)
+static void test_bad_brightness(igt_backlight_context_t *context)
 {
 	int val;
 	/* First write some sane value */
-	backlight_write(context->max / 2, "brightness", context);
+	igt_backlight_write(context->max / 2, "brightness", context);
 	/* Writing invalid values should fail and not change the value */
-	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
-	backlight_read(&val, "brightness", context);
+	igt_assert_lt(igt_backlight_write(-1, "brightness", context), 0);
+	igt_backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
-	backlight_read(&val, "brightness", context);
+	igt_assert_lt(igt_backlight_write(context->max + 1, "brightness", context), 0);
+	igt_backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
-	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
-	backlight_read(&val, "brightness", context);
+	igt_assert_lt(igt_backlight_write(INT_MAX, "brightness", context), 0);
+	igt_backlight_read(&val, "brightness", context);
 	igt_assert_eq(val, context->max / 2);
 }
 
-static void test_fade(struct context *context)
+static void test_fade(igt_backlight_context_t *context)
 {
 	int i;
 	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
@@ -218,19 +163,19 @@ check_dpms(igt_output_t *output)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
 
-static void check_dpms_cycle(struct context *context)
+static void check_dpms_cycle(igt_backlight_context_t *context)
 {
 	int max, val_1, val_2;
 
-	backlight_read(&max, "max_brightness", context);
+	igt_backlight_read(&max, "max_brightness", context);
 	igt_assert(max);
 
-	backlight_write(max / 2, "brightness", context);
-	backlight_read(&val_1, "actual_brightness", context);
+	igt_backlight_write(max / 2, "brightness", context);
+	igt_backlight_read(&val_1, "actual_brightness", context);
 
 	check_dpms(context->output);
 
-	backlight_read(&val_2, "actual_brightness", context);
+	igt_backlight_read(&val_2, "actual_brightness", context);
 	igt_assert_eq(val_1, val_2);
 }
 
@@ -286,11 +231,11 @@ igt_main
 	igt_output_t *output;
 	char file_path_n[PATH_MAX] = "";
 	bool dual_edp = false;
-	struct context contexts[NUM_EDP_OUTPUTS];
+	igt_backlight_context_t contexts[NUM_EDP_OUTPUTS];
 	struct {
 		const char *name;
 		const char *desc;
-		void (*test_t) (struct context *);
+		void (*test_t)(igt_backlight_context_t *context);
 		int flags;
 	} tests[] = {
 		{ "basic-brightness", "test the basic brightness.", test_brightness, TEST_NONE },
@@ -339,14 +284,17 @@ igt_main
 
 			close(fd);
 
+			snprintf(contexts[i].backlight_dir_path, PATH_MAX, "%s", BACKLIGHT_PATH);
+
 			/* should be ../../cardX-$output */
 			snprintf(file_path_n, PATH_MAX, "%s/%s/device", BACKLIGHT_PATH,
 				 contexts[i].path);
 			igt_assert_lt(16, readlink(file_path_n, full_name, sizeof(full_name) - 1));
 			name = basename(full_name);
-			igt_assert(backlight_read(&contexts[i].max,
-						"max_brightness", &contexts[i]) > -1);
-			igt_skip_on(backlight_read(&contexts[i].old, "brightness", &contexts[i]));
+			igt_assert(igt_backlight_read(&contexts[i].max,
+						      "max_brightness", &contexts[i]) > -1);
+			igt_skip_on(igt_backlight_read(&contexts[i].old,
+						       "brightness", &contexts[i]));
 
 			if (!strcmp(name + 6, output->name)) {
 				contexts[i++].output = output;
@@ -383,7 +331,7 @@ igt_main
 	igt_fixture {
 		/* Restore old brightness */
 		for (i = 0; i < (dual_edp ? 2 : 1); i++)
-			backlight_write(contexts[i].old, "brightness", &contexts[i]);
+			igt_backlight_write(contexts[i].old, "brightness", &contexts[i]);
 
 		igt_display_fini(&display);
 		igt_pm_restore_sata_link_power_management();
-- 
2.34.1


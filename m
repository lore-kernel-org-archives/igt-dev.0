Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DED1D88B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 16:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BC010E5BC;
	Tue, 15 Oct 2024 16:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbwgNjzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858C310E5BB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729009536; x=1760545536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rc7U3Cbche0SZwrU04zAzwwspFnC/28QuwME1gAm2IY=;
 b=ZbwgNjzXj4UdgH0VhvD2TVzg4O+Ntu7sAUu3YOxtvZ88wip/pWcQuPd+
 zud6bTr3TjQ1D8C7F3RzzH+1LZhJR/evdlDY9u7d4JwQ/E3mcBnpZ8PIy
 gaZHpsHiWl0lkeBJSUE61R7muIYEf/RcQqSgex/Vapkksdd7ie8TOw52a
 pFM7fEQ1H9gBFuoYZWh51eaUXqv3MnFozMQGlpnK23uO1gnMmXNG0D2CU
 7MqTScZC8f6b60vz37w2kxTR3Q9NUbaWs09KH/9lIEmWdC02sthZ43CCp
 sZBegw1e/XUKt8HF2xgrFXZlScDk/2+WmAo3DV0gYUqxnz72JrsVtJvV3 A==;
X-CSE-ConnectionGUID: iPWjrUlxRUOultXv4ifTDg==
X-CSE-MsgGUID: VjO3uu0NRdWKdWlthAS2rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28616995"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28616995"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:25:36 -0700
X-CSE-ConnectionGUID: XDyiJbvERkmBjx5aJo8WOg==
X-CSE-MsgGUID: skhS5jt0TBqrkGa8xqi7Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77962854"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 09:25:34 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/intel/kms_pm_backlight: Refactor and use
 functions from lib
Date: Tue, 15 Oct 2024 21:53:36 +0530
Message-Id: <20241015162336.304730-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
References: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
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

Refactor the code to use the backlight_read and write from library
update struct names to maintain consistency.
Move defines to lib.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 77 +++++-----------------------------
 1 file changed, 11 insertions(+), 66 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 196b5af03..59002e3f4 100644
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
@@ -87,7 +80,6 @@ enum {
 };
 
 #define TOLERANCE 5 /* percent */
-#define BACKLIGHT_PATH "/sys/class/backlight"
 
 #define FADESTEPS 10
 #define FADESPEED 100 /* milliseconds between steps */
@@ -96,55 +88,7 @@ enum {
 
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
+static void test_and_verify(intel_backlight_context_t *context, int val)
 {
 	const int tolerance = val * TOLERANCE / 100;
 	int result;
@@ -162,14 +106,14 @@ static void test_and_verify(struct context *context, int val)
 		     result, val, tolerance);
 }
 
-static void test_brightness(struct context *context)
+static void test_brightness(intel_backlight_context_t *context)
 {
 	test_and_verify(context, 0);
 	test_and_verify(context, context->max);
 	test_and_verify(context, context->max / 2);
 }
 
-static void test_bad_brightness(struct context *context)
+static void test_bad_brightness(intel_backlight_context_t *context)
 {
 	int val;
 	/* First write some sane value */
@@ -186,7 +130,7 @@ static void test_bad_brightness(struct context *context)
 	igt_assert_eq(val, context->max / 2);
 }
 
-static void test_fade(struct context *context)
+static void test_fade(intel_backlight_context_t *context)
 {
 	int i;
 	static const struct timespec ts = { .tv_sec = 0, .tv_nsec = FADESPEED*1000000 };
@@ -218,7 +162,7 @@ check_dpms(igt_output_t *output)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
 
-static void check_dpms_cycle(struct context *context)
+static void check_dpms_cycle(intel_backlight_context_t *context)
 {
 	int max, val_1, val_2;
 
@@ -286,11 +230,11 @@ igt_main
 	igt_output_t *output;
 	char file_path_n[PATH_MAX] = "";
 	bool dual_edp = false;
-	struct context contexts[NUM_EDP_OUTPUTS];
+	intel_backlight_context_t contexts[NUM_EDP_OUTPUTS];
 	struct {
 		const char *name;
 		const char *desc;
-		void (*test_t) (struct context *);
+		void (*test_t)(intel_backlight_context_t *context);
 		int flags;
 	} tests[] = {
 		{ "basic-brightness", "test the basic brightness.", test_brightness, TEST_NONE },
@@ -320,11 +264,12 @@ igt_main
 
 			if (found)
 				snprintf(file_path_n, PATH_MAX, "%s/card%i-%s-backlight/brightness",
-					 BACKLIGHT_PATH, igt_device_get_card_index(display.drm_fd),
+					 INTEL_BACKLIGHT_PATH,
+					 igt_device_get_card_index(display.drm_fd),
 					 igt_output_name(output));
 			else
 				snprintf(file_path_n, PATH_MAX, "%s/intel_backlight/brightness",
-					 BACKLIGHT_PATH);
+					 INTEL_BACKLIGHT_PATH);
 
 			fd = open(file_path_n, O_RDONLY);
 			if (fd == -1)
@@ -340,7 +285,7 @@ igt_main
 			close(fd);
 
 			/* should be ../../cardX-$output */
-			snprintf(file_path_n, PATH_MAX, "%s/%s/device", BACKLIGHT_PATH,
+			snprintf(file_path_n, PATH_MAX, "%s/%s/device", INTEL_BACKLIGHT_PATH,
 				 contexts[i].path);
 			igt_assert_lt(16, readlink(file_path_n, full_name, sizeof(full_name) - 1));
 			name = basename(full_name);
-- 
2.34.1


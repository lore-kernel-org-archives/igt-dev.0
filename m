Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D864010E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 20:59:25 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-41cb76f3cf0so23661181cf.2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 13:59:25 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 20:56:38 +0000
Message-ID: <20231023205910.3556533-9-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
References: <20231023205910.3556533-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 8/8] tests/kms_vrr: Add a max/min test to
 oscillate between rates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The new MAXMIN test will oscillate between the max and min
refresh rates every frame to stress test the panel. This is
useful for manual profiling of flicker.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Added to the set
---
 tests/kms_vrr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index b986087f0..58bed4f20 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -89,6 +89,7 @@ enum {
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
 	TEST_NEGATIVE = 1 << 4,
+	TEST_MAXMIN = 1 << 6,
 };
 
 typedef struct range {
@@ -529,6 +530,14 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.min - 5), rate[0], result);
 	}
 
+	if (flags & TEST_MAXMIN) {
+		uint64_t maxmin_rates[] = {vtest_ns.max, vtest_ns.min};
+		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+		igt_assert_f(result < 50,
+			     "Refresh rate (%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+			     (range.min - 5), maxmin_rates[0], maxmin_rates[1], result);
+	}
+
 	/*
 	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
 	 * modeset. And the expected behavior is the same as disabling VRR on
@@ -654,6 +663,11 @@ igt_main_args("d:r:s", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Oscillates between highest and lowest refresh each frame for manual "
+		     "flicker profiling");
+	igt_subtest_with_dynamic("max-min")
+		run_vrr_test(&data, test_basic, TEST_MAXMIN);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477B610E15D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:39:39 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-79b4d2c0621so487699241.2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 11:39:39 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 18:36:17 +0000
Message-ID: <20230825183934.1271156-3-sean@poorly.run>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
References: <20230825183934.1271156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/6] tests/kms_vrr: Move vtest_ns into data_t
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

vtest_ns is derived from data->range which is fixed. Move it into data_t
and generate it once in prepare_test().

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 tests/kms_vrr.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 83a91b543..8ef5972aa 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -101,20 +101,21 @@ typedef struct range {
 	unsigned int max;
 } range_t;
 
+typedef struct vtest_ns {
+	uint64_t min;
+	uint64_t mid;
+	uint64_t max;
+} vtest_ns_t;
+
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
 	igt_plane_t *primary;
 	igt_fb_t fb[2];
 	range_t range;
+	vtest_ns_t vtest_ns;
 } data_t;
 
-typedef struct vtest_ns {
-	uint64_t min;
-	uint64_t mid;
-	uint64_t max;
-} vtest_ns_t;
-
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
@@ -215,18 +216,6 @@ get_vrr_range(data_t *data, igt_output_t *output)
 	return range;
 }
 
-/* Returns vrr test frequency for min, mid & max range. */
-static vtest_ns_t get_test_rate_ns(range_t range)
-{
-	vtest_ns_t vtest_ns;
-
-	vtest_ns.min = rate_from_refresh(range.min);
-	vtest_ns.mid = rate_from_refresh(((range.max + range.min) / 2));
-	vtest_ns.max = rate_from_refresh(range.max);
-
-	return vtest_ns;
-}
-
 /* Returns true if driver supports VRR. */
 static bool has_vrr(igt_output_t *output)
 {
@@ -260,6 +249,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	/* Capture VRR range */
 	data->range = get_vrr_range(data, output);
 
+	data->vtest_ns.min = rate_from_refresh(data->range.min);
+	data->vtest_ns.mid = rate_from_refresh(
+				(data->range.min + data->range.max) / 2);
+	data->vtest_ns.max = rate_from_refresh(data->range.max);
+
 	/* Override mode with max vrefresh.
 	 *   - vrr_min range should be less than the override mode vrefresh.
 	 *   - Limit the vrr_max range with the override mode vrefresh.
@@ -334,7 +328,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint64_t start_ns, last_event_ns, target_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
-	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
+	vtest_ns_t vtest_ns = data->vtest_ns;
 
 	/* Align with the flip completion event to speed up convergence. */
 	do_flip(data, &data->fb[0]);
@@ -411,7 +405,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	prepare_test(data, output, pipe);
 	range = data->range;
-	vtest_ns = get_test_rate_ns(range);
+	vtest_ns = data->vtest_ns;
 	rate = vtest_ns.mid;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
-- 
Sean Paul, Software Engineer, Google / Chromium OS

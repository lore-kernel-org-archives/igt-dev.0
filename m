Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8D10E399
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 2/9] tests/kms_vrr: Move vtest_ns into data_t
Date: Mon, 18 Dec 2023 13:52:00 +0530
Message-Id: <20231218082207.32719-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
References: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

v2: (Bhanu)
- Rebase

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index dda716ff3..505bad44b 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -100,6 +100,12 @@ typedef struct range {
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
@@ -107,14 +113,9 @@ typedef struct data {
 	igt_fb_t fb[2];
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
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
@@ -232,18 +233,6 @@ get_vrr_range(data_t *data, igt_output_t *output)
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
@@ -276,6 +265,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	mode = *igt_output_get_mode(output);
 
+	data->vtest_ns.min = rate_from_refresh(data->range.min);
+	data->vtest_ns.mid = rate_from_refresh(
+				(data->range.min + data->range.max) / 2);
+	data->vtest_ns.max = rate_from_refresh(data->range.max);
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -341,7 +335,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint64_t start_ns, last_event_ns, target_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
-	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
+	vtest_ns_t vtest_ns = data->vtest_ns;
 
 	/* Align with the flip completion event to speed up convergence. */
 	do_flip(data, &data->fb[0]);
@@ -418,7 +412,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	prepare_test(data, output, pipe);
 	range = data->range;
-	vtest_ns = get_test_rate_ns(range);
+	vtest_ns = data->vtest_ns;
 	rate = vtest_ns.mid;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
@@ -512,7 +506,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	prepare_test(data, output, pipe);
-	vtest_ns = get_test_rate_ns(data->range);
+	vtest_ns = data->vtest_ns;
 
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
-- 
2.40.0

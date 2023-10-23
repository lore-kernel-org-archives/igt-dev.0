Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70AB10E258
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 20:59:19 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-458289fb60bso1234292137.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 13:59:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 20:56:34 +0000
Message-ID: <20231023205910.3556533-5-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
References: <20231023205910.3556533-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 4/8] tests/kms_vrr: Allow test duration to be
 specified from the command line
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

Using --duration argument, otherwise use default.

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Add short opt to the main callsite (Bhanu)
---
 tests/kms_vrr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 62335e9bf..af61c312e 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -109,6 +109,7 @@ typedef struct data {
 	igt_fb_t fb[2];
 	range_t range;
 	vtest_ns_t vtest_ns;
+	uint64_t duration_ns;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -257,6 +258,9 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 		     data->vtest_ns.rate_ns >= data->vtest_ns.max,
 		     "Invalid test rate specified!\n");
 
+	if (data->duration_ns == 0)
+		data->duration_ns = TEST_DURATION_NS;
+
 	/* Override mode with max vrefresh.
 	 *   - vrr_min range should be less than the override mode vrefresh.
 	 *   - Limit the vrr_max range with the override mode vrefresh.
@@ -453,7 +457,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     (range.max + 5), rate, result);
@@ -461,7 +465,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & ~TEST_NEGATIVE) {
 		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     ((range.max + range.min) / 2), rate, result);
@@ -469,7 +473,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.min - 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
 			     (range.min - 5), rate, result);
@@ -482,7 +486,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
@@ -538,6 +542,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	data_t *data = _data;
 
 	switch (opt) {
+	case 'd':
+		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
+		break;
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
@@ -546,16 +553,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
 }
 
 static const struct option long_opts[] = {
+	{ .name = "duration", .has_arg = true, .val = 'd', },
 	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
 	{}
 };
 
 static const char help_str[] =
+	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
 	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
 
 static data_t data;
 
-igt_main_args("r:", long_opts, help_str, opt_handler, &data)
+igt_main_args("d:r:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

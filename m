Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC810E6C0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:39:40 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-410a2925972so6773661cf.0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 11:39:40 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 18:36:19 +0000
Message-ID: <20230825183934.1271156-5-sean@poorly.run>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
References: <20230825183934.1271156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/6] tests/kms_vrr: Allow test duration to be
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
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 tests/kms_vrr.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d62ded180..67d13d4bf 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -114,6 +114,7 @@ typedef struct data {
 	igt_fb_t fb[2];
 	range_t range;
 	vtest_ns_t vtest_ns;
+	uint64_t duration_ns;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -262,6 +263,9 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 		     data->vtest_ns.rate_ns >= data->vtest_ns.max,
 		     "Invalid test rate specified!\n");
 
+	if (data->duration_ns == 0)
+		data->duration_ns = TEST_DURATION_NS;
+
 	/* Override mode with max vrefresh.
 	 *   - vrr_min range should be less than the override mode vrefresh.
 	 *   - Limit the vrr_max range with the override mode vrefresh.
@@ -458,7 +462,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     (range.max + 5), rate, result);
@@ -466,7 +470,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & ~TEST_NEGATIVE) {
 		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     ((range.max + range.min) / 2), rate, result);
@@ -474,7 +478,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.min - 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
 			     (range.min - 5), rate, result);
@@ -487,7 +491,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
@@ -543,6 +547,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	data_t *data = _data;
 
 	switch (opt) {
+	case 'd':
+		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
+		break;
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
@@ -551,11 +558,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
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
-- 
Sean Paul, Software Engineer, Google / Chromium OS

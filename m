Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B5110E0F1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 06:39:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 1/2] tests/kms_vrr: Enhance flip accuracy measurement
Date: Wed, 17 Jan 2024 12:03:38 +0530
Message-Id: <20240117063339.3805517-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240117063339.3805517-1-bhanuprakash.modem@intel.com>
References: <20240117063339.3805517-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The threshold of ~50us, which is roughly the difference between
144Hz & 143Hz, to be too high for high refresh rate panels (like
60-360Hz) and too low for low refresh rate panels (like 40-60Hz)
when measuring flip accuracy.

Revise the threshold to allow for a deviation of approximately
(+/-) 1 Hz will improve the accuracy of flip measurements across
a wider range of panel refresh rates.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 71fc36162..44bc3480d 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -339,10 +339,23 @@ static uint32_t
 flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 uint64_t rate_ns, uint64_t duration_ns)
 {
-	uint64_t start_ns, last_event_ns, target_ns;
+	uint64_t start_ns, last_event_ns, target_ns, exp_rate_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
 	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
+	uint64_t threshold_hi, threshold_lo;
+
+	if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
+		exp_rate_ns = rate_ns;
+	else
+		exp_rate_ns = vtest_ns.max;
+
+	/* Allow ~1 Hz deviation for different reasons causing delay. */
+	threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
+	threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+
+	igt_info("Requested rate: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
+			rate_ns, threshold_hi, threshold_lo);
 
 	/* Align with the flip completion event to speed up convergence. */
 	do_flip(data, &data->fb0);
@@ -369,18 +382,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		/*
 		 * Check if the difference between the two flip timestamps
 		 * was within the required threshold from the expected rate.
-		 *
-		 * A ~50us threshold is arbitrary, but it's roughly the
-		 * difference between 144Hz and 143Hz which should give this
-		 * enough accuracy for most use cases.
 		 */
-		if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
-			diff_ns = rate_ns;
-		else
-			diff_ns = vtest_ns.max;
-		diff_ns -= event_ns - last_event_ns;
+		diff_ns = event_ns - last_event_ns;
 
-		if (llabs(diff_ns) < 50000ll)
+		if (llabs(diff_ns) < threshold_lo && llabs(diff_ns) > threshold_hi)
 			total_pass += 1;
 
 		last_event_ns = event_ns;
-- 
2.40.0

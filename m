Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FED6E439
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 09:03:06 +0000 (UTC)
From: Anand Moon <anandx.ram.moon@intel.com>
Date: Mon,  2 Nov 2020 09:02:43 +0000
Message-Id: <20201102090243.19737-1-anandx.ram.moon@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_setmode: basic Improve accuracy with
 using of confidence interval
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
To: igt-dev@lists.freedesktop.org, Dorota Czaplejewicz <dorota.czaplejewicz@collabora.co.uk>
Cc: Anand Moon <anandx.ram.moon@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Using confidence interval formula accuracy is estimates approximately
at 95% when {X} is the average of a sample of size n.
Use this confidence interval formula as used in statistics
to estimate the accuracy.

Cc: Dorota Czaplejewicz <dorota.czaplejewicz@collabora.co.uk>
Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
---
See below link.
https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule#Cumulative_distribution_function
---
 tests/kms_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 92f3ead2..58814a13 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -494,7 +494,7 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	 * which depend on timing, giving the lowest acceptable MTBF of 5.6s
 	 * for 60Hz sampling rate.
 	 */
-	accuracy = 3. * stddev;
+	accuracy = 3. * stddev / sqrt(CALIBRATE_TS_STEPS);
 
 	igt_info("Expected frametime: %.0fus; measured %.1fus +- %.3fus accuracy %.2f%% [%.2f scanlines]\n",
 		 expected, mean, stddev,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

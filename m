Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EB410E208
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 10:55:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 16:22:40 +0530
Message-Id: <20221128105240.366559-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_vrr: Fix the usage of VRR max refresh
 rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The max refresh rate of VRR is likely to be lower than the Vrefresh
of the selected mode. So, to test the VRR choose vrr_max as max
refresh rate if Vrefresh is greater than vrr_max, otherwise Vrefresh.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 68c4f264..41e88818 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -215,11 +215,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Override mode with max vrefresh.
 	 *   - vrr_min range should be less than the override mode vrefresh.
-	 *   - Limit the vrr_max range with the override mode vrefresh.
+	 *   - Limit the vrr_max range with the override mode vrefresh if
+	 *     vrr_max is greater than vrefresh else vrefresh.
 	 */
 	mode = output_mode_with_maxrate(output, data->range.max);
 	igt_require(mode.vrefresh > data->range.min);
-	data->range.max = mode.vrefresh;
+	data->range.max = (mode.vrefresh > data->range.max) ?
+				data->range.max : mode.vrefresh;
 	igt_output_override_mode(output, &mode);
 
 	/* Prepare resources */
-- 
2.38.1

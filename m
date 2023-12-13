Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B05710E710
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 08:27:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 1/2] tests/kms_vrr: Tweak flipline subtest
Date: Wed, 13 Dec 2023 13:46:51 +0530
Message-Id: <20231213081652.3662325-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As per the spec: If there is no flip request with in Vmax,
Hardware will terminate the Vblank at Vmax.

If we flip with the interval > Vmax, the expected refresh rate
could be: (Vmax + time left for the next flip + Vmin), and it
is very difficult to generalize. For low refresh rate panels
(like 40 - 60 Hz), result is not falling into the threshold.

Hence, tweak the test to increase the flip request interval.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 5c190cd8c..7cb7c3ef5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -456,7 +456,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.min - 5);
+		rate = rate_from_refresh(range.min - 10);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
-- 
2.40.0

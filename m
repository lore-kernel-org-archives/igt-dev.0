Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D6510E2BD
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 16:03:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 25 Sep 2022 21:30:50 +0530
Message-Id: <20220925160050.2149579-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_color: Fix ctm-0.* tests
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

As we are testing with a few values around the expected result
because of the hardware rounded values, fix the logic to generate
the expected values to deal with those hardware rounding issues.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index ab285af8..2804bde8 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -770,7 +770,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 			expected_colors[0].r =
 				expected_colors[1].g =
 				expected_colors[2].b =
-				0.5 + delta * (i - 2);
+				ctm[0] + delta * (i - (iter / 2));
 			if (test_pipe_ctm(data, data->primary, red_green_blue,
 					  expected_colors, ctm)) {
 				success = true;
-- 
2.37.3

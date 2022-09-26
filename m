Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B258510E1ED
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 03:14:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:41:58 +0530
Message-Id: <20220926031158.2164382-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220926031158.2164382-1-bhanuprakash.modem@intel.com>
References: <20220926031158.2164382-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/chamelium/kms_color_chamelium: Fix
 ctm-0.* tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As we are testing with a few values around the expected result
because of the hardware rounded values, fix the logic to generate
the expected values to deal with those hardware rounding issues.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_color_chamelium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
index 401f78c8..792aef8a 100644
--- a/tests/chamelium/kms_color_chamelium.c
+++ b/tests/chamelium/kms_color_chamelium.c
@@ -513,7 +513,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 			expected_colors[0].r =
 				expected_colors[1].g =
 				expected_colors[2].b =
-				0.5 + delta * (i - 2);
+				ctm[0] + delta * (i - (iter / 2));
 			if (test_pipe_ctm(data, data->primary,
 					  red_green_blue, expected_colors,
 					  ctm, data->ports[port_idx])) {
-- 
2.37.3

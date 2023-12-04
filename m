Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218A010E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 07:52:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	vidya.srinivas@intel.com
Date: Mon,  4 Dec 2023 13:11:07 +0530
Message-Id: <20231204074111.3167784-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
References: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 5/9] tests/kms_vrr: Fix the logic to calculate
 expected rate
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

Fix the condition check to measure the expected refresh rate.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2918f7860..422d89073 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -329,7 +329,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 * difference between 144Hz and 143Hz which should give this
 		 * enough accuracy for most use cases.
 		 */
-		if ((rate_ns < vtest_ns.min) && (rate_ns >= vtest_ns.max))
+		if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
 			diff_ns = rate_ns;
 		else
 			diff_ns = vtest_ns.max;
-- 
2.40.0

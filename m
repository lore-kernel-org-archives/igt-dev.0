Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C7D6EB21
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 08:08:43 +0000 (UTC)
From: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
Date: Thu, 27 Aug 2020 08:06:40 +0000
Message-Id: <20200827080640.3022-1-sowmyax.kaparthi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] Fixing the latency of hrtimer
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
To: igt-dev@lists.freedesktop.org, sowmyax.kaparthi@intel.com, umesh.nerlige.ramappa@intel.com, lionel.g.landwerlin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The blocking/polling parameterized tests were introduced to test
different hrtimer configurations.These tests check how many times the
process wakes up to read the reports with different hrtimer values (=
duration of test / hrtimer value). A user is more likely to choose a
larger hrtimer value than the default 5ms to avoid wake up too frequently.

Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
---
 tests/i915/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index a894fd38..5fd1193f 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4995,7 +4995,7 @@ igt_main
 			      40 * 1000 * 1000 /* default 40ms hrtimer */);
 		test_blocking(500 * 1000 /* 500us oa period */,
 			      true /* set_kernel_hrtimer */,
-			      2 * 1000 * 1000 /* default 2ms hrtimer */);
+			      10 * 1000 * 1000 /* default 10ms hrtimer */);
 	}
 
 	igt_describe("Test polled read with default hrtimer frequency");
@@ -5014,7 +5014,7 @@ igt_main
 			     40 * 1000 * 1000 /* default 40ms hrtimer */);
 		test_polling(500 * 1000 /* 500us oa period */,
 			     true /* set_kernel_hrtimer */,
-			     2 * 1000 * 1000 /* default 2ms hrtimer */);
+			     10 * 1000 * 1000 /* default 10ms hrtimer */);
 	}
 
 	igt_describe("Test polled read with buffer size smaller than available data");
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

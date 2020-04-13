Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9CC89F6E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2020 15:55:36 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Mon, 13 Apr 2020 08:55:31 -0700
Message-Id: <20200413155533.11914-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200413155533.11914-1-umesh.nerlige.ramappa@intel.com>
References: <20200413155533.11914-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/perf: Use poll oa period minimum
 of 5 ms
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The cpu overhead measured in these tests is based on heurisitcs
determined for the default 5 ms hrtimer in the driver over a span of
several platforms. Limit tests to use a poll oa period >= 5ms.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 152d48a7..ca12090a 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -4972,7 +4972,7 @@ igt_main
 			      40 * 1000 * 1000 /* default 40ms hrtimer */);
 		test_blocking(500 * 1000 /* 500us oa period */,
 			      true /* set_kernel_hrtimer */,
-			      2 * 1000 * 1000 /* default 2ms hrtimer */);
+			      5 * 1000 * 1000 /* default 2ms hrtimer */);
 	}
 
 	igt_describe("Test polled read with default hrtimer frequency");
@@ -4991,7 +4991,7 @@ igt_main
 			     40 * 1000 * 1000 /* default 40ms hrtimer */);
 		test_polling(500 * 1000 /* 500us oa period */,
 			     true /* set_kernel_hrtimer */,
-			     2 * 1000 * 1000 /* default 2ms hrtimer */);
+			     5 * 1000 * 1000 /* default 2ms hrtimer */);
 	}
 
 	igt_describe("Test polled read with buffer size smaller than available data");
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

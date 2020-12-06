Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8B889B9F
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Dec 2020 13:14:48 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun,  6 Dec 2020 18:47:24 +0530
Message-Id: <20201206131724.264564-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_selftest: Add subtests description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all the subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/i915_selftest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/i915_selftest.c b/tests/i915/i915_selftest.c
index abc8c9c7..00a02b40 100644
--- a/tests/i915/i915_selftest.c
+++ b/tests/i915/i915_selftest.c
@@ -31,16 +31,20 @@ igt_main
 	const char *env = getenv("SELFTESTS") ?: "";
 	char opts[1024];
 
+	igt_describe("Executes all mock selftests of i915 i.e. before driver loading using mock hardware");
 	igt_assert(snprintf(opts, sizeof(opts),
 			    "mock_selftests=-1 disable_display=1 st_filter=%s",
 			    env) < sizeof(opts));
 	igt_kselftests("i915", opts, NULL, "mock");
 
+	igt_describe("Executes all live selftests of i915 i.e. after driver initialisation on the live system");
 	igt_assert(snprintf(opts, sizeof(opts),
 			    "live_selftests=-1 disable_display=1 st_filter=%s",
 			    env) < sizeof(opts));
 	igt_kselftests("i915", opts, "live_selftests", "live");
 
+	igt_describe("Executes all performance orientated selftests of i915 after driver initialisation "
+	       "on the live system");
 	igt_assert(snprintf(opts, sizeof(opts),
 			    "perf_selftests=-1 disable_display=1 st_filter=%s",
 			    env) < sizeof(opts));
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

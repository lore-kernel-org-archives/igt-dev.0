Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5E10E084
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:09 -0700
Message-ID: <20230808010017.37819-13-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/20] tests/i915/perf: Don't load module
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

Because now the perf code is being shared between i915 and xe, we have two
modules to load and can't decide which to load unless we've loaded one. So
to avoid the chicken and egg issue, don't load any module. The default
module in the system should automatically get loaded.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 7cbf3f7ca287..e0afbbc45ea2 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5952,22 +5952,6 @@ igt_main
 	const intel_ctx_t *ctx;
 	const struct intel_execution_engine2 *e;
 
-	igt_fixture {
-		struct stat sb;
-
-		/*
-		 * Prior tests may have unloaded i915 or failed while
-		 * loading/unloading i915. Load i915 here before we stat the
-		 * files.
-		 */
-		drm_load_module(DRIVER_INTEL);
-
-		igt_require(stat(i9xe.sysctl_path_paranoid, &sb)
-			    == 0);
-		igt_require(stat(i9xe.sysctl_path_max_sample_rate, &sb)
-			    == 0);
-	}
-
 	igt_subtest("i915-ref-count")
 		test_i915_ref_count();
 
-- 
2.41.0

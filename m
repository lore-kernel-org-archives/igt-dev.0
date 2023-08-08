Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F2B10E14B
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:10 -0700
Message-ID: <20230808010017.37819-14-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/20] tests/i915/perf: Move
 test_sysctl_defaults after the fixture
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

test_sysctl_defaults requires sysctl paths to be set which is done in the
fixture.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e0afbbc45ea2..78e68462ad06 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5955,9 +5955,6 @@ igt_main
 	igt_subtest("i915-ref-count")
 		test_i915_ref_count();
 
-	igt_subtest("sysctl-defaults")
-		test_sysctl_defaults();
-
 	igt_fixture {
 		/* We expect that the ref count test before these fixtures
 		 * should have closed drm_fd...
@@ -5996,6 +5993,9 @@ igt_main
 			render_copy = igt_get_render_copyfunc(devid);
 	}
 
+	igt_subtest("sysctl-defaults")
+		test_sysctl_defaults();
+
 	igt_subtest("non-system-wide-paranoid")
 		test_system_wide_paranoid();
 
-- 
2.41.0

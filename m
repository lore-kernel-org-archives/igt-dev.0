Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6210E3FE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 14:20:37 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Feb 2023 15:20:26 +0100
Message-Id: <20230201142026.14045-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_params: Cross-check getparam
 against engine execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Make the no-bsd, no-blt, no-vebox tests also check that if the getparam does report
the engine, the ring selector rather than skipping.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_exec_params.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index 618635ec3..3e06f2107 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -411,25 +411,26 @@ igt_main
 	igt_subtest("mmapped")
 		mmapped(fd);
 
-#define RUN_FAIL(expected_errno) do { \
-		igt_assert_eq(__gem_execbuf(fd, &execbuf), -expected_errno); \
-	} while(0)
-
 	igt_subtest("no-bsd") {
-		igt_require(!gem_has_bsd(fd));
 		execbuf.flags = I915_EXEC_BSD;
-		RUN_FAIL(EINVAL);
+		igt_assert_eq(__gem_execbuf(fd, &execbuf),
+			      gem_has_bsd(fd) ? 0 : -EINVAL);
 	}
 	igt_subtest("no-blt") {
-		igt_require(!gem_has_blt(fd));
 		execbuf.flags = I915_EXEC_BLT;
-		RUN_FAIL(EINVAL);
+		igt_assert_eq(__gem_execbuf(fd, &execbuf),
+			      gem_has_blt(fd) ? 0 : -EINVAL);
 	}
 	igt_subtest("no-vebox") {
-		igt_require(!gem_has_vebox(fd));
 		execbuf.flags = I915_EXEC_VEBOX;
-		RUN_FAIL(EINVAL);
+		igt_assert_eq(__gem_execbuf(fd, &execbuf),
+			      gem_has_vebox(fd) ? 0 : -EINVAL);
 	}
+
+#define RUN_FAIL(expected_errno) do { \
+		igt_assert_eq(__gem_execbuf(fd, &execbuf), -expected_errno); \
+	} while(0)
+
 	igt_subtest("invalid-ring") {
 		execbuf.flags = I915_EXEC_RING_MASK;
 		RUN_FAIL(EINVAL);
-- 
2.39.0

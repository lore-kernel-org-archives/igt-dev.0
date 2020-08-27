Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254466E22D
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 05:22:23 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 27 Aug 2020 10:48:21 +0530
Message-Id: <20200827051821.27522-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_bad_destroy: Added test
 description for test case
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
To: Arjun.Melkaveri@intel.com, lukasz.fiedorowicz@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description for all the available subtests.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_ctx_bad_destroy.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
index 50bb9aa0..2ebc5abb 100644
--- a/tests/i915/gem_ctx_bad_destroy.c
+++ b/tests/i915/gem_ctx_bad_destroy.c
@@ -53,18 +53,24 @@ igt_main
 	}
 
 	/* try double destroy */
+	igt_describe("Test tries to destroy context two times "
+		     "and checks if second destroy returns (ENOENT)error on no entry or not.");
 	igt_subtest("double-destroy") {
 		ctx_id = gem_context_create(fd);
 		gem_context_destroy(fd, ctx_id);
 		igt_assert(__gem_context_destroy(fd, ctx_id) == -ENOENT);
 	}
-
+	
+	igt_describe("Test checks if invalid destroy of contextid returns ENOENT or not.");
 	igt_subtest("invalid-ctx")
 		igt_assert(__gem_context_destroy(fd, 2) == -ENOENT);
-
+	
+	igt_describe("Test checks if destroy of default context returns ENOENT or not.");
 	igt_subtest("invalid-default-ctx")
 		igt_assert(__gem_context_destroy(fd, 0) == -ENOENT);
-
+	
+	igt_describe("Test checks if invalid pad value is given "
+		     "while destroying context returns error or not(EINVAL).");
 	igt_subtest("invalid-pad") {
 		struct drm_i915_gem_context_destroy destroy;
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E187C10E02A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 06:19:25 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 11:49:15 +0530
Message-Id: <20221121061916.3571789-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
References: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] Revert "tests/i915/gem_ctx_param: Add
 tests for recently removed params"
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

This reverts commit 3e70bbfb8af91396baaff5091791fdeee8526072.
---
 tests/i915/gem_ctx_param.c | 44 --------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 990ce4e95..2e199f9c3 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -247,35 +247,6 @@ static void test_vm(int i915)
 	put_ahnd(ahnd);
 }
 
-static void test_set_invalid_param(int fd, uint64_t param, uint64_t value)
-{
-	/* Create a fresh context */
-	struct drm_i915_gem_context_param arg = {
-		.ctx_id = gem_context_create(fd),
-		.param = param,
-		.value = value,
-	};
-	int err;
-
-	err = __gem_context_set_param(fd, &arg);
-	gem_context_destroy(fd, arg.ctx_id);
-	igt_assert_eq(err, -EINVAL);
-}
-
-static void test_get_invalid_param(int fd, uint64_t param)
-{
-	/* Create a fresh context */
-	struct drm_i915_gem_context_param arg = {
-		.ctx_id = gem_context_create(fd),
-		.param = param,
-	};
-	int err;
-
-	err = __gem_context_get_param(fd, &arg);
-	gem_context_destroy(fd, arg.ctx_id);
-	igt_assert_eq(err, -EINVAL);
-}
-
 igt_main
 {
 	struct drm_i915_gem_context_param arg;
@@ -438,21 +409,6 @@ igt_main
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -EINVAL);
 	}
 
-	igt_subtest("invalid-set-ringsize")
-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE, 8192);
-
-	igt_subtest("invalid-get-ringsize")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE);
-
-	igt_subtest("invalid-set-no-zeromap")
-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP, 1);
-
-	igt_subtest("invalid-get-no-zeromap")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP);
-
-	igt_subtest("invalid-get-engines")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
-
 	igt_fixture
 		close(fd);
 }

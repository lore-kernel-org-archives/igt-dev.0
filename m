Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF110E02A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 06:19:23 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 11:49:14 +0530
Message-Id: <20221121061916.3571789-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
References: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] Revert "tests/i915/gem_ctx_param: Add a
 couple invalid PARAM_VM cases"
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

This reverts commit 9c59d4bd0d18b336d0b15e6dea0210e43768b96c.
---
 tests/i915/gem_ctx_param.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index d119ea74e..990ce4e95 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -182,25 +182,6 @@ static void test_vm(int i915)
 	gem_context_destroy(i915, arg.ctx_id);
 	igt_require(err == -ENOENT);
 
-	/* Test that we can't set the VM on ctx0 */
-	arg.ctx_id = 0;
-	arg.value = gem_vm_create(i915);
-	err = __gem_context_set_param(i915, &arg);
-	gem_vm_destroy(i915, arg.value);
-	igt_assert_eq(err, -EINVAL);
-
-	/* Test that we can't set the VM after we've done an execbuf */
-	arg.ctx_id = gem_context_create(i915);
-	ahnd = get_reloc_ahnd(i915, arg.ctx_id);
-	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = arg.ctx_id);
-	igt_spin_free(i915, spin);
-	put_ahnd(ahnd);
-	arg.value = gem_vm_create(i915);
-	err = __gem_context_set_param(i915, &arg);
-	gem_context_destroy(i915, arg.ctx_id);
-	gem_vm_destroy(i915, arg.value);
-	igt_assert_eq(err, -EINVAL);
-
 	parent = gem_context_create(i915);
 	child = gem_context_create(i915);
 

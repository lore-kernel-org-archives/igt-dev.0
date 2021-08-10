Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7CB89DF7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:21 +0200
Message-Id: <20210810052711.7866-16-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 15/65] tests/gem_ctx_param: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

v2: recreate ahnd for appropriate context before starting the second
    spinner (Ashutosh)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_param.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index c795f1b45..d119ea74e 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -165,6 +165,7 @@ static void test_vm(int i915)
 	int err;
 	uint32_t parent, child;
 	igt_spin_t *spin;
+	uint64_t ahnd;
 
 	/*
 	 * Proving 2 contexts share the same GTT is quite tricky as we have no
@@ -190,8 +191,10 @@ static void test_vm(int i915)
 
 	/* Test that we can't set the VM after we've done an execbuf */
 	arg.ctx_id = gem_context_create(i915);
-	spin = igt_spin_new(i915, .ctx_id = arg.ctx_id);
+	ahnd = get_reloc_ahnd(i915, arg.ctx_id);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = arg.ctx_id);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 	arg.value = gem_vm_create(i915);
 	err = __gem_context_set_param(i915, &arg);
 	gem_context_destroy(i915, arg.ctx_id);
@@ -201,8 +204,9 @@ static void test_vm(int i915)
 	parent = gem_context_create(i915);
 	child = gem_context_create(i915);
 
+	ahnd = get_reloc_ahnd(i915, 0);
 	/* Create a background spinner to keep the engines busy */
-	spin = igt_spin_new(i915);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 	for (int i = 0; i < 16; i++) {
 		spin->execbuf.rsvd1 = gem_context_create(i915);
 		__gem_context_set_priority(i915, spin->execbuf.rsvd1, 1023);
@@ -259,6 +263,7 @@ static void test_vm(int i915)
 	igt_spin_free(i915, spin);
 	gem_sync(i915, batch.handle);
 	gem_close(i915, batch.handle);
+	put_ahnd(ahnd);
 }
 
 static void test_set_invalid_param(int fd, uint64_t param, uint64_t value)
-- 
2.26.0

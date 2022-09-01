Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC6C10E694
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:44:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:33 +0200
Message-Id: <20220901114442.55071-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/12] lib/i915: Distinguish
 I915_MMAP_OFFSET_FIXED with an invalid domain
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Don't treat OFFSET_FIXED as using DOMAIN_CPU [0], but give it an invalid
domain so we can avoid using in tests.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 lib/i915/gem_mman.c          |  2 +-
 tests/i915/gem_mmap_offset.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index aa9ac6f3d7..48e3f8c991 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -678,7 +678,7 @@ const struct mmap_offset mmap_offset_types[] = {
 	{ "wb", I915_MMAP_OFFSET_WB, I915_GEM_DOMAIN_CPU },
 	{ "wc", I915_MMAP_OFFSET_WC, I915_GEM_DOMAIN_WC },
 	{ "uc", I915_MMAP_OFFSET_UC, I915_GEM_DOMAIN_WC },
-	{ "fixed", I915_MMAP_OFFSET_FIXED, 0},
+	{ "fixed", I915_MMAP_OFFSET_FIXED, -1 },
 	{},
 };
 
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 5e6b19eb34..d1075c32eb 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -148,7 +148,8 @@ static void basic_uaf(int i915)
 		}
 
 		expected = calloc(obj_size, sizeof(*expected));
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain != -1)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(addr, expected, obj_size) == 0,
 			     "mmap(%s) not clear on gem_create()\n",
 			     t->name);
@@ -157,15 +158,18 @@ static void basic_uaf(int i915)
 		buf = calloc(obj_size, sizeof(*buf));
 		memset(buf + 1024, 0x01, 1024);
 		gem_write(i915, handle, 0, buf, obj_size);
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain != -1)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(buf, addr, obj_size) == 0,
 			     "mmap(%s) not coherent with gem_write()\n",
 			     t->name);
 
-		gem_set_domain(i915, handle, t->domain, t->domain);
+		if (t->domain != -1)
+			gem_set_domain(i915, handle, t->domain, t->domain);
 		memset(addr + 2048, 0xff, 1024);
 		gem_read(i915, handle, 0, buf, obj_size);
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain != -1)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(buf, addr, obj_size) == 0,
 			     "mmap(%s) not coherent with gem_read()\n",
 			     t->name);
-- 
2.34.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F2110EAB9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 11:09:30 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 13:09:12 +0200
Message-Id: <20220922110918.16510-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
References: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] i915/gem_mmap_offset: Avoid set_domain
 when I915_MMAP_OFFSET_FIXED is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

When OFFSET_FIXED mapping is in use avoid to set domain at all.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_mmap_offset.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 5e6b19eb..edbc637a 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -148,7 +148,8 @@ static void basic_uaf(int i915)
 		}
 
 		expected = calloc(obj_size, sizeof(*expected));
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(addr, expected, obj_size) == 0,
 			     "mmap(%s) not clear on gem_create()\n",
 			     t->name);
@@ -157,15 +158,18 @@ static void basic_uaf(int i915)
 		buf = calloc(obj_size, sizeof(*buf));
 		memset(buf + 1024, 0x01, 1024);
 		gem_write(i915, handle, 0, buf, obj_size);
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(buf, addr, obj_size) == 0,
 			     "mmap(%s) not coherent with gem_write()\n",
 			     t->name);
 
-		gem_set_domain(i915, handle, t->domain, t->domain);
+		if (t->domain)
+			gem_set_domain(i915, handle, t->domain, t->domain);
 		memset(addr + 2048, 0xff, 1024);
 		gem_read(i915, handle, 0, buf, obj_size);
-		gem_set_domain(i915, handle, t->domain, 0);
+		if (t->domain)
+			gem_set_domain(i915, handle, t->domain, 0);
 		igt_assert_f(memcmp(buf, addr, obj_size) == 0,
 			     "mmap(%s) not coherent with gem_read()\n",
 			     t->name);
-- 
2.34.1

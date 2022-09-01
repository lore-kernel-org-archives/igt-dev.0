Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B34A10E5D2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:30:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:29:56 +0200
Message-Id: <20220901063000.25640-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
References: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/13] i915/gem_mmap_offset: Verify all
 regions have nonblocking pagefaults
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

From: Chris Wilson <chris.p.wilson@intel.com>

Check that if we fault in a page that is active on the gpu, it doesn't
wait for completion.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/i915/gem_mmap_offset.c | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index c392dc2092..d82c19e946 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -287,7 +287,7 @@ static void isolation(int i915)
 	}
 }
 
-static void pf_nonblock(int i915)
+static void pf_nonblock_batch(int i915)
 {
 	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 	igt_spin_t *spin = igt_spin_new(i915, .ahnd = ahnd);
@@ -313,6 +313,41 @@ static void pf_nonblock(int i915)
 	put_ahnd(ahnd);
 }
 
+static void pf_nonblock(int i915)
+{
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
+
+	pf_nonblock_batch(i915);
+
+	for_each_memory_region(r, i915) {
+		igt_spin_t *spin;
+		uint32_t handle;
+
+		handle = gem_create_in_memory_region_list(i915, 4096, 0, &r->ci, 1);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .dependency = handle);
+
+		for_each_mmap_offset_type(i915, t) {
+			uint32_t *ptr;
+
+			ptr = __mmap_offset(i915, handle, 0, 4096,
+					    PROT_READ | PROT_WRITE,
+					    t->type);
+			if (!ptr)
+				continue;
+
+			igt_set_timeout(1, t->name);
+			/* no set-domain as we want to verify the pagefault is async */
+			ptr[256] = 0;
+			igt_reset_timeout();
+
+			munmap(ptr, 4096);
+		}
+
+		igt_spin_free(i915, spin);
+		gem_close(i915, handle);
+	}
+}
+
 static void *memchr_inv(const void *s, int c, size_t n)
 {
 	const uint8_t *us = s;
-- 
2.34.1

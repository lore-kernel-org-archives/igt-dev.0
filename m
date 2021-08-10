Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB606E042
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:54:05 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:52:58 +0200
Message-Id: <20210810105323.31375-30-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 29/54] tests/gem_mmap_offset: Add
 allocator support
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_mmap_offset.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index f1ba67b7c..8148f0a2d 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -248,7 +248,8 @@ static void isolation(int i915)
 
 static void pf_nonblock(int i915)
 {
-	igt_spin_t *spin = igt_spin_new(i915);
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
+	igt_spin_t *spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	for_each_mmap_offset_type(i915, t) {
 		uint32_t *ptr;
@@ -268,6 +269,7 @@ static void pf_nonblock(int i915)
 	}
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void *memchr_inv(const void *s, int c, size_t n)
-- 
2.26.0

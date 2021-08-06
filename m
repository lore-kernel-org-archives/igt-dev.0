Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3D6E053
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:18 +0200
Message-Id: <20210806134145.24634-30-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 29/56] tests/gem_mmap: Add allocator
 support
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
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index a77c0ad60..61c9c5c19 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -123,8 +123,9 @@ test_pf_nonblock(int i915)
 {
 	igt_spin_t *spin;
 	uint32_t *ptr;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
-	spin = igt_spin_new(i915);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	igt_set_timeout(1, "initial pagefaulting did not complete within 1s");
 
@@ -135,6 +136,7 @@ test_pf_nonblock(int i915)
 	igt_reset_timeout();
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
-- 
2.26.0

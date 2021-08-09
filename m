Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24913899A5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:09:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:05:00 +0200
Message-Id: <20210809130533.27759-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 32/65] tests/gem_mmap_wc: Adopt to use
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_mmap_wc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index abb89b8eb..6dc7bae49 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -459,8 +459,9 @@ test_pf_nonblock(int i915)
 {
 	igt_spin_t *spin;
 	uint32_t *ptr;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
-	spin = igt_spin_new(i915);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	igt_set_timeout(1, "initial pagefaulting did not complete within 1s");
 
@@ -471,6 +472,7 @@ test_pf_nonblock(int i915)
 	igt_reset_timeout();
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
-- 
2.26.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90B189DEA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:42 +0200
Message-Id: <20210810052711.7866-37-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 36/65] tests/gem_unfence_active_buffers:
 Adopt to use allocator
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_unfence_active_buffers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
index 2c9cebb6d..532eed2e7 100644
--- a/tests/i915/gem_unfence_active_buffers.c
+++ b/tests/i915/gem_unfence_active_buffers.c
@@ -69,11 +69,13 @@ igt_simple_main
 {
 	int i915, num_fences;
 	igt_spin_t *spin;
+	uint64_t ahnd;
 
 	i915 = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(i915);
 
-	spin = igt_spin_new(i915);
+	ahnd = get_reloc_ahnd(i915, 0);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	num_fences = gem_available_fences(i915);
 	igt_require(num_fences);
@@ -96,4 +98,5 @@ igt_simple_main
 	}
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
-- 
2.26.0

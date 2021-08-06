Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A616EB9F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:28 +0200
Message-Id: <20210806134145.24634-40-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 39/56] tests/gem_unref_active_buffers:
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_unref_active_buffers.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
index 731190b39..3b8c981da 100644
--- a/tests/i915/gem_unref_active_buffers.c
+++ b/tests/i915/gem_unref_active_buffers.c
@@ -69,11 +69,13 @@ igt_simple_main
 	struct itimerval itv;
 	igt_spin_t *spin;
 	int i915;
+	uint64_t ahnd;
 
 	i915 = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(i915);
 
-	spin = igt_spin_new(i915);
+	ahnd = get_reloc_ahnd(i915, 0);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
 
 	sigaction(SIGALRM, &sa, &old_sa);
@@ -118,4 +120,5 @@ igt_simple_main
 	sigaction(SIGALRM, &old_sa, NULL);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
-- 
2.26.0

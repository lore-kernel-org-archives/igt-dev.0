Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22B36E8B8
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 09:13:41 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 15 Jan 2020 09:13:07 +0000
Message-Id: <20200115091307.2602311-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Drop extended basic mmap testing
 from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Now that we have basic page faulting support (and more) for mmap in
selftests, we don't need the same redundant exercise in BAT.

While these individual tests are quite quick, on some systems such as
fi-kbl-soraka we incur much longer delays between each test; removing
20 tests can easily shorten the BAT runtime by 20s.

References: 6fedafacae1b ("drm/i915/selftests: Wrap vm_mmap() around GEM objects")
References: 9771d5f72966 ("drm/i915/selftests: Extend fault handler selftests to all memory regions")
References: 0658186283ba ("drm/i915/selftests: Compare user mmap against GPU")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 8081446e3..37a92b4e7 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -36,26 +36,7 @@ igt@gem_flink_basic@double-flink
 igt@gem_flink_basic@flink-lifetime
 igt@gem_linear_blits@basic
 igt@gem_mmap@basic
-igt@gem_mmap@basic-small-bo
 igt@gem_mmap_gtt@basic
-igt@gem_mmap_gtt@basic-copy
-igt@gem_mmap_gtt@basic-read
-igt@gem_mmap_gtt@basic-read-no-prefault
-igt@gem_mmap_gtt@basic-read-write
-igt@gem_mmap_gtt@basic-read-write-distinct
-igt@gem_mmap_gtt@basic-short
-igt@gem_mmap_gtt@basic-small-bo
-igt@gem_mmap_gtt@basic-small-bo-tiledx
-igt@gem_mmap_gtt@basic-small-bo-tiledy
-igt@gem_mmap_gtt@basic-small-copy
-igt@gem_mmap_gtt@basic-small-copy-xy
-igt@gem_mmap_gtt@basic-write
-igt@gem_mmap_gtt@basic-write-cpu-read-gtt
-igt@gem_mmap_gtt@basic-write-gtt
-igt@gem_mmap_gtt@basic-write-gtt-no-prefault
-igt@gem_mmap_gtt@basic-write-no-prefault
-igt@gem_mmap_gtt@basic-write-read
-igt@gem_mmap_gtt@basic-write-read-distinct
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
 igt@gem_ringfill@basic-default
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

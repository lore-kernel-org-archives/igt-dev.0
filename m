Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1367B6EE60
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 14:18:26 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 11 Feb 2020 16:18:20 +0200
Message-Id: <20200211141820.29114-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Remove blacklist entries for
 removed tests
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Removed entries in blacklist.txt that no longer match any
tests. Removals of these tests have been done in these commits:

- 5c9dea6487d8 ("tests/gem_hangcheck_forcewake: Drop gem_hangcheck_forcewake.c")
- 31711203f7d6 ("tests/gem_pin: Drop gem_pin.c")
- 4147bab8e3dc ("i915: Drop prefault controls")
- ece35d37e6b0 ("tests/gem_seqno_wrap: Drop gem_seqno_wrap.c")
- 94b866b68d8e ("tests/i915/gem_storedw*: Remove tests")

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/intel-ci/blacklist.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 181c8cd5..f544289b 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -45,28 +45,21 @@ igt@gem_fd_exhaustion(@.*)?
 igt@gem_fence_upload(@.*)?
 igt@gem_gtt_hog(@.*)?
 igt@gem_gtt_speed(@.*)?
-igt@gem_hangcheck_forcewake(@.*)?
 igt@gem_lut_handle(@.*)?
 igt@gem_mmap_gtt@.*(huge|swap|clflush|forked).*
 igt@gem_mmap@.*(swap|huge).*
-igt@gem_pin(@.*)?
 igt@gem_pread_after_blit(@.*)?
 igt@gem_read_read_speed(@.*)?
-igt@gem_reloc_overflow(@.*)?
-igt@gem_reloc_vs_gpu(@.*)?
 igt@gem_render_linear_blits@(?!.*basic).*
 igt@gem_render_tiled_blits@(?!.*basic).*
 igt@gem_reset_stats(@.*)?
 igt@gem_ringfill@(?!.*basic).*
 igt@gem_ring_sync_copy(@.*)?
 igt@gem_ring_sync_loop(@.*)?
-igt@gem_seqno_wrap(@.*)?
 igt@gem_shrink@(?!reclaim$).*
 igt@gem_softpin@.*(hang|S4).*
 igt@gem_spin_batch(@.*)?
 igt@gem_stolen@.*hibernate.*
-igt@gem_storedw_batches_loop(@.*)?
-igt@gem_storedw_loop(@.*)?
 igt@gem_streaming_writes(@.*)?
 igt@gem_sync@(?!.*basic).*
 igt@gem_tiled_swapping@(?!non-threaded).*
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

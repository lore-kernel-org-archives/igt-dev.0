Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 12:04:26 +0000
Message-Id: <20221107120426.22849-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap_offset: use cpu_size in
 always_clear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If we can't fit the buffer in the CPU visible portion of lmem, then the
kernel will be unable to migrate the pages on fault on small-bar
systems.  Note that this doesn't restrict where the pages are allocated,
but should just ensure we don't SIGBUS, if we need to migrate the pages.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7382
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_mmap_offset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 0adeb0b5..b27920de 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -750,7 +750,7 @@ static void always_clear(int i915, const struct gem_memory_region *r, int timeou
 	struct thread_clear arg = {
 		.i915 = i915,
 		.region = r->ci,
-		.max = r->size / 2 >> 12, /* in pages */
+		.max = r->cpu_size / 2 >> 12, /* in pages */
 		.timeout = timeout,
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-- 
2.38.1

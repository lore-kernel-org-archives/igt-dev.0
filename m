Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB0F6EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:46 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:20 -0800
Message-Id: <20191211005235.67897-15-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/29] i915/gem: Omit Linux-specific madvise, mmap,
 and sched flags on non-Linux
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
List-ID: <igt-dev@lists.freedesktop.org>

These various flags are Linux specific and don't have cross
platform equivalents. Accept the different behavior differences on
other platforms for now.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 tests/i915/gem_concurrent_all.c | 7 +++++--
 tests/i915/gem_exec_latency.c   | 5 ++++-
 tests/i915/gem_shrink.c         | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 6486bebf..bee18637 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -1876,8 +1876,11 @@ igt_main
 						pin_sz *= 1024 * 1024;
 
 						if (posix_memalign(&pinned, 4096, pin_sz) ||
-						    mlock(pinned, pin_sz) ||
-						    madvise(pinned, pin_sz, MADV_DONTFORK)) {
+						    mlock(pinned, pin_sz)
+#if defined(__linux__)
+						    || madvise(pinned, pin_sz, MADV_DONTFORK)
+#endif
+						) {
 							free(pinned);
 							pinned = NULL;
 						}
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 3d99182a..111d71bc 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -509,7 +509,10 @@ rthog_latency_on_ring(int fd, unsigned int engine, const char *name, unsigned in
 				{ .sched_priority = 99 };
 
 				ret = sched_setscheduler(0,
-							 SCHED_FIFO | SCHED_RESET_ON_FORK,
+#if defined(__linux__)
+							 SCHED_RESET_ON_FORK |
+#endif
+							 SCHED_FIFO,
 							 &rt);
 				if (ret) {
 					igt_warn("Failed to set scheduling policy!\n");
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 11aa9efc..ff4e3f39 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -272,7 +272,10 @@ static void leak(int fd, uint64_t alloc)
 	char *ptr;
 
 	ptr = mmap(NULL, alloc, PROT_READ | PROT_WRITE,
-		   MAP_ANON | MAP_PRIVATE | MAP_POPULATE,
+#if defined(__linux__)
+		   MAP_POPULATE |
+#endif
+		   MAP_ANON | MAP_PRIVATE,
 		   -1, 0);
 	if (ptr != (char *)-1)
 		return;
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

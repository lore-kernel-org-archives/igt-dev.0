Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 Dec 2020 16:12:30 +0000
Message-Id: <20201230161230.1617083-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_whisper: Replace ring
 selection with engine map
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Provide complete engine coverage by switching from the legacy ring
selection abi into the engine map.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_whisper.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 263db5707..71bd610c6 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -28,7 +28,6 @@
  */
 
 #include "i915/gem.h"
-#include "i915/gem_ring.h"
 #include "igt.h"
 #include "igt_debugfs.h"
 #include "igt_rapl.h"
@@ -177,6 +176,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 	struct drm_i915_gem_exec_object2 tmp[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	unsigned engines[I915_EXEC_RING_MASK + 1];
+	const struct intel_execution_engine2 *e;
 	struct hang hang;
 	int fds[64];
 	uint32_t contexts[64];
@@ -203,14 +203,12 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
-		for_each_physical_ring(e, fd) {
-			if (gem_can_store_dword(fd, eb_ring(e)))
-				engines[nengine++] = eb_ring(e);
+		__for_each_physical_engine(fd, e) {
+			if (gem_class_can_store_dword(fd, e->class))
+				engines[nengine++] = e->flags;
 		}
 	} else {
 		igt_assert(!(flags & ALL));
-		igt_require(gem_has_ring(fd, engine));
-		igt_require(gem_can_store_dword(fd, engine));
 		engines[nengine++] = engine;
 	}
 	igt_require(nengine);
@@ -297,15 +295,17 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 
 		if (flags & CONTEXTS) {
 			for (n = 0; n < 64; n++)
-				contexts[n] = gem_context_create(fd);
+				contexts[n] = gem_context_clone_with_engines(fd, 0);
 		}
 		if (flags & QUEUES) {
 			for (n = 0; n < 64; n++)
 				contexts[n] = gem_queue_create(fd);
 		}
 		if (flags & FDS) {
-			for (n = 0; n < 64; n++)
+			for (n = 0; n < 64; n++) {
 				fds[n] = gem_reopen_driver(fd);
+				gem_context_copy_engines(fd, 0, fds[n], 0);
+			}
 		}
 
 		memset(batches, 0, sizeof(batches));
@@ -553,6 +553,7 @@ igt_main
 		{ "queues-sync", QUEUES | SYNC },
 		{ NULL }
 	};
+	const struct intel_execution_engine2 *e;
 	int fd = -1;
 
 	igt_fixture {
@@ -573,14 +574,18 @@ igt_main
 			whisper(fd, ALL_ENGINES, m->flags | ALL);
 	}
 
-	for (const struct intel_execution_ring *e = intel_execution_rings;
-	     e->name; e++) {
-		for (const struct mode *m = modes; m->name; m++) {
-			if (m->flags & CHAIN)
-				continue;
+	for (const struct mode *m = modes; m->name; m++) {
+		if (m->flags & CHAIN)
+			continue;
+
+		igt_subtest_with_dynamic_f("%s", m->name) {
+			__for_each_physical_engine(fd, e) {
+				if (!gem_class_can_store_dword(fd, e->class))
+					continue;
 
-			igt_subtest_f("%s-%s", e->name, m->name)
-				whisper(fd, eb_ring(e), m->flags);
+				igt_dynamic_f("%s", e->name)
+					whisper(fd, e->flags, m->flags);
+			}
 		}
 	}
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

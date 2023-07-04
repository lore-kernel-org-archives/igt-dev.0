Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773410E0A3
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 21:05:36 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 14:05:30 -0700
Message-Id: <20230704210530.7721-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t] tests/xe/xe_evict: Check for memory
 availability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: thomas.hellstrom@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On systems with low system memory the subtests fail in
various ways including returning -ENOMEM, hanging, etc.
Ensure system has enough memory for the tests, otherwise
skip it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/xe/xe_evict.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 1a70f1b45..d28400f1c 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -454,6 +454,13 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 	return (ALIGN(vram_size, 0x40000000)  * mul) / div;
 }
 
+static bool has_required_memory(uint64_t mem_size, uint64_t vram_size,
+				int num_bos, uint64_t bo_size)
+{
+	/* Assume 1/2 of system memory is available to use */
+	return (mem_size / 2 + vram_size) >= (num_bos * bo_size);
+}
+
 /**
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
@@ -658,12 +665,13 @@ igt_main
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_ENGINE },
 		{ NULL },
 	};
-	uint64_t vram_size;
+	uint64_t mem_size, vram_size;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
+		mem_size = igt_get_total_ram_mb() << 20;
 		vram_size = xe_vram_size(fd, 0);
 		igt_assert(vram_size);
 
@@ -673,25 +681,31 @@ igt_main
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
-			test_evict(-1, hwe, s->n_engines, s->n_execs,
-				   calc_bo_size(vram_size, s->mul, s->div),
-				   s->flags, NULL);
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+
+			igt_require(has_required_memory(mem_size, vram_size, s->n_execs / 2, bo_size));
+			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size, s->flags, NULL);
+		}
 	}
 
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
-			test_evict_cm(-1, hwe, s->n_engines, s->n_execs,
-				      calc_bo_size(vram_size, s->mul, s->div),
-				      s->flags, NULL);
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+
+			igt_require(has_required_memory(mem_size, vram_size, s->n_execs / 2, bo_size));
+			test_evict(-1, hwe, s->n_engines, s->n_execs, bo_size, s->flags, NULL);
+		}
 	}
 
 	for (const struct section_threads *s = sections_threads; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
-			threads(-1, hwe, s->n_threads, s->n_engines,
-				 s->n_execs,
-				 calc_bo_size(vram_size, s->mul, s->div),
-				 s->flags);
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+
+			igt_require(has_required_memory(mem_size, vram_size,
+							s->n_threads * (s->n_execs / 2), bo_size));
+			threads(-1, hwe, s->n_threads, s->n_engines, s->n_execs, bo_size, s->flags);
+		}
 	}
 
 	igt_fixture
-- 
2.21.0.rc0.32.g243a4c7e27

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 30 Mar 2020 10:21:14 +0100
Message-Id: <20200330092117.810776-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] i915/gem_bad_reloc: Reduce negative
 testing
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

The plain negative-reloc tests do no execute anything on the GPU and so
cannot determine if the GPU would fallover, they only exercise the
kernel's placement which is uniform across the engines. We should also
cover the engines with perhaps MI_STORE_DWORD, but for the moment the
solitary exercise of blt remains.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_bad_reloc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 96c9babe6..57efc77c3 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -50,7 +50,7 @@ IGT_TEST_DESCRIPTION("Simulates SNA behaviour using negative self-relocations"
  * than the total size of the GTT), the GPU will hang.
  * See https://bugs.freedesktop.org/show_bug.cgi?id=78533
  */
-static void negative_reloc(int fd, unsigned engine, unsigned flags)
+static void negative_reloc(int fd, unsigned flags)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
@@ -60,7 +60,6 @@ static void negative_reloc(int fd, unsigned engine, unsigned flags)
 	uint64_t *offsets;
 	int i;
 
-	gem_require_ring(fd, engine);
 	igt_require(intel_gen(intel_get_drm_devid(fd)) >= 7);
 
 	memset(&obj, 0, sizeof(obj));
@@ -70,7 +69,7 @@ static void negative_reloc(int fd, unsigned engine, unsigned flags)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = (uintptr_t)&obj;
 	execbuf.buffer_count = 1;
-	execbuf.flags = engine | (flags & USE_LUT);
+	execbuf.flags = flags & USE_LUT;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
 	igt_info("Found offset %lld for 4k batch\n", (long long)obj.offset);
@@ -185,7 +184,6 @@ static void negative_reloc_blt(int fd)
 
 igt_main
 {
-	const struct intel_execution_engine *e;
 	int fd = -1;
 
 	igt_fixture {
@@ -194,13 +192,11 @@ igt_main
 		gem_require_blitter(fd);
 	}
 
-	for (e = intel_execution_engines; e->name; e++) {
-		igt_subtest_f("negative-reloc-%s", e->name)
-			negative_reloc(fd, eb_ring(e), 0);
+	igt_subtest("negative-reloc")
+		negative_reloc(fd, 0);
 
-		igt_subtest_f("negative-reloc-lut-%s", e->name)
-			negative_reloc(fd, eb_ring(e), USE_LUT);
-	}
+	igt_subtest("negative-reloc-lut")
+		negative_reloc(fd, USE_LUT);
 
 	igt_subtest("negative-reloc-bltcopy")
 		negative_reloc_blt(fd);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

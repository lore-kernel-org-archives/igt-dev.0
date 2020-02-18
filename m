Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 18 Feb 2020 17:42:19 +0000
Message-Id: <20200218174219.1301127-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200218122648.1252102-1-chris@chris-wilson.co.uk>
References: <20200218122648.1252102-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Exercise implicit
 ordering between engines
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Check that reads are serialised after a write, and that a subsequent
write is after all reads.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Sravan Kumar Nedunoori <sravan.kumar.nedunoori@intel.com>
---
 tests/i915/gem_exec_schedule.c | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index a20985864..cfd06aa55 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -241,6 +241,61 @@ static void fifo(int fd, unsigned ring)
 	igt_assert_eq_u32(result, 2);
 }
 
+enum implicit_dir {
+	READ_WRITE = 0x1,
+	WRITE_READ = 0x2,
+};
+
+static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
+{
+	IGT_CORK_FENCE(cork);
+	unsigned int count;
+	uint32_t scratch;
+	uint32_t result;
+	int fence;
+
+	count = 0;
+	for_each_physical_engine(other, i915) {
+		if (eb_ring(other) == ring)
+			continue;
+
+		count++;
+	}
+	igt_require(count);
+
+	scratch = gem_create(i915, 4096);
+	fence = igt_cork_plug(&cork, i915);
+
+	if (dir & WRITE_READ)
+		store_dword_fenced(i915, 0,
+				   ring, scratch, 0, -ring,
+				   fence, I915_GEM_DOMAIN_RENDER);
+
+	for_each_physical_engine(other, i915) {
+		if (eb_ring(other) == ring)
+			continue;
+
+		store_dword_fenced(i915, 0,
+				   eb_ring(other), scratch, 0, eb_ring(other),
+				   fence, 0);
+	}
+
+	if (dir & READ_WRITE)
+		store_dword_fenced(i915, 0,
+				   ring, scratch, 0, ring,
+				   fence, I915_GEM_DOMAIN_RENDER);
+
+	unplug_show_queue(i915, &cork, ring);
+	close(fence);
+
+	result =  __sync_read_u32(i915, scratch, 0);
+	gem_close(i915, scratch);
+
+	igt_assert_neq_u32(result, -ring);
+	if (dir & READ_WRITE)
+		igt_assert_eq_u32(result, ring);
+}
+
 static void independent(int fd, unsigned int engine)
 {
 	IGT_CORK_FENCE(cork);
@@ -2042,6 +2097,24 @@ igt_main
 				fifo(fd, eb_ring(e));
 			}
 
+			igt_subtest_f("implicit-read-write-%s", e->name) {
+				igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
+				igt_require(gem_can_store_dword(fd, eb_ring(e)));
+				implicit_rw(fd, eb_ring(e), READ_WRITE);
+			}
+
+			igt_subtest_f("implicit-write-read-%s", e->name) {
+				igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
+				igt_require(gem_can_store_dword(fd, eb_ring(e)));
+				implicit_rw(fd, eb_ring(e), WRITE_READ);
+			}
+
+			igt_subtest_f("implicit-both-%s", e->name) {
+				igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
+				igt_require(gem_can_store_dword(fd, eb_ring(e)));
+				implicit_rw(fd, eb_ring(e), READ_WRITE | WRITE_READ);
+			}
+
 			igt_subtest_f("independent-%s", e->name) {
 				igt_require(gem_ring_has_physical_engine(fd, eb_ring(e)));
 				igt_require(gem_can_store_dword(fd, eb_ring(e)));
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

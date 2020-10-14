Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 14 Oct 2020 11:40:34 +0100
Message-Id: <20201014104038.2554985-6-chris@chris-wilson.co.uk>
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/10] i915/gem_exec_reloc: Continuing the
 trend of checking userptr
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_reloc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index cb1a04b11..fc2bd0a56 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -429,7 +429,7 @@ static unsigned int offset_in_page(void *addr)
 	return (uintptr_t)addr & 4095;
 }
 
-static void active_spin(int fd, unsigned engine)
+static void active_spin(int fd, unsigned engine, unsigned long flags)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_relocation_entry reloc;
@@ -439,7 +439,7 @@ static void active_spin(int fd, unsigned engine)
 
 	spin = igt_spin_new(fd,
 			    .engine = engine,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
+			    .flags = IGT_SPIN_NO_PREEMPTION | flags);
 
 	memset(obj, 0, sizeof(obj));
 	obj[0] = spin->obj[IGT_SPIN_BATCH];
@@ -1266,7 +1266,14 @@ igt_main
 	igt_subtest_with_dynamic("basic-spin") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
-				active_spin(fd, e->flags);
+				active_spin(fd, e->flags, 0);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-spin-user") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active_spin(fd, e->flags, IGT_SPIN_USERPTR);
 		}
 	}
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 14 Feb 2020 13:08:26 +0000
Message-Id: <20200214130826.31004-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/i915/gem_exec_store: remove hard coded
 engine limit
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Prep for having an arbitrary context engine[], since that can be
whatever we like.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_store.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index b74c3d84..eb511696 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -180,25 +180,40 @@ static void store_all(int fd)
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct intel_execution_engine2 *engine;
-	struct drm_i915_gem_relocation_entry reloc[32];
+	struct drm_i915_gem_relocation_entry *reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
-	unsigned engines[16], permuted[16];
+	unsigned *engines, *permuted;
 	uint32_t batch[16];
 	uint64_t offset;
 	unsigned nengine;
 	int value;
 	int i, j;
 
+	nengine = 0;
+	__for_each_physical_engine(fd, engine) {
+		if (!gem_class_can_store_dword(fd, engine->class))
+			continue;
+		nengine++;
+	}
+
+	reloc = calloc(2*nengine, sizeof(*reloc));
+	igt_assert(reloc);
+
+	engines = calloc(nengine, sizeof(*engines));
+	igt_assert(engines);
+
+	permuted = calloc(nengine, sizeof(*permuted));
+	igt_assert(permuted);
+
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 
-	memset(reloc, 0, sizeof(reloc));
 	memset(obj, 0, sizeof(obj));
-	obj[0].handle = gem_create(fd, 4096);
-	obj[1].handle = gem_create(fd, 4096);
+	obj[0].handle = gem_create(fd, nengine*sizeof(uint32_t));
+	obj[1].handle = gem_create(fd, 2*nengine*sizeof(batch));
 	obj[1].relocation_count = 1;
 
 	offset = sizeof(uint32_t);
@@ -224,8 +239,6 @@ static void store_all(int fd)
 		if (!gem_class_can_store_dword(fd, engine->class))
 			continue;
 
-		igt_assert(2*(nengine+1)*sizeof(batch) <= 4096);
-
 		execbuf.flags &= ~ENGINE_MASK;
 		execbuf.flags |= engine->flags;
 
@@ -281,12 +294,16 @@ static void store_all(int fd)
 	}
 	gem_close(fd, obj[1].handle);
 
-	gem_read(fd, obj[0].handle, 0, engines, sizeof(engines));
+	gem_read(fd, obj[0].handle, 0, engines, nengine*sizeof(engines[0]));
 	gem_close(fd, obj[0].handle);
 
 	for (i = 0; i < nengine; i++)
 		igt_assert_eq_u32(engines[i], i);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+
+	free(permuted);
+	free(engines);
+	free(reloc);
 }
 
 static int print_welcome(int fd)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

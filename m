Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 May 2020 14:00:18 +0100
Message-Id: <20200526130018.20163-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] lib: Randomise spinner location to reduce
 relocation risk
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Randomise the position of the spinner to reduce the number of
relocations we might require.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_dummyload.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index a733bd674..776e97baa 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -82,8 +82,21 @@ emit_recursive_batch(igt_spin_t *spin,
 	unsigned int nengine;
 	int fence_fd = -1;
 	uint32_t *cs, *batch;
+	uint32_t addr;
 	int i;
 
+	/*
+	 * Pick a random location for our spinner et al.
+	 *
+	 * If available, the kernel will place our objects in our hinted
+	 * locations and we will avoid having to perform any relocations.
+	 *
+	 * It must be a valid location (or else the kernel will be forced
+	 * to select one for us) and so must be within the GTT and suitably
+	 * aligned. For simplicity, stick to the low 32bit addresses.
+	 */
+	addr = (random() % 1024 + 1024) << 12;
+
 	nengine = 0;
 	if (opts->engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *engine;
@@ -114,6 +127,9 @@ emit_recursive_batch(igt_spin_t *spin,
 	execbuf->buffer_count++;
 	cs = batch;
 
+	obj[BATCH].offset = addr;
+	addr += BATCH_SIZE;
+
 	if (opts->dependency) {
 		igt_assert(!(opts->flags & IGT_SPIN_POLL_RUN));
 
@@ -152,11 +168,13 @@ emit_recursive_batch(igt_spin_t *spin,
 							       spin->poll_handle,
 							       0, 4096,
 							       PROT_READ | PROT_WRITE);
+		addr += 4096; /* guard page */
+		obj[SCRATCH].offset = addr;
+		addr += 4096;
 
 		igt_assert_eq(spin->poll[SPIN_POLL_START_IDX], 0);
 
-		/* batch is first */
-		r->presumed_offset = 4096;
+		r->presumed_offset = obj[SCRATCH].offset;
 		r->target_handle = obj[SCRATCH].handle;
 		r->offset = sizeof(uint32_t) * 1;
 		r->delta = sizeof(uint32_t) * SPIN_POLL_START_IDX;
@@ -231,7 +249,7 @@ emit_recursive_batch(igt_spin_t *spin,
 		spin->condition[0] = 0xffffffff;
 		spin->condition[1] = 0xffffffff;
 
-		r->presumed_offset = 0;
+		r->presumed_offset = obj[BATCH].offset;
 		r->target_handle = obj[BATCH].handle;
 		r->offset = (cs + 2 - batch) * sizeof(*cs);
 		r->read_domains = I915_GEM_DOMAIN_COMMAND;
@@ -239,28 +257,29 @@ emit_recursive_batch(igt_spin_t *spin,
 
 		*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 		*cs++ = MI_BATCH_BUFFER_END;
-		*cs++ = r->delta;
+		*cs++ = r->presumed_offset + r->delta;
 		*cs++ = 0;
 	}
 
 	/* recurse */
 	r = &relocs[obj[BATCH].relocation_count++];
 	r->target_handle = obj[BATCH].handle;
+	r->presumed_offset = obj[BATCH].offset;
 	r->offset = (cs + 1 - batch) * sizeof(*cs);
 	r->read_domains = I915_GEM_DOMAIN_COMMAND;
 	r->delta = LOOP_START_OFFSET;
 	if (gen >= 8) {
 		*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-		*cs++ = r->delta;
+		*cs++ = r->presumed_offset + r->delta;
 		*cs++ = 0;
 	} else if (gen >= 6) {
 		*cs++ = MI_BATCH_BUFFER_START | 1 << 8;
-		*cs++ = r->delta;
+		*cs++ = r->presumed_offset + r->delta;
 	} else {
 		*cs++ = MI_BATCH_BUFFER_START | 2 << 6;
 		if (gen < 4)
 			r->delta |= 1;
-		*cs = r->delta;
+		*cs = r->presumed_offset + r->delta;
 		cs++;
 	}
 	obj[BATCH].relocs_ptr = to_user_pointer(relocs);
-- 
2.27.0.rc0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

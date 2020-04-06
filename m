Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7FF6E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 09:19:25 +0000 (UTC)
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Date: Mon, 6 Apr 2020 09:19:20 +0000
Message-ID: <CA3CE573A55781488FA37084931071AB14DD503F@BGSMSX105.gar.corp.intel.com>
References: <20200406091246.23951-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200406091246.23951-1-arjun.melkaveri@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V2]tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changes and version is continuing of review from 
https://patchwork.freedesktop.org/patch/355243/?series=73955&rev=1 

Thanks 
Arjun M

-----Original Message-----
From: Melkaveri, Arjun <arjun.melkaveri@intel.com> 
Sent: Monday, April 6, 2020 2:43 PM
To: Melkaveri, Arjun <arjun.melkaveri@intel.com>; igt-dev@lists.freedesktop.org
Subject: [PATCH] [PATCH i-g-t][V2]tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available

Replaced the legacy for_each_engine* defines with the ones implemented in the gem_engine_topology library.

Used  gem_context_clone_with_engines
to make sure that engine index was potentially created based on a  default context with engine map configured.

Added gem_reopen_driver and gem_context_copy_engines to transfer the engine map from parent fd default context.

V2:
Added Legacy engine coverage for sync_ring and sync_all.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_sync.c | 566 +++++++++++++++++++++++++-----------------
 1 file changed, 343 insertions(+), 223 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c index 2ef55ecc..8efa0668 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -79,52 +79,56 @@ out:
 }
 
 static void
-sync_ring(int fd, unsigned ring, int num_children, int timeout)
+sync_ring(int fd, const struct intel_execution_engine2 *e,
+	  int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 
 		num_children *= num_engines;
 	} else {
-		gem_require_ring(fd, ring);
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
+		int i915;
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double start, elapsed;
 		unsigned long cycles;
 
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = gem_create(i915, 4096);
+		gem_write(i915, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = engines[child % num_engines];
-		gem_execbuf(fd, &execbuf);
-		gem_sync(fd, object.handle);
+		gem_execbuf(i915, &execbuf);
+		gem_sync(i915, object.handle);
 
 		start = gettime();
 		cycles = 0;
 		do {
 			do {
-				gem_execbuf(fd, &execbuf);
-				gem_sync(fd, object.handle);
+				gem_execbuf(i915, &execbuf);
+				gem_sync(i915, object.handle);
 			} while (++cycles & 1023);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n", @@ -132,14 +136,14 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 			 names[child % num_engines] ? " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
-		gem_close(fd, object.handle);
+		gem_close(i915, object.handle);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);  }
 
 static void
-idle_ring(int fd, unsigned ring, int timeout)
+idle_ring(int fd, const struct intel_execution_engine2 *e, int timeout)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object; @@ -147,7 +151,6 @@ idle_ring(int fd, unsigned ring, int timeout)
 	double start, elapsed;
 	unsigned long cycles;
 
-	gem_require_ring(fd, ring);
 
 	memset(&object, 0, sizeof(object));
 	object.handle = gem_create(fd, 4096);
@@ -156,7 +159,7 @@ idle_ring(int fd, unsigned ring, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&object);
 	execbuf.buffer_count = 1;
-	execbuf.flags = ring;
+	execbuf.flags = e->flags;
 	gem_execbuf(fd, &execbuf);
 	gem_sync(fd, object.handle);
 
@@ -178,32 +181,34 @@ idle_ring(int fd, unsigned ring, int timeout)  }
 
 static void
-wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
+wakeup_ring(int fd, const struct intel_execution_engine2 *e,
+	    int timeout, int wlen)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 		igt_require(num_engines);
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
+		igt_require(gem_class_can_store_dword(fd, e->class));
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_engines) {
+		int i915;
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf; @@ -211,9 +216,11 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		unsigned long cycles;
 		igt_spin_t *spin;
 
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = gem_create(i915, 4096);
+		gem_write(i915, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object); @@ -226,10 +233,10 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 						IGT_SPIN_FAST));
 		igt_assert(igt_spin_has_poll(spin));
 
-		gem_execbuf(fd, &execbuf);
+		gem_execbuf(i915, &execbuf);
 
 		igt_spin_end(spin);
-		gem_sync(fd, object.handle);
+		gem_sync(i915, object.handle);
 
 		for (int warmup = 0; warmup <= 1; warmup++) {
 			end = gettime() + timeout/10.;
@@ -238,12 +245,12 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			do {
 				igt_spin_reset(spin);
 
-				gem_execbuf(fd, &spin->execbuf);
+				gem_execbuf(i915, &spin->execbuf);
 				igt_spin_busywait_until_started(spin);
 
 				this = gettime();
 				igt_spin_end(spin);
-				gem_sync(fd, spin->handle);
+				gem_sync(i915, spin->handle);
 				now = gettime();
 
 				elapsed += now - this;
@@ -262,15 +269,15 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		do {
 			igt_spin_reset(spin);
 
-			gem_execbuf(fd, &spin->execbuf);
+			gem_execbuf(i915, &spin->execbuf);
 			igt_spin_busywait_until_started(spin);
 
 			for (int n = 0; n < wlen; n++)
-				gem_execbuf(fd, &execbuf);
+				gem_execbuf(i915, &execbuf);
 
 			this = gettime();
 			igt_spin_end(spin);
-			gem_sync(fd, object.handle);
+			gem_sync(i915, object.handle);
 			now = gettime();
 
 			elapsed += now - this;
@@ -283,49 +290,53 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			 names[child % num_engines] ? " c" : "C",
 			 cycles, 1e6*baseline, elapsed*1e6/cycles);
 
-		igt_spin_free(fd, spin);
-		gem_close(fd, object.handle);
+		igt_spin_free(i915, spin);
+		gem_close(i915, object.handle);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);  }
 
-static void active_ring(int fd, unsigned ring, int timeout)
+static void active_ring(int fd, const struct intel_execution_engine2 *e,
+			int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 		igt_require(num_engines);
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
+		igt_require(gem_class_can_store_dword(fd, e->class));
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_engines) {
+		int i915;
 		double start, end, elapsed;
 		unsigned long cycles;
 		igt_spin_t *spin[2];
 
-		spin[0] = __igt_spin_new(fd,
-					 .engine = ring,
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
+		spin[0] = __igt_spin_new(i915,
+					 .engine = e->flags,
 					 .flags = IGT_SPIN_FAST);
 
-		spin[1] = __igt_spin_new(fd,
-					 .engine = ring,
+		spin[1] = __igt_spin_new(i915,
+					 .engine = e->flags,
 					 .flags = IGT_SPIN_FAST);
 
 		start = gettime();
@@ -336,16 +347,16 @@ static void active_ring(int fd, unsigned ring, int timeout)
 				igt_spin_t *s = spin[loop & 1];
 
 				igt_spin_end(s);
-				gem_sync(fd, s->handle);
+				gem_sync(i915, s->handle);
 
 				igt_spin_reset(s);
 
-				gem_execbuf(fd, &s->execbuf);
+				gem_execbuf(i915, &s->execbuf);
 			}
 			cycles += 1024;
 		} while ((elapsed = gettime()) < end);
-		igt_spin_free(fd, spin[1]);
-		igt_spin_free(fd, spin[0]);
+		igt_spin_free(i915, spin[1]);
+		igt_spin_free(i915, spin[0]);
 
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
 			 names[child % num_engines] ?: "",
@@ -357,32 +368,34 @@ static void active_ring(int fd, unsigned ring, int timeout)  }
 
 static void
-active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
+active_wakeup_ring(int fd, const struct intel_execution_engine2 *e,
+		   int timeout, int wlen)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 		igt_require(num_engines);
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
+		igt_require(gem_class_can_store_dword(fd, e->class));
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_engines) {
+		int i915;
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf; @@ -390,36 +403,38 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		unsigned long cycles;
 		igt_spin_t *spin[2];
 
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = gem_create(i915, 4096);
+		gem_write(i915, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = engines[child % num_engines];
 
-		spin[0] = __igt_spin_new(fd,
+		spin[0] = __igt_spin_new(i915,
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
 		igt_assert(igt_spin_has_poll(spin[0]));
 
-		spin[1] = __igt_spin_new(fd,
+		spin[1] = __igt_spin_new(i915,
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
 
-		gem_execbuf(fd, &execbuf);
+		gem_execbuf(i915, &execbuf);
 
 		igt_spin_end(spin[1]);
 		igt_spin_end(spin[0]);
-		gem_sync(fd, object.handle);
+		gem_sync(i915, object.handle);
 
 		for (int warmup = 0; warmup <= 1; warmup++) {
 			igt_spin_reset(spin[0]);
 
-			gem_execbuf(fd, &spin[0]->execbuf);
+			gem_execbuf(i915, &spin[0]->execbuf);
 
 			end = gettime() + timeout/10.;
 			elapsed = 0;
@@ -429,11 +444,11 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 
 				igt_spin_reset(spin[1]);
 
-				gem_execbuf(fd, &spin[1]->execbuf);
+				gem_execbuf(i915, &spin[1]->execbuf);
 
 				this = gettime();
 				igt_spin_end(spin[0]);
-				gem_sync(fd, spin[0]->handle);
+				gem_sync(i915, spin[0]->handle);
 				now = gettime();
 
 				elapsed += now - this;
@@ -450,7 +465,7 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 
 		igt_spin_reset(spin[0]);
 
-		gem_execbuf(fd, &spin[0]->execbuf);
+		gem_execbuf(i915, &spin[0]->execbuf);
 
 		end = gettime() + timeout;
 		elapsed = 0;
@@ -459,15 +474,15 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			igt_spin_busywait_until_started(spin[0]);
 
 			for (int n = 0; n < wlen; n++)
-				gem_execbuf(fd, &execbuf);
+				gem_execbuf(i915, &execbuf);
 
 			igt_spin_reset(spin[1]);
 
-			gem_execbuf(fd, &spin[1]->execbuf);
+			gem_execbuf(i915, &spin[1]->execbuf);
 
 			this = gettime();
 			igt_spin_end(spin[0]);
-			gem_sync(fd, object.handle);
+			gem_sync(i915, object.handle);
 			now = gettime();
 
 			elapsed += now - this;
@@ -482,43 +497,45 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			 names[child % num_engines] ? " c" : "C",
 			 cycles, 1e6*baseline, elapsed*1e6/cycles);
 
-		igt_spin_free(fd, spin[1]);
-		igt_spin_free(fd, spin[0]);
-		gem_close(fd, object.handle);
+		igt_spin_free(i915, spin[1]);
+		igt_spin_free(i915, spin[0]);
+		gem_close(i915, object.handle);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);  }
 
 static void
-store_ring(int fd, unsigned ring, int num_children, int timeout)
+store_ring(int fd, const struct intel_execution_engine2 *e,
+	   int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 
 		num_children *= num_engines;
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
+		igt_require(gem_class_can_store_dword(fd, e->class));
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
+		int i915;
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object[2];
 		struct drm_i915_gem_relocation_entry reloc[1024]; @@ -527,6 +544,8 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 		unsigned long cycles;
 		uint32_t *batch, *b;
 
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(object);
 		execbuf.flags = engines[child % num_engines]; @@ -536,20 +555,20 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 			execbuf.flags |= I915_EXEC_SECURE;
 
 		memset(object, 0, sizeof(object));
-		object[0].handle = gem_create(fd, 4096);
-		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
+		object[0].handle = gem_create(i915, 4096);
+		gem_write(i915, object[0].handle, 0, &bbe, sizeof(bbe));
 		execbuf.buffer_count = 1;
-		gem_execbuf(fd, &execbuf);
+		gem_execbuf(i915, &execbuf);
 
 		object[0].flags |= EXEC_OBJECT_WRITE;
-		object[1].handle = gem_create(fd, 20*1024);
+		object[1].handle = gem_create(i915, 20*1024);
 
 		object[1].relocs_ptr = to_user_pointer(reloc);
 		object[1].relocation_count = 1024;
 
-		batch = gem_mmap__cpu(fd, object[1].handle, 0, 20*1024,
+		batch = gem_mmap__cpu(i915, object[1].handle, 0, 20*1024,
 				PROT_WRITE | PROT_READ);
-		gem_set_domain(fd, object[1].handle,
+		gem_set_domain(i915, object[1].handle,
 				I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 
 		memset(reloc, 0, sizeof(reloc));
@@ -582,15 +601,15 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 		igt_assert((b - batch)*sizeof(uint32_t) < 20*1024);
 		munmap(batch, 20*1024);
 		execbuf.buffer_count = 2;
-		gem_execbuf(fd, &execbuf);
-		gem_sync(fd, object[1].handle);
+		gem_execbuf(i915, &execbuf);
+		gem_sync(i915, object[1].handle);
 
 		start = gettime();
 		cycles = 0;
 		do {
 			do {
-				gem_execbuf(fd, &execbuf);
-				gem_sync(fd, object[1].handle);
+				gem_execbuf(i915, &execbuf);
+				gem_sync(i915, object[1].handle);
 			} while (++cycles & 1023);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n", @@ -598,16 +617,18 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 			 names[child % num_engines] ? " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
-		gem_close(fd, object[1].handle);
-		gem_close(fd, object[0].handle);
+		gem_close(i915, object[1].handle);
+		gem_close(i915, object[0].handle);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);  }
 
 static void
-switch_ring(int fd, unsigned ring, int num_children, int timeout)
+switch_ring(int fd, const struct intel_execution_engine2 *e,
+	    int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	const char *names[16];
@@ -615,27 +636,28 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 
 	gem_require_contexts(fd);
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 
 		num_children *= num_engines;
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
+		igt_require(gem_class_can_store_dword(fd, e->class));
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
+		int i915;
+		uint32_t ctx;
 		struct context {
 			struct drm_i915_gem_exec_object2 object[2];
 			struct drm_i915_gem_relocation_entry reloc[1024]; @@ -643,7 +665,13 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 		} contexts[2];
 		double elapsed, baseline;
 		unsigned long cycles;
-
+		/*
+		 * Ensure the gpu is idle by launching
+		 * nop execbuf and stalling for it.
+		 */
+		i915 = gem_reopen_driver(fd);
+		ctx = gem_context_create(fd);
+		gem_context_copy_engines(fd, 0, i915, ctx);
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
 			const uint32_t bbe = MI_BATCH_BUFFER_END;
 			const uint32_t sz = 32 << 10;
@@ -657,23 +685,23 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			c->execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 			if (gen < 6)
 				c->execbuf.flags |= I915_EXEC_SECURE;
-			c->execbuf.rsvd1 = gem_context_create(fd);
+			c->execbuf.rsvd1 = ctx;
 
 			memset(c->object, 0, sizeof(c->object));
-			c->object[0].handle = gem_create(fd, 4096);
-			gem_write(fd, c->object[0].handle, 0, &bbe, sizeof(bbe));
+			c->object[0].handle = gem_create(i915, 4096);
+			gem_write(i915, c->object[0].handle, 0, &bbe, sizeof(bbe));
 			c->execbuf.buffer_count = 1;
-			gem_execbuf(fd, &c->execbuf);
+			gem_execbuf(i915, &c->execbuf);
 
 			c->object[0].flags |= EXEC_OBJECT_WRITE;
-			c->object[1].handle = gem_create(fd, sz);
+			c->object[1].handle = gem_create(i915, sz);
 
 			c->object[1].relocs_ptr = to_user_pointer(c->reloc);
 			c->object[1].relocation_count = 1024 * i;
 
-			batch = gem_mmap__cpu(fd, c->object[1].handle, 0, sz,
+			batch = gem_mmap__cpu(i915, c->object[1].handle, 0, sz,
 					PROT_WRITE | PROT_READ);
-			gem_set_domain(fd, c->object[1].handle,
+			gem_set_domain(i915, c->object[1].handle,
 					I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 
 			memset(c->reloc, 0, sizeof(c->reloc)); @@ -707,8 +735,8 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			igt_assert((b - batch)*sizeof(uint32_t) < sz);
 			munmap(batch, sz);
 			c->execbuf.buffer_count = 2;
-			gem_execbuf(fd, &c->execbuf);
-			gem_sync(fd, c->object[1].handle);
+			gem_execbuf(i915, &c->execbuf);
+			gem_sync(i915, c->object[1].handle);
 		}
 
 		cycles = 0;
@@ -717,12 +745,12 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			do {
 				double this;
 
-				gem_execbuf(fd, &contexts[1].execbuf);
-				gem_execbuf(fd, &contexts[0].execbuf);
+				gem_execbuf(i915, &contexts[1].execbuf);
+				gem_execbuf(i915, &contexts[0].execbuf);
 
 				this = gettime();
-				gem_sync(fd, contexts[1].object[1].handle);
-				gem_sync(fd, contexts[0].object[1].handle);
+				gem_sync(i915, contexts[1].object[1].handle);
+				gem_sync(i915, contexts[0].object[1].handle);
 				baseline += gettime() - this;
 			} while (++cycles & 1023);
 		}
@@ -734,14 +762,14 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			do {
 				double this;
 
-				gem_execbuf(fd, &contexts[1].execbuf);
-				gem_execbuf(fd, &contexts[0].execbuf);
+				gem_execbuf(i915, &contexts[1].execbuf);
+				gem_execbuf(i915, &contexts[0].execbuf);
 
 				this = gettime();
-				gem_sync(fd, contexts[0].object[1].handle);
+				gem_sync(i915, contexts[0].object[1].handle);
 				elapsed += gettime() - this;
 
-				gem_sync(fd, contexts[1].object[1].handle);
+				gem_sync(i915, contexts[1].object[1].handle);
 			} while (++cycles & 1023);
 		}
 		elapsed /= cycles;
@@ -752,9 +780,9 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			 cycles, elapsed*1e6, baseline*1e6);
 
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
-			gem_close(fd, contexts[i].object[1].handle);
-			gem_close(fd, contexts[i].object[0].handle);
-			gem_context_destroy(fd, contexts[i].execbuf.rsvd1);
+			gem_close(i915, contexts[i].object[1].handle);
+			gem_close(i915, contexts[i].object[0].handle);
+			gem_context_destroy(i915, contexts[i].execbuf.rsvd1);
 		}
 	}
 	igt_waitchildren_timeout(timeout+10, NULL); @@ -803,7 +831,8 @@ static void *waiter(void *arg)  }
 
 static void
-__store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
+__store_many(int fd, const struct intel_execution_engine2 *e,
+	     int timeout, unsigned long *cycles)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END; @@ -817,7 +846,7 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(object);
-	execbuf.flags = ring;
+	execbuf.flags = e->flags;
 	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
 	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 	if (gen < 6)
@@ -931,8 +960,9 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)  }
 
 static void
-store_many(int fd, unsigned ring, int timeout)
+store_many(int fd, const struct intel_execution_engine2 *e, int 
+timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned long *shared;
 	const char *names[16];
 	int n = 0;
@@ -942,24 +972,23 @@ store_many(int fd, unsigned ring, int timeout)
 
 	intel_detect_and_clear_missed_interrupts(fd);
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
 			igt_fork(child, 1)
 				__store_many(fd,
-					     eb_ring(e),
+					     e2,
 					     timeout,
 					     &shared[n]);
 
-			names[n++] = e->name;
+			names[n++] = e2->name;
 		}
 		igt_waitchildren();
 	} else {
-		gem_require_ring(fd, ring);
-		igt_require(gem_can_store_dword(fd, ring));
-		__store_many(fd, ring, timeout, &shared[n]);
+		igt_require(gem_class_can_store_dword(fd, e->class));
+		__store_many(fd, e, timeout, &shared[n]);
 		names[n++] = NULL;
 	}
 
@@ -1025,15 +1054,16 @@ sync_all(int fd, int num_children, int timeout)  static void  store_all(int fd, int num_children, int timeout)  {
+	const struct intel_execution_engine2 *e;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	int num_engines = 0;
 
-	for_each_physical_engine(e, fd) {
-		if (!gem_can_store_dword(fd, eb_ring(e)))
+	__for_each_physical_engine(fd, e) {
+		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
-		engines[num_engines++] = eb_ring(e);
+		engines[num_engines++] = e->flags;
 		if (num_engines == ARRAY_SIZE(engines))
 			break;
 	}
@@ -1041,6 +1071,7 @@ store_all(int fd, int num_children, int timeout)
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
+		int i915;
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object[2];
 		struct drm_i915_gem_relocation_entry reloc[1024]; @@ -1049,6 +1080,8 @@ store_all(int fd, int num_children, int timeout)
 		unsigned long cycles;
 		uint32_t *batch, *b;
 
+		i915 = gem_reopen_driver(fd);
+		gem_context_copy_engines(fd, 0, i915, 0);
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(object);
 		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC; @@ -1057,20 +1090,20 @@ store_all(int fd, int num_children, int timeout)
 			execbuf.flags |= I915_EXEC_SECURE;
 
 		memset(object, 0, sizeof(object));
-		object[0].handle = gem_create(fd, 4096);
-		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
+		object[0].handle = gem_create(i915, 4096);
+		gem_write(i915, object[0].handle, 0, &bbe, sizeof(bbe));
 		execbuf.buffer_count = 1;
-		gem_execbuf(fd, &execbuf);
+		gem_execbuf(i915, &execbuf);
 
 		object[0].flags |= EXEC_OBJECT_WRITE;
-		object[1].handle = gem_create(fd, 1024*16 + 4096);
+		object[1].handle = gem_create(i915, 1024*16 + 4096);
 
 		object[1].relocs_ptr = to_user_pointer(reloc);
 		object[1].relocation_count = 1024;
 
-		batch = gem_mmap__cpu(fd, object[1].handle, 0, 16*1024 + 4096,
+		batch = gem_mmap__cpu(i915, object[1].handle, 0, 16*1024 + 4096,
 				PROT_WRITE | PROT_READ);
-		gem_set_domain(fd, object[1].handle,
+		gem_set_domain(i915, object[1].handle,
 				I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 
 		memset(reloc, 0, sizeof(reloc));
@@ -1103,8 +1136,8 @@ store_all(int fd, int num_children, int timeout)
 		igt_assert((b - batch)*sizeof(uint32_t) < 20*1024);
 		munmap(batch, 16*1024+4096);
 		execbuf.buffer_count = 2;
-		gem_execbuf(fd, &execbuf);
-		gem_sync(fd, object[1].handle);
+		gem_execbuf(i915, &execbuf);
+		gem_sync(i915, object[1].handle);
 
 		start = gettime();
 		cycles = 0;
@@ -1114,101 +1147,104 @@ store_all(int fd, int num_children, int timeout)
 				for (int n = 0; n < num_engines; n++) {
 					execbuf.flags &= ~ENGINE_MASK;
 					execbuf.flags |= engines[n];
-					gem_execbuf(fd, &execbuf);
+					gem_execbuf(i915, &execbuf);
 				}
-				gem_sync(fd, object[1].handle);
+				gem_sync(i915, object[1].handle);
 			} while (++cycles & 1023);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("Completed %ld cycles: %.3f us\n",
 			 cycles, elapsed*1e6/cycles);
 
-		gem_close(fd, object[1].handle);
-		gem_close(fd, object[0].handle);
+		gem_close(i915, object[1].handle);
+		gem_close(i915, object[0].handle);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);  }
 
 static void
-preempt(int fd, unsigned ring, int num_children, int timeout)
+preempt(int fd, const struct intel_execution_engine2 *e,
+	int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
-	uint32_t ctx[2];
 
-	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+	if (!e) {
+		__for_each_physical_engine(fd, e2) {
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
 
 		num_children *= num_engines;
 	} else {
-		gem_require_ring(fd, ring);
 		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		engines[num_engines++] = e->flags;
 	}
 
-	ctx[0] = gem_context_create(fd);
-	gem_context_set_priority(fd, ctx[0], MIN_PRIO);
-
-	ctx[1] = gem_context_create(fd);
-	gem_context_set_priority(fd, ctx[1], MAX_PRIO);
-
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
+		int i915;
+		uint32_t ctx[2];
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 		struct drm_i915_gem_exec_object2 object;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double start, elapsed;
 		unsigned long cycles;
 
+		i915 = gem_reopen_driver(fd);
+		ctx[1] = gem_context_clone_with_engines(fd, 0);
+		gem_context_set_priority(fd, ctx[1], MAX_PRIO);
+		gem_context_copy_engines(fd, 0, i915, ctx[1]);
 		memset(&object, 0, sizeof(object));
-		object.handle = gem_create(fd, 4096);
-		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
+		object.handle = gem_create(i915, 4096);
+		gem_write(i915, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = engines[child % num_engines];
 		execbuf.rsvd1 = ctx[1];
-		gem_execbuf(fd, &execbuf);
-		gem_sync(fd, object.handle);
-
+		gem_execbuf(i915, &execbuf);
+		gem_sync(i915, object.handle);
+		ctx[0] = gem_context_clone_with_engines(fd, 0);
+		gem_context_set_priority(fd, ctx[0], MIN_PRIO);
+		gem_context_copy_engines(fd, 0, i915, ctx[0]);
 		start = gettime();
 		cycles = 0;
 		do {
 			igt_spin_t *spin =
-				__igt_spin_new(fd,
+				__igt_spin_new(i915,
 					       .ctx = ctx[0],
 					       .engine = execbuf.flags);
 
 			do {
-				gem_execbuf(fd, &execbuf);
-				gem_sync(fd, object.handle);
+				gem_execbuf(i915, &execbuf);
+				gem_sync(i915, object.handle);
 			} while (++cycles & 1023);
 
-			igt_spin_free(fd, spin);
+			igt_spin_free(i915, spin);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
 			 names[child % num_engines] ?: "",
 			 names[child % num_engines] ? " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
-		gem_close(fd, object.handle);
+		gem_context_destroy(i915, ctx[1]);
+		gem_context_destroy(i915, ctx[0]);
+		gem_close(i915, object.handle);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
-	gem_context_destroy(fd, ctx[1]);
-	gem_context_destroy(fd, ctx[0]);
 }
 
 igt_main
 {
+	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_engine *e;
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	int fd = -1;
@@ -1222,55 +1258,138 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	/* Legacy testing must be first. */
 	for (e = intel_execution_engines; e->name; e++) {
-		igt_subtest_f("%s", e->name)
-			sync_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("idle-%s", e->name)
-			idle_ring(fd, eb_ring(e), 20);
-		igt_subtest_f("active-%s", e->name)
-			active_ring(fd, eb_ring(e), 20);
-		igt_subtest_f("wakeup-%s", e->name)
-			wakeup_ring(fd, eb_ring(e), 20, 1);
-		igt_subtest_f("active-wakeup-%s", e->name)
-			active_wakeup_ring(fd, eb_ring(e), 20, 1);
-		igt_subtest_f("double-wakeup-%s", e->name)
-			wakeup_ring(fd, eb_ring(e), 20, 2);
-		igt_subtest_f("store-%s", e->name)
-			store_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("switch-%s", e->name)
-			switch_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("forked-switch-%s", e->name)
-			switch_ring(fd, eb_ring(e), ncpus, 20);
-		igt_subtest_f("many-%s", e->name)
-			store_many(fd, eb_ring(e), 20);
-		igt_subtest_f("forked-%s", e->name)
-			sync_ring(fd, eb_ring(e), ncpus, 20);
-		igt_subtest_f("forked-store-%s", e->name)
-			store_ring(fd, eb_ring(e), ncpus, 20);
+		struct intel_execution_engine2 e2__;
+
+		e2__ = gem_eb_flags_to_engine(eb_ring(e));
+		if (e2__.flags == -1)
+			continue;
+		e2 = &e2__;
+
+		igt_subtest_f("legacy_%s", e->name)
+			sync_ring(fd, e2, 1, 20);
+
+	}
+
+	igt_subtest_with_dynamic("basic_sync_ring") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				sync_ring(fd, e2, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("idle") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				idle_ring(fd, e2, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("active") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				active_ring(fd, e2, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				wakeup_ring(fd, e2, 150, 1);
+		}
+	}
+
+	igt_subtest_with_dynamic("active-wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				active_wakeup_ring(fd, e2, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("double-wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				wakeup_ring(fd, e2, 20, 2);
+		}
+	}
+
+	igt_subtest_with_dynamic("store") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_ring(fd, e2, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("switch") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				switch_ring(fd, e2, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked-switch") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				switch_ring(fd, e2, ncpus, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("many") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_many(fd, e2, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				sync_ring(fd, e2, ncpus, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked-store") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_ring(fd, e2, ncpus, 20);
+		}
 	}
 
 	igt_subtest("basic-each")
-		sync_ring(fd, ALL_ENGINES, 1, 2);
+		sync_ring(fd, NULL, 1, 2);
 	igt_subtest("basic-store-each")
-		store_ring(fd, ALL_ENGINES, 1, 2);
+		store_ring(fd, NULL, 1, 2);
 	igt_subtest("basic-many-each")
-		store_many(fd, ALL_ENGINES, 2);
+		store_many(fd, NULL, 2);
 	igt_subtest("switch-each")
-		switch_ring(fd, ALL_ENGINES, 1, 20);
+		switch_ring(fd, NULL, 1, 20);
 	igt_subtest("forked-switch-each")
-		switch_ring(fd, ALL_ENGINES, ncpus, 20);
+		switch_ring(fd, NULL, ncpus, 20);
 	igt_subtest("forked-each")
-		sync_ring(fd, ALL_ENGINES, ncpus, 20);
+		sync_ring(fd, NULL, ncpus, 20);
 	igt_subtest("forked-store-each")
-		store_ring(fd, ALL_ENGINES, ncpus, 20);
+		store_ring(fd, NULL, ncpus, 20);
 	igt_subtest("active-each")
-		active_ring(fd, ALL_ENGINES, 20);
+		active_ring(fd, NULL, 20);
 	igt_subtest("wakeup-each")
-		wakeup_ring(fd, ALL_ENGINES, 20, 1);
+		wakeup_ring(fd, NULL, 20, 1);
 	igt_subtest("active-wakeup-each")
-		active_wakeup_ring(fd, ALL_ENGINES, 20, 1);
+		active_wakeup_ring(fd, NULL, 20, 1);
 	igt_subtest("double-wakeup-each")
-		wakeup_ring(fd, ALL_ENGINES, 20, 2);
+		wakeup_ring(fd, NULL, 20, 2);
 
 	igt_subtest("basic-all")
 		sync_all(fd, 1, 2);
@@ -1294,14 +1413,15 @@ igt_main
 		}
 
 		igt_subtest("preempt-all")
-			preempt(fd, ALL_ENGINES, 1, 20);
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("preempt-%s", e->name)
-				preempt(fd, eb_ring(e), ncpus, 20);
+			preempt(fd, NULL, 1, 20);
+		igt_subtest_with_dynamic("preempt") {
+			__for_each_physical_engine(fd, e2) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+				igt_dynamic_f("%s", e2->name)
+					preempt(fd, e2, ncpus, 20);
+			}
 		}
 	}
-
 	igt_fixture {
 		igt_stop_hang_detector();
 		close(fd);
--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

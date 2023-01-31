Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 31 Jan 2023 10:17:30 +0100
Message-Id: <20230131091731.5892-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/perf: Stress opening of new perf
 streams against existing contexts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Try opening the perf stream while there is a flurry of activity on the
system, both new and old contexts. This will exercise the ability of the
driver to modify those contexts to work with perf.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 tests/i915/perf.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index dd1f1ac399..e33cacc443 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4885,6 +4885,71 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
+static void test_open_race(const struct intel_execution_engine2 *e, int timeout)
+{
+	int *done;
+
+	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(done != MAP_FAILED);
+
+	igt_fork(child, 1) {
+		uint64_t properties[] = {
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+			DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC,
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+		unsigned long count = 0;
+
+		do {
+			__perf_close(__perf_open(drm_fd, &param, false));
+			count++;
+		} while (!READ_ONCE(*done));
+
+		igt_info("Completed %lu cycles\n", count);
+	}
+
+	for (int persistence = 0; persistence <= 1; persistence++) {
+		igt_fork(child, sysconf(_SC_NPROCESSORS_ONLN)) {
+			int i915 = gem_reopen_driver(drm_fd);
+
+			do {
+				igt_spin_t *spin;
+				uint64_t ahnd;
+				uint32_t ctx;
+
+				ctx = gem_context_create_for_engine(i915, e->class, e->instance);
+				gem_context_set_persistence(i915, ctx, persistence);
+
+				spin = __igt_spin_new(i915, ctx, .ahnd = ahnd);
+				for (int i = random() % 7; i--; ) {
+					if (random() & 1) {
+						igt_spin_end(spin);
+						gem_sync(i915, spin->handle);
+						igt_spin_reset(spin);
+					}
+					gem_execbuf(i915, &spin->execbuf);
+				}
+
+				gem_context_destroy(i915, ctx);
+				igt_spin_free(i915, spin);
+				put_ahnd(ahnd);
+			} while (!READ_ONCE(*done));
+		}
+	}
+
+	sleep(timeout);
+	*done = 1;
+	igt_waitchildren();
+
+	munmap(done, 4096);
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -5259,6 +5324,15 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
+	igt_subtest_with_dynamic("open-race") {
+		const struct intel_execution_engine2 *e;
+
+		for_each_physical_engine(drm_fd, e)
+			if (e->class == I915_ENGINE_CLASS_RENDER)
+				igt_dynamic_f("%s", e->name)
+					test_open_race(e, 5);
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
-- 
2.25.1

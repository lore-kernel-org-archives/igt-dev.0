Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri, 14 Jan 2022 10:17:12 -0800
Message-Id: <20220114181713.1798514-15-John.C.Harrison@Intel.com>
In-Reply-To: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
References: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 i-g-t 14/15] tests/i915/i915_hangman: Configure
 engine properties for quicker hangs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some platforms have very long timeouts configured for some engines.
Some have them disabled completely. That makes for a very slow (or
broken) hangman test. So explicitly configure the engines to have
reasonable settings first.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/i915_hangman.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index e661b8ad0..23055c271 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -496,8 +496,12 @@ igt_main
 {
 	const intel_ctx_t *ctx;
 	igt_hang_t hang = {};
+	struct gem_engine_properties saved_params[GEM_MAX_ENGINES];
+	int num_engines = 0;
 
 	igt_fixture {
+		const struct intel_execution_engine2 *e;
+
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 
@@ -511,6 +515,13 @@ igt_main
 		igt_require(has_error_state(sysfs));
 
 		gem_require_mmap_device_coherent(device);
+
+		for_each_physical_engine(device, e) {
+			saved_params[num_engines].engine = e;
+			saved_params[num_engines].preempt_timeout = 500;
+			saved_params[num_engines].heartbeat_interval = 1000;
+			gem_engine_properties_configure(device, saved_params + num_engines++);
+		}
 	}
 
 	igt_describe("Basic error capture");
@@ -542,6 +553,11 @@ igt_main
 	do_tests("engine", "engine", ctx);
 
 	igt_fixture {
+		int i;
+
+		for (i = 0; i < num_engines; i++)
+			gem_engine_properties_restore(device, saved_params + i);
+
 		igt_disallow_hang(device, hang);
 		intel_ctx_destroy(device, ctx);
 		close(device);
-- 
2.25.1

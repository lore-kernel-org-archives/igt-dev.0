Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Dale B Stimson <dale.b.stimson@intel.com>
Date: Tue, 28 Jan 2020 10:47:43 -0800
Message-Id: <602b092503019eb09ce7299eaafcac11d2afdd33.1580236781.git.dale.b.stimson@intel.com>
In-Reply-To: <ad6ab29b3bde2a85d2dd6666fe5e6b06e404c2c8.1580236781.git.dale.b.stimson@intel.com>
References: <cover.1580236781.git.dale.b.stimson@intel.com>
 <ad6ab29b3bde2a85d2dd6666fe5e6b06e404c2c8.1580236781.git.dale.b.stimson@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/2] i915/gem_ctx_isolation:
 gem_engine_topology, part 2
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Switch from the existing engine iteration to using macro
__for_each_physical_engine which all engines that are actually present.

The invocation of __for_each_physical_engine sets the engine mapping
for context 0 to be all existing engines.  Subsequent context creation
is done via gem_context_clone_with_engines so that all contexts share
the same engine mapping.

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
---
 tests/i915/gem_ctx_isolation.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index c45617456..1b66fec11 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -586,7 +586,8 @@ static void nonpriv(int fd,
 		igt_spin_t *spin = NULL;
 		uint32_t ctx, regs[2], tmpl;
 
-		ctx = gem_context_create(fd);
+		ctx = gem_context_clone_with_engines(fd, 0);
+
 		tmpl = read_regs(fd, ctx, e, flags);
 		regs[0] = read_regs(fd, ctx, e, flags);
 
@@ -599,7 +600,7 @@ static void nonpriv(int fd,
 		write_regs(fd, ctx, e, flags, values[v]);
 
 		if (flags & DIRTY2) {
-			uint32_t sw = gem_context_create(fd);
+			uint32_t sw = gem_context_clone_with_engines(fd, 0);
 			igt_spin_t *syncpt, *dirt;
 
 			/* Explicit sync to keep the switch between write/read */
@@ -668,7 +669,7 @@ static void isolation(int fd,
 		igt_spin_t *spin = NULL;
 		uint32_t ctx[2], regs[2], tmp;
 
-		ctx[0] = gem_context_create(fd);
+		ctx[0] = gem_context_clone_with_engines(fd, 0);
 		regs[0] = read_regs(fd, ctx[0], e, flags);
 
 		spin = igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
@@ -687,7 +688,7 @@ static void isolation(int fd,
 		 * the default values from this context, but if goes badly we
 		 * see the corruption from the previous context instead!
 		 */
-		ctx[1] = gem_context_create(fd);
+		ctx[1] = gem_context_clone_with_engines(fd, 0);
 		regs[1] = read_regs(fd, ctx[1], e, flags);
 
 		if (flags & DIRTY2) {
@@ -727,7 +728,7 @@ static void isolation(int fd,
 static void inject_reset_context(int fd, const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
-		.ctx = gem_context_create(fd),
+		.ctx = gem_context_clone_with_engines(fd, 0),
 		.engine = e->flags,
 		.flags = IGT_SPIN_FAST,
 	};
@@ -775,11 +776,11 @@ static void preservation(int fd,
 
 	gem_quiescent_gpu(fd);
 
-	ctx[num_values] = gem_context_create(fd);
+	ctx[num_values] = gem_context_clone_with_engines(fd, 0);
 	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
 	regs[num_values][0] = read_regs(fd, ctx[num_values], e, flags);
 	for (int v = 0; v < num_values; v++) {
-		ctx[v] = gem_context_create(fd);
+		ctx[v] = gem_context_clone_with_engines(fd, 0);
 		write_regs(fd, ctx[v], e, flags, values[v]);
 
 		regs[v][0] = read_regs(fd, ctx[v], e, flags);
@@ -874,7 +875,9 @@ igt_main
 		igt_skip_on(gen > LAST_KNOWN_GEN);
 	}
 
-	__for_each_static_engine(e) {
+	/* __for_each_physical_engine switches context to all engines. */
+
+	__for_each_physical_engine(fd, e) {
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_context_isolation & (1 << e->class));
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

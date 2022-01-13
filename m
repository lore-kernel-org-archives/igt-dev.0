Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 13:26:53 -0800
Message-Id: <20220113212653.1554786-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220113195947.1536897-12-John.C.Harrison@Intel.com>
References: <20220113195947.1536897-12-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] tests/i915/i915_hangman: Don't let
 background contexts cause a ban
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The global context used by all the subtests for causing hangs is
marked as unbannable. However, some of the subtests set background
spinners running on all engines using a freshly created context. If
there is a test failure for any reason, all of those spinners can be
killed off as hanging contexts. On systems with lots of engines, that
can result in the test being banned from creating any new contexts.

So make the spinner contexts unbannable as well. That way if one
subtest fails it won't necessarily bring down all subsequent subtests.

v2: Simplify anti-banning code (review feedback from Matthew Brost).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/i915_hangman.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 9f7f8062c..537ed35a5 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -284,6 +284,17 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
 	check_alive();
 }
 
+static void context_unban(int fd, unsigned ctx)
+{
+	struct drm_i915_gem_context_param param = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_BANNABLE,
+		.value = 0,
+	};
+
+	gem_context_set_param(fd, &param);
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -307,6 +318,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
+		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
 		spin = __igt_spin_new(device,
 				      .ahnd = ahndN,
-- 
2.25.1

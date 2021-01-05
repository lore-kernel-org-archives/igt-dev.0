Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 Jan 2021 11:25:35 +0000
Message-Id: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
 inject_reset_context() from banning
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
Cc: igt-dev@lists.freedesktop.org, Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Disable banning as we deliberately inject GPU resets to test isolation.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 tests/i915/gem_ctx_isolation.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 58a35b487..4f1742685 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -762,10 +762,21 @@ static void isolation(int fd,
 #define S4 (4 << 8)
 #define SLEEP_MASK (0xf << 8)
 
+static uint32_t create_reset_context(int i915)
+{
+	struct drm_i915_gem_context_param param = {
+		.ctx_id = gem_context_clone_with_engines(i915, 0),
+		.param = I915_CONTEXT_PARAM_BANNABLE,
+	};
+
+	gem_context_set_param(i915, &param);
+	return param.ctx_id;
+}
+
 static void inject_reset_context(int fd, const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
-		.ctx = gem_context_clone_with_engines(fd, 0),
+		.ctx = create_reset_context(fd),
 		.engine = e->flags,
 		.flags = IGT_SPIN_FAST,
 	};
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

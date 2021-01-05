Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 Jan 2021 11:25:36 +0000
Message-Id: <20210105112536.3284632-2-chris@chris-wilson.co.uk>
In-Reply-To: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
References: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_ctx_exec: Protect norecovery
 from being banned
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

Disable banning as we deliberately inject GPU resets to test norecovery
handling.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 tests/i915/gem_ctx_exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 897761856..c80a98473 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -171,14 +171,16 @@ static void norecovery(int i915)
 	for (int pass = 1; pass >= 0; pass--) {
 		struct drm_i915_gem_context_param param = {
 			.ctx_id = gem_context_create(i915),
-			.param = I915_CONTEXT_PARAM_RECOVERABLE,
-			.value = pass,
+			.param = I915_CONTEXT_PARAM_BANNABLE,
 		};
 		int expect = pass == 0 ? -EIO : 0;
 		igt_spin_t *spin;
 
 		gem_context_set_param(i915, &param);
 
+		param.param = I915_CONTEXT_PARAM_RECOVERABLE;
+		param.value = pass;
+		gem_context_set_param(i915, &param);
 		param.value = !pass;
 		gem_context_get_param(i915, &param);
 		igt_assert_eq(param.value, pass);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

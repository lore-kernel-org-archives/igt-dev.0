Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri, 14 Jan 2022 10:17:10 -0800
Message-Id: <20220114181713.1798514-13-John.C.Harrison@Intel.com>
In-Reply-To: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
References: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 i-g-t 12/15] tests/i915/gem_exec_fence:
 Configure correct context
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

The update to use intel_ctx_t missed a line that configures the
context to allow hanging. Fix that.

Fixes: 09c36188b ("tests/i915/gem_exec_fence: Convert to intel_ctx_t (v2)")
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_exec_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 196236b27..5e45d0518 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -3139,7 +3139,7 @@ igt_main
 			igt_hang_t hang;
 
 			igt_fixture {
-				hang = igt_allow_hang(i915, 0, 0);
+				hang = igt_allow_hang(i915, ctx->id, 0);
 				intel_allocator_multiprocess_start();
 			}
 
-- 
2.25.1

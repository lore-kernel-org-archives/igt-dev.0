Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Mon, 13 Dec 2021 15:29:14 -0800
Message-Id: <20211213232914.2523139-12-John.C.Harrison@Intel.com>
In-Reply-To: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 11/11] tests/i915/gem_exec_fence:
 Configure correct context
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

The update to use intel_ctx_t missed a line that configures the
context to allow hanging. Fix that.

Fixes: 09c36188b23f83ef9a7b5414e2a10100adc4291f

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c4091a454..328a2f06e 100644
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

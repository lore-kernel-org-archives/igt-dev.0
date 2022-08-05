Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 Aug 2022 16:27:14 +0200
Message-Id: <20220805142716.185077-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/gem_exec_fence: Fix wrong engine
 checked for store_dword capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Commit ed7c8cfb67e3 ("tests/i915/gem_exec_fence: Add
__for_each_physical_engine to utilize all engines."), while replacing
depraciated for_each_physical_engine(e, fd) loop with
__for_each_physical_engine(fd, e2) and gem_can_store_dword() inside that
loop with gem_class_can_store_dword(), didn't switch to e2 consequently --
eb_ring(e) argument of gem_can_store_dword() was replaced with e->class
passed to gem_class_can_store_dword() instead of e2->class.  As a result,
a batch that stores dword is now submitted to all engines, also those that
don't support that operation.  Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_exec_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 7ff7614dad..048870053a 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -331,7 +331,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 
 	i = 0;
 	for_each_ctx_engine(fd, ctx, e2) {
-		if (!gem_class_can_store_dword(fd, e->class))
+		if (!gem_class_can_store_dword(fd, e2->class))
 			continue;
 
 		if (flags & NONBLOCK) {
-- 
2.25.1

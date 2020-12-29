Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 29 Dec 2020 10:49:30 +0000
Message-Id: <20201229104930.272826-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201229103852.234352-1-chris@chris-wilson.co.uk>
References: <20201229103852.234352-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_reset_stats: Check noop submission
 before bans
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_reset_stats.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index d55b85869..afe2cd99b 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -337,8 +337,8 @@ static void test_ban(const struct intel_execution_engine *e)
 	assert_reset_status(fd_bad, fd_bad, 0, RS_NO_ERROR);
 	assert_reset_status(fd_good, fd_good, 0, RS_NO_ERROR);
 
-	noop(fd_bad, 0, e);
-	noop(fd_good, 0, e);
+	igt_assert_lt(0, noop(fd_bad, 0, e));
+	igt_assert_lt(0, noop(fd_good, 0, e));
 
 	assert_reset_status(fd_bad, fd_bad, 0, RS_NO_ERROR);
 	assert_reset_status(fd_good, fd_good, 0, RS_NO_ERROR);
@@ -346,8 +346,8 @@ static void test_ban(const struct intel_execution_engine *e)
 	inject_hang(fd_bad, 0, e, BAN | ASYNC);
 	active_count++;
 
-	noop(fd_good, 0, e);
-	noop(fd_good, 0, e);
+	igt_assert_lt(0, noop(fd_good, 0, e));
+	igt_assert_lt(0, noop(fd_good, 0, e));
 
 	while (retry--) {
 		inject_hang(fd_bad, 0, e, BAN);
@@ -396,8 +396,8 @@ static void test_ban_ctx(const struct intel_execution_engine *e)
 	assert_reset_status(fd, fd, ctx_good, RS_NO_ERROR);
 	assert_reset_status(fd, fd, ctx_bad, RS_NO_ERROR);
 
-	noop(fd, ctx_bad, e);
-	noop(fd, ctx_good, e);
+	igt_assert_lt(0, noop(fd, ctx_bad, e));
+	igt_assert_lt(0, noop(fd, ctx_good, e));
 
 	assert_reset_status(fd, fd, ctx_good, RS_NO_ERROR);
 	assert_reset_status(fd, fd, ctx_bad, RS_NO_ERROR);
@@ -405,8 +405,8 @@ static void test_ban_ctx(const struct intel_execution_engine *e)
 	inject_hang(fd, ctx_bad, e, BAN | ASYNC);
 	active_count++;
 
-	noop(fd, ctx_good, e);
-	noop(fd, ctx_good, e);
+	igt_assert_lt(0, noop(fd, ctx_good, e));
+	igt_assert_lt(0, noop(fd, ctx_good, e));
 
 	while (retry--) {
 		inject_hang(fd, ctx_bad, e, BAN);
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

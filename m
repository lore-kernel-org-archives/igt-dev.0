Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756518951B
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 09:49:57 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 28 Dec 2020 15:22:07 +0530
Message-Id: <20201228095207.376732-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_reset_stats: Call noop() with
 relevant params
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
To: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

- Modify to use noop function in test_ban() and test_ban_ctx()
with relevant params after hang injection
- Add corresponding checks to verify return value of noop

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_reset_stats.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 4ba1ec8e..13f02ea8 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -341,8 +341,8 @@ static void test_ban(const struct intel_execution_engine *e)
 	assert_reset_status(fd_bad, fd_bad, 0, RS_NO_ERROR);
 	assert_reset_status(fd_good, fd_good, 0, RS_NO_ERROR);
 
-	noop(fd_bad, 0, e);
-	noop(fd_good, 0, e);
+	igt_assert(noop(fd_bad, 0, e) > 0);
+	igt_assert(noop(fd_good, 0, e) > 0);
 
 	assert_reset_status(fd_bad, fd_bad, 0, RS_NO_ERROR);
 	assert_reset_status(fd_good, fd_good, 0, RS_NO_ERROR);
@@ -350,8 +350,8 @@ static void test_ban(const struct intel_execution_engine *e)
 	inject_hang(fd_bad, 0, e, BAN | ASYNC);
 	active_count++;
 
-	noop(fd_good, 0, e);
-	noop(fd_good, 0, e);
+	igt_assert(noop(fd_bad, 0, e) > 0);
+	igt_assert(noop(fd_good, 0, e) > 0);
 
 	while (retry--) {
 		inject_hang(fd_bad, 0, e, BAN);
@@ -400,8 +400,8 @@ static void test_ban_ctx(const struct intel_execution_engine *e)
 	assert_reset_status(fd, fd, ctx_good, RS_NO_ERROR);
 	assert_reset_status(fd, fd, ctx_bad, RS_NO_ERROR);
 
-	noop(fd, ctx_bad, e);
-	noop(fd, ctx_good, e);
+	igt_assert(noop(fd, ctx_bad, e) > 0);
+	igt_assert(noop(fd, ctx_good, e) > 0);
 
 	assert_reset_status(fd, fd, ctx_good, RS_NO_ERROR);
 	assert_reset_status(fd, fd, ctx_bad, RS_NO_ERROR);
@@ -409,8 +409,8 @@ static void test_ban_ctx(const struct intel_execution_engine *e)
 	inject_hang(fd, ctx_bad, e, BAN | ASYNC);
 	active_count++;
 
-	noop(fd, ctx_good, e);
-	noop(fd, ctx_good, e);
+	igt_assert(noop(fd, ctx_bad, e) > 0);
+	igt_assert(noop(fd, ctx_good, e) > 0);
 
 	while (retry--) {
 		inject_hang(fd, ctx_bad, e, BAN);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

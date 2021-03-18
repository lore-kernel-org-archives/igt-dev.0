Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C326E862
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 01:29:57 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 17 Mar 2021 18:29:52 -0700
Message-Id: <20210318012952.53562-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Drop
 gem_require_pread_pwrite check from userptr tests
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Since 0b6967520b ("tests: Do not use pread on userptr in
gem_exec_parallel.") gem_exec_parallel userptr tests no longer use pread so
gem_require_pread_pwrite check is not needed.

Fixes: ad5eb02eb3 ("lib/ioctl_wrappers: Keep IGT working without pread/pwrite ioctls")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_parallel.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 73cdc94b7e..c9cf9d7afa 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -211,9 +211,6 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 	if (flags & CONTEXTS)
 		gem_require_contexts(fd);
 
-	if (flags & USERPTR)
-		gem_require_pread_pwrite(fd);
-
 	if (flags & FDS) {
 		igt_require(gen > 5);
 		igt_require(igt_allow_unlimited_files());
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

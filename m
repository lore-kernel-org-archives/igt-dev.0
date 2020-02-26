Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830C16E109
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 05:55:53 +0000 (UTC)
From: bhanuprakash.modem@intel.com
Date: Wed, 26 Feb 2020 11:16:34 +0530
Message-Id: <20200226054634.6611-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_lut_handle: Minor fixes
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
To: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Remove redundent logics.
After exec, destroy BO properly.
Remove unnecessary & unused macros.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/gem_lut_handle.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_lut_handle.c b/tests/i915/gem_lut_handle.c
index fec65dd8..367d8bdf 100644
--- a/tests/i915/gem_lut_handle.c
+++ b/tests/i915/gem_lut_handle.c
@@ -41,10 +41,6 @@
 IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
 		     " interface.");
 
-#define BATCH_SIZE		(1024*1024)
-
-#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
-
 #define NORMAL 0
 #define USE_LUT 0x1
 #define BROKEN 0x2
@@ -80,7 +76,7 @@ static int exec(int fd, uint32_t handle, unsigned int flags)
 	execbuf.num_cliprects = 0;
 	execbuf.DR1 = 0;
 	execbuf.DR4 = 0;
-	execbuf.flags = flags & USE_LUT ? LOCAL_I915_EXEC_HANDLE_LUT : 0;
+	execbuf.flags = flags & USE_LUT ? I915_EXEC_HANDLE_LUT : 0;
 	i915_execbuffer2_set_context_id(execbuf, 0);
 	execbuf.rsvd2 = 0;
 
@@ -147,7 +143,7 @@ static int many_exec(int fd, uint32_t batch, int num_exec, int num_reloc, unsign
 	execbuf.num_cliprects = 0;
 	execbuf.DR1 = 0;
 	execbuf.DR4 = 0;
-	execbuf.flags = flags & USE_LUT ? LOCAL_I915_EXEC_HANDLE_LUT : 0;
+	execbuf.flags = flags & USE_LUT ? I915_EXEC_HANDLE_LUT : 0;
 	i915_execbuffer2_set_context_id(execbuf, 0);
 	execbuf.rsvd2 = 0;
 
@@ -180,8 +176,6 @@ igt_simple_main
 	fail(exec(fd, handle, BROKEN));
 
 	igt_skip_on(exec(fd, handle, USE_LUT));
-
-	do_or_die(exec(fd, handle, USE_LUT));
 	fail(exec(fd, handle, USE_LUT | BROKEN));
 
 	for (i = 2; i <= SLOW_QUICK(65536, 8); i *= 2) {
@@ -228,4 +222,6 @@ igt_simple_main
 		fail(many_exec(fd, handle, i+1, i, USE_LUT | BROKEN));
 		fail(many_exec(fd, handle, i+1, i+1, USE_LUT | BROKEN));
 	}
+
+	gem_close(fd, handle);
 }
-- 
2.24.1.1.gb6d4d82bd5

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

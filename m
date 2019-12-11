Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6A46EA2E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:42 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:09 -0800
Message-Id: <20191211005235.67897-4-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/29] lib/igt_core: update longjmp buffers
 to type sigjmp_buf
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
List-ID: <igt-dev@lists.freedesktop.org>

sigsetjmp/siglongjmp operate on a different type from
setjmp/longjmp, sigjmp_buf vs jmp_buf. On glibc these happen to be
the same type, but on other platforms they may be different.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_core.c | 2 +-
 lib/igt_core.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c705be1e..09d8c159 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1328,7 +1328,7 @@ static void exit_subtest(const char *result)
 	const char *subtest_text = in_dynamic_subtest ? "Dynamic subtest" : "Subtest";
 	const char **subtest_name = in_dynamic_subtest ? &in_dynamic_subtest : &in_subtest;
 	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
-	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
+	sigjmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
 
 	igt_gettime(&now);
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index c17a7ba8..e99b782f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -145,8 +145,8 @@ void __igt_fixture_end(void) __attribute__((noreturn));
 			 __igt_fixture_complete())
 
 /* subtest infrastructure */
-jmp_buf igt_subtest_jmpbuf;
-jmp_buf igt_dynamic_jmpbuf;
+sigjmp_buf igt_subtest_jmpbuf;
+sigjmp_buf igt_dynamic_jmpbuf;
 typedef int (*igt_opt_handler_t)(int opt, int opt_index, void *data);
 #define IGT_OPT_HANDLER_SUCCESS 0
 #define IGT_OPT_HANDLER_ERROR -2
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

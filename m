Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31366E478
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:13:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBB89144D6B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:11:35 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:11:29 -0400
Message-Id: <20200316161132.29833-2-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-1-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_core: Make
 igt_subtest_jmpbuf/igt_dynamic_jmpbuf extern
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

From: Lyude Paul <lyude@redhat.com>

Since gcc 10, -fno-common has become the default (vs. -fcommon). As a
result, gcc is much stricter about missing extern and static keywords
and causes our build to fail in anything including igt_core.h:

/usr/bin/ld:
lib/libigt-i915_gem_context_c.a(i915_gem_context.c.o):lib/igt_core.h:149:
multiple definition of `igt_dynamic_jmpbuf';
lib/libigt-drmtest_c.a(drmtest.c.o):lib/igt_core.h:149: first defined
here
/usr/bin/ld:
lib/libigt-i915_gem_context_c.a(i915_gem_context.c.o):lib/igt_core.h:148:
multiple definition of `igt_subtest_jmpbuf';
lib/libigt-drmtest_c.a(drmtest.c.o):lib/igt_core.h:148: first defined
here

So, fix this by marking these as extern and declaring them in
lib/igt_core.c.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_core.c | 3 +++
 lib/igt_core.h | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 51041793..2b928f1a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -261,6 +261,9 @@
  * such as those related to Chamelium support.
  */
 
+jmp_buf igt_subtest_jmpbuf;
+jmp_buf igt_dynamic_jmpbuf;
+
 static unsigned int exit_handler_count;
 const char *igt_interactive_debug;
 bool igt_skip_crc_compare;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index c17a7ba8..fae5f59e 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -145,8 +145,8 @@ void __igt_fixture_end(void) __attribute__((noreturn));
 			 __igt_fixture_complete())
 
 /* subtest infrastructure */
-jmp_buf igt_subtest_jmpbuf;
-jmp_buf igt_dynamic_jmpbuf;
+extern jmp_buf igt_subtest_jmpbuf;
+extern jmp_buf igt_dynamic_jmpbuf;
 typedef int (*igt_opt_handler_t)(int opt, int opt_index, void *data);
 #define IGT_OPT_HANDLER_SUCCESS 0
 #define IGT_OPT_HANDLER_ERROR -2
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

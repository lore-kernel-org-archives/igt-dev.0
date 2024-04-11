Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33508C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 19:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE010F2F1;
	Thu, 11 Apr 2024 19:53:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FC010F2ED
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 19:53:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C58F60002;
 Thu, 11 Apr 2024 19:53:49 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH i-g-t v2] tests/intel/gem_exec_capture: Fix many-* subtests
Date: Thu, 11 Apr 2024 21:53:34 +0200
Message-ID: <20240411195348.10881-1-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410174031.5840-1-me@petersenna.com>
References: <20240410174031.5840-1-me@petersenna.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: me@petersenna.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Currently trying to run `gem_exec_capture --run-subtest
many-4K-incremental` or `gem_exec_capture --run-subtest many-4K-zero`
will fail with:

 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Test
 assertion failure function gem_engine_properties_configure, file
 ../lib/i915/gem_engine_topology.c:577:
 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Failed assertion: ret == 1
 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Last errno: 9, Bad file descriptor
 (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: error: -1 != 1

This problem happens inside the macro find_first_available_engine()
when:
 1. for_each_ctx_engine() allocates an struct intel_engine_data 'ed'
    inside a for loop. The core of the issue is that ed only exists
    inside the for loop. As soon as the for loop ends, ed is out of scope
    and after it's lifetime.
 2. intel_get_current_engine() sets '*e' to an address of ed. This is ok
    while inside the for loop, and is undefined behavior after the for
    loop ends.
 3. configure_hangs() uses '*e' after the lifetime of 'ed' has ended
    leading to undefined behavior
 4. After the call to find_first_available_engine() __captureN() will
    fail as it expects '*e' to be valid. This is also undefined
    behavior.

Additionally, this patch sets 'e' to NULL early on at the macro, and at
the end check if it is still NULL. If so it will skip the test to
prevent downstream code from crashing.

 v2: removed the 'igt_assert(tmpe)'; added the explanation about
     checking if e is still NULL by the end of the macro to decide to skip
     the test or not.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
---
 tests/intel/gem_exec_capture.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 57b178f3e..e6598ec42 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -662,13 +662,18 @@ static bool needs_recoverable_ctx(int fd)
 
 #define find_first_available_engine(fd, ctx, e, saved) \
 	do { \
+		struct intel_execution_engine2 *tmpe = NULL; \
+		e = NULL; \
+		\
 		ctx = intel_ctx_create_all_physical(fd); \
 		igt_assert(ctx); \
-		for_each_ctx_engine(fd, ctx, e) \
-			for_each_if(gem_class_can_store_dword(fd, e->class)) \
+		for_each_ctx_engine(fd, ctx, tmpe) \
+			if(gem_class_can_store_dword(fd, tmpe->class)) { \
+				saved = configure_hangs(fd, tmpe, ctx->id); \
+				e = &saved.engine; \
 				break; \
-		igt_assert(e); \
-		saved = configure_hangs(fd, e, ctx->id); \
+			} \
+		igt_skip_on_f(e == NULL, "no capable engine found\n"); \
 	} while(0)
 
 static void many(int fd, int dir, uint64_t size, unsigned int flags)
-- 
2.44.0


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D92CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 05:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2986010E58C;
	Wed, 10 Apr 2024 05:43:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65810E202
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 05:43:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E95D0E0002;
 Wed, 10 Apr 2024 05:43:12 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH i-g-t v7] tests/intel/gem_exec_capture: Fix many-* subtests
Date: Wed, 10 Apr 2024 07:40:30 +0200
Message-ID: <20240410054311.5852-1-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325210552.2738-1-me@petersenna.com>
References: <20240325210552.2738-1-me@petersenna.com>
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

This patch fixes the issue by:
 1. Creating a 'tmpe' variable for code clarity by hinting that this is a
    temporal variable.
 1. Moving the call to configure_hangs() to inside the for loop, where
    there are no issues with scope and lifetime of 'ed'.
 2. Assigning 'e' to a value of 'saved' with 'e = &saved.engine;'. The
    reason why this works is twofold: First 'saved' has the same content
    as 'e' had when there were no variable scope and lifetime issues.
    Second both 'e' and 'saved' are defined in many() meaning that they
    share the same scope and lifetime.

Additionally, this patch:
 - moves the 'igt_assert(tmpe);' to between the assignment and first use
   of 'tmpe'.
 - sets 'e = NULL;' and checks if this changes to decide to skip the
   test.

 v7: unifies the two patches from v6; creates 'tmpe' for code clarity;
     sets 'e = NULL;' to decide to skip the the test if still NULL by
     the end of 'find_first_available_engine()'; places
     'igt_assert(tmpe);' between assignment and first use of 'tmpe';

Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
---
 tests/intel/gem_exec_capture.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 57b178f3e..b79268443 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -662,13 +662,19 @@ static bool needs_recoverable_ctx(int fd)
 
 #define find_first_available_engine(fd, ctx, e, saved) \
 	do { \
+		struct intel_execution_engine2 *tmpe = NULL; \
+		e = NULL; \
 		ctx = intel_ctx_create_all_physical(fd); \
 		igt_assert(ctx); \
-		for_each_ctx_engine(fd, ctx, e) \
-			for_each_if(gem_class_can_store_dword(fd, e->class)) \
+		for_each_ctx_engine(fd, ctx, tmpe) { \
+			igt_assert(tmpe); \
+			if(gem_class_can_store_dword(fd, tmpe->class)) { \
+				saved = configure_hangs(fd, tmpe, ctx->id); \
+				e = &saved.engine; \
 				break; \
-		igt_assert(e); \
-		saved = configure_hangs(fd, e, ctx->id); \
+			} \
+		} \
+		igt_skip_on_f(e == NULL, "no capable engine found\n"); \
 	} while(0)
 
 static void many(int fd, int dir, uint64_t size, unsigned int flags)
-- 
2.44.0


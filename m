Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA47CD1283
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 06:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAA510F8CE;
	Wed, 27 Mar 2024 06:59:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3FD10F8CE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 06:59:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2656DC0002;
 Wed, 27 Mar 2024 06:59:28 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH i-g-t v4] Fix memory access issue due to variable block scope
Date: Wed, 27 Mar 2024 07:59:27 +0100
Message-ID: <20240327065928.5522-1-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
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

This patch fixes the tests many-4k-incremental and many-4k-zero from
gem_exec_capture that are currently failing with an invalid file
descriptor error.

tests/intel/gem_exec_capture.c
    many(), userptr(), capture_invisible()
        find_first_available_engine()
            for_each_ctx_engine()
                for_each_ctx_cfg_engine()

find_first_available_engine() expects a struct intel_execution_engine2
*e as parameter. for_each_ctx_cfg_engine() allocates a struct
intel_engine_data ed inside a for loop and then update e to point to an
element of ed.

The problem is that ed has the block scope of the for loop, and trying
to access its content through e after the for loop has ended creates
undefined behavior.

This patch updates e to point to the same content at a different memory
region, to avoid the block scope of ed.

v4: Move `saved = configure_hangs(fd, e, ctx->id);` to inside the for
loop where it is safe to use 'e'. This is because 'e' points to an
element of a variable that is defined with the block scope of the for
loop.

Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
---
 tests/intel/gem_exec_capture.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 57b178f3e..f7b10bdd4 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
 		ctx = intel_ctx_create_all_physical(fd); \
 		igt_assert(ctx); \
 		for_each_ctx_engine(fd, ctx, e) \
-			for_each_if(gem_class_can_store_dword(fd, e->class)) \
+			for_each_if(gem_class_can_store_dword(fd, e->class)) { \
+				saved = configure_hangs(fd, e, ctx->id); \
 				break; \
+			}  \
+		e = &saved.engine; \
 		igt_assert(e); \
-		saved = configure_hangs(fd, e, ctx->id); \
 	} while(0)
 
 static void many(int fd, int dir, uint64_t size, unsigned int flags)
-- 
2.44.0


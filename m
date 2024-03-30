Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67C9CD1288
	for <igt-dev@archiver.kernel.org>; Sat, 30 Mar 2024 14:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E4C10E289;
	Sat, 30 Mar 2024 14:19:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86A310E468
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2024 14:19:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE1631C0009;
 Sat, 30 Mar 2024 14:19:53 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH i-g-t v6 2/2] Skip the test when no engines are found
Date: Sat, 30 Mar 2024 15:19:32 +0100
Message-ID: <20240330141951.84598-2-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240330141951.84598-1-me@petersenna.com>
References: <20240327065928.5522-1-me@petersenna.com>
 <20240330141951.84598-1-me@petersenna.com>
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

This patch calls igt_skip() when no engines are found by
find_first_available_engine() preventing downstream code from crashing.

Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
---
 tests/intel/gem_exec_capture.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index a8348f21b..2afb84283 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
 		ctx = intel_ctx_create_all_physical(fd); \
 		igt_assert(ctx); \
 		for_each_ctx_engine(fd, ctx, e) \
-			for_each_if(gem_class_can_store_dword(fd, e->class)) { \
+			if(gem_class_can_store_dword(fd, e->class)) { \
 				igt_assert(e); \
 				saved = configure_hangs(fd, e, ctx->id); \
 				break; \
+			} else { \
+				igt_skip("find_first_available_engine(): No engine available\n"); \
 			} \
 		e = &saved.engine; \
 	} while(0)
-- 
2.44.0


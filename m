Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C58CD1288
	for <igt-dev@archiver.kernel.org>; Sat, 30 Mar 2024 14:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C84D10E87A;
	Sat, 30 Mar 2024 14:59:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED1510E87A
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2024 14:59:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEAD7E0002;
 Sat, 30 Mar 2024 14:59:40 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH] [PATCH i-g-t] tests/intel/gem_exec_capture: Reduce test size
Date: Sat, 30 Mar 2024 15:59:34 +0100
Message-ID: <20240330145939.85030-1-me@petersenna.com>
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

Before this patch, when using a chromebook-level CPU such as the N3150,
with 8GB of RAM, the test `gem_exec_capture --run-subtest
many-4K-incremental` could take 4 minutes to complete, and the
`gem_exec_capture --run-subtest many-4K-zero` could take a minute.

This patch reduces the test size by half, reducing the time to run by
half as well.

Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
---

This patch is only "testable" after my other patch that fixes the test,
in the first place. As I write this, the other patch is here:

  https://patchwork.freedesktop.org/series/131602/

 tests/intel/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 2afb84283..3f454b897 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -700,7 +700,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
 		  gtt, ram);
 
-	count = min(gtt, ram) / 4;
+	count = min(gtt, ram) / 8;
 	igt_require(count > 1);
 
 	igt_require_memory(count, size, CHECK_RAM);
-- 
2.44.0


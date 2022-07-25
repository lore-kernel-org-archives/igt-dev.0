Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876A6A5B73
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jul 2022 12:15:18 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Jul 2022 13:15:04 +0100
Message-Id: <20220725121504.99519-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap: remove useless memset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Array 'expected' is never used again in a comparison after memset'ing it.
Remove the useless statement.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 tests/i915/gem_mmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 61f862a8e275..926cd03c577e 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -264,7 +264,6 @@ igt_main
 		igt_info("Testing coherency of writes and mmap reads.\n");
 		memset(buf, 0, sizeof(buf));
 		memset(buf + 1024, 0x01, 1024);
-		memset(expected + 1024, 0x01, 1024);
 		gem_write(fd, arg.handle, 0, buf, OBJECT_SIZE);
 		igt_assert(memcmp(buf, addr, sizeof(buf)) == 0);
 
-- 
2.37.0

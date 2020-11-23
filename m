Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F6789354
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 18:54:35 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Nov 2020 18:54:27 +0000
Message-Id: <20201123185427.3891897-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/fbdev: Flip assertion for an unmet
 memchr()
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The last unaligned test, looks for the target character in the tail of
the buffer, where it is not expected to be found. We should be asserting
that the memchr() returned NULL.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 85d52b933..443a43dc1 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -140,7 +140,7 @@ static void framebuffer_tests(int fd)
 		pos = memchr(&buf[off + len],
 			     0x55,
 			     fix_info.smem_len - (off + len));
-		igt_assert_f(pos,
+		igt_assert_f(!pos,
 			     "found 0x55 at pos %zu, none expected\n",
 			     pos - buf);
 	}
@@ -197,7 +197,7 @@ static void framebuffer_tests(int fd)
 		pos = memchr(&map[off + len],
 			     0x55,
 			     fix_info.smem_len - (off + len));
-		igt_assert_f(pos,
+		igt_assert_f(!pos,
 			     "found 0x55 at pos %zu, none expected\n",
 			     pos - map);
 	}
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

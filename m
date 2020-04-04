Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189106E04E
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Apr 2020 10:41:48 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat,  4 Apr 2020 11:41:40 +0100
Message-Id: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_flip: Skip interruptible testing for
 negative and hangs tests
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

Negative tests are API tests that will be rejected before we either
waiting. Repeating them expecting it to be interrupted is a forlorn
hope.

Hang tests are expected to be blocked until they can be resolved by
hangcheck. Repeating those to see how a long wait responds when
interrupted is counter purpose, just a waste of time.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_flip.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 9ce83c53d..c95838c73 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1600,10 +1600,17 @@ igt_main
 			continue;
 
 		/*
+		 * -EINVAL are negative API tests, they are rejected before
+		 *  any waits and so not subject to interruptiblity.
+		 *
 		 * -EBUSY needs to complete in a single vblank, skip them for
 		 * interruptible tests
+		 *
+		 * HANGs are slow enough and interruptible hang testing is
+		 * an oxymoron (can't force the wait-for-hang if being
+		 * interrupted all the time).
 		 */
-		if (tests[i].flags & TEST_EBUSY)
+		if (tests[i].flags & (TEST_EINVAL | TEST_EBUSY | TEST_HANG))
 			continue;
 
 		igt_subtest_f( "%s-interruptible", tests[i].name)
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

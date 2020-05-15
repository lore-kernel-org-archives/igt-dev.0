Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80826EBF3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 07:19:35 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 15 May 2020 08:19:28 +0100
Message-Id: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_flip: Trim test durations for basic
 subtests [BAT]
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

Reduce the target runtime for the individual subtests as each may be
repeated multiple times accumulating a substantial fraction of the BAT
runtime. A 100 flips or so should be as good an indicator of basic
driver health as a few thousand, with the stress testing coming in the
non-basic testing.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_flip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 199b6eb41..46bfc5858 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1581,22 +1581,22 @@ igt_main
 					"absolute-wf_vblank" },
 		{ 30,  TEST_VBLANK | TEST_VBLANK_BLOCK | TEST_VBLANK_ABSOLUTE,
 					"blocking-absolute-wf_vblank" },
-		{ 10, TEST_FLIP | TEST_BASIC, "plain-flip" },
+		{ 2, TEST_FLIP | TEST_BASIC, "plain-flip" },
 		{ 1, TEST_FLIP | TEST_EBUSY, "busy-flip" },
 		{ 30, TEST_FLIP | TEST_FENCE_STRESS , "flip-vs-fences" },
 		{ 30, TEST_FLIP | TEST_CHECK_TS, "plain-flip-ts-check" },
 		{ 30, TEST_FLIP | TEST_CHECK_TS | TEST_FB_RECREATE,
 			"plain-flip-fb-recreate" },
 		{ 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , "flip-vs-rmfb" },
-		{ 20, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
+		{ 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
 		{ 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
-		{ 20, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
+		{ 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
 		{ 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,
 					"flip-vs-expired-vblank" },
 
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_ABSOLUTE |
 		      TEST_CHECK_TS, "flip-vs-absolute-wf_vblank" },
-		{ 10, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
+		{ 2, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
 					"flip-vs-wf_vblank" },
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
 			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  8 Apr 2020 11:24:08 +0100
Message-Id: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_flip: Reduce hang tests to minimum
 duration
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Hang tests are slow since we must wait for the kernel to detect the GPU
hang before it forcibly completes the execution and signals the fence.
The flip is not allowed before the fence is signaled and so must wait.
Our test is that the flip does eventually occur, we only need to do that
once, and let the power of repeated runs across many machines weed out
the corner cases.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_flip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index afaed69aa..4535ecc8b 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1546,8 +1546,8 @@ igt_main
 					"flip-vs-wf_vblank" },
 		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
 			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
-		{ 30, TEST_FLIP | TEST_MODESET | TEST_HANG | TEST_NOEVENT, "flip-vs-modeset-vs-hang" },
-		{ 30, TEST_FLIP | TEST_PAN | TEST_HANG, "flip-vs-panning-vs-hang" },
+		{ 1, TEST_FLIP | TEST_MODESET | TEST_HANG | TEST_NOEVENT, "flip-vs-modeset-vs-hang" },
+		{ 1, TEST_FLIP | TEST_PAN | TEST_HANG, "flip-vs-panning-vs-hang" },
 
 		{ 1, TEST_DPMS_OFF | TEST_MODESET | TEST_FLIP,
 					"flip-vs-dpms-off-vs-modeset" },
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

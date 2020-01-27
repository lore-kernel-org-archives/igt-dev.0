Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 27 Jan 2020 08:51:23 +0000
Message-Id: <20200127085123.2229746-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pipe_control_store_loop: Limit
 runtime
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use a runtime limit, not a fixed amount of work, so that it doesn't take
several hundred seconds on the slower machines.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_pipe_control_store_loop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index b8a21d780..9330a47c8 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -62,13 +62,13 @@ uint32_t devid;
 
 /* Like the store dword test, but we create new command buffers each time */
 static void
-store_pipe_control_loop(bool preuse_buffer)
+store_pipe_control_loop(bool preuse_buffer, int timeout)
 {
 	int i, val = 0;
 	uint32_t *buf;
 	drm_intel_bo *target_bo;
 
-	for (i = 0; i < SLOW_QUICK(0x10000, 4); i++) {
+	igt_until_timeout(timeout) {
 		/* we want to check tlb consistency of the pipe_control target,
 		 * so get a new buffer every time around */
 		target_bo = drm_intel_bo_alloc(bufmgr, "target bo", 4096, 4096);
@@ -182,10 +182,10 @@ igt_main
 	}
 
 	igt_subtest("fresh-buffer")
-		store_pipe_control_loop(false);
+		store_pipe_control_loop(false, 2);
 
 	igt_subtest("reused-buffer")
-		store_pipe_control_loop(true);
+		store_pipe_control_loop(true, 2);
 
 	igt_fixture {
 		intel_batchbuffer_free(batch);
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

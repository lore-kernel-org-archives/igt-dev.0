Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 11:59:37 -0800
Message-Id: <20220113195947.1536897-6-John.C.Harrison@Intel.com>
In-Reply-To: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 i-g-t 05/15] tests/i915/i915_hangman: Add
 uevent test & fix detector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some of the IGT framework relies on receving a uevent when a hang
occurs. So add a test that this actually works.

While testing this, noticed that hangs could sometimes be missed
because the uevent was (presumably) still in flight by the time the
handler was de-registered. So add an extra delay during cleanup to
give the uevent chance to arrive.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 lib/igt_aux.c             |  7 +++++++
 tests/i915/i915_hangman.c | 43 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index c247a1aa4..03cc38c93 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -523,6 +523,13 @@ void igt_fork_hang_detector(int fd)
 
 void igt_stop_hang_detector(void)
 {
+	/*
+	 * Give the uevent time to arrive. No sleep at all misses about 20% of
+	 * hangs (at least, in the i915_hangman/detector test). A sleep of 1ms
+	 * seems to miss about 2%, 10ms loses <1%, so 100ms should be safe.
+	 */
+	usleep(100 * 1000);
+
 	igt_stop_helper(&hang_detector);
 }
 
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 7b8390a6c..354769f39 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -31,6 +31,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <fcntl.h>
+#include <signal.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -289,6 +290,38 @@ test_engine_hang(const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 }
 
+static int hang_count;
+
+static void sig_io(int sig)
+{
+	hang_count++;
+}
+
+static void test_hang_detector(const intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e)
+{
+	igt_hang_t hang;
+	uint64_t ahnd = get_reloc_ahnd(device, ctx->id);
+
+	hang_count = 0;
+
+	igt_fork_hang_detector(device);
+
+	/* Steal the signal handler */
+	signal(SIGIO, sig_io);
+
+	/* Make a hang... */
+	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, e->flags, 0);
+
+	igt_post_hang_ring(device, hang);
+	put_ahnd(ahnd);
+
+	igt_stop_hang_detector();
+
+	/* Did it work? */
+	igt_assert(hang_count == 1);
+}
+
 /* This test covers the case where we end up in an uninitialised area of the
  * ppgtt and keep executing through it. This is particularly relevant if 48b
  * ppgtt is enabled because the ppgtt is massively bigger compared to the 32b
@@ -408,6 +441,16 @@ igt_main
 	igt_subtest("hangcheck-unterminated")
 		hangcheck_unterminated(ctx);
 
+	igt_describe("Check that hang detector works");
+	igt_subtest_with_dynamic("detector") {
+		const struct intel_execution_engine2 *e;
+
+		for_each_ctx_engine(device, ctx, e) {
+			igt_dynamic_f("%s", e->name)
+				test_hang_detector(ctx, e);
+		}
+	}
+
 	do_tests("GT", "gt", ctx);
 
 	igt_fixture {
-- 
2.25.1

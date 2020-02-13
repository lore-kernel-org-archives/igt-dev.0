Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Dale B Stimson <dale.b.stimson@intel.com>
Date: Wed, 12 Feb 2020 17:28:40 -0800
Message-Id: <20200213012840.31472-6-dale.b.stimson@intel.com>
In-Reply-To: <20200213012840.31472-1-dale.b.stimson@intel.com>
References: <20200213012840.31472-1-dale.b.stimson@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 5/5] i915/gem_ctx_isolation.c - If
 initialization fails, exit
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

At the start of igt_main, failure of the initial tests for successful
initialization transfer control to the end of an igt_fixture block.
From there, execution of the main per-engine loop is attempted.
Instead, the test should be caused to exit.

If initialization fails, exit.

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
---
 tests/i915/gem_ctx_isolation.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 07ffbb84a..b11158dab 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -898,10 +898,13 @@ igt_main
 	int fd = -1;
 	struct eng_mmio_base_table_s *mbp = NULL;
 	uint32_t mmio_base = 0;
+	/* igt_fixture block is skipped if --list-subtests, so start with true. */
+	bool init_successful = true;
 
 	igt_fixture {
 		int gen;
 
+		init_successful = false;
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_has_contexts(fd));
@@ -916,8 +919,20 @@ igt_main
 		igt_skip_on(gen > LAST_KNOWN_GEN);
 
 		mbp = gem_engine_mmio_base_info_get(fd);
+		init_successful = true;
 	}
 
+	if (!init_successful) {
+		igt_exit_early();
+	}
+
+	/**
+	 * With --list-subtests the above igt_fixture block is skipped and so
+	 * the device is not open.  Because fd < 0, __for_each_physical_engine
+	 * falls back to a static engine list, which will affect the output
+	 * of --list-subtests.
+	 */
+
 	/* __for_each_physical_engine switches context to all engines. */
 	__for_each_physical_engine(fd, e) {
 		igt_subtest_group {
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

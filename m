Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09B10E703
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 09:20:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 11:20:38 +0200
Message-Id: <20220621092038.191352-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ppgtt: Temporary meminfo log
 dump for Sandybridge
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sandybridge we observe -ENOMEM with page cache which takes almost
whole memory. It is weird especially drop caches is called immediate
before test.

Patch is not a fix but I need more information to debug this issue.
It adds /proc/meminfo lines to igt log (not debug) triple times for
Sandybridge machines - before drop caches, after that and just before
test completes.

Unfortunately repro path is not predictive and occurs rare so merging
this code and revert in the future will be necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_ppgtt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 0a06e9ec8f..9147b33a99 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -45,6 +45,23 @@
 #define HEIGHT 512
 #define SIZE (HEIGHT*STRIDE)
 
+static void dump_meminfo(const char *info, int lines)
+{
+	FILE *file;
+	size_t n = 0;
+	char *line = NULL;
+
+	file = fopen("/proc/meminfo", "r");
+	igt_assert(file);
+
+	igt_info("[meminfo - %s]\n", info);
+	while (getline(&line, &n, file) >= 0 && lines--)
+		igt_info("%s", line);
+
+	free(line);
+	fclose(file);
+}
+
 static struct intel_buf *create_bo(struct buf_ops *bops, uint32_t pixel)
 {
 	uint64_t value = (uint64_t)pixel << 32 | pixel, *v;
@@ -270,9 +287,15 @@ static bool has_contexts(void)
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	bool is_sandybridge = false;
 
 	igt_fixture {
 		int fd = drm_open_driver(DRIVER_INTEL);
+		uint32_t devid = intel_get_drm_devid(fd);
+
+		if (IS_SANDYBRIDGE(devid))
+			is_sandybridge = true;
+
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
 		close(fd);
@@ -283,9 +306,17 @@ igt_main
 		int nchild = ncpus + 1;
 		uint64_t mem_per_test;
 
+		/* Temporary meminfo dump for SNB */
+		if (is_sandybridge)
+			dump_meminfo("before drop-caches", 16);
+
 		mem_per_test = SIZE;
 		igt_require_memory(nchild + 1, mem_per_test, CHECK_RAM);
 
+		/* SNB */
+		if (is_sandybridge)
+			dump_meminfo("after drop-caches", 16);
+
 		rcs = calloc(sizeof(*rcs), nchild);
 		igt_assert(rcs);
 
@@ -300,6 +331,10 @@ igt_main
 		cleanup_bufs(bcs, 1);
 		cleanup_bufs(rcs, nchild);
 		free(rcs);
+
+		/* SNB */
+		if (is_sandybridge)
+			dump_meminfo("finish", 16);
 	}
 
 	igt_subtest("blt-vs-render-ctxN") {
-- 
2.32.0

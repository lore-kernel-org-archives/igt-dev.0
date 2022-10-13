Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5A010E27E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:14:06 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Oct 2022 08:13:58 -0700
Message-Id: <20221013151400.2086268-7-ashutosh.dixit@intel.com>
In-Reply-To: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
References: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] i915/gem_exec_whisper: Add energy
 support for dgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Riana Tauro <riana.tauro@intel.com>

igt_power library reads energy using hwmon interface for dgfx and
rapl otherwise. Modify gem_exec_whisper test to use igt_power interface.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_whisper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index c763cc8e8d..c3fc5ba804 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -210,7 +210,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	unsigned int reloc_interruptions = 0;
 	unsigned int eb_migrations = 0;
 	struct power_sample sample[2];
-	struct rapl rapl;
+	struct igt_power gpu;
 	uint64_t old_offset;
 	int i, n, loc;
 	int debugfs;
@@ -223,7 +223,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	}
 
 	debugfs = igt_debugfs_dir(fd);
-	gpu_power_open(&rapl);
+	igt_power_open(fd, &gpu, "gpu");
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
@@ -258,7 +258,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		nchild *= nengine;
 
 	intel_detect_and_clear_missed_interrupts(fd);
-	rapl_read(&rapl, &sample[0]);
+	igt_power_get_energy(&gpu, &sample[0]);
 	igt_fork(child, nchild) {
 		unsigned int pass;
 
@@ -559,12 +559,14 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		fini_hang(&hang);
 	else
 		igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
-	if (rapl_read(&rapl, &sample[1]))  {
+
+	igt_power_get_energy(&gpu, &sample[1]);
+	if (sample[1].energy) {
 		igt_info("Total energy used: %.1fmJ\n",
-			 power_J(&rapl, &sample[0], &sample[1]) * 1e3);
+			 igt_power_get_mJ(&gpu, &sample[0], &sample[1]));
 	}
 
-	rapl_close(&rapl);
+	igt_power_close(&gpu);
 	close(debugfs);
 }
 
-- 
2.38.0

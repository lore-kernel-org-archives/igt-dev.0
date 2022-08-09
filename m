Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 Aug 2022 11:26:38 +0100
Message-Id: <20220809102638.146913-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/gem_lmem_swapping: add some
 coverage for big objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Everything we are testing here unfortunately fits within one packet (8M)
which means we have zero coverage when we need to split the copy over
multiple packets (including the aux CCS state).

v2:
 - Add some coverage for 2G objects, just to see if something blows up
   with overflowing int. (Ram)
 - Just make TEST_RANDOM use bigger sizes to ensure we get coverage of
   objects that require splitting the copy into multiple packets.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 1a4f4ca5..cccdb319 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -63,6 +63,7 @@ struct params {
 #define TEST_ENGINES	(1 << 4)
 #define TEST_MULTI	(1 << 5)
 #define TEST_CCS	(1 << 6)
+#define TEST_MASSIVE	(1 << 7)
 	unsigned int flags;
 	unsigned int seed;
 	bool oom_test;
@@ -477,8 +478,8 @@ static void fill_params(int i915, struct params *params,
 {
 	const int swap_mb = /* For lmem, swap is total of smem + swap. */
 		igt_get_total_ram_mb() + igt_get_total_swap_mb();
-	const unsigned int size = 1 << 20;
 	const int max_swap_pct = 75;
+	unsigned int size;
 	/*
 	 * In random mode, add 85% hard limit to use system memory.
 	 * noticed that 88.8% can trigger OOM on some system.
@@ -487,12 +488,23 @@ static void fill_params(int i915, struct params *params,
 	int spill_mb;
 	uint32_t handle;
 
+	size = 1 << 20;
+	if (flags & TEST_MASSIVE)
+		size = 1u << 31;
+
 	if (flags & TEST_RANDOM) {
 		params->size.min = 4096;
 		handle = create_bo(i915, &params->size.min, &region->region,
 				   do_oom_test);
 		gem_close(i915, handle);
-		params->size.max = 2 * size + params->size.min;
+		/*
+		 * Big enough to ensure we need to split the copy (both the
+		 * actual pages and aux CCS state) into multiple packets. Also
+		 * larger enough to ensure we get a mix of 64K and 2M GTT pages
+		 * (1G GTT pages are still missing from the kernel).
+		 */
+		params->size.max = (1ul << 24) + size + params->size.min;
+		size = params->size.max;
 	} else {
 		params->size.min = size;
 		params->size.max = size;
@@ -733,6 +745,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		unsigned int flags;
 	} *test, tests[] = {
 		{ "basic", 0 },
+		{ "massive",  TEST_MASSIVE }, /* check for (int) overflows */
+		{ "massive-random",  TEST_RANDOM | TEST_MASSIVE },
 		{ "random", TEST_RANDOM },
 		{ "random-engines", TEST_RANDOM | TEST_ENGINES },
 		{ "heavy-random", TEST_RANDOM | TEST_HEAVY },
-- 
2.37.1

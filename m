Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962576EABD
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 08:28:13 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed,  9 Sep 2020 14:01:25 +0530
Message-Id: <20200909083125.2057105-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_wc: Align subtests with
 correct function calls
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
To: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

- Fix the name of subtest "write-gtt-read-gtt"
- Fix subtests "write-wc-read-gtt" and "write-gtt-read-gtt"
to call correct fucntions

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/gem_mmap_wc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index f44b406d..c940376a 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -329,7 +329,7 @@ test_write_cpu_read_wc(int fd, int force_domain)
 }
 
 static void
-test_write_gtt_read_wc(int fd)
+test_write_wc_read_gtt(int fd)
 {
 	uint32_t handle;
 	uint32_t *src, *dst;
@@ -350,7 +350,7 @@ test_write_gtt_read_wc(int fd)
 }
 
 static void
-test_write_wc_read_gtt(int fd)
+test_write_gtt_read_wc(int fd)
 {
 	uint32_t handle;
 	uint32_t *src, *dst;
@@ -610,7 +610,7 @@ igt_main
 		igt_fixture gem_require_mappable_ggtt(fd);
 		igt_subtest("write-wc-read-gtt")
 			test_write_wc_read_gtt(fd);
-		igt_subtest("write-gtt-read-gtt")
+		igt_subtest("write-gtt-read-wc")
 			test_write_gtt_read_wc(fd);
 	}
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EE510E1C3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 15:35:33 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Thu, 26 May 2022 20:55:50 +0530
Message-Id: <20220526152551.773547-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220526152551.773547-1-priyanka.dandamudi@intel.com>
References: <20220526152551.773547-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_close_race: added description
 for test case
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added description for subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_close_race.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 93ae07ed..ec520510 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -289,6 +289,7 @@ igt_main
 		close(fd);
 	}
 
+	igt_describe("Basic check to verify race of gem close against workload submission.");
 	igt_subtest("basic-process") {
 		int fd = drm_open_driver(DRIVER_INTEL);
 
@@ -300,9 +301,13 @@ igt_main
 		close(fd);
 	}
 
+	igt_describe("Share buffer handle across different drmfd's and verify race of"
+		     " gem close against continuous workload(selfcopy) with minimum timeout.");
 	igt_subtest("basic-threads")
 		threads(1, 0);
 
+	igt_describe("Verify race of gem close against submission of continuous"
+		     " workload(selfcopying).");
 	igt_subtest("process-exit") {
 		int fd = drm_open_driver(DRIVER_INTEL);
 
@@ -314,9 +319,13 @@ igt_main
 		close(fd);
 	}
 
+	igt_describe("Share buffer handle across different drmfd's and verify race of"
+		     " gem close against continuous workload(selfcopy) in other contexts.");
 	igt_subtest("contexts")
 		threads(30, CONTEXTS);
 
+	igt_describe("Share buffer handle across different drmfd's and verify race of"
+		     " gem close against continuous workload(selfcopy) with timeout of 150ms.");
 	igt_subtest("gem-close-race")
 		threads(150, 0);
 
-- 
2.25.1

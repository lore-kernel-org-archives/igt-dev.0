Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B6910E50A
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 13:34:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 15:33:09 +0200
Message-Id: <20230905133309.365109-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230905133309.365109-1-zbigniew.kempczynski@intel.com>
References: <20230905133309.365109-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 9/9] tests/gem|xe_compute: Update
 documentation regarding test requirements
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

Currently test is prepared to run on DG2, ATS-M and PVC so lets
reflect this in the documentation tags.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/gem_compute.c | 3 +--
 tests/intel/xe_compute.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index b408efee16..8f4722d2dc 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -18,12 +18,11 @@
 
 /**
  * SUBTEST: compute-square
- * GPU requirement: only works on TGL
+ * GPU requirement: TGL, DG2, ATS-M
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
  * Functionality: compute openCL kernel
- * TODO: extend test to cover other platforms
  */
 static void
 test_compute_square(int fd)
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 0c54fbec42..07764decb5 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,12 +19,11 @@
 
 /**
  * SUBTEST: compute-square
- * GPU requirement: only works on TGL
+ * GPU requirement: TGL, PVC
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
  *	for an input dataset..
  * Functionality: compute openCL kernel
- * TODO: extend test to cover other platforms
  */
 static void
 test_compute_square(int fd)
-- 
2.34.1

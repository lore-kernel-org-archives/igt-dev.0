Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315F510E423
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:52 +0200
Message-Id: <20230817094652.40243-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/gem|xe_compute: Update
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

Currently test is prepared to run on DG2 and ATS-M so lets reflect
this in the documentation tags.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_compute.c | 3 +--
 tests/xe/xe_compute.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_compute.c b/tests/i915/gem_compute.c
index b408efee16..8f4722d2dc 100644
--- a/tests/i915/gem_compute.c
+++ b/tests/i915/gem_compute.c
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
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 0c54fbec42..71ff790460 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -19,12 +19,11 @@
 
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
-- 
2.34.1

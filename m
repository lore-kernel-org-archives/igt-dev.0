Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6758410E5B3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:01:13 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:14 +0200
Message-ID: <20231020130016.86398-7-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 6/8] tests/intel/xe_create: use drm
 helper for GPUs count
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

Instead of counting filter use more general method supported
by new function from drmtest, drm_get_gpu_count().

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d74c2140d..d17ebeb65 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -237,14 +237,14 @@ igt_main
 	}
 
 	igt_subtest("multigpu-create-massive-size") {
-		int gpu_filter_count = igt_device_filter_count();
+		int gpu_filter_count = drm_get_gpu_count(DRIVER_XE);
 
 		igt_require(xe > 0);
 		igt_require(gpu_filter_count >= 2);
 		igt_multi_fork(child, gpu_filter_count) {
 			int gpu_fd;
 
-			gpu_fd = child ? __drm_open_driver_another(child, DRIVER_XE) : drm_reopen_driver(xe);
+			gpu_fd = __drm_open_driver_another(child, DRIVER_XE);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 
 			create_massive_size(gpu_fd);
-- 
2.42.0

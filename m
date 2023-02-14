Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9310E982
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 19:28:54 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 20:28:30 +0100
Message-Id: <20230214192830.51997-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
References: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] i915/gem_exec_gttfill: fix multigpu
 subtest
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

Fix multigpu subtest and open cards in order, starting
from first one.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_gttfill.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index 137277fe..c310a981 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -266,11 +266,23 @@ igt_main
 	}
 
 	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
+#define MAX_GPU 16
+		int fds[MAX_GPU];
+
 		igt_require(gpu_count > 1);
+		igt_require(gpu_count <= MAX_GPU);
+		for (int i = 0; i < gpu_count; i++) {
+			int n_fd;
+
+			n_fd = i ? __drm_open_driver_another(i, DRIVER_INTEL) : gem_reopen_driver(i915);
+			igt_assert(n_fd >= 0);
+			fds[i] = n_fd;
+		}
+
 		igt_multi_fork(child, gpu_count) {
 			int g_fd;
 			// prepare
-			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+			g_fd = gem_reopen_driver(fds[child]);
 			igt_assert(g_fd >= 0);
 			ctx = intel_ctx_create_all_physical(g_fd);
 			igt_fork_hang_detector(g_fd);
-- 
2.37.2

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBCB10E027
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 19:28:43 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 20:28:28 +0100
Message-Id: <20230214192830.51997-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
References: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/i915/gem_basic: fix multigpu
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

Function opening N-th driver card is designed to be called in
succession so refactor test to accommodate it. This was not
discovered until a recent test on a board with more than two
discrete GPU cards.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_basic.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 3dd790c6..66ff7fcc 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -37,6 +37,7 @@
 
 #include "drm.h"
 
+#include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_types.h"
@@ -101,17 +102,32 @@ igt_main
 
 	igt_describe("Verify basic functionality of gem_create and gem_close on multi-GPU.");
 	igt_subtest("multigpu-create-close") {
+#define MAX_GPU 16
+		int fds[MAX_GPU];
+
 		igt_require(gpu_count > 1);
+		igt_require(gpu_count <= MAX_GPU);
+		for (int i = 0; i < gpu_count; i++) {
+			int n_fd;
+
+			n_fd = i ? __drm_open_driver_another(i, DRIVER_INTEL) : gem_reopen_driver(fd);
+			igt_assert(n_fd >= 0);
+			fds[i] = n_fd;
+		}
+
 		igt_multi_fork(child, gpu_count) {
 			int gpu_fd;
 
-			gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
+			gpu_fd = gem_reopen_driver(fds[child]);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 			test_create_close(gpu_fd);
 			close(gpu_fd);
 		}
 
 		igt_waitchildren();
+
+		for (int i = gpu_count - 1; i >= 0; i--)
+			close(fds[i]);
 	}
 
 	igt_describe("Verify that closing drm driver is possible with opened gem object.");
-- 
2.37.2

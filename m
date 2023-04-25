Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEBA10E6C0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 06:55:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:19:39 +0530
Message-Id: <20230425064953.2121947-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 26/40] tests/kms_concurrent: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_concurrent.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index e6d61a84d..e1e581723 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -387,7 +387,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_start();
 	}
 
@@ -397,7 +397,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_stop();
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.40.0

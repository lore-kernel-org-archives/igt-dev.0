Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2911A69C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 14:17:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 May 2022 16:17:45 +0200
Message-Id: <20220519141745.118599-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: For i915 devices run
 allocator in multiprocess mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luciano Coelho <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test calls igt_fork() so for i915 requires offset allocation arbitration
(allocator in multiprocess mode) especially when same drm fd is used
in children. Dedicated thread (intel_allocator_multiprocess_start())
is required to be started on the very beginning to handle offset
allocations as well as stopping it (intel_allocator_multiprocess_stop())
before test exits.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Luciano Coelho <luciano.coelho@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_concurrent.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 82b2021e72..c334194b9a 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -378,6 +378,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
+		if (is_i915_device(data.drm_fd))
+			intel_allocator_multiprocess_start();
 	}
 
 	for_each_pipe_static(pipe) {
@@ -386,6 +388,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		if (is_i915_device(data.drm_fd))
+			intel_allocator_multiprocess_stop();
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
-- 
2.32.0

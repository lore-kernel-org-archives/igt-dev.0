Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5C310E8F4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 10:22:43 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 10:22:11 +0000
Message-Id: <20230322102211.263194-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/debugfs: fix xe_device_get()
 placement
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

Accidentally broke this when moving the xe_device_get(), missing that
for_each_gt() also relies on the cached query state:

Starting subtest: gt
(xe_debugfs:6941) xe/xe_query-CRITICAL: Test assertion failure function
xe_number_gt, file ../lib/xe/xe_query.c:327:
(xe_debugfs:6941) xe/xe_query-CRITICAL: Failed assertion: xe_dev
Stack trace:
  #0 ../lib/igt_core.c:1963 __igt_fail_assert()
  #1 ../lib/xe/xe_query.c:327 xe_number_gt()
  #2 ../tests/xe/xe_debugfs.c:262 __igt_unique____real_main245()
  #3 ../tests/xe/xe_debugfs.c:245 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x25]
Subtest gt failed.

Fixes: c01d2733 ("tests/xe/debugfs: fix double-free in test_base")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/xe/xe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index ad6191fb..f2480845 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -145,8 +145,6 @@ test_base(int fd)
 	igt_debugfs_dump(fd, "gem_names");
 
 	validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
-
-	xe_device_put(fd);
 }
 
 /**
@@ -250,6 +248,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
 		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
 	}
 
@@ -271,6 +270,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		xe_device_put(fd);
 		close(fd);
 	}
 }
-- 
2.39.2

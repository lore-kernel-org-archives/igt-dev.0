Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC510E4DE
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:06 +0530
Message-Id: <20230622065422.2235134-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 07/23] tests/kms: Close the fd before exit
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

Close the file descriptor before exiting the test.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c       | 1 +
 tests/kms_writeback.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4eb..6a766bfb9 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -528,5 +528,6 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index c4808b02c..db1f0884f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -606,5 +606,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		detach_crtc(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
-- 
2.40.0

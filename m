Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32E10E96E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:07 +0530
Message-Id: <20230426114725.2244653-28-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 27/45] tests/kms_async_flips: No XE support
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

Async flips won't work with linear buffers on Intel hardware,
hence don't run tests on XE device as XE won't support tiling.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1e6506e3d..51ffa523a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -592,7 +592,13 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 	int i;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		/*
+		 * FIXME: As of now, Async flips won't work with linear buffers
+		 * on Intel hardware, hence don't run tests on XE device as XE
+		 * won't support tiling.
+		 * Once Kernel changes got landed, please update this logic.
+		 */
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY & ~DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-- 
2.40.0

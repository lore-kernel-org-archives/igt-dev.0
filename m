Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093266E8E6
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 03:16:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri, 16 Jul 2021 16:33:42 +0530
Message-Id: <20210716110342.20034-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dither: Make dither tests generic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

As dithering is not Intel specific, it would be good to make
these tests generic, so that it can be easy to extend/re-use
for other platforms.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 49f7935268..65ca169ac2 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -90,6 +90,8 @@ static dither_status_t get_dither_state(data_t *data)
 	int dir, res;
 	dither_status_t status;
 
+	igt_require(is_i915_device(data->drm_fd));
+
 	dir = igt_debugfs_dir(data->drm_fd);
 	igt_assert(dir >= 0);
 
@@ -230,7 +232,7 @@ igt_main
 	data_t data = { 0 };
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

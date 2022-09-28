Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98C510E291
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:37:46 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 12:09:10 +0530
Message-Id: <20220928063912.2963498-4-kunal1.joshi@intel.com>
In-Reply-To: <20220928063912.2963498-1-kunal1.joshi@intel.com>
References: <20220928063912.2963498-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/5] tests/i915/kms_pwrite_crc: test
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v1:
Sanitize the state before starting the subtest and close drm_fd.

v2:
igt_fixture cannot be place inside igt_simple_main (Jeevan)
Corrected commit subject. (Swati)
Removed comments (Swati)

CC: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_pwrite_crc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 584e6a19..9bfd44ed 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -160,6 +160,9 @@ static void run_test(data_t *data)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+
+		igt_display_reset(&data->display);
+
 		data->output = output;
 		data->pipe = pipe;
 
@@ -179,16 +182,13 @@ static data_t data;
 igt_simple_main
 {
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-
 	data.devid = intel_get_drm_devid(data.drm_fd);
-
 	kmstest_set_vt_graphics_mode();
-
 	igt_require_pipe_crc(data.drm_fd);
-
 	igt_display_require(&data.display, data.drm_fd);
 
 	run_test(&data);
-
+
 	igt_display_fini(&data.display);
+	close(data.drm_fd);
 }
-- 
2.25.1

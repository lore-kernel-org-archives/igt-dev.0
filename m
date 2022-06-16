Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9076610FB61
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 18:03:25 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jun 2022 23:30:24 +0530
Message-Id: <20220616180024.98304-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220616180024.98304-1-mohammed.thasleem@intel.com>
References: <20220616180024.98304-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_mmap_write_crc: Test
 Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index b7a3b9de..1c0da8ab 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -169,6 +169,8 @@ static void prepare_crtc(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode;
 
+	igt_display_reset(display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -204,7 +206,7 @@ static void cleanup_crtc(data_t *data)
 
 	igt_plane_set_fb(data->primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
@@ -290,6 +292,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 
 		igt_stop_helper(&hog);
 	}
-- 
2.25.1

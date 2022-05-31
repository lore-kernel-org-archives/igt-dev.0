Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12EA10F698
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 10:39:46 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 15:38:15 +0530
Message-Id: <20220531100815.32431-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: Move cleanup code to
 fixture
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

When a subtest fails, it exits from the assert and does not run the
cleanup part of the subtest. To avoid this, move the cleanup code to
igt_fixture outside the subtest.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_fb.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 7a850401..9d54f9c9 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -264,12 +264,6 @@ static void prep_fb(data_t *data)
 	generate_pattern(data, &data->big_fb, 640, 480);
 }
 
-static void cleanup_fb(data_t *data)
-{
-	igt_remove_fb(data->drm_fd, &data->big_fb);
-	data->big_fb.fb_id = 0;
-}
-
 static void set_c8_lut(data_t *data)
 {
 	igt_pipe_t *pipe = &data->display.pipes[data->pipe];
@@ -463,14 +457,6 @@ static bool test_pipe(data_t *data)
 	if (data->format == DRM_FORMAT_C8)
 		unset_lut(data);
 
-	igt_pipe_crc_free(data->pipe_crc);
-
-	igt_output_set_pipe(data->output, PIPE_ANY);
-
-	igt_remove_fb(data->drm_fd, &data->small_fb);
-
-	intel_bb_destroy(data->ibb);
-
 	return ret;
 }
 
@@ -563,14 +549,6 @@ max_hw_stride_async_flip_test(data_t *data)
 	}
 	igt_reset_timeout();
 
-	igt_pipe_crc_free(data->pipe_crc);
-	igt_output_set_pipe(data->output, PIPE_NONE);
-	igt_remove_fb(data->drm_fd, &data->big_fb);
-	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
-	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
-
-	intel_bb_destroy(data->ibb);
-
 	return true;
 }
 
@@ -773,6 +751,18 @@ set_max_hw_stride(data_t *data)
 	}
 }
 
+static void test_cleanup(data_t *data)
+{
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_remove_fb(data->drm_fd, &data->big_fb);
+	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
+	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
+	igt_remove_fb(data->drm_fd, &data->small_fb);
+
+	intel_bb_destroy(data->ibb);
+}
+
 static data_t data = {};
 
 static const struct {
@@ -918,7 +908,7 @@ igt_main
 			}
 
 			igt_fixture
-				cleanup_fb(&data);
+				test_cleanup(&data);
 		}
 	}
 
@@ -975,7 +965,7 @@ igt_main
 				}
 
 				igt_fixture
-					cleanup_fb(&data);
+					test_cleanup(&data);
 			}
 		}
 	}
-- 
2.22.0

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE7510E0ED
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 04:59:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	ville.syrjala@linux.intel.com
Date: Mon, 13 Mar 2023 10:26:01 +0530
Message-Id: <20230313045601.1914192-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230313045601.1914192-1-bhanuprakash.modem@intel.com>
References: <20230313045601.1914192-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms: Add missing
 igt_put_cairo_ctx()
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

Remeber to call igt_put_cairo_ctx() after rendering to make
sure the results actually end up in the framebuffer (in case
the rendering happens to a temporary buffer and there needs
to be a copy back at the end).

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_async_flips.c | 4 ++++
 tests/kms_lease.c       | 2 +-
 tests/kms_writeback.c   | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 55be0bd87..34808f401 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -494,9 +494,11 @@ static void test_crc(data_t *data)
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
 	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
+	igt_put_cairo_ctx(cr);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[!frame]);
 	igt_paint_color(cr, 0, 0, data->bufs[!frame].width, data->bufs[!frame].height, 1.0, 0.0, 0.0);
+	igt_put_cairo_ctx(cr);
 
 	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
 			     &data->output->config.connector->connector_id, 1,
@@ -518,6 +520,7 @@ static void test_crc(data_t *data)
 		/* fill the next fb with the expected color */
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
 		igt_paint_color(cr, 0, 0, 1, data->bufs[frame].height, 1.0, 0.0, 0.0);
+		igt_put_cairo_ctx(cr);
 
 		data->flip_pending = true;
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
@@ -530,6 +533,7 @@ static void test_crc(data_t *data)
 		frame = !frame;
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
 		igt_paint_color_rand(cr, 0, 0, 1, data->bufs[frame].height);
+		igt_put_cairo_ctx(cr);
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 7eab77078..b9b669420 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -207,7 +207,7 @@ static int paint_fb(int drm_fd, struct igt_fb *fb, const char *test_name,
 	igt_cairo_printf_line(cr, align_hcenter, 10, "%s", connector_str);
 	igt_cairo_printf_line(cr, align_hcenter, 10, "%s", pipe_str);
 
-	cairo_destroy(cr);
+	igt_put_cairo_ctx(cr);
 
 	return 0;
 }
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9d1345857..c4808b02c 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -414,6 +414,7 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
 	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
+	cairo_surface_destroy(fb_surface_out);
 
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
-- 
2.39.1

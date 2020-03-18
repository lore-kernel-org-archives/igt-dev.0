Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62096E84B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 00:49:22 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 17 Mar 2020 20:49:14 -0400
Message-Id: <20200318004914.236815-2-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
References: <20200318004914.236815-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_pipe_crc_basic: Add
 disable-crc-after-crtc-pipe-* tests
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
Cc: nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

I ended up hitting some bugs when writing nouveau's CRC implementation
due to incorrectly handling the situation where we disable CRCs on a
pipe that already been disabled, which ended up causing some other vague
igt issues when running certain tests in multi-mode.

So, let's add a trivial test for this scenario while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_pipe_crc_basic.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f121e27e..4a58332a 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -152,6 +152,41 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	}
 }
 
+static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output = igt_get_single_output_for_pipe(&data->display, pipe);
+	igt_pipe_crc_t *pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	igt_crc_t crc[2];
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
+
+	igt_create_color_fb(data->drm_fd,
+			    mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.0, 1.0, 0.0, &data->fb);
+	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
+	igt_display_commit(display);
+
+	igt_pipe_crc_start(pipe_crc);
+	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[0]);
+
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_pipe_crc_stop(pipe_crc);
+
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc[1]);
+	igt_assert_crc_equal(&crc[0], &crc[1]);
+
+	igt_pipe_crc_free(pipe_crc);
+	igt_remove_fb(data->drm_fd, &data->fb);
+}
+
 data_t data = {0, };
 
 igt_main
@@ -196,6 +231,9 @@ igt_main
 			test_read_crc(&data, pipe, 0);
 		}
 
+		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
+			test_disable_crc_after_crtc(&data, pipe);
+
 		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
 			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F22E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB3410E51D;
	Fri, 10 Jan 2025 19:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNBem+cY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA9610E51D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538363; x=1768074363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DTtf4CkCzzIFStWVO+zZmR+PeNuXM0wqUftLyffLNHg=;
 b=YNBem+cYe3BdGyCnPGVKw61A0cJ2tDTtmZs+A0kTTapQ0mw8VeK9NHOJ
 +AKFbeAxl/MhLbglPyX4KEJqqSTk5fUc96sEx63/JrJTkZxIjcBT4sAkv
 Jxu01fPYKmWmv6tPpbBdYlpEKSUWEQVkEmhUtkKoULPJWK3Tf3qYI5Xt1
 cvkr14cJ4bXiALYO4xT9ES/ip/9qDatVMv2XiAPy5wi8aew/da+GeAHdt
 zdzhozKFD/PHU2LZvq8aXMii0GHJiLrq9rY2Og+M62OkjlbRhqgyN9fdP
 yStS41SXbysc84aOSjYCJ23ShhnA6uAVpx8G7hdPuIChbygSGwmM16lLG g==;
X-CSE-ConnectionGUID: xtdQjCIkSFqkCkUj53FD3g==
X-CSE-MsgGUID: wOvuINqgRFWjrS10svy/sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419819"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419819"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:46:03 -0800
X-CSE-ConnectionGUID: 3FvomNEFT+OrfNUJnluTaw==
X-CSE-MsgGUID: 2H2BAkVkS6uyLOQj6z3D5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334456"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:46:01 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t 6/8] tools: Add new sharpness tool
Date: Sat, 11 Jan 2025 01:20:58 +0530
Message-Id: <20250110195100.150301-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

New sharpness tool is introduced to validate basic functionality
of content adaptive sharpness filter supported with intel LNL platform.

Tool has following 2 main functions:
1. input user defined strength value (1-255)
2. input incr/decr factor for setting strength and use up/down
   arrow keys to increase/decrease strength during run time

To experiment with sharpness, HD 640x480 default image is used.
Option is given to user to provide HD, FHD, 4K images as an
input.
NOTE: Image used as default is a stocked image.

Tool has following options:
-d <incr/decr_factor>:		increment/decrement factor for
				sharpness strength for HD resolution.
				Default image will be used.
-D <strength>:			sharpness strength value for HD
				resolution. Default image will be used.
-h <image> <incr/decr_factor>:	image file for HD resolution (640x480) and
				increment/decrement factor for sharpness strength.
-H <image> <strength>:		image file for HD resolution
				(640x480) and sharpness strength value.
-f <image> <incr/decr_factor>:	image file for Full HD resolution
				(1920x1080) and increment/decrement factor for sharpness strength.
-F <image> <strength>:		image file for Full HD resolution
				(1920x1080) and sharpness strength value.
-k <image> <incr/decr_factor>:	image file for 4K resolution
				(3840x2160) and increment/decrement factor for sharpness strength.
-K <image> <strength>:		image file for 4K resolution
				(3840x2160) and sharpness strength value.
-p:				prints this message

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tools/intel_sharpness_tool.c | 370 +++++++++++++++++++++++++++++++++++
 1 file changed, 370 insertions(+)
 create mode 100644 tools/intel_sharpness_tool.c

diff --git a/tools/intel_sharpness_tool.c b/tools/intel_sharpness_tool.c
new file mode 100644
index 000000000..89d307e32
--- /dev/null
+++ b/tools/intel_sharpness_tool.c
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+#include <unistd.h>
+
+#define DISABLE_FILTER 0
+#define MIN_VALUE 1
+#define MAX_VALUE 255
+#define UP_ARROW 65
+#define DOWN_ARROW 66
+
+#define MAX(a, b) ((a) > (b) ? (a) : (b))
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
+typedef struct {
+	int drm_fd;
+	enum pipe pipe_id;
+	struct igt_fb fb;
+	igt_pipe_t *pipe;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *plane;
+	drmModeModeInfo *mode;
+	int filter_strength;
+	uint64_t modifier;
+	uint32_t format;
+	const char *png;
+	int incr_value;
+	int width;
+	int height;
+} data_t;
+
+typedef enum {
+	NONE_SELECTED,
+	SHARP_INCR_SELECTED,
+	SHARP_USR_SELECTED,
+} option;
+
+/* Sets the sharpness filter strength on the display pipe. */
+static void set_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPNESS_STRENGTH,
+				data->filter_strength);
+}
+
+static void paint_image(data_t *data)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
+	int img_x, img_y, img_w, img_h;
+
+	img_x = img_y = 0;
+	img_w = data->fb.width;
+	img_h = data->fb.height;
+
+	igt_paint_image(cr, data->png, img_x, img_y, img_w, img_h);
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void setup_fb(data_t *data)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(data->drm_fd, data->width, data->height,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
+	igt_assert(fb_id);
+
+	paint_image(data);
+}
+
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->fb);
+
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+/* Tests the sharpness filter by applying the filter strength and committing the changes. */
+static void test_sharpness_filter(data_t *data)
+{
+	int ret;
+
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	data->plane = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	setup_fb(data);
+	igt_plane_set_fb(data->plane, &data->fb);
+	igt_plane_set_size(data->plane, data->mode->hdisplay, data->mode->vdisplay);
+
+	/* Set filter strength property */
+	set_filter_strength_on_pipe(data);
+	igt_debug("Sharpened image should be observed for filter strength > 0\n");
+
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_assert_eq(ret, 0);
+}
+
+/* Checks if the sharpness filter property is available on a given pipe. */
+static bool has_sharpness_filter(igt_pipe_t *pipe)
+{
+	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
+}
+
+static void set_output(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		/* Restricting to pipe A */
+		if (pipe != PIPE_A)
+			continue;
+
+		data->output = output;
+		data->pipe_id = pipe;
+		data->pipe = &display->pipes[data->pipe_id];
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!has_sharpness_filter(data->pipe))
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+	}
+}
+
+/* Handles incrementing or decrementing the sharpness filter strength based on factor. */
+static void do_sharpness_incr(data_t *data)
+{
+	char arrow;
+	data->filter_strength = 0;
+
+	set_output(data);
+
+	/* Handle incrementing or decrementing based on arrow key input */
+	while ((arrow = getchar()) != 'q') {
+		if (arrow != UP_ARROW && arrow != DOWN_ARROW)
+			continue;
+
+		if (arrow == UP_ARROW) {
+			data->filter_strength = MIN(MAX_VALUE, data->filter_strength + data->incr_value);
+		} else if (arrow == DOWN_ARROW) {
+			data->filter_strength = MAX(MIN_VALUE, data->filter_strength - data->incr_value);
+		}
+
+		igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), data->output->name, data->filter_strength);
+		test_sharpness_filter(data);
+	}
+
+	/* Clear the input buffer */
+	while (getchar() != '\n');
+	cleanup(data);
+}
+
+/* Allows the user to specify a sharpness filter strength value directly. */
+static void do_sharpness_usr(data_t *data)
+{
+	// Check if the strength value is within the valid range
+	if (data->filter_strength < MIN_VALUE || data->filter_strength > MAX_VALUE) {
+		igt_warn("Invalid strength value. Please provide a value between %d and %d.\n", MIN_VALUE, MAX_VALUE);
+		cleanup(data);
+		return;
+	}
+
+	set_output(data);
+	igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), data->output->name, data->filter_strength);
+	test_sharpness_filter(data);
+
+	cleanup(data);
+}
+
+static void print_usage(void)
+{
+	printf("Options:\n"
+	       "  -d <incr/decr_factor>:          increment/decrement factor for sharpness strength for HD resolution. Default image will be used.\n"
+	       "  -D <strength>:                  sharpness strength value for HD resolution. Default image will be used.\n"
+
+	       "  -h <image> <incr/decr_factor>:  image file for HD resolution (640x480) and increment/decrement factor for sharpness strength.\n"
+	       "  -H <image> <strength>:          image file for HD resolution (640x480) and sharpness strength value.\n"
+	       "  -d <incr/decr_factor>:          increment/decrement factor for sharpness strength for HD resolution. Default image will be used.\n"
+	       "  -D <strength>:                  sharpness strength value for HD resolution. Default image will be used.\n"
+	       "  -f <image> <incr/decr_factor>:  image file for Full HD resolution (1920x1080) and increment/decrement factor for sharpness strength.\n"
+	       "  -F <image> <strength>:          image file for Full HD resolution (1920x1080) and sharpness strength value.\n"
+	       "  -k <image> <incr/decr_factor>:  image file for 4K resolution (3840x2160) and increment/decrement factor for sharpness strength.\n"
+	       "  -K <image> <strength>:          image file for 4K resolution (3840x2160) and sharpness strength value.\n"
+	       "  -p:                             prints this message\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int opt;
+	data_t data = {0};
+	int ret = EXIT_SUCCESS;
+	FILE *file = NULL;
+
+	option selected_option = NONE_SELECTED;
+
+	// Default image for -d and -D options
+	const char *default_image = "default_hd_image.png";
+
+	if (argc <= 1) {
+		print_usage();
+		return EXIT_SUCCESS;
+	}
+
+	data.drm_fd = drm_open_driver_master(DRIVER_XE);
+	igt_require(data.drm_fd >= 0);
+
+	kmstest_set_vt_graphics_mode();
+
+	igt_display_require(&data.display, data.drm_fd);
+	igt_require(data.display.is_atomic);
+	igt_display_require_output(&data.display);
+
+	while ((opt = getopt(argc, argv, "h:H:d:D:f:k:F:K:p")) != -1) {
+		switch (opt) {
+		case 'p':
+			print_usage();
+			return EXIT_SUCCESS;
+		case 'd':
+			data.incr_value = atoi(optarg);
+			data.png = default_image;
+			data.width = 640;
+			data.height = 480;
+			selected_option = SHARP_INCR_SELECTED;
+			break;
+		case 'D':
+			data.filter_strength = atoi(optarg);
+			if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
+				igt_warn("Invalid strength value.\n");
+				return EXIT_FAILURE;
+			}
+			data.png = default_image;
+			data.width = 640;
+			data.height = 480;
+			selected_option = SHARP_USR_SELECTED;
+			break;
+		case 'h':
+			if (optind < argc) {
+				data.png = optarg;
+				data.incr_value = atoi(argv[optind]);
+				optind++;
+			} else {
+				igt_warn("Error: Option -h requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 640;
+			data.height = 480;
+			selected_option = SHARP_INCR_SELECTED;
+			break;
+		case 'H':
+			if (optind < argc) {
+				data.png = optarg;
+				data.filter_strength = atoi(argv[optind]);
+				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
+					igt_warn("Invalid strength value.\n");
+					return EXIT_FAILURE;
+				}
+				optind++;
+			} else {
+				igt_warn("Error: Option -H requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 640;
+			data.height = 480;
+			selected_option = SHARP_USR_SELECTED;
+			break;
+		case 'f':
+			if (optind < argc) {
+				data.png = optarg;
+				data.incr_value = atoi(argv[optind]);
+				optind++;
+			} else {
+				igt_warn("Error: Option -f requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 1920;
+			data.height = 1080;
+			selected_option = SHARP_INCR_SELECTED;
+			break;
+		case 'F':
+			if (optind < argc) {
+				data.png = optarg;
+				data.filter_strength = atoi(argv[optind]);
+				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
+					igt_warn("Invalid strength value.\n");
+					return EXIT_FAILURE;
+				}
+				optind++;
+			} else {
+				igt_warn("Error: Option -F requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 1920;
+			data.height = 1080;
+			selected_option = SHARP_USR_SELECTED;
+			break;
+		case 'k':
+			if (optind < argc) {
+				data.png = optarg;
+				data.incr_value = atoi(argv[optind]);
+				optind++;
+			} else {
+				igt_warn("Error: Option -k requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 3840;
+			data.height = 2160;
+			selected_option = SHARP_INCR_SELECTED;
+			break;
+		case 'K':
+			if (optind < argc) {
+				data.png = optarg;
+				data.filter_strength = atoi(argv[optind]);
+				if (data.filter_strength < MIN_VALUE || data.filter_strength > MAX_VALUE) {
+					igt_warn("Invalid strength value.\n");
+					return EXIT_FAILURE;
+				}
+				optind++;
+			} else {
+				igt_warn("Error: Option -K requires two arguments.\n");
+				return EXIT_FAILURE;
+			}
+			data.width = 3840;
+			data.height = 2160;
+			selected_option = SHARP_USR_SELECTED;
+			break;
+		default:
+			igt_warn("Unknown option.\n");
+			print_usage();
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (data.png) {
+		file = igt_fopen_data(data.png);
+		if (file == NULL) {
+			igt_warn("Could not open data file \"%s\": No such file or directory\n", data.png);
+			return EXIT_FAILURE;
+		}
+	}
+
+	// Ensure valid arguments
+	if (!data.png && data.filter_strength <= 0 && selected_option != NONE_SELECTED) {
+		igt_warn("Error: No image file or strength value specified.\n");
+		return EXIT_FAILURE;
+	}
+
+	// Handle different options
+	if (selected_option == SHARP_INCR_SELECTED) {
+		do_sharpness_incr(&data);
+	} else if (selected_option == SHARP_USR_SELECTED) {
+		do_sharpness_usr(&data);
+	}
+
+	fclose(file);
+	igt_display_fini(&data.display);
+	close(data.drm_fd);
+
+	return ret;
+}
+
-- 
2.25.1


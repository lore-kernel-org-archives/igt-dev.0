Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCDECF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3F610E393;
	Mon, 23 Sep 2024 07:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGtCyTFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048FC10E393
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075279; x=1758611279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8y+HNnquyfTbZ1puhP5u+Tu2imxG0MIkXC42TWgouM=;
 b=LGtCyTFZcy3H7Ww0hc81EANyg38EVuTf/3OPSagl7QIvrfr7e+LKRqwH
 0MowR46m/Bq8KM0cUvGlx9gxSV0FRrRC1f/cUXB6yZ5j+hB+78VoDFdGu
 9CluTRtuXGKzU8loM7raX32OR99T9oR8LBIRshOnIDB4yG/c+zW1k+Vza
 sIEjN12W8Bhdl7PsnVCW/KDb5vNRdS4j/Hpnba8aKhvoaGJ3th0yTRuxQ
 iP22Y8iPvnygtB613TpjdskZW8JXczRnl6azqGVu63kk+uR7JFQvz+nd8
 PiR7kO53/RRSNNsNPr75mDfEanh7P/GyaPEQT1UmUb2y19eWVFD1osdL0 Q==;
X-CSE-ConnectionGUID: 0ejrsyoeTxS3HepzMhE1eA==
X-CSE-MsgGUID: TI3KlO6xSaqy/nc04CFhvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25956170"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25956170"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:07:59 -0700
X-CSE-ConnectionGUID: hNUNdaekQwW3l/kBB04HwA==
X-CSE-MsgGUID: jNEp0B+fQ0Oknrazg9DyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71799166"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 00:07:58 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t 4/6] tools: Add new sharpness tool
Date: Mon, 23 Sep 2024 12:40:21 +0530
Message-Id: <20240923071023.1170127-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923071023.1170127-1-swati2.sharma@intel.com>
References: <20240923071023.1170127-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

To experiment with sharpness, 3 images are used (HD, FHD, 4K).
All the images are stocked images.

Tool has following options:
-h value:   incr/decr factor for setting strength for hd res
-f value:   incr/decr factor for setting strength for fhd res
-k value:   incr/decr factor for setting strength for 4k res
-H value:   user defined strength (1-255) for hd res
-F value:   user defined strength (1-255) for fhd res
-K value:   user defined strength (1-255) for 4k res
-p:         prints this message

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tools/intel_sharpness_tool.c | 342 +++++++++++++++++++++++++++++++++++
 1 file changed, 342 insertions(+)
 create mode 100644 tools/intel_sharpness_tool.c

diff --git a/tools/intel_sharpness_tool.c b/tools/intel_sharpness_tool.c
new file mode 100644
index 000000000..3040bb802
--- /dev/null
+++ b/tools/intel_sharpness_tool.c
@@ -0,0 +1,342 @@
+/* SPDX-License-Identifier: MIT */=0D
+/*=0D
+ * Copyright =C2=A9 2024 Intel Corporation=0D
+ */=0D
+=0D
+#include "igt.h"=0D
+#include "igt_kms.h"=0D
+=0D
+#define DISABLE_FILTER			0=0D
+#define MIN_VALUE			1=0D
+#define MAX_VALUE			255=0D
+#define UP_ARROW			65=0D
+#define DOWN_ARROW			66=0D
+=0D
+#define MAX(a,b) ((a) > (b) ? (a) : (b))=0D
+#define MIN(a,b) ((a) < (b) ? (a) : (b))=0D
+=0D
+typedef struct {=0D
+	int drm_fd;=0D
+	enum pipe pipe_id;=0D
+	struct igt_fb fb;=0D
+	igt_pipe_t *pipe;=0D
+	igt_display_t display;=0D
+	igt_output_t *output;=0D
+	igt_plane_t *plane;=0D
+	drmModeModeInfo *mode;=0D
+	int filter_strength;=0D
+	uint64_t modifier;=0D
+	uint32_t format;=0D
+	const char *png;=0D
+	int incr_value;=0D
+	int width;=0D
+	int height;=0D
+} data_t;=0D
+=0D
+typedef enum {=0D
+	NONE_SELECTED,=0D
+	SHARP_INCR_SELECTED,=0D
+	SHARP_USR_SELECTED,=0D
+	USAGE_SELECTED=0D
+} option;=0D
+=0D
+/* Sets the sharpness filter strength on the display pipe. */=0D
+static void set_filter_strength_on_pipe(data_t *data)=0D
+{=0D
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,=0D
+				IGT_CRTC_SHARPNESS_STRENGTH,=0D
+				data->filter_strength);=0D
+}=0D
+=0D
+static void paint_image(data_t *data)=0D
+{=0D
+	cairo_t *cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);=0D
+	int img_x, img_y, img_w, img_h;=0D
+=0D
+	img_x =3D img_y =3D 0;=0D
+	img_w =3D data->fb.width;=0D
+	img_h =3D data->fb.height;=0D
+=0D
+	igt_paint_image(cr, data->png, img_x, img_y, img_w, img_h);=0D
+=0D
+	igt_put_cairo_ctx(cr);=0D
+}=0D
+=0D
+static void setup_fb(data_t *data)=0D
+{=0D
+	int fb_id;=0D
+=0D
+	fb_id =3D igt_create_fb(data->drm_fd, data->width, data->height, data->fo=
rmat, data->modifier, &data->fb);=0D
+	igt_assert(fb_id);=0D
+=0D
+	paint_image(data);=0D
+}=0D
+=0D
+static void cleanup(data_t *data)=0D
+{=0D
+	igt_remove_fb(data->drm_fd, &data->fb);=0D
+=0D
+	igt_output_set_pipe(data->output, PIPE_NONE);=0D
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);=0D
+}=0D
+=0D
+/* Tests the sharpness filter by applying the filter strength and committi=
ng the changes. */=0D
+static void test_sharpness_filter(data_t *data)=0D
+{=0D
+	igt_output_t *output =3D data->output;=0D
+	drmModeModeInfo *mode =3D data->mode;=0D
+	int ret;=0D
+=0D
+	igt_display_reset(&data->display);=0D
+	igt_output_set_pipe(output, data->pipe_id);=0D
+=0D
+	data->plane =3D igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMAR=
Y);=0D
+	igt_skip_on_f(!igt_plane_has_format_mod(data->plane, data->format, data->=
modifier),=0D
+		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(dat=
a->pipe_id));=0D
+=0D
+	setup_fb(data);=0D
+	igt_plane_set_fb(data->plane, &data->fb);=0D
+	igt_plane_set_size(data->plane, mode->hdisplay, mode->vdisplay);=0D
+=0D
+	/* Set filter strength property */=0D
+	set_filter_strength_on_pipe(data);=0D
+	igt_debug("Sharpened image should be observed for filter strength > 0\n")=
;=0D
+=0D
+	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);=0D
+	igt_assert_eq(ret, 0);=0D
+}=0D
+=0D
+/* Checks if the sharpness filter property is available on a given pipe. *=
/=0D
+static bool has_sharpness_filter(igt_pipe_t *pipe)=0D
+{=0D
+	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);=0D
+}=0D
+=0D
+static void set_output(data_t *data)=0D
+{=0D
+	igt_display_t *display =3D &data->display;=0D
+	igt_output_t *output;=0D
+	enum pipe pipe;=0D
+=0D
+	for_each_pipe_with_valid_output(display, pipe, output) {=0D
+		/* Restricting to pipe A */=0D
+		if (pipe !=3D PIPE_A)=0D
+			continue;=0D
+=0D
+		data->output =3D output;=0D
+		data->pipe_id =3D pipe;=0D
+		data->pipe =3D &display->pipes[data->pipe_id];=0D
+		data->mode =3D igt_output_get_mode(data->output);=0D
+=0D
+		if (!has_sharpness_filter(data->pipe))=0D
+			continue;=0D
+=0D
+		igt_output_set_pipe(output, pipe);=0D
+=0D
+		if (!intel_pipe_output_combo_valid(display)) {=0D
+			igt_output_set_pipe(output, PIPE_NONE);=0D
+			continue;=0D
+		}=0D
+	}=0D
+}=0D
+=0D
+/* Handles incrementing or decrementing the sharpness filter strength base=
d on arrow key inputs. */=0D
+static void do_sharpness_incr(data_t *data)=0D
+{=0D
+	char arrow;=0D
+=0D
+	data->modifier =3D DRM_FORMAT_MOD_LINEAR;=0D
+	data->format =3D DRM_FORMAT_XRGB8888;=0D
+=0D
+	/* Run with sharpness filter disable */=0D
+	set_output(data);=0D
+	test_sharpness_filter(data);=0D
+=0D
+	/*=0D
+	 * Press up-arrow to increase & down-arrow to decrease strength value=0D
+	 * and 'q' to escape. Strength value is incremented/decremented by=0D
+	 * incr/decr value provide by user if its within range (0-255).=0D
+	 */=0D
+=0D
+	/* Read the arrow key input */=0D
+	while ((arrow =3D getchar()) !=3D 'q') {=0D
+		if (arrow !=3D UP_ARROW && arrow !=3D DOWN_ARROW)=0D
+			continue;=0D
+=0D
+		if (arrow =3D=3D UP_ARROW) {=0D
+			data->filter_strength =3D MIN(MAX_VALUE, data->filter_strength + data->=
incr_value);=0D
+		} else if (arrow =3D=3D DOWN_ARROW) {=0D
+			data->filter_strength =3D MAX(MIN_VALUE, data->filter_strength - data->=
incr_value);=0D
+		}=0D
+=0D
+		igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), =
data->output->name, data->filter_strength);=0D
+		test_sharpness_filter(data);=0D
+	}=0D
+=0D
+	/* Clear the input buffer */=0D
+	while (getchar() !=3D '\n');=0D
+	cleanup(data);=0D
+}=0D
+=0D
+/* Allows the user to specify a sharpness filter strength value directly. =
*/=0D
+static void do_sharpness_usr(data_t *data)=0D
+{=0D
+	data->modifier =3D DRM_FORMAT_MOD_LINEAR;=0D
+	data->format =3D DRM_FORMAT_XRGB8888;=0D
+=0D
+	/* Run with sharpness filter disable */=0D
+	set_output(data);=0D
+	test_sharpness_filter(data);=0D
+=0D
+	igt_info("pipe-%s-%s-strength-%d \n", kmstest_pipe_name(data->pipe_id), d=
ata->output->name, data->filter_strength);=0D
+	test_sharpness_filter(data);=0D
+=0D
+	cleanup(data);=0D
+}=0D
+=0D
+static void print_usage(void)=0D
+{=0D
+	printf("Options:\n"=0D
+"  -h value:   incr/decr factor for setting strength value for hd resoluti=
on. use up/down \n"=0D
+"              arrow keys to increase/decrease strength by this factor and=
 q to quit.\n"=0D
+"  -f value:   incr/decr factor for setting strength value for fhd resolut=
ion. use up/down \n"=0D
+"              arrow keys to increase/decrease strength by this factor and=
 q to quit.\n"=0D
+"  -k value:   incr/decr factor for setting strength value for 4k resoluti=
on. use up/down \n"=0D
+"              arrow keys to increase/decrease strength by this factor and=
 q to quit.\n"=0D
+"  -H value:   user defined strength value (1-255) for hd resolution.\n"=0D
+"  -F value:   user defined strength value (1-255) for fhd resolution.\n"=
=0D
+"  -K value:   user defined strength value (1-255) for 4k resolution.\n"=0D
+"  -p:         prints this message\n");=0D
+}=0D
+=0D
+int main(int argc, char *argv[])=0D
+{=0D
+	int opt;=0D
+	data_t data =3D {0};=0D
+	int ret =3D EXIT_SUCCESS;=0D
+	FILE *file =3D NULL;=0D
+	const char *files[] =3D {"640x480.png", "1920x1080.png", "3840x2160.png"}=
;=0D
+=0D
+	option selected_option =3D NONE_SELECTED;=0D
+=0D
+	if (argc <=3D 1) {=0D
+		print_usage();=0D
+		return EXIT_SUCCESS;=0D
+	}=0D
+=0D
+	data.drm_fd =3D drm_open_driver_master(DRIVER_XE);=0D
+	igt_require(data.drm_fd >=3D 0);=0D
+=0D
+	kmstest_set_vt_graphics_mode();=0D
+=0D
+	igt_display_require(&data.display, data.drm_fd);=0D
+	igt_require(data.display.is_atomic);=0D
+	igt_display_require_output(&data.display);=0D
+=0D
+	while ((opt =3D getopt(argc, argv, "h:f:k:H:F:K:p")) !=3D -1) {=0D
+		switch (opt) {=0D
+		case 'h':=0D
+		case 'f':=0D
+		case 'k':=0D
+			if (selected_option !=3D NONE_SELECTED) {=0D
+				igt_warn("Error: Only one option can be selected.\n");=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+			data.incr_value =3D atoi(optarg);=0D
+			if (data.incr_value < 1 || data.incr_value > 255) {=0D
+				igt_warn("Invalid input for -%c option. Value should be between 1 and =
255.\n", opt);=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+			selected_option =3D SHARP_INCR_SELECTED;=0D
+=0D
+			data.png =3D (opt =3D=3D 'h') ? files[0] : ((opt =3D=3D 'f') ? files[1]=
 : files[2]);=0D
+			data.width =3D (opt =3D=3D 'h') ? 640 : ((opt =3D=3D 'f') ? 1920 : 3840=
);=0D
+			data.height =3D (opt =3D=3D 'h') ? 480 : ((opt =3D=3D 'f') ? 1080 : 216=
0);=0D
+=0D
+			// Check if the file exists and can be opened=0D
+			file =3D igt_fopen_data(data.png);=0D
+			if (file =3D=3D NULL) {=0D
+				igt_warn("Error: Unable to open file '%s'\n", data.png);=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+=0D
+			fclose(file);=0D
+			break;=0D
+		case 'H':=0D
+		case 'F':=0D
+		case 'K':=0D
+			if (selected_option !=3D NONE_SELECTED) {=0D
+				igt_warn("Error: Only one option can be selected.\n");=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+			data.filter_strength =3D atoi(optarg);=0D
+			if (data.filter_strength < 1 || data.filter_strength > 255) {=0D
+				igt_warn("Invalid input for -%c option. Value should be between 1 and =
255.\n", opt);=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+			selected_option =3D SHARP_USR_SELECTED;=0D
+=0D
+			data.png =3D (opt =3D=3D 'H') ? files[0] : ((opt =3D=3D 'F') ? files[1]=
 : files[2]);=0D
+			data.width =3D (opt =3D=3D 'H') ? 640 : ((opt =3D=3D 'F') ? 1920 : 3840=
);=0D
+			data.height =3D (opt =3D=3D 'H') ? 480 : ((opt =3D=3D 'F') ? 1080 : 216=
0);=0D
+=0D
+			// Check if the file exists and can be opened=0D
+			file =3D igt_fopen_data(data.png);=0D
+			if (file =3D=3D NULL) {=0D
+				igt_warn("Error: Unable to open file '%s'\n", data.png);=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+=0D
+			fclose(file);=0D
+			break;=0D
+		case 'p':=0D
+			if (selected_option !=3D NONE_SELECTED) {=0D
+				igt_warn("Error: Only one option can be selected.\n");=0D
+				print_usage();=0D
+				ret =3D EXIT_FAILURE;=0D
+				goto exit;=0D
+			}=0D
+			selected_option =3D USAGE_SELECTED;=0D
+			break;=0D
+		default:=0D
+			igt_warn("Error: Unknown option -%c.\n", opt);=0D
+			print_usage();=0D
+			ret =3D EXIT_FAILURE;=0D
+			goto exit;=0D
+		}=0D
+	}=0D
+=0D
+	// Check if the selected_option that requires a file was selected=0D
+	if ((selected_option =3D=3D SHARP_INCR_SELECTED ||  selected_option =3D=
=3D SHARP_USR_SELECTED) && data.png =3D=3D NULL) {=0D
+		igt_warn("Error: No file specified for sharpness adjustment.\n");=0D
+	    	ret =3D EXIT_FAILURE;=0D
+		goto exit;=0D
+	  }=0D
+=0D
+	// Handle the case where no valid option was processed=0D
+	if (selected_option =3D=3D NONE_SELECTED) {=0D
+		igt_warn("Error: No valid option selected.\n");=0D
+		ret =3D EXIT_FAILURE;=0D
+		goto exit;=0D
+	}=0D
+=0D
+	// Perform actions based on the selected option=0D
+	if (selected_option =3D=3D SHARP_INCR_SELECTED) {=0D
+		do_sharpness_incr(&data);=0D
+	} else if (selected_option =3D=3D SHARP_USR_SELECTED) {=0D
+		do_sharpness_usr(&data);=0D
+	} else if (selected_option =3D=3D USAGE_SELECTED) {=0D
+		print_usage();=0D
+	}=0D
+exit:=0D
+	igt_display_fini(&data.display);=0D
+	close(data.drm_fd);=0D
+=0D
+	return ret;=0D
+}=0D
--=20
2.25.1


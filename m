Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1710E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Dec 2023 13:59:25 +0000 (UTC)
Date: Tue, 19 Dec 2023 14:59:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20231219135920.3ebsgzl7nuco4twl@kamilkon-desk.igk.intel.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jessica,
On 2023-12-15 at 16:40:23 -0800, Jessica Zhang wrote:
> Add a basic test for solid fill planes.
> 
> This test will first commit a single-color framebuffer plane then
> a solid fill plane with the same contents. It then validates the solid
> fill plane by comparing the resulting CRC with the CRC of the reference
> framebuffer commit.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> old mode 100644
> new mode 100755
> index 2b6e9a8f0383..8f81e65ad84f
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
>  	PLANE_RELAX_FB = (1 << 1)
>  };
>  
> +struct solid_fill_blob {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +	uint32_t pad;
> +};
> +
>  static inline int damage_rect_width(struct drm_mode_rect *r)
>  {
>  	return r->x2 - r->x1;
> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb_2);
>  }
>  
> +static void test_solid_fill_plane(data_t *data, igt_output_t *output,  igt_plane_t *plane)
> +{
> +	struct drm_mode_create_blob c;
> +	struct drm_mode_destroy_blob d;
> +	drmModeModeInfo *mode = igt_output_get_mode(output);
> +	struct drm_mode_rect rect = { 0 };
> +	struct igt_fb ref_fb;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, new_crc;
> +	enum pipe pipe = data->pipe->pipe;
> +	int height, width;
> +	int ret;
> +
> +	struct solid_fill_blob blob_data = {
> +		.r = 0x00000000,
> +		.g = 0x00000000,
> +		.b = 0xff000000,
> +		.pad = 0x0,
> +	};
> +
> +	rect.x1 = 0;
> +	rect.x2 = mode->hdisplay;
> +	rect.y1 = 0;
> +	rect.y2 = mode->vdisplay;
> +
> +	height = rect.y2 - rect.y1;
> +	width = rect.x2 - rect.x1;
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
> +
> +	c.data = (uintptr_t) &blob_data;
> +	c.length = sizeof(blob_data);
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> +				    IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	/* get reference CRC */
> +	igt_create_color_fb(data->drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &ref_fb);
> +	igt_plane_set_fb(plane, &ref_fb);
> +	igt_plane_set_position(plane, rect.x1, rect.y1);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_start(pipe_crc);
> +	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> +
> +	ret = drmIoctl(data->display.drm_fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &c);
> +	igt_assert(ret == 0);
> +
> +	/* test solid fill plane */
> +	igt_plane_set_solid_fill(plane, &rect, c.blob_id);
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "SOLID_FILL");
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
> +	igt_assert_crc_equal(&ref_crc, &new_crc);
> +
> +	/* Switch back to FB pixel source */
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	d.blob_id = c.blob_id;
> +	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
> +	igt_assert(ret == 0);
> +
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_remove_fb(data->drm_fd, &ref_fb);
> +}
> +
>  static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
>  	drmModeModeInfo *mode;
> @@ -1634,6 +1714,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  

Please add also description at begin of file, one at each test added,
something like:

 * SUBTEST: plane-primary-solid-fill
 * Description: fill primary planes with solid color

Above example can be incorrect, please correct it as needed.

For verification look if there are any build warnings at patchwork, like:

Warning: Missing documentation for igt@kms_atomic@plane-cursor-solid-fill
Warning: Missing documentation for igt@kms_atomic@plane-primary-solid-fill

+cc Bhanu

Regards,
Kamil

> +	igt_describe("Test case for solid fill primary planes");
> +	igt_subtest_with_dynamic("plane-primary-solid-fill") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> +				atomic_setup(&data, pipe, output);
> +				test_solid_fill_plane(&data, output, data.primary);
> +				atomic_clear(&data, pipe, output);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> 
> -- 
> 2.43.0
> 

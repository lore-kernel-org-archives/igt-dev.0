Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C6010EB19
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 10:06:50 +0000 (UTC)
Message-ID: <b3767972-a0e6-2fa2-6e73-69ae61681063@intel.com>
Date: Wed, 22 Jun 2022 15:36:30 +0530
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220621175706.23060-1-jeevan.b@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220621175706.23060-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add test for
 clone mode
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

On Tue-21-06-2022 11:27 pm, Jeevan B wrote:
> Add test for validation of clone mode.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 83 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index eff30cbb..af299dc0 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -129,6 +129,80 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>   	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
>   }
>   
> +static void run_clonemode_basic(data_t *data, int pipe1, int pipe2)
> +{
> +	struct igt_fb fbs[2];
> +	drmModeModeInfo *mode[2];
> +	igt_output_t *output, *clone_output[2];
> +	igt_display_t *display = &data->display;
> +	igt_plane_t *plane[2];
> +	igt_pipe_crc_t *pipe_crc[2] = { 0 };
> +	igt_crc_t ref_crc[2], crc[2];
> +	int count = 0;
> +
> +	for_each_connected_output(display, output) {
> +		clone_output[count] = output;
> +		count++;
> +
> +		if (count > 1)
> +			break;
> +	}
> +
> +	igt_output_set_pipe(clone_output[0], pipe1);
> +	igt_output_set_pipe(clone_output[1], pipe2);
> +
> +	mode[0] = igt_output_get_mode(clone_output[0]);
> +	mode[1] = igt_output_get_mode(clone_output[1]);
> +
> +	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, INTEL_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
> +			    DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
> +
> +	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[1]->vdisplay,
> +			    DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[1]);
> +
> +	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_TYPE_PRIMARY);
> +	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(plane[0], &fbs[0]);
> +	igt_plane_set_fb(plane[1], &fbs[1]);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
> +	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
> +
> +	igt_plane_set_fb(plane[0], &fbs[0]);
> +	igt_plane_set_fb(plane[1], &fbs[1]);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
> +	igt_pipe_crc_collect_crc(pipe_crc[1], &crc[1]);
> +
> +	/*Clean up*/
> +	igt_remove_fb(data->drm_fd, &fbs[0]);
> +	igt_remove_fb(data->drm_fd, &fbs[1]);
> +
> +	igt_pipe_crc_free(pipe_crc[0]);
> +	igt_pipe_crc_free(pipe_crc[1]);
> +
> +	igt_output_set_pipe(clone_output[0], PIPE_NONE);
> +	igt_output_set_pipe(clone_output[1], PIPE_NONE);
> +
> +	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe1],
> +			 DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
> +			 DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/*Compare CRC*/
> +	igt_assert_crc_equal(&crc[0], &ref_crc[0]);
> +	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
> +}
> +
>   igt_main
>   {
>   	data_t data;
> @@ -167,6 +241,15 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Test for validating display clone mode with a pair of connected displays");
> +	igt_subtest_with_dynamic("clone-mode-basic") {
> +		for (i = 0; i < data.n_pipes - 1; i++) {
> +			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
> +					kmstest_pipe_name(pipe[i+1]));
> +			run_clonemode_basic(&data, pipe[i], pipe[i+1]);

I guess, kms_setmode is already covering this (ofcourse without crc). 
Can you please check once?

- Bhanu

> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   	}

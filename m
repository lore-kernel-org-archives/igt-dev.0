Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B816E2F3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2020 19:45:12 +0000 (UTC)
Received: by mail-qv1-f71.google.com with SMTP id n5so13397qvx.2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2020 12:45:09 -0700 (PDT)
Date: Tue, 25 Aug 2020 15:45:06 -0400
From: Jeremy Cline <jcline@redhat.com>
Message-ID: <20200825194506.GA377883@dev.jcline.org>
References: <20200818193528.986926-1-lyude@redhat.com>
 <20200818193528.986926-2-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200818193528.986926-2-lyude@redhat.com>
Content-Disposition: inline
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_pipe_crc_basic: Add
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 03:35:28PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> I ended up hitting some bugs when writing nouveau's CRC implementation
> due to incorrectly handling the situation where we disable CRCs on a
> pipe that already been disabled, which ended up causing some other vague
> igt issues when running certain tests in multi-mode.
> 
> So, let's add a trivial test for this scenario while we're at it.
> 
> v2:
> * Rebased
> * Write test description for new tests
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  tests/kms_pipe_crc_basic.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 53d76df1..e584dca9 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -221,6 +221,41 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>  	igt_remove_fb(data->drm_fd, &fb1);
>  }
>  
> +static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output = igt_get_single_output_for_pipe(&data->display, pipe);
> +	igt_pipe_crc_t *pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
> +	drmModeModeInfo *mode = igt_output_get_mode(output);
> +	igt_crc_t crc[2];
> +
> +	igt_display_reset(display);
> +	igt_output_set_pipe(output, pipe);
> +
> +	igt_create_color_fb(data->drm_fd,
> +			    mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    LOCAL_DRM_FORMAT_MOD_NONE,
> +			    0.0, 1.0, 0.0, &data->fb);

The API docs indicate this could return a negative error code. I'm not
sure what errors there could be so I don't know if it's worth adding a
check here, but just something to consider. It looks like much (all?)
the existing code doesn't check so I guess it's not that problematic.

> +	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
> +	igt_display_commit(display);
> +
> +	igt_pipe_crc_start(pipe_crc);
> +	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[0]);
> +
> +	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> +				   DRM_MODE_DPMS_OFF);
> +	igt_pipe_crc_stop(pipe_crc);
> +
> +	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
> +				   DRM_MODE_DPMS_ON);
> +	igt_pipe_crc_collect_crc(pipe_crc, &crc[1]);
> +	igt_assert_crc_equal(&crc[0], &crc[1]);
> +
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +}
> +
>  data_t data = {0, };
>  
>  igt_main
> @@ -265,6 +300,11 @@ igt_main
>  			test_read_crc(&data, pipe, 0);
>  		}
>  
> +		igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
> +			     "does not cause issues.");
> +		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
> +			test_disable_crc_after_crtc(&data, pipe);
> +
>  		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
>  			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
>  
> -- 
> 2.26.2
> 

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9046E047
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 19:25:45 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id nw23so320841ejb.4
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Sep 2020 12:25:45 -0700 (PDT)
References: <20200902154423.9199-1-srinivasx.k@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <0aee3d1c-aeb2-6f73-b28e-2014c5d129d8@gmail.com>
Date: Wed, 2 Sep 2020 22:25:37 +0300
MIME-Version: 1.0
In-Reply-To: <20200902154423.9199-1-srinivasx.k@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc.c Stripping
 rendercopy implementation to use Cairo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamati Srinivas <srinivasx.k@intel.com>, igt-dev@lists.freedesktop.org
Cc: tejaskumarx.surendrakumar.upadhyay@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

I'm bit confused why I don't see this patch on igt-dev nor in patchwork, 
sometimes those mail servers behave strange. :/

Mostly it look ok to me but could you resubmit so we will see what CI 
will think about this. I have just couple minor comments below.

On 2.9.2020 18.44, Kamati Srinivas wrote:
> Rendercopy implementation is stripped to use cairo for restoring image.
> Removed dead code.
> 
> Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
> Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Signed-off-by: Kamati Srinivas <srinivasx.k@intel.com>
> ---
>   tests/kms_cursor_crc.c | 89 +++++++-----------------------------------
>   1 file changed, 14 insertions(+), 75 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index e9491847..700dab15 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -64,11 +64,8 @@ typedef struct {
>   	igt_plane_t *cursor;
>   	cairo_surface_t *surface;
>   	uint32_t devid;
> -	drm_intel_bufmgr *bufmgr;
> -	igt_render_copyfunc_t rendercopy;
>   	drm_intel_bo * drmibo[2];
>   	struct intel_batchbuffer *batch;

I think those drmibo and batch are also for rendercopy, they probably 
could also be taken out.

> -	struct igt_buf igtbo[2];
>   
>   } data_t;
>   
> @@ -153,23 +150,14 @@ static void restore_image(data_t *data)
>   {
>   	cairo_t *cr;
>   
> -	if (data->rendercopy != NULL) {
> -		/* use rendercopy if available */
> -		data->rendercopy(data->batch, NULL,
> -				 &data->igtbo[RESTOREBUFFER], 0, 0,
> -				 data->primary_fb[RESTOREBUFFER].width,
> -				 data->primary_fb[RESTOREBUFFER].height,
> -				 &data->igtbo[FRONTBUFFER], 0, 0);
> -	} else {
> -		/* if rendercopy not implemented in igt use cairo */
> -		cr = igt_get_cairo_ctx(data->drm_fd,
> -				       &data->primary_fb[FRONTBUFFER]);
> -		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> -		cairo_set_source_surface(cr, data->surface, 0, 0);
> -		cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
> -		cairo_fill(cr);
> -		igt_put_cairo_ctx(cr);
> -	}
> +	/* rendercopy stripped in igt using cairo */
> +	cr = igt_get_cairo_ctx(data->drm_fd,
> +			       &data->primary_fb[FRONTBUFFER]);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	cairo_set_source_surface(cr, data->surface, 0, 0);
> +	cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
> +	cairo_fill(cr);
> +	igt_put_cairo_ctx(cr);
>   	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>   }
>   
> @@ -384,15 +372,6 @@ static void cleanup_crtc(data_t *data)
>   	igt_display_reset(display);
>   }
>   
> -static void scratch_buf_init(data_t *data, int buffer)
> -{
> -	data->igtbo[buffer].bo = data->drmibo[buffer];
> -	data->igtbo[buffer].surface[0].stride = data->primary_fb[buffer].strides[0];
> -	data->igtbo[buffer].tiling = data->primary_fb[buffer].modifier;
> -	data->igtbo[buffer].surface[0].size = data->primary_fb[buffer].size;
> -	data->igtbo[buffer].bpp = data->primary_fb[buffer].plane_bpp[0];
> -}
> -
>   static void prepare_crtc(data_t *data, igt_output_t *output,
>   			 int cursor_w, int cursor_h)
>   {
> @@ -443,38 +422,11 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
>   
>   	data->surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24, data->screenw, data->screenh);
>   
> -	if (data->rendercopy == NULL) {
> -		/* store test image as cairo surface */
> -		cr = cairo_create(data->surface);
> -		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> -		igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -		cairo_destroy(cr);
> -	} else {
> -		/* store test image as fb if rendercopy is available */
> -		cr = igt_get_cairo_ctx(data->drm_fd,
> -		                       &data->primary_fb[RESTOREBUFFER]);
> -		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> -		igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -		igt_put_cairo_ctx(cr);
> -
> -		data->drmibo[FRONTBUFFER] = gem_handle_to_libdrm_bo(data->bufmgr,
> -								    data->drm_fd,
> -								    "", data->primary_fb[FRONTBUFFER].gem_handle);
> -		igt_assert(data->drmibo[FRONTBUFFER]);
> -
> -		data->drmibo[RESTOREBUFFER] = gem_handle_to_libdrm_bo(data->bufmgr,
> -								      data->drm_fd,
> -								      "", data->primary_fb[RESTOREBUFFER].gem_handle);
> -		igt_assert(data->drmibo[RESTOREBUFFER]);
> -
> -		scratch_buf_init(data, RESTOREBUFFER);
> -		scratch_buf_init(data, FRONTBUFFER);
> -
> -		data->batch = intel_batchbuffer_alloc(data->bufmgr,
> -						      data->devid);
> -		igt_assert(data->batch);
> -	}
> -
> +	/* store test image as cairo surface */
> +	cr = cairo_create(data->surface);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	igt_paint_test_pattern(cr, data->screenw, data->screenh);
> +	cairo_destroy(cr);
>   	igt_pipe_crc_start(data->pipe_crc);
>   }
>   
> @@ -831,15 +783,7 @@ igt_main
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   
> -		if (is_i915_device(data.drm_fd)) {
> -			data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> -			igt_assert(data.bufmgr);
> -			drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> -
> -			data.devid = intel_get_drm_devid(data.drm_fd);
> -			data.rendercopy = igt_get_render_copyfunc(data.devid);
> -		}
> -		igt_debug("Using %s for restoring test image\n", (data.rendercopy == NULL)?"Cairo":"rendercopy");
> +		igt_debug("Using Cairo for restoring test image\n");

I think this debug print is reduntant now since it will always be cairo 
who is restoring the image.

>   	}
>   
>   	data.cursor_max_w = cursor_width;
> @@ -855,11 +799,6 @@ igt_main
>   			igt_pipe_crc_free(data.pipe_crc);
>   		}
>   
> -		if (data.bufmgr != NULL) {
> -			intel_batchbuffer_free(data.batch);
> -			drm_intel_bufmgr_destroy(data.bufmgr);
> -		}
> -
>   		igt_display_fini(&data.display);
>   	}
>   }
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

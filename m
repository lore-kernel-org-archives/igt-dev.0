Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5469898BF
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 17:49:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x11so683481ejv.0
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 10:49:13 -0700 (PDT)
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-5-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <8e35f961-0f24-733c-fce3-c252d623da9d@gmail.com>
Date: Tue, 31 Aug 2021 20:49:06 +0300
MIME-Version: 1.0
In-Reply-To: <20210827145756.3342904-5-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tests/kms_ccs: Test bad params for
 all CCS planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.8.2021 17.57, Imre Deak wrote:
> Test creating an FB with incorrect CCS plane parameters for all CCS
> planes. While at it move all the incorrect FB parameter subtests earlier
> before generating an FB. For these subtests we won't modeset and so
> don't need to generate FBs with a test pattern. Exceptions are the
> bad-rotation subtests which also do a modeset.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   tests/kms_ccs.c | 180 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 112 insertions(+), 68 deletions(-)
> 
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index 52252c633..7440f8427 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -44,9 +44,9 @@ enum test_flags {
>   	TEST_ALL_PLANES			= 1 << 9,
>   };
>   
> -#define TEST_FAIL_ON_ADDFB2 \
> -	(TEST_BAD_PIXEL_FORMAT | TEST_NO_AUX_BUFFER | TEST_BAD_CCS_HANDLE | \
> -	 TEST_BAD_AUX_STRIDE)
> +#define TEST_BAD_CCS_PLANE	(TEST_NO_AUX_BUFFER | TEST_BAD_CCS_HANDLE | \
> +				 TEST_BAD_AUX_STRIDE)
> +#define TEST_FAIL_ON_ADDFB2	(TEST_BAD_PIXEL_FORMAT | TEST_BAD_CCS_PLANE)
>   
>   enum test_fb_flags {
>   	FB_COMPRESSED			= 1 << 0,
> @@ -128,6 +128,17 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
>   	}
>   }
>   
> +static void
> +create_fb_prepare_add(int drm_fd, int width, int height,
> +		      uint32_t format, uint64_t modifier,
> +		      igt_fb_t *fb, struct drm_mode_fb_cmd2 *f)
> +{
> +	igt_create_bo_for_fb(drm_fd, width, height, format, modifier, fb);
> +	igt_assert(fb->gem_handle > 0);
> +
> +	addfb_init(fb, f);
> +}
> +
>   static bool is_ccs_cc_modifier(uint64_t modifier)
>   {
>   	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
> @@ -226,14 +237,96 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>   	munmap(map, fb->size);
>   }
>   
> -static int get_ccs_plane_index(uint32_t format)
> +static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
> +			       enum test_fb_flags fb_flags)
>   {
> -	int index = 1;
> +	struct igt_fb fb = {};
> +	struct drm_mode_fb_cmd2 f = {};
> +	uint32_t bad_ccs_bo = 0;
> +	int ret;
>   
> -	if (igt_format_is_yuv_semiplanar(format))
> -		return 2;
> +	igt_assert(fb_flags & FB_COMPRESSED);
> +	create_fb_prepare_add(data->drm_fd, width, height,
> +			      data->format, data->ccs_modifier,
> +			      &fb, &f);
>   
> -	return index;
> +	/*
> +	 * The stride of CCS planes on GEN12+ is fixed, so we can check for
> +	 * an incorrect stride with the same delta as on earlier platforms.
> +	 */
> +	if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
> +		igt_skip_on_f(width <= 1024,
> +			      "FB already has the smallest possible stride\n");
> +		f.pitches[ccs_plane] -= 64;
> +	}
> +
> +	if (fb_flags & FB_SMALL_AUX_STRIDE) {
> +		igt_skip_on_f(width <= 1024,
> +			      "FB already has the smallest possible stride\n");
> +		f.pitches[ccs_plane] = ALIGN(f.pitches[ccs_plane] / 2, 128);
> +	}
> +
> +	if (fb_flags & FB_ZERO_AUX_STRIDE)
> +		f.pitches[ccs_plane] = 0;
> +
> +	/* Put the CCS buffer on a different BO. */
> +	if (data->flags & TEST_BAD_CCS_HANDLE) {
> +		bad_ccs_bo = gem_create(data->drm_fd, fb.size);
> +		f.handles[ccs_plane] = bad_ccs_bo;
> +	}
> +
> +	if (data->flags & TEST_NO_AUX_BUFFER) {
> +		f.handles[ccs_plane] = 0;
> +		f.modifier[ccs_plane] = 0;
> +		f.pitches[ccs_plane] = 0;
> +		f.offsets[ccs_plane] = 0;
> +	}
> +
> +	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	if (bad_ccs_bo)
> +		gem_close(data->drm_fd, bad_ccs_bo);
> +
> +	gem_close(data->drm_fd, fb.gem_handle);
> +}
> +
> +static void test_bad_ccs_plane_params(data_t *data, int width, int height,
> +				      enum test_fb_flags fb_flags)
> +{
> +	for (int ccs_plane = 1;
> +	     ccs_plane <= (igt_format_is_yuv_semiplanar(data->format) ? 2 : 1);
> +	     ccs_plane++)
> +		test_bad_ccs_plane(data, width, height, ccs_plane, fb_flags);
> +}
> +
> +static void test_bad_pixel_format(data_t *data, int width, int height,
> +				  enum test_fb_flags fb_flags)
> +{
> +	struct igt_fb fb = {};
> +	struct drm_mode_fb_cmd2 f = {};
> +	int ret;
> +
> +	igt_assert(fb_flags & FB_COMPRESSED);
> +	create_fb_prepare_add(data->drm_fd, width, height,
> +			      DRM_FORMAT_RGB565, data->ccs_modifier,
> +			      &fb, &f);
> +
> +	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	gem_close(data->drm_fd, fb.gem_handle);
> +}
> +
> +static void test_bad_fb_params(data_t *data, int width, int height, enum test_fb_flags fb_flags)
> +{
> +	if (data->flags & TEST_BAD_PIXEL_FORMAT)
> +		test_bad_pixel_format(data, width, height, fb_flags);
> +
> +	if (data->flags & TEST_BAD_CCS_PLANE)
> +		test_bad_ccs_plane_params(data, width, height, fb_flags);
>   }
>   
>   static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
> @@ -259,16 +352,15 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   			enum test_fb_flags fb_flags)
>   {
>   	struct drm_mode_fb_cmd2 f = {0};
> -	uint32_t format;
>   	uint64_t modifier;
>   	cairo_t *cr;
> -	int index;
>   	int ret;
>   	const float cc_color[4] = {colors[!!data->plane].r,
>   				   colors[!!data->plane].g,
>   				   colors[!!data->plane].b,
>   				   1.0};
>   
> +
>   	/* Use either compressed or Y-tiled to test. However, given the lack of
>   	 * available bandwidth, we use linear for the primary plane when
>   	 * testing sprites, since we cannot fit two CCS planes into the
> @@ -281,54 +373,14 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   	else
>   		modifier = 0;
>   
> -	if (data->flags & TEST_BAD_PIXEL_FORMAT)
> -		format = DRM_FORMAT_RGB565;
> -	else
> -		format = data->format;
> -
> -	index = get_ccs_plane_index(format);
> -
> -	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier, fb);
> -	igt_assert(fb->gem_handle > 0);
> -
> -	addfb_init(fb, &f);
> -
> -	/*
> -	 * The stride of CCS planes on GEN12+ is fixed, so we can check for
> -	 * an incorrect stride with the same delta as on earlier platforms.
> -	 */
> -	if (fb_flags & FB_COMPRESSED) {
> -		if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
> -			igt_skip_on_f(width <= 1024,
> -				      "FB already has the smallest possible stride\n");
> -			f.pitches[index] -= 64;
> -		}
> -
> -		if (fb_flags & FB_SMALL_AUX_STRIDE) {
> -			igt_skip_on_f(width <= 1024,
> -				      "FB already has the smallest possible stride\n");
> -			f.pitches[index] = ALIGN(f.pitches[index]/2, 128);
> -		}
> -
> -		if (fb_flags & FB_ZERO_AUX_STRIDE)
> -			f.pitches[index] = 0;
> -
> -		/* Put the CCS buffer on a different BO. */
> -		if (data->flags & TEST_BAD_CCS_HANDLE)
> -			f.handles[index] = gem_create(data->drm_fd, fb->size);
> -
> -		if (data->flags & TEST_NO_AUX_BUFFER) {
> -			f.handles[index] = 0;
> -			f.modifier[index] = 0;
> -			f.pitches[index] = 0;
> -			f.offsets[index] = 0;
> -		}
> -	}
> +	create_fb_prepare_add(data->drm_fd, width, height,
> +			      data->format, modifier,
> +			      fb, &f);
>   
>   	if (data->flags & TEST_RANDOM) {
>   		srand(data->seed);
>   		fill_fb_random(data->drm_fd, fb);
> -	} else if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
> +	} else {
>   		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
>   		bool do_solid_fill = do_fast_clear || data->plane;
>   		int c = !!data->plane;
> @@ -348,16 +400,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   	}
>   
>   	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
> -	if (data->flags & TEST_FAIL_ON_ADDFB2) {
> -		igt_assert_eq(ret, -1);
> -		igt_assert_eq(errno, EINVAL);
> -
> -		if (f.handles[index])
> -			gem_close(data->drm_fd, f.handles[index]);
> -
> -		return;
> -	} else
> -		igt_assert_eq(ret, 0);
> +	igt_assert_eq(ret, 0);
>   
>   	if (check_ccs_planes)
>   		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TEST_RANDOM));
> @@ -423,6 +466,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   
>   	fb_width = min(MAX_SPRITE_PLANE_WIDTH, fb_width);
>   
> +	if (data->flags & TEST_FAIL_ON_ADDFB2) {
> +		test_bad_fb_params(data, fb_width, drm_mode->vdisplay, fb_flags);
> +		return true;
> +	}
> +
>   	if (data->plane && fb_flags & FB_COMPRESSED) {
>   		if (!igt_plane_has_format_mod(data->plane, data->format,
>   					      data->ccs_modifier))
> @@ -435,9 +483,6 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   		generate_fb(data, &fb, fb_width, drm_mode->vdisplay, fb_flags);
>   	}
>   
> -	if (data->flags & TEST_FAIL_ON_ADDFB2)
> -		goto out_free_fbs;
> -
>   	igt_plane_set_position(primary, 0, 0);
>   	igt_plane_set_size(primary, drm_mode->hdisplay, drm_mode->vdisplay);
>   	igt_plane_set_fb(primary, &fb);
> @@ -475,7 +520,6 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   	igt_plane_set_rotation(primary, IGT_ROTATION_0);
>   	igt_display_commit2(display, commit);
>   
> -out_free_fbs:
>   	if (fb_sprite.fb_id)
>   		igt_remove_fb(data->drm_fd, &fb_sprite);
>   	if (fb.fb_id)
> 

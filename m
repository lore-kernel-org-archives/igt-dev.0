Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F1CE7B0A
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 13:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2706710EA58;
	Fri,  6 Sep 2024 13:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dM3Oq5gS";
	dkim-atps=neutral
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B26B10EA54
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 13:13:14 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f5064816edso24052451fa.3
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Sep 2024 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725628392; x=1726233192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9Vq1qIywde73uZZJ53mEdW3JhO3XpCgHn5R0YrBu95k=;
 b=dM3Oq5gSsQ+4nU5uoWuLvs56CoyY+BMbFBTXhEt8GkdMetuiBK1arCnV0gdNj3bMNI
 Gg+HEoYOLA6jWKaFCoYj5yBxTTFabMleBz30u2yL1wERe16GoXp1QUZSk+mPRRIFpN5a
 QmnrVQ/FONTWbxKCRlk9TreigIfYgn3TDkCrG+snuAOiOt91S74WRaPl6r4LrZyUNoI/
 ds1ijX9WLF7N7M7xbLi76NVGuYda1oDmQ94r/58MV72fLWgviyG/9z1lVS2xyLOESW+R
 iewWs+RCXz2rAYINGITUcByUyXHbqF45QSvszYiz9Eyaouq+HYNTShrQzojAnT6KRAqh
 53+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725628392; x=1726233192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Vq1qIywde73uZZJ53mEdW3JhO3XpCgHn5R0YrBu95k=;
 b=sXxyPUlLIRN85vcTHWNeLnlT58VBTF/9N9gtj4V/wLbW+u5HBjWXKqQt98tGUjAPYS
 4Y6ZJQi7F7fsh5k7WP20NhX76OQYV+4iRgZCJOuGDgdVUoIZdlybpVb7We8Ks2QIGE8u
 AdrN5mCu62za/kxhzXIfJxunXXb0px6CwlOfRU+p6JLt5vaRFl7iYKO/NICtA6vThZ31
 rzkIEU8ZEtYaKR1BejNNi6prxxwW/77JYqpzoWP/ZFpJU8cqEs26XB9Yq8lubVoPknEJ
 vXE42mB9MO3vgLNuz5J9Fk3lSVjGlMElkEbUsYHn5vBsvZ7PpLx/JS3CNYYAn20oaow6
 1wIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2x5QQAwDu2So75DqGKCIqixcuoz5ZpffH6DTrpmUPMysr7uAfYhKxK2h5qEl3Bzy1CGZw/7JI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPBKuDA46f4V9iPYOg3Jc+WcdP4mya6/kSiG9RvZWq9ISpeYMe
 27/85v3fIDsR4nmRrGyeBuocT69wl7hIwcLZannZn7lVYj3xYW34
X-Google-Smtp-Source: AGHT+IGxwpyMyVe6edwMg/iOioPvi4u5uGZhucoHBpkz5W+k/Faq6wVk0DaG1foJsU25ry0bqK4/TQ==
X-Received: by 2002:a2e:a98e:0:b0:2f5:b1a:a10 with SMTP id
 38308e7fff4ca-2f752495f87mr17165241fa.35.1725628392088; 
 Fri, 06 Sep 2024 06:13:12 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a5a40sm2436006a12.87.2024.09.06.06.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 06:13:11 -0700 (PDT)
Message-ID: <b243691e-b3f4-466f-8397-5bfe63f37fb2@gmail.com>
Date: Fri, 6 Sep 2024 16:13:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 04/23] lib/igt_fb: Make igt_calc_fb_size() somewhat
 usable
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240902143758.21036-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 2.9.2024 17.37, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> igt_calc_fb_size() is very awkward to use in combinations
> with planar/compressed formats. To fix it we either need
> to add tons of output parameters (strides/offsets/etc.),
> or we just get rid of it and promote calc_fb_size() to
> take its place. I chose the latter approach. This does
> mean that the callers will need to have a struct igt_fb
> around, but I think that's nicer than adding tons of
> output parameters.
> 
> v2: Fix a misplaced fb->size
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c             | 50 +++++++++++-----------------------------
>   lib/igt_fb.h             |  3 +--
>   tests/intel/gem_pxp.c    |  4 +---
>   tests/intel/kms_big_fb.c | 37 +++++++++++++++--------------
>   tests/kms_addfb_basic.c  | 14 ++++++-----
>   tests/kms_prime.c        | 12 ++++++++--
>   tests/kms_rotation_crc.c | 10 ++++----
>   7 files changed, 57 insertions(+), 73 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index b7fc6c34606c..21c56a454c5a 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -936,7 +936,15 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
>   	return alignment;
>   }
>   
> -static uint64_t calc_fb_size(struct igt_fb *fb)
> +/**
> + * igt_calc_fb_size:
> + * @fb: the framebuffer
> + *
> + * This function calculates the framebuffer size/strides/offsets/etc.
> + * appropriately. The framebuffer needs to be sufficiently initialized
> + * beforehand eg. with igt_init_fb().
> + */
> +void igt_calc_fb_size(struct igt_fb *fb)
>   {
>   	uint64_t size = 0;
>   	int plane;
> @@ -963,36 +971,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
>   			size = ALIGN(size, SZ_64K);
>   	}
>   
> -	return size;
> -}
> -
> -/**
> - * igt_calc_fb_size:
> - * @fd: the DRM file descriptor
> - * @width: width of the framebuffer in pixels
> - * @height: height of the framebuffer in pixels
> - * @format: drm fourcc pixel format code
> - * @modifier: tiling layout of the framebuffer (as framebuffer modifier)
> - * @size_ret: returned size for the framebuffer
> - * @stride_ret: returned stride for the framebuffer
> - *
> - * This function returns valid stride and size values for a framebuffer with the
> - * specified parameters.
> - */
> -void igt_calc_fb_size(int fd, int width, int height, uint32_t drm_format, uint64_t modifier,
> -		      uint64_t *size_ret, unsigned *stride_ret)
> -{
> -	struct igt_fb fb;
> -
> -	igt_init_fb(&fb, fd, width, height, drm_format, modifier,
> -		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> -
> -	fb.size = calc_fb_size(&fb);
> -
> -	if (size_ret)
> -		*size_ret = fb.size;
> -	if (stride_ret)
> -		*stride_ret = fb.strides[0];
> +	/* Respect the size requested by the caller. */
> +	if (fb->size == 0)
> +		fb->size = size;
>   }
>   
>   /**
> @@ -1179,7 +1160,6 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>   	unsigned *strides = &fb->strides[0];
>   	bool device_bo = false;
>   	int fd = fb->fd;
> -	uint64_t size;
>   
>   	/*
>   	 * The current dumb buffer allocation API doesn't really allow to
> @@ -1194,11 +1174,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>   		device_bo = true;
>   
>   	/* Sets offets and stride if necessary. */
> -	size = calc_fb_size(fb);
> -
> -	/* Respect the size requested by the caller. */
> -	if (fb->size == 0)
> -		fb->size = size;
> +	igt_calc_fb_size(fb);
>   
>   	if (device_bo) {
>   		fb->is_dumb = false;
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 834aaef54dea..2b5040ce3c6b 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -125,8 +125,7 @@ enum igt_text_align {
>   
>   void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>   			  unsigned *width_ret, unsigned *height_ret);
> -void igt_calc_fb_size(int fd, int width, int height, uint32_t format, uint64_t modifier,
> -		      uint64_t *size_ret, unsigned *stride_ret);
> +void igt_calc_fb_size(struct igt_fb *fb);
>   void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
>   		 uint32_t drm_format, uint64_t modifier,
>   		 enum igt_color_encoding color_encoding,
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index e2c12df17980..94544240d649 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1154,9 +1154,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
>   
>   	igt_init_fb(fb, i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
>   		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> -
> -	igt_calc_fb_size(i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
> -			 &fb->size, &fb->strides[0]);
> +	igt_calc_fb_size(fb);
>   
>   	err = create_bo_ext(i915, fb->size, true, &(fb->gem_handle));
>   	igt_assert_eq(err, 0);
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 2fef03ab7412..7da3d12d43b8 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -336,8 +336,7 @@ static bool size_ok(data_t *data, uint64_t size)
>   static void max_fb_size(data_t *data, int *width, int *height,
>   			uint32_t format, uint64_t modifier)
>   {
> -	unsigned int stride;
> -	uint64_t size;
> +	struct igt_fb fb;
>   	int i = 0;
>   
>   	/* max fence stride is only 8k bytes on gen3 */
> @@ -345,17 +344,19 @@ static void max_fb_size(data_t *data, int *width, int *height,
>   	    format == DRM_FORMAT_XRGB8888)
>   		*width = min(*width, 8192 / 4);
>   
> -	igt_calc_fb_size(data->drm_fd, *width, *height,
> -			 format, modifier, &size, &stride);
> +	igt_init_fb(&fb, data->drm_fd, *width, *height, format, modifier,
> +		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +	igt_calc_fb_size(&fb);
>   
> -	while (!size_ok(data, size)) {
> +	while (!size_ok(data, fb.size)) {
>   		if (i++ & 1)
>   			*width >>= 1;
>   		else
>   			*height >>= 1;
>   
> -		igt_calc_fb_size(data->drm_fd, *width, *height,
> -				 format, modifier, &size, &stride);
> +		igt_init_fb(&fb, data->drm_fd, *width, *height, format, modifier,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
>   	}
>   
>   	igt_info("Max usable framebuffer size for format "IGT_FORMAT_FMT" / modifier 0x%"PRIx64": %dx%d\n",
> @@ -840,11 +841,9 @@ static int rmfb(int fd, uint32_t id)
>   static void
>   test_addfb(data_t *data)
>   {
> -	uint64_t size;
> +	struct igt_fb fb;
>   	uint32_t fb_id;
>   	uint32_t bo;
> -	uint32_t offsets[4] = {};
> -	uint32_t strides[4] = {};
>   	uint32_t format;
>   	int ret;
>   
> @@ -861,29 +860,29 @@ test_addfb(data_t *data)
>   	igt_require(igt_display_has_format_mod(&data->display,
>   					       format, data->modifier));
>   
> -	igt_calc_fb_size(data->drm_fd,
> -			 data->max_fb_width,
> -			 data->max_fb_height,
> -			 format, data->modifier,
> -			 &size, &strides[0]);
> +	igt_init_fb(&fb, data->drm_fd,
> +		    data->max_fb_width, data->max_fb_height,
> +		    format, data->modifier,
> +		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +	igt_calc_fb_size(&fb);
>   
>   	if (is_i915_device(data->drm_fd))
> -		bo = gem_buffer_create_fb_obj(data->drm_fd, size);
> +		bo = gem_buffer_create_fb_obj(data->drm_fd, fb.size);
>   	else
>   		bo = xe_bo_create(data->drm_fd, 0,
> -				  ALIGN(size, xe_get_default_alignment(data->drm_fd)),
> +				  ALIGN(fb.size, xe_get_default_alignment(data->drm_fd)),
>   				  vram_if_possible(data->drm_fd, 0), 0);
>   	igt_require(bo);
>   
>   	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) < 4)
>   		gem_set_tiling(data->drm_fd, bo,
> -			       igt_fb_mod_to_tiling(data->modifier), strides[0]);
> +			       igt_fb_mod_to_tiling(data->modifier), fb.strides[0]);
>   
>   	ret = __kms_addfb(data->drm_fd, bo,
>   			  data->max_fb_width,
>   			  data->max_fb_height,
>   			  format, data->modifier,
> -			  strides, offsets, 1,
> +			  fb.strides, fb.offsets, fb.num_planes,
>   			  DRM_MODE_FB_MODIFIERS, &fb_id);
>   	igt_assert_eq(ret, 0);
>   
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 5c812a49fce8..8fe22ec05166 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -294,19 +294,21 @@ static void invalid_tests(int fd)
>   	igt_describe("Check if addfb2 with a system memory gem object "
>   		     "fails correctly if device requires local memory framebuffers");
>   	igt_subtest("invalid-smem-bo-on-discrete") {
> -		uint32_t handle, stride;
> -		uint64_t size;
> +		struct igt_fb fb;
> +		uint32_t handle;
>   
>   		igt_require_intel(fd);
> -		igt_calc_fb_size(fd, f.width, f.height,
> -				DRM_FORMAT_XRGB8888, 0, &size, &stride);
> +		igt_init_fb(&fb, fd, f.width, f.height,
> +			    DRM_FORMAT_XRGB8888, 0,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
>   
>   		if (is_i915_device(fd)) {
>   			igt_require(gem_has_lmem(fd));
> -			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
> +			handle = gem_create_in_memory_regions(fd, fb.size, REGION_SMEM);
>   		} else {
>   			igt_require(xe_has_vram(fd));
> -			handle = xe_bo_create(fd, 0, size, system_memory(fd), 0);
> +			handle = xe_bo_create(fd, 0, fb.size, system_memory(fd), 0);
>   		}
>   
>   		f.handles[0] = handle;
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index e52eba8cf262..7f46c6842704 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -149,8 +149,16 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>   		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
>   					      scratch->size, PROT_WRITE);
>   	} else {
> -		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
> +		struct igt_fb fb;
> +
> +		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
> +
> +		scratch->size = fb.size;
> +		scratch->pitch = fb.strides[0];
> +
>   		if (gem_has_lmem(exporter_fd))
>   			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
>   								       REGION_LMEM(0), REGION_SMEM);
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 8d8c53b5ff84..9888ac6ac3c4 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1091,8 +1091,8 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
>   	int fd = data->gfx_fd;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb[MAX_FENCES+1] = {};
> -	uint64_t size;
> -	unsigned int stride, w, h;
> +	struct igt_fb tmp_fb;
> +	unsigned int w, h;
>   	uint64_t total_aperture_size, total_fbs_size;
>   	int i;
>   
> @@ -1106,13 +1106,15 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
>   	w = mode->hdisplay;
>   	h = mode->vdisplay;
>   
> -	igt_calc_fb_size(fd, w, h, format, modifier, &size, &stride);
> +	igt_init_fb(&tmp_fb, fd, w, h, format, modifier,
> +		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +	igt_calc_fb_size(&tmp_fb);
>   
>   	/*
>   	 * Make sure there is atleast 90% of the available GTT space left
>   	 * for creating (MAX_FENCES+1) framebuffers.
>   	 */
> -	total_fbs_size = size * (MAX_FENCES + 1);
> +	total_fbs_size = tmp_fb.size * (MAX_FENCES + 1);
>   	total_aperture_size = gem_available_aperture_size(fd);
>   	igt_require(total_fbs_size < total_aperture_size * 0.9);
>   


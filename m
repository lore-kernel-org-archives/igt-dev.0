Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7CE89DF9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 07:48:39 +0000 (UTC)
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
 <20210909153047.16729-6-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <7a0668fb-a491-5306-0c5f-9432f23a6032@intel.com>
Date: Mon, 20 Sep 2021 13:18:19 +0530
In-Reply-To: <20210909153047.16729-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 05/11] tests/kms_big_fb: Use
 igt_has_drm_cap()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/9/2021 9:00 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Replace the hand rolled cap check with igt_has_drm_cap().
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_big_fb.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index 092cbc6846fe..308227c9113a 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -57,7 +57,6 @@ typedef struct {
>   	double planeclearrgb[3];
>   	uint32_t format_override;
>   	uint32_t stride_override;
> -	uint32_t async_flip_support;
>   } data_t;
>   
>   static struct intel_buf *init_buf(data_t *data,
> @@ -800,7 +799,6 @@ igt_main
>   {
>   	igt_fixture {
>   		drmModeResPtr res;
> -		struct drm_get_cap cap = { .capability = DRM_CAP_ASYNC_PAGE_FLIP };
>   
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>   
> @@ -851,9 +849,6 @@ igt_main
>   
>   		data.max_hw_stride_test = false;
>   		data.async_flip_test = false;
> -
> -		igt_ioctl(data.drm_fd, DRM_IOCTL_GET_CAP, &cap);
> -		data.async_flip_support = cap.value;
>   	}
>   
>   	/*
> @@ -983,7 +978,7 @@ igt_main
>   							igt_require(data.format == DRM_FORMAT_C8 ||
>   								igt_fb_supported_format(data.format));
>   							igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
> -							igt_require_f(data.async_flip_support, "Async Flip is not supported\n");
> +							igt_require(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP));
>   							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
>   							test_scanout(&data);
>   					}


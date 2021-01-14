Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0F6E123
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jan 2021 16:43:43 +0000 (UTC)
From: "Kim, Sung joon" <Sungjoon.Kim@amd.com>
Date: Thu, 14 Jan 2021 16:43:40 +0000
Message-ID: <MN2PR12MB3054AEFE0CA1D96BABAF28E797A80@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20210112225400.115515-1-sungkim@amd.com>
 <4bd36d90-e3fe-0d52-be42-23ebcb320c37@amd.com>
In-Reply-To: <4bd36d90-e3fe-0d52-be42-23ebcb320c37@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/3] lib: Add stride and size calculation for
 amdgpu + tiling
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
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

On 2021-01-12 5:53 p.m., Sung Joon Kim wrote:
> For amdgpu, we need to calculate the stride and size of framebuffer 
> correctly during non-linear tiling mode
> 
> v2: add call to amdgpu tiling/swizzle addressing
> Signed-off-by: Sung Joon Kim <sungkim@amd.com>
> ---
>   lib/igt_fb.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 4b9be47e..6eebe048 
> 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -671,6 +671,11 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
>   		 * so the easiest way is to align the luma stride to 256.
>   		 */
>   		return ALIGN(min_stride, 256);
> +	}else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		return ALIGN(min_stride, 512);
>   	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
>   		/* clear color always fixed to 64 bytes */
>   		return 64;
> @@ -711,6 +716,12 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
>   		size = roundup_power_of_two(size);
>   
>   		return size;
> +	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		return (uint64_t) fb->strides[plane] *
> +			ALIGN(fb->plane_height[plane], 512);
>   	} else if (is_gen12_ccs_plane(fb, plane)) {
>   		/* The AUX CCS surface must be page aligned */
>   		return (uint64_t)fb->strides[plane] * @@ -2352,6 +2363,13 @@ 
> static void free_linear_mapping(struct fb_blit_upload *blit)
>   
>   		vc4_fb_convert_plane_to_tiled(fb, map, &linear->fb, &linear->map);
>   
> +		munmap(map, fb->size);
> +	} else if (is_amdgpu_device(fd) && fb->modifier != 0) {
> +		void *map = igt_amd_mmap_bo(fd, fb->gem_handle, fb->size, 
> +PROT_WRITE);
> +
> +		igt_amd_fb_convert_plane_to_tiled(fb, map, &linear->fb, 
> +linear->map);

Hi Nicholas,

The definition of that function should be in igt_amd.c which is shown in [PATCH 3/3].

Thanks,
Joon

Are you missing a patch in the series?

I don't see the definition for igt_amd_fb_convert_plane_to_tiled() anywhere.

Regards,
Nicholas Kazlauskas

> +
> +		munmap(linear->map, fb->size);
>   		munmap(map, fb->size);
>   	} else {
>   		gem_munmap(linear->map, linear->fb.size); @@ -2419,6 +2437,10 @@ 
> static void setup_linear_mapping(struct fb_blit_upload *blit)
>   		vc4_fb_convert_plane_from_tiled(&linear->fb, &linear->map, fb, 
> map);
>   
>   		munmap(map, fb->size);
> +	} else if (is_amdgpu_device(fd) && fb->modifier != 0) {
> +		linear->map = igt_amd_mmap_bo(fd, linear->fb.gem_handle,
> +					      linear->fb.size,
> +					      PROT_READ | PROT_WRITE);
>   	} else {
>   		/* Copy fb content to linear BO */
>   		gem_set_domain(fd, linear->fb.gem_handle, @@ -3625,7 +3647,7 @@ 
> cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
>   		if (use_convert(fb))
>   			create_cairo_surface__convert(fd, fb);
>   		else if (use_blitter(fb) || use_enginecopy(fb) ||
> -			 igt_vc4_is_tiled(fb->modifier))
> +			 igt_vc4_is_tiled(fb->modifier) || (is_amdgpu_device(fd) && 
> +fb->modifier != 0))
>   			create_cairo_surface__gpu(fd, fb);
>   		else
>   			create_cairo_surface__gtt(fd, fb);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27816E029
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jan 2021 15:36:40 +0000 (UTC)
References: <20201216230223.24311-1-sungkim@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <a8ba5956-1947-f711-dbe9-de464840e61e@amd.com>
Date: Mon, 4 Jan 2021 10:36:36 -0500
In-Reply-To: <20201216230223.24311-1-sungkim@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] lib: Add stride and size calculation for
 amdgpu + tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sung Joon Kim <sungkim@amd.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-12-16 6:02 p.m., Sung Joon Kim wrote:
> For amdgpu, we need to calculate the stride and size of framebuffer correctly during non-linear tiling mode
> 
> Signed-off-by: Sung Joon Kim <sungkim@amd.com>
> ---
>   lib/igt_fb.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 422a9e06..b99e8d07 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -670,6 +670,11 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
>   		 * so the easiest way is to align the luma stride to 256.
>   		 */
>   		return ALIGN(min_stride, 256);
> +	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		return ALIGN(min_stride, 512);
>   	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
>   		/* clear color always fixed to 64 bytes */
>   		return 64;
> @@ -710,6 +715,12 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
>   		size = roundup_power_of_two(size);
>   
>   		return size;
> +	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		return (uint64_t) fb->strides[plane] *
> +			ALIGN(fb->plane_height[plane], 512);

Is the requirement that only the stride be aligned to 512? Are you sure 
we need to bypass the regular plane size calculation here?

Regards,
Nicholas Kazlauskas

>   	} else if (is_gen12_ccs_plane(fb, plane)) {
>   		/* The AUX CCS surface must be page aligned */
>   		return (uint64_t)fb->strides[plane] *
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

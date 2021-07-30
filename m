Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAED06F3D1
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jul 2021 05:50:12 +0000 (UTC)
References: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <2ce3082b-9823-8625-920e-7dcb8da0efbc@intel.com>
Date: Fri, 30 Jul 2021 11:20:08 +0530
MIME-Version: 1.0
In-Reply-To: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width to
 256B
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 28-Jul-21 10:25 AM, Tejas Upadhyay wrote:
> some display resolutions like 1366x768 6bpc which does not
> have 64B aligned width are creating crc mismatch in
> kms_plane_alpha_blend test on Intel platforms.
> 
> Also having different alignment requirement by different drivers,
> 256B aligned width should work for all drm drivers.
> 
> amdgpu and radeon, amdgpu_align_pitch: 256B
> armada, armada_pitch: 128B
> exynos_drm_gem_dumb_create: No alignment required
> drm_gem_shmem_dumb_create: 8B
> drm_gem_vram_fill_create_dumb: 8B
> 
> Thus 256B covers everything we see in the kernel drm drivers.
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index d649a09f..864e83f9 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -168,6 +168,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
>   	w = mode->hdisplay;
>   	h = mode->vdisplay;
>   
> +	w = ALIGN(w, 256);
>   	/* recreate all fbs if incompatible */
>   	if (data->xrgb_fb.width != w || data->xrgb_fb.height != h) {
>   		cairo_t *cr;
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

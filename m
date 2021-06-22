Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0ED6E86F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 18:11:57 +0000 (UTC)
Date: Tue, 22 Jun 2021 14:11:52 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210622181152.3ihjwqrurd27lwvd@outlook.office365.com>
References: <20210621172146.4130875-1-markyacoub@chromium.org>
Content-Disposition: inline
In-Reply-To: <20210621172146.4130875-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] lib/igt_fb: Support Tile Size for AMD non
 linear modifiers.
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, seanpaul@chromium.org, petri.latvala@intel.com, bas@basnieuwenhuizen.nl
List-ID: <igt-dev@lists.freedesktop.org>

On 06/21, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> Calculate the width and height of the tile on amdgpu when the modifier
> is not linear.
> 
> v1:
> Change width_ret to bytes not pixels.
> 
> Cc: bas@basnieuwenhuizen.nl
> Cc: daniel.vetter@ffwll.ch
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Change-Id: I30849ee1368fc626d1ce2826fb726cd76565a449
> ---
>  lib/igt_fb.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 71b89855..a3926dc9 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -396,6 +396,19 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  		vc4_modifier_param = fourcc_mod_broadcom_param(modifier);
>  		modifier = fourcc_mod_broadcom_mod(modifier);
>  	}
> +	// For all non-linear modifiers, AMD uses 64 KiB tiles
> +	else if (IS_AMD_FMT_MOD(modifier)) {
> +		igt_require_amdgpu(fd);
> +		const int bytes_per_pixel = fb_bpp / 8;
> +		const int format_log2 = log2(bytes_per_pixel);
> +		const int pixel_log2 = log2(64 * 1024) - format_log2;
> +		const int width_log2 = (pixel_log2 + 1) / 2;
> +		const int height_log2 = pixel_log2 - width_log2;
> +
> +		*width_ret = bytes_per_pixel << width_log2;
> +		*height_ret = 1 << height_log2;
> +		return;
> +	}

Hi Mark,

This patch lgtm,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

However, let's check if Bas has any comment about it.

Btw, is the CI failure a false positive?

Thanks

>  
>  	switch (modifier) {
>  	case LOCAL_DRM_FORMAT_MOD_NONE:
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C9bb62f4ec1014d6c59c508d934d9127e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637598929185530952%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1D6ewDi%2FlMRkDjtg94ZNeaxHQFJhfMrYAbKLGQ2%2F9DA%3D&amp;reserved=0

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CE610E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 07:53:55 +0000 (UTC)
Message-ID: <8ebda745-a8ce-0fd0-06c2-cb191da37d90@intel.com>
Date: Wed, 28 Jun 2023 13:23:25 +0530
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230627172210.4599-1-juhapekka.heikkila@gmail.com>
 <20230627172210.4599-4-juhapekka.heikkila@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230627172210.4599-4-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: On blitter path take
 clear color modifier into account
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


On Tue-27-06-2023 10:52 pm, Juha-Pekka Heikkila wrote:
> On blitter path take clear color modifier into account so rc ccs cc will
> pass correctly.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_fb.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index d8f2cc640..ebebe86cd 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2841,9 +2841,12 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
>   	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
>   			   ? REGION_LMEM(0) : REGION_SMEM;
> +	/* To ignore CC plane */
> +	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
> +	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
>   
>   	igt_assert_eq(dst_fb->fd, src_fb->fd);
> -	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
> +	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
>   
>   	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
>   	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
> @@ -2860,7 +2863,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>   							  mem_region) == 0);
>   	}
>   
> -	for (int i = 0; i < dst_fb->num_planes; i++) {
> +	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
>   		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
>   		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
>   		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);

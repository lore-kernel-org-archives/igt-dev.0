Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0C89EB1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 09:12:56 +0000 (UTC)
Date: Tue, 15 Nov 2022 10:12:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3NYEw8mzAdFPiOs@kamilkon-desk1>
References: <20221114170721.32148-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221114170721.32148-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915_blt: Narrow setting same pitch
 and aux-ccs to Tile64 only
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

On 2022-11-14 at 18:07:21 +0100, Zbigniew Kempczyński wrote:
> In commit 229bb0accbb7 ("lib/i915_blt: equalize pitch and aux-ccs for
> full resolve") i've incidentally introduce partial regression for x-major
> and Tile4.
> 
> Limit equalizing pitch and aux-ccs for full-resolve to Tile64 only.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/i915/i915_blt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index a886c1d72d..3776c56c60 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -317,7 +317,7 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw00.special_mode = __special_mode(blt);
>  	data->dw00.length = extended_command ? 20 : 10;
>  
> -	if (__special_mode(blt) == SM_FULL_RESOLVE) {
> +	if (__special_mode(blt) == SM_FULL_RESOLVE && blt->src.tiling == T_TILE64) {
>  		data->dw01.dst_pitch = blt->src.pitch - 1;
>  		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
>  	} else {
> -- 
> 2.34.1
> 

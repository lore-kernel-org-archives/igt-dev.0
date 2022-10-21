Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9310E652
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 09:28:43 +0000 (UTC)
Message-ID: <6935cc62-2ea6-6b02-3b5e-f5dcfd941936@intel.com>
Date: Fri, 21 Oct 2022 11:28:40 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20221020065337.26978-1-zbigniew.kempczynski@intel.com>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <20221020065337.26978-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915_blt: Equalize pitch and
 aux-ccs for full resolve
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20.10.2022 08:53, Zbigniew Kempczyński wrote:
> According to documentation and hw team suggestion use source pitch
> and aux-ccs in destination object when inplace decompression is
> performed (full-resolve operation).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> 
> ---
> v2: group assignments in if/else
> ---
>   lib/i915/i915_blt.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 8d46e51fb7..a886c1d72d 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -317,8 +317,14 @@ static void fill_data(struct gen12_block_copy_data *data,
>   	data->dw00.special_mode = __special_mode(blt);
>   	data->dw00.length = extended_command ? 20 : 10;
>   
> -	data->dw01.dst_pitch = blt->dst.pitch - 1;
> -	data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
> +	if (__special_mode(blt) == SM_FULL_RESOLVE) {
> +		data->dw01.dst_pitch = blt->src.pitch - 1;
> +		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
> +	} else {
> +		data->dw01.dst_pitch = blt->dst.pitch - 1;
> +		data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
> +	}
> +

iirc, with FULL_RESOLVE, we want to have identical src and dst
configuration, not just aux and pitch. Still, these were the only
differences we found when analysing bbs (and it would be hard to
restructure fill_data() to do it), so I'm fine with this change.

Reviewed-by: Karolina Drobnik <karolina.drobnik@intel.com>

>   	data->dw01.dst_mocs = blt->dst.mocs;
>   	data->dw01.dst_compression = blt->dst.compression;
>   	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);

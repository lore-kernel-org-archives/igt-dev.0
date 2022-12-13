Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434B10E336
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 15:38:15 +0000 (UTC)
Message-ID: <a7a22cbd-496e-648a-696d-704434a3251b@intel.com>
Date: Tue, 13 Dec 2022 16:37:26 +0100
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20221212125035.51326-1-zbigniew.kempczynski@intel.com>
 <20221212125035.51326-2-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20221212125035.51326-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/i915_blt: Remove src == dst
 pitch restriction
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

On 12.12.2022 13:50, Zbigniew Kempczyński wrote:
> During debugging phase we established there's not necessary to enforce
> same pitch for destination surface in FULL_RESOLVE mode. Relax this
> condition allowing caller to pass requirement surface configuration.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/i915/i915_blt.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 3776c56c60..42c28623f9 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -317,13 +317,11 @@ static void fill_data(struct gen12_block_copy_data *data,
>   	data->dw00.special_mode = __special_mode(blt);
>   	data->dw00.length = extended_command ? 20 : 10;
>   
> -	if (__special_mode(blt) == SM_FULL_RESOLVE && blt->src.tiling == T_TILE64) {
> -		data->dw01.dst_pitch = blt->src.pitch - 1;
> +	if (__special_mode(blt) == SM_FULL_RESOLVE)

"blt->src.tiling == T_TILE64" part was introduced in commit cdc0258a4672 
("lib/i915_blt: Narrow setting same pitch and aux-ccs to Tile64 only").
I know it's a bit nit-picky, but could we revert that change (as it 
looks like it's not necessary), and have a separate commit that removes 
data->dw01.dst_pitch = blt->src.pitch - 1?

The question remains -- what actually caused the regression for Tile4 
and xmajor? Was it because of the pitch settings? I run the tests a 
couple of times in the row after applying this patch and everything 
worked as expected.

All the best,
Karolina

>   		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
> -	} else {
> -		data->dw01.dst_pitch = blt->dst.pitch - 1;
> +	else
>   		data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
> -	}
> +	data->dw01.dst_pitch = blt->dst.pitch - 1;
>   
>   	data->dw01.dst_mocs = blt->dst.mocs;
>   	data->dw01.dst_compression = blt->dst.compression;

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A4E10E3D8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 09:25:07 +0000 (UTC)
Message-ID: <340f937c-6a97-966f-0b6c-4231c3159672@intel.com>
Date: Wed, 12 Jul 2023 11:24:49 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
 <20230711112009.122482-18-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230711112009.122482-18-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 17/17] tests/gem_ccs: Avoid writing
 png twice
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

On 11.07.2023 13:20, Zbigniew Kempczyński wrote:
> As Karolina noticed we write source png twice what's just takes
> time as source surface is not touched. Drop one png write.

It was outside of the scope, but you did it! Thanks for writing this patch:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   tests/i915/gem_ccs.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index d9d785ed9b..a1302e0a4d 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -421,7 +421,6 @@ static void block_copy(int i915,
>   	if (mid->compression)
>   		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
>   
> -	WRITE_PNG(i915, run_id, "src", &blt.src, width, height);
>   	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
>   
>   	if (config->surfcopy && pext) {

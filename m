Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316E10E125
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 10:59:09 +0000 (UTC)
Message-ID: <c3e7b1ab-14a3-400b-0b79-96b4adf4e5bc@intel.com>
Date: Wed, 5 Jul 2023 12:58:56 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
 <20230704090104.120219-2-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230704090104.120219-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 01/12] lib/xe_query: Use vramN when
 returning string region name
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

Hi Zbigniew,

On 4.07.2023 11:00, Zbigniew Kempczyński wrote:
> For tests which are mixing regions (like xe_ccs) name is confusing.
> As an example might be example "subtest-name-vram-1-vram-1". It's
> more readable when it will be renamed to "subtest-name-vram1-vram1".

Sounds good, but I wonder how it maps to the convention used in other 
tests. In gem_ccs, iirc, we had "smem" and "lmemN". Could we reuse it here?

All the best,
Karolina

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/xe/xe_query.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 48fb5afba7..830b7e401d 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -445,7 +445,7 @@ struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
>    * xe_region_name:
>    * @region: region mask
>    *
> - * Returns region string like "system" or "vram-n" where n=0...62.
> + * Returns region string like "system" or "vramN" where N=0...62.
>    */
>   const char *xe_region_name(uint64_t region)
>   {
> @@ -457,7 +457,7 @@ const char *xe_region_name(uint64_t region)
>   		vrams = calloc(64, sizeof(char *));
>   		for (int i = 0; i < 64; i++) {
>   			if (i != 0)
> -				asprintf(&vrams[i], "vram-%d", i - 1);
> +				asprintf(&vrams[i], "vram%d", i - 1);
>   			else
>   				asprintf(&vrams[i], "system");
>   			igt_assert(vrams[i]);

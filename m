Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16BC6F3FA
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 12:14:49 +0000 (UTC)
Date: Tue, 23 Nov 2021 13:14:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211123121445.GB3625@zkempczy-mobl2>
References: <20211123083615.3756632-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123083615.3756632-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/gem_lmem_swapping: run only for
 discrete platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 23, 2021 at 02:06:15PM +0530, Tejas Upadhyay wrote:
> Testsuit only meant to be run on discrete platforms and skip
> with right reason on other platforms.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  tests/i915/gem_lmem_swapping.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 3c1573b6..abf9d8a2 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -525,6 +525,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		regions = gem_get_query_memory_regions(i915);
>  		igt_require(regions);
>  
> +		igt_require(gem_has_lmem(i915));
> +

Generally agree, this is better check. Only thing I would change
is the place of this require. I suggest immediate after require gem:

		i915 = drm_open_driver(DRIVER_INTEL);
		igt_require_gem(i915);
		igt_require(gem_has_lmem(i915));

With above changes:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


>  		for_each_physical_engine(i915, e)
>  			__num_engines__++;
>  		igt_require(__num_engines__);
> -- 
> 2.31.1
> 

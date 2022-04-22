Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3744210EB58
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 14:12:28 +0000 (UTC)
Date: Fri, 22 Apr 2022 16:12:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmK3yFzMkYFEyDnK@kamilkon-DESK1>
References: <20220422125912.6862-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422125912.6862-1-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

On 2022-04-22 at 18:29:12 +0530, Anshuman Gupta wrote:
> Currently IGT is lacking IS_DGFX() macro support.

imho anything new is lacking ... I would rewrite this into
something like in subject and move that add macro info to
place where you describe what you added.

> There are some power features like D3Cold are only
> supported on discrete card. So IGT test/tools specific

s/So//

> to D3Cold requires to consume IS_DGFX().

s/requires to consume IS_DGFX()./requires to know this./

> Adding a is_dgfx field in intel_device_info and initializing

s/a is_dgfx/an is_dgfx/

Here you can write about new macro.

> it for DG1. All future discrete platform would require to
-------- ^

You are also adding it for DG2, so write DG1/DG2 here.

Regards,
Kamil

> initialize this field.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/intel_chipset.h     | 2 ++
>  lib/intel_device_info.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index db75a829f..07fdd213e 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -42,6 +42,7 @@ struct intel_device_info {
>  	unsigned gt; /* 0 if unknown */
>  	bool has_4tile : 1;
>  	bool has_flatccs;
> +	bool is_dgfx :1;
>  	bool is_mobile : 1;
>  	bool is_whitney : 1;
>  	bool is_almador : 1;
> @@ -208,6 +209,7 @@ void intel_check_pch(void);
>  
>  #define IS_MOBILE(devid)	(intel_get_device_info(devid)->is_mobile)
>  #define IS_965(devid)		AT_LEAST_GEN(devid, 4)
> +#define IS_DGFX(devid)	(intel_get_device_info(devid)->is_dgfx)
>  
>  #define HAS_BSD_RING(devid)	AT_LEAST_GEN(devid, 5)
>  #define HAS_BLT_RING(devid)	AT_LEAST_GEN(devid, 6)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index e55841df5..b735f16a6 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -386,6 +386,7 @@ static const struct intel_device_info intel_rocketlake_info = {
>  static const struct intel_device_info intel_dg1_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 12,
> +	.is_dgfx = true,
>  	.is_dg1 = true,
>  	.codename = "dg1"
>  };
> @@ -394,6 +395,7 @@ static const struct intel_device_info intel_dg2_info = {
>  	.graphics_ver = 12,
>  	.display_ver = 13,
>  	.has_4tile = true,
> +	.is_dgfx = true,
>  	.is_dg2 = true,
>  	.codename = "dg2",
>  	.has_flatccs = true,
> -- 
> 2.26.2
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9D10E55E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 16:13:18 +0000 (UTC)
Date: Wed, 27 Sep 2023 18:09:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230927160931.m34jkwcwn6l3yf5w@kamilkon-desk.igk.intel.com>
References: <20230926184748.199187-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230926184748.199187-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH 1/3] lib/drmtest: Use module table for
 chipset_to_str()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,
On 2023-09-26 at 11:47:45 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Use the existing table, so there is one fewer place to update to add
> support for a new driver.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/drmtest.c | 29 +++++------------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e1da66c877e9..2cfa8a899d53 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -601,30 +601,11 @@ static void cancel_work_at_exit_render(int sig)
>  
>  static const char *chipset_to_str(int chipset)
>  {
> -	switch (chipset) {
> -	case DRIVER_INTEL:
> -		return "intel";
--------------- ^^^^^
This will change into "i915" and break compatibility with older
tests, so imho leave this function as is and add new one:

static const char *chipset_to_module_str(int chipset)

Regards,
Kamil

> -	case DRIVER_V3D:
> -		return "v3d";
> -	case DRIVER_VC4:
> -		return "vc4";
> -	case DRIVER_VGEM:
> -		return "vgem";
> -	case DRIVER_AMDGPU:
> -		return "amdgpu";
> -	case DRIVER_PANFROST:
> -		return "panfrost";
> -	case DRIVER_MSM:
> -		return "msm";
> -	case DRIVER_XE:
> -		return "xe";
> -	case DRIVER_VMWGFX:
> -		return "vmwgfx";
> -	case DRIVER_ANY:
> -		return "any";
> -	default:
> -		return "other";
> -	}
> +	for (const struct module *m = modules; m->module; m++)
> -		return "intel";
> +		if (m->bit == chipset)
> +			return m->module;
> +
> +	return (chipset == DRIVER_ANY) ? "any" : "other";
>  }
>  
>  /**
> -- 
> 2.41.0
> 

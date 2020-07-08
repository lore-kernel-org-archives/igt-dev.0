Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31026E91F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 20:07:04 +0000 (UTC)
Date: Wed, 8 Jul 2020 13:07:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200708200703.GA2168119@mdroper-desk1.amr.corp.intel.com>
References: <20200708174252.25699-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708174252.25699-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Sync i915 PCI ids
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 10:42:52AM -0700, Jos=E9 Roberto de Souza wrote:
> Two new patches landed in kernel adding new PCI ids:
> 123f62de419f ("drm/i915/rkl: Add RKL platform info and PCI ids")
> 52797a8e8529 ("drm/i915/ehl: Add new PCI ids")
> =

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/i915_pciids.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> =

> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 662d8351c..d6cb28992 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -588,7 +588,11 @@
>  	INTEL_VGA_DEVICE(0x4551, info), \
>  	INTEL_VGA_DEVICE(0x4541, info), \
>  	INTEL_VGA_DEVICE(0x4E71, info), \
> +	INTEL_VGA_DEVICE(0x4557, info), \
> +	INTEL_VGA_DEVICE(0x4555, info), \
>  	INTEL_VGA_DEVICE(0x4E61, info), \
> +	INTEL_VGA_DEVICE(0x4E57, info), \
> +	INTEL_VGA_DEVICE(0x4E55, info), \
>  	INTEL_VGA_DEVICE(0x4E51, info)
>  =

>  /* TGL */
> @@ -605,4 +609,13 @@
>  	INTEL_VGA_DEVICE(0x9AD9, info), \
>  	INTEL_VGA_DEVICE(0x9AF8, info)
>  =

> +/* RKL */
> +#define INTEL_RKL_IDS(info) \
> +	INTEL_VGA_DEVICE(0x4C80, info), \
> +	INTEL_VGA_DEVICE(0x4C8A, info), \
> +	INTEL_VGA_DEVICE(0x4C8B, info), \
> +	INTEL_VGA_DEVICE(0x4C8C, info), \
> +	INTEL_VGA_DEVICE(0x4C90, info), \
> +	INTEL_VGA_DEVICE(0x4C9A, info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- =

> 2.27.0
> =


-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

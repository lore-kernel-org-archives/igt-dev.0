Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A026E0D3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 17:18:24 +0000 (UTC)
Date: Thu, 12 Dec 2019 09:18:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20191212171824.GE85422@mdroper-desk1.amr.corp.intel.com>
References: <20191210195559.9860-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210195559.9860-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Sync i915_pciids.h
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

On Tue, Dec 10, 2019 at 11:55:59AM -0800, Jos=E9 Roberto de Souza wrote:
> IGT is missing the new EHL/JSL PCI ids added in commit
> 651cc835d5f6 ("drm/i915: Add new EHL/JSL PCI ids")
> =

> Cc: James Ausmus <james.ausmus@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Matches the kernel and the bspec.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/i915_pciids.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> =

> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index b1f66b11..3e26a917 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -579,12 +579,15 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
>  =

> -/* EHL */
> +/* EHL/JSL */
>  #define INTEL_EHL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4500, info),	\
>  	INTEL_VGA_DEVICE(0x4571, info), \
>  	INTEL_VGA_DEVICE(0x4551, info), \
> -	INTEL_VGA_DEVICE(0x4541, info)
> +	INTEL_VGA_DEVICE(0x4541, info), \
> +	INTEL_VGA_DEVICE(0x4E71, info), \
> +	INTEL_VGA_DEVICE(0x4E61, info), \
> +	INTEL_VGA_DEVICE(0x4E51, info)
>  =

>  /* TGL */
>  #define INTEL_TGL_12_IDS(info) \
> -- =

> 2.24.0
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

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB13B10E04F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:24:31 +0000 (UTC)
Date: Tue, 13 Jun 2023 18:23:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230613162359.42e5gu7rkb3zb3au@kamilkon-desk1>
References: <20230613094455.2636571-1-christoph.manszewski@intel.com>
 <20230613094455.2636571-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230613094455.2636571-2-christoph.manszewski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] lib: Let gen7/gen8 inherit
 gen4_render.h
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

Hi Christoph,

On 2023-06-13 at 11:44:55 +0200, Christoph Manszewski wrote:
> Currently 'PIPELINE_SELECT_3D' macros are redifined. This can lead to
> compiler warnings when including headers containing those redifinitions.
> Instead of redefining pipe selects, inherit them from gen4_render.h
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/gen7_media.h | 2 +-
>  lib/gen8_media.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/gen7_media.h b/lib/gen7_media.h
> index b5e49cae..93dc7312 100644
> --- a/lib/gen7_media.h
> +++ b/lib/gen7_media.h
> @@ -3,6 +3,7 @@
>  
>  #include <stdint.h>
>  #include "surfaceformat.h"
> +#include "gen4_render.h"
>  
>  #define GEN7_FLOATING_POINT_IEEE_754		0
>  #define GEN7_FLOATING_POINT_NON_IEEE_754	1
> @@ -13,7 +14,6 @@
>  						((Subopcode) << 16))
>  
>  #define GEN7_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
> -# define PIPELINE_SELECT_3D			(0 << 0)
>  # define PIPELINE_SELECT_GPGPU			(2 << 0)
>  
>  #define GEN7_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
> diff --git a/lib/gen8_media.h b/lib/gen8_media.h
> index b5c19e50..07ea2ac0 100644
> --- a/lib/gen8_media.h
> +++ b/lib/gen8_media.h
> @@ -3,6 +3,7 @@
>  
>  #include <stdint.h>
>  #include "surfaceformat.h"
> +#include "gen4_render.h"
>  
>  #define GEN8_FLOATING_POINT_IEEE_754		0
>  #define GEN8_FLOATING_POINT_NON_IEEE_754	1
> @@ -13,7 +14,6 @@
>  						((Subopcode) << 16))
>  
>  #define GEN8_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
> -# define PIPELINE_SELECT_3D			(0 << 0)
>  
>  #define GEN8_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
>  
> -- 
> 2.40.1
> 

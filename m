Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170E910E266
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 12:03:47 +0000 (UTC)
Date: Fri, 11 Mar 2022 14:02:50 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <Yis6ajirjjAn2Eel@platvala-desk.ger.corp.intel.com>
References: <20220311113712.159192-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311113712.159192-1-jani.nikula@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt: don't include i915_pciids.h
 everywhere
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

On Fri, Mar 11, 2022 at 01:37:12PM +0200, Jani Nikula wrote:
> Macros from i915_pciids.h are only needed in one place,
> intel_device_info.c, and that already includes the header. Remove an
> unnecessary global include.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 0bf98aa5d767..96a368e11bbf 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -26,7 +26,6 @@
>  
>  #include "drmtest.h"
>  #include "i915_3d.h"
> -#include "i915_pciids.h"
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_core.h"
> -- 
> 2.30.2
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616110E51C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 18:44:27 +0000 (UTC)
Date: Thu, 12 Oct 2023 20:44:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012184422.zr5ntdyvmdi3l2ys@kamilkon-desk.igk.intel.com>
References: <20231011141841.7-1-francois.dugast@intel.com>
 <20231011141841.7-17-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011141841.7-17-francois.dugast@intel.com>
Subject: Re: [igt-dev] [RFC v1 16/20] xe_query: Add missing include.
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

Hi Francois,
On 2023-10-11 at 14:18:37 +0000, Francois Dugast wrote:

please remove dot from end of subject:
[RFC v1 16/20] xe_query: Add missing include.
--------------------------------------------^

Also this looks like a fix, imho send this as separate patch,
without RFC in it or at least move it to take 1 or before
build break. +cc Ashutosh

Regards,
Kamil

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> When trying to use xe_for_each_mem_region from a caller
> that is not importing the igt_aux.h, the following build issue
> will occur:
> 
> ../lib/xe/xe_query.h:76:38: error: implicit declaration of function ‘igt_fls’ [-Werror=implicit-function-declaration]
>    76 |         for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
> 
> So, to avoid a dependency chain, let's include from the file
> that is using the helper.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/xe/xe_query.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 8557bb4c5..dcdfa52c2 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -11,6 +11,8 @@
>  
>  #include <stdint.h>
>  #include <xe_drm.h>
> +
> +#include "igt_aux.h"
>  #include "igt_list.h"
>  
>  #define SZ_4K	0x1000
> -- 
> 2.34.1
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151610E09E
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 14:13:08 +0000 (UTC)
Date: Mon, 5 Dec 2022 15:13:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y438b77Tj0qdmec/@kamilkon-desk1>
References: <20221201053226.629748-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221201053226.629748-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_isolation.c :
 Increase MAX_REG
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Steve Hampson <steven.t.hampson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-12-01 at 11:02:26 +0530, Vikas Srivastava wrote:
> From: Steve Hampson <steven.t.hampson@intel.com>
> 
> Increase MAX_REG from 0x200000 to 0x400000 to support new large MMIO
> base addresses such as to support GEN12+ platform base addresses.

While it is ok for gen12+ this imho should be platform dependent
as now we will allow bigger regs for older platforms. It may be
something worth to fix in future, as of now

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Small nit - do not put space "tests/i915/gem_ctx_isolation.c :"
and also cut off ".c", so it will look like:
tests/i915/gem_ctx_isolation: Increase MAX_REG

btw no need to resend this,

Regards,
Kamil

> 
> Signed-off-by: Steve Hampson <steven.t.hampson@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_ctx_isolation.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index dc52a9a03..ec6935714 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -27,7 +27,8 @@
>  #include "igt_dummyload.h"
>  #include "igt_types.h"
>  
> -#define MAX_REG 0x200000
> +/* MAX_REG must be greater than the maximum register address. */
> +#define MAX_REG 0x400000
>  #define NUM_REGS (MAX_REG / sizeof(uint32_t))
>  
>  #define PAGE_ALIGN(x) ALIGN(x, 4096)
> -- 
> 2.25.1
> 

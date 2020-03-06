Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E7A6ECC5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 10:19:16 +0000 (UTC)
Date: Fri, 6 Mar 2020 12:19:13 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200306101913.GW3839@platvala-desk.ger.corp.intel.com>
References: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib: move upper_32_bits() and
 lower_32_bits() to library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 04:22:56PM +0100, Daniel Mrzyglod wrote:
> Move inline upper_32_bits() and lower_32_bits() function from tests to
> library. Functiom will be usefull for elsewhere use.
> 
> v2: fix function description
> 
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/ioctl_wrappers.h        | 20 ++++++++++++++++++++
>  tests/i915/gem_exec_fence.c | 10 ----------
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 7614e688c..9b29fce81 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -244,4 +244,24 @@ static inline void *from_user_pointer(uint64_t u64)
>  	return (void *)(uintptr_t)u64;
>  }
>  
> +/**
> + * lower_32_bits:
> + *
> + * return bits 0-31 of a number.
> + */
> +static inline uint32_t lower_32_bits(uint64_t x)
> +{
> +	return x & 0xffffffff;
> +}
> +
> +/**
> + * upper_32_bits:
> + *
> + * return bits 32-63 of a number.
> + */
> +static inline uint32_t upper_32_bits(uint64_t x)
> +{
> +	return x >> 32;
> +}
> +
>  #endif /* IOCTL_WRAPPERS_H */
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 9b3735325..ebd0f931f 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -590,16 +590,6 @@ static uint32_t batch_create(int fd)
>  	return handle;
>  }
>  
> -static inline uint32_t lower_32_bits(uint64_t x)
> -{
> -	return x & 0xffffffff;
> -}
> -
> -static inline uint32_t upper_32_bits(uint64_t x)
> -{
> -	return x >> 32;
> -}
> -
>  static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
>  {
>  	struct sigaction sa = { .sa_handler = alarm_handler };
> -- 
> 2.21.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

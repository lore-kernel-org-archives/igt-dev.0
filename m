Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EE010E054
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:39:54 +0000 (UTC)
Date: Mon, 18 Sep 2023 09:39:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Message-ID: <20230918073949.yqu2cxxkz3cjpfzf@zkempczy-mobl2>
References: <20230914172332.2322524-1-jonathan.cavitt@intel.com>
 <20230914172332.2322524-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914172332.2322524-2-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/intel_allocator: Query exact
 gtt size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 10:23:32AM -0700, Jonathan Cavitt wrote:
> Use the gem_context_get_param functionality to query the exact gtt size
> for each vm in the intel_allocator.  This replaces the fixed declaration
> using the GEN8_GTT_ADDRESS_WIDTH.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> ---
>  lib/intel_allocator.h        | 11 +++++++++++
>  lib/intel_allocator_simple.c | 10 +++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index f9ff7f1cc9..cfe20bf8aa 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -12,6 +12,7 @@
>  #include <stdint.h>
>  #include <stdatomic.h>
>  #include "i915/gem_submission.h"
> +#include "i915/gem_context.h"
>  #include "intel_reg.h"
>  
>  /**
> @@ -275,6 +276,16 @@ static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
>  	return intel_allocator_alloc(ahnd, handle, size, alignment);
>  }
>  
> +static inline uint64_t get_gtt_size(int fd)
> +{
> +	struct drm_i915_gem_context_param p = {
> +		.param = I915_CONTEXT_PARAM_GTT_SIZE
> +	};
> +
> +	gem_context_get_param(fd, &p);
> +	return p.value;
> +}
> +
>  static inline bool put_offset(uint64_t ahnd, uint32_t handle)
>  {
>  	if (!ahnd)
> diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
> index 3d5e45870e..137885a88b 100644
> --- a/lib/intel_allocator_simple.c
> +++ b/lib/intel_allocator_simple.c
> @@ -459,9 +459,9 @@ static bool intel_allocator_simple_is_allocated(struct intel_allocator *ial,
>  	return same;
>  }
>  
> -static uint64_t get_size(uint64_t start, uint64_t end)
> +static uint64_t get_size(int fd, uint64_t start, uint64_t end)
>  {
> -	end = end ? end : 1ull << GEN8_GTT_ADDRESS_WIDTH;
> +	end = end ? end : get_gtt_size(fd);

Yes, this definitely requires rework to handle different vm address
width. Take a look to CANONICAL() and DECANONICAL(). I've also noticed
some instructions are not 57-bit (pvc) compatibile so it will be
hard to make this generic.

--
Zbigniew

>  
>  	return end - start;
>  }
> @@ -485,7 +485,7 @@ static bool intel_allocator_simple_reserve(struct intel_allocator *ial,
>  	start = DECANONICAL(start);
>  	end = DECANONICAL(end);
>  	igt_assert(end > start || end == 0);
> -	size = get_size(start, end);
> +	size = get_size(ial->fd, start, end);
>  	igt_assert(start + size <= ials->end);
>  	igt_assert(start >= ials->start);
>  
> @@ -526,7 +526,7 @@ static bool intel_allocator_simple_unreserve(struct intel_allocator *ial,
>  	start = DECANONICAL(start);
>  	end = DECANONICAL(end);
>  	igt_assert(end > start || end == 0);
> -	size = get_size(start, end);
> +	size = get_size(ial->fd, start, end);
>  
>  	entry = igt_map_search_entry(ials->reserved, &start);
>  
> @@ -574,7 +574,7 @@ static bool intel_allocator_simple_is_reserved(struct intel_allocator *ial,
>  	start = DECANONICAL(start);
>  	end = DECANONICAL(end);
>  	igt_assert(end > start || end == 0);
> -	size = get_size(start, end);
> +	size = get_size(ial->fd, start, end);
>  
>  	rec = igt_map_search(ials->reserved, &start);
>  
> -- 
> 2.25.1
> 

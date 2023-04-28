Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B0310E0CC
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:51:31 +0000 (UTC)
Date: Fri, 28 Apr 2023 09:51:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230428075127.wyrzr5pi7cbawlb4@kamilkon-desk1>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
 <20230428062224.21322-10-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428062224.21322-10-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8 09/17] lib/intel_batchbuffer: Update
 intel-bb docs
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

On 2023-04-28 at 08:22:16 +0200, Zbigniew Kempczyński wrote:
> After RANDOM pseudo-allocator was removed and RELOC allocator becomed
> stateful docs stays intact and documents old code. Fix this before
> adding xe code.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_batchbuffer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 99b0b61585..306b7650e9 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -836,7 +836,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
>   *
>   * intel-bb assumes it will work in one of two modes - with relocations or
> - * with using allocator (currently RANDOM and SIMPLE are implemented).
> + * with using allocator (currently RELOC and SIMPLE are implemented).
>   * Some description is required to describe how they maintain the addresses.
>   *
>   * Before entering into each scenarios generic rule is intel-bb keeps objects
> @@ -854,10 +854,10 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   *
>   * This mode is valid only for ppgtt. Addresses are acquired from allocator
>   * and softpinned. intel-bb cache must be then coherent with allocator
> - * (simple is coherent, random is not due to fact we don't keep its state).
> + * (simple is coherent, reloc partially [doesn't support address reservation]).
>   * When we do intel-bb reset with purging cache it has to reacquire addresses
>   * from allocator (allocator should return same address - what is true for
> - * simple allocator and false for random as mentioned before).
> + * simple and reloc allocators).
>   *
>   * If we do reset without purging caches we use addresses from intel-bb cache
>   * during execbuf objects construction.
> @@ -967,7 +967,7 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
>   * @size: size of the batchbuffer
>   * @start: allocator vm start address
>   * @end: allocator vm start address
> - * @allocator_type: allocator type, SIMPLE, RANDOM, ...
> + * @allocator_type: allocator type, SIMPLE, RELOC, ...
>   * @strategy: allocation strategy
>   *
>   * Creates bb with context passed in @ctx, size in @size and allocator type
> -- 
> 2.34.1
> 

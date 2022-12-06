Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E4810E0F1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 15:56:26 +0000 (UTC)
Date: Tue, 6 Dec 2022 16:56:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y49mJhoEu+Szij9n@kamilkon-desk1>
References: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
 <20221205202708.76217-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221205202708.76217-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/5] lib/intel_allocator: Remove
 RANDOM allocator
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

On 2022-12-05 at 21:27:04 +0100, Zbigniew Kempczyński wrote:
> It was added in first allocator series as modification of previously
> existing offset provider. As it is randomizing offsets there's a risk
> they can overlap and during exec we can get ENOSPC in softpin mode.
> Another thing is nobody is using it, so it is good idea to remove it
> and prevent to have incidental failures in case of use.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I do see some value of having random allocations but I agree with
you that in current state it either needs improvement or should be
removed.

Changes lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_allocator.c            |   3 -
>  lib/intel_allocator.h            |   3 +-
>  lib/intel_allocator_random.c     | 191 -------------------------------
>  lib/meson.build                  |   1 -
>  tests/i915/api_intel_allocator.c |   8 +-
>  tests/i915/api_intel_bb.c        |  12 --
>  6 files changed, 3 insertions(+), 215 deletions(-)
>  delete mode 100644 lib/intel_allocator_random.c
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 717d7fc56b..3004f15ae1 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -305,9 +305,6 @@ static struct intel_allocator *intel_allocator_create(int fd,
>  	case INTEL_ALLOCATOR_RELOC:
>  		ial = intel_allocator_reloc_create(fd, start, end);
>  		break;
> -	case INTEL_ALLOCATOR_RANDOM:
> -		ial = intel_allocator_random_create(fd, start, end);
> -		break;
>  	case INTEL_ALLOCATOR_SIMPLE:
>  		ial = intel_allocator_simple_create(fd, start, end,
>  						    allocator_strategy);
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index c237e8e442..28e1165540 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -213,8 +213,7 @@ void intel_allocator_print(uint64_t allocator_handle);
>  #define ALLOC_INVALID_ADDRESS (-1ull)
>  #define INTEL_ALLOCATOR_NONE   0
>  #define INTEL_ALLOCATOR_RELOC  1
> -#define INTEL_ALLOCATOR_RANDOM 2
> -#define INTEL_ALLOCATOR_SIMPLE 3
> +#define INTEL_ALLOCATOR_SIMPLE 2
>  
>  #define GEN8_GTT_ADDRESS_WIDTH 48
>  
> diff --git a/lib/intel_allocator_random.c b/lib/intel_allocator_random.c
> deleted file mode 100644
> index d22f817670..0000000000
> --- a/lib/intel_allocator_random.c
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2021 Intel Corporation
> - */
> -
> -#include <sys/ioctl.h>
> -#include <stdlib.h>
> -#include "igt.h"
> -#include "igt_x86.h"
> -#include "igt_rand.h"
> -#include "intel_allocator.h"
> -
> -struct intel_allocator *
> -intel_allocator_random_create(int fd, uint64_t start, uint64_t end);
> -
> -struct intel_allocator_random {
> -	uint32_t prng;
> -	uint64_t start;
> -	uint64_t end;
> -
> -	/* statistics */
> -	uint64_t allocated_objects;
> -};
> -
> -/* Keep the low 256k clear, for negative deltas */
> -#define BIAS (256 << 10)
> -#define RETRIES 8
> -
> -static void intel_allocator_random_get_address_range(struct intel_allocator *ial,
> -						     uint64_t *startp,
> -						     uint64_t *endp)
> -{
> -	struct intel_allocator_random *ialr = ial->priv;
> -
> -	if (startp)
> -		*startp = ialr->start;
> -
> -	if (endp)
> -		*endp = ialr->end;
> -}
> -
> -static uint64_t intel_allocator_random_alloc(struct intel_allocator *ial,
> -					     uint32_t handle, uint64_t size,
> -					     uint64_t alignment,
> -					     enum allocator_strategy strategy)
> -{
> -	struct intel_allocator_random *ialr = ial->priv;
> -	uint64_t offset;
> -	int cnt = RETRIES;
> -
> -	(void) handle;
> -	(void) strategy;
> -
> -	/* randomize the address, we try to avoid relocations */
> -	do {
> -		offset = hars_petruska_f54_1_random64(&ialr->prng);
> -		/* maximize the chances of fitting in the last iteration */
> -		if (cnt == 1)
> -			offset = 0;
> -
> -		offset %= ialr->end - ialr->start;
> -		offset += ialr->start;
> -		offset = ALIGN(offset, alignment);
> -	} while (offset + size > ialr->end && --cnt);
> -
> -	if (!cnt)
> -		return ALLOC_INVALID_ADDRESS;
> -
> -	ialr->allocated_objects++;
> -
> -	return offset;
> -}
> -
> -static bool intel_allocator_random_free(struct intel_allocator *ial,
> -					uint32_t handle)
> -{
> -	struct intel_allocator_random *ialr = ial->priv;
> -
> -	(void) handle;
> -
> -	ialr->allocated_objects--;
> -
> -	return false;
> -}
> -
> -static bool intel_allocator_random_is_allocated(struct intel_allocator *ial,
> -						uint32_t handle, uint64_t size,
> -						uint64_t offset)
> -{
> -	(void) ial;
> -	(void) handle;
> -	(void) size;
> -	(void) offset;
> -
> -	return false;
> -}
> -
> -static void intel_allocator_random_destroy(struct intel_allocator *ial)
> -{
> -	igt_assert(ial);
> -
> -	free(ial->priv);
> -	free(ial);
> -}
> -
> -static bool intel_allocator_random_reserve(struct intel_allocator *ial,
> -					   uint32_t handle,
> -					   uint64_t start, uint64_t end)
> -{
> -	(void) ial;
> -	(void) handle;
> -	(void) start;
> -	(void) end;
> -
> -	return false;
> -}
> -
> -static bool intel_allocator_random_unreserve(struct intel_allocator *ial,
> -					     uint32_t handle,
> -					     uint64_t start, uint64_t end)
> -{
> -	(void) ial;
> -	(void) handle;
> -	(void) start;
> -	(void) end;
> -
> -	return false;
> -}
> -
> -static bool intel_allocator_random_is_reserved(struct intel_allocator *ial,
> -					       uint64_t start, uint64_t end)
> -{
> -	(void) ial;
> -	(void) start;
> -	(void) end;
> -
> -	return false;
> -}
> -
> -static void intel_allocator_random_print(struct intel_allocator *ial, bool full)
> -{
> -	struct intel_allocator_random *ialr = ial->priv;
> -
> -	(void) full;
> -
> -	igt_info("<ial: %p, fd: %d> allocated objects: %" PRIx64 "\n",
> -		 ial, ial->fd, ialr->allocated_objects);
> -}
> -
> -static bool intel_allocator_random_is_empty(struct intel_allocator *ial)
> -{
> -	struct intel_allocator_random *ialr = ial->priv;
> -
> -	return !ialr->allocated_objects;
> -}
> -
> -struct intel_allocator *
> -intel_allocator_random_create(int fd, uint64_t start, uint64_t end)
> -{
> -	struct intel_allocator *ial;
> -	struct intel_allocator_random *ialr;
> -
> -	igt_debug("Using random allocator\n");
> -	ial = calloc(1, sizeof(*ial));
> -	igt_assert(ial);
> -
> -	ial->fd = fd;
> -	ial->get_address_range = intel_allocator_random_get_address_range;
> -	ial->alloc = intel_allocator_random_alloc;
> -	ial->free = intel_allocator_random_free;
> -	ial->is_allocated = intel_allocator_random_is_allocated;
> -	ial->reserve = intel_allocator_random_reserve;
> -	ial->unreserve = intel_allocator_random_unreserve;
> -	ial->is_reserved = intel_allocator_random_is_reserved;
> -	ial->destroy = intel_allocator_random_destroy;
> -	ial->print = intel_allocator_random_print;
> -	ial->is_empty = intel_allocator_random_is_empty;
> -
> -	ialr = ial->priv = calloc(1, sizeof(*ialr));
> -	igt_assert(ial->priv);
> -	ialr->prng = (uint32_t) to_user_pointer(ial);
> -
> -	start = max_t(uint64_t, start, BIAS);
> -	igt_assert(start < end);
> -	ialr->start = start;
> -	ialr->end = end;
> -
> -	ialr->allocated_objects = 0;
> -
> -	return ial;
> -}
> diff --git a/lib/meson.build b/lib/meson.build
> index 8ae9fe13d1..2c6ebce7b6 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -47,7 +47,6 @@ lib_sources = [
>  	'instdone.c',
>  	'intel_allocator.c',
>  	'intel_allocator_msgchannel.c',
> -	'intel_allocator_random.c',
>  	'intel_allocator_reloc.c',
>  	'intel_allocator_simple.c',
>  	'intel_batchbuffer.c',
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index a7929e9b13..098b9e6960 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -179,9 +179,6 @@ static void basic_alloc(int fd, int cnt, uint8_t type)
>  	for (i = 0; i < cnt; i++) {
>  		igt_progress("check overlapping: ", i, cnt);
>  
> -		if (type == INTEL_ALLOCATOR_RANDOM)
> -			continue;
> -
>  		for (j = 0; j < cnt; j++) {
>  			if (j == i)
>  				continue;
> @@ -307,8 +304,8 @@ static void parallel_one(int fd, uint8_t type)
>  
>  	/* Check if all objects are allocated */
>  	for (i = 0; i < count; i++) {
> -		/* Reloc + random allocators don't have state. */
> -		if (type == INTEL_ALLOCATOR_RELOC || type == INTEL_ALLOCATOR_RANDOM)
> +		/* Reloc don't have state. */
> +		if (type == INTEL_ALLOCATOR_RELOC)
>  			break;
>  
>  		igt_assert_eq(offsets[i],
> @@ -752,7 +749,6 @@ struct allocators {
>  } als[] = {
>  	{"simple", INTEL_ALLOCATOR_SIMPLE},
>  	{"reloc",  INTEL_ALLOCATOR_RELOC},
> -	{"random", INTEL_ALLOCATOR_RANDOM},
>  	{NULL, 0},
>  };
>  
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 4c8ca6ab36..980906f4ed 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -1620,24 +1620,12 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("object-noreloc-keep-cache-simple")
>  		object_noreloc(bops, KEEP_CACHE, INTEL_ALLOCATOR_SIMPLE);
>  
> -	igt_subtest("object-noreloc-purge-cache-random")
> -		object_noreloc(bops, PURGE_CACHE, INTEL_ALLOCATOR_RANDOM);
> -
> -	igt_subtest("object-noreloc-keep-cache-random")
> -		object_noreloc(bops, KEEP_CACHE, INTEL_ALLOCATOR_RANDOM);
> -
>  	igt_subtest("blit-reloc-purge-cache")
>  		blit(bops, RELOC, PURGE_CACHE, INTEL_ALLOCATOR_SIMPLE);
>  
>  	igt_subtest("blit-reloc-keep-cache")
>  		blit(bops, RELOC, KEEP_CACHE, INTEL_ALLOCATOR_SIMPLE);
>  
> -	igt_subtest("blit-noreloc-keep-cache-random")
> -		blit(bops, NORELOC, KEEP_CACHE, INTEL_ALLOCATOR_RANDOM);
> -
> -	igt_subtest("blit-noreloc-purge-cache-random")
> -		blit(bops, NORELOC, PURGE_CACHE, INTEL_ALLOCATOR_RANDOM);
> -
>  	igt_subtest("blit-noreloc-keep-cache")
>  		blit(bops, NORELOC, KEEP_CACHE, INTEL_ALLOCATOR_SIMPLE);
>  
> -- 
> 2.34.1
> 

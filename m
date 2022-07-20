Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008811A133
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 11:20:59 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:20:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YtflF9TyQlM7sSNy@kamilkon-desk1>
References: <20220719115141.35236-1-zbigniew.kempczynski@intel.com>
 <20220719115141.35236-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719115141.35236-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/perf_pmu: Add second
 store dword for looping
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

Hi Zbigniew,

On 2022-07-19 at 13:51:41 +0200, Zbigniew Kempczyński wrote:
> On Broadwell/Braswell we observe semaphore wait isn't starting sometimes.
> It's hard to say what's the main reason of this behavior - it happens
> rare (each 2-3 months). To find out is this delayed write lets add
> additional store dword for loop condition. Add also some assertions
> to catch unexpected sw/hw behavior.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
> 
> v2: Add timeout to break the loop
> ---
>  tests/i915/perf_pmu.c | 42 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 39e9fc5fef..9b951df125 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -812,6 +812,12 @@ create_sema(int gem_fd, uint64_t ahnd,
>  		0,
>  		1,
>  
> +		/* Separate write for loop */
> +		MI_STORE_DWORD_IMM,
> +		0,
> +		0,
> +		2,
> +

imho this should be after semaphore, I see no point adding this
right after first write and then waiting on map[1] == 2. Maybe
it is worth to add this after semaphore and wait on
map[0] == 1 ? Or when one write fails we can run second round
with two consecutive writes ?

>  		/* Wait until the semaphore value is set to 0 [by caller] */

I do not see in code "map[0] = 0" ?

>  		MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_NEQ_SDD,
>  		1,
> @@ -827,17 +833,22 @@ create_sema(int gem_fd, uint64_t ahnd,
>  	handle = gem_create(gem_fd, 4096);
>  	*poffset = get_offset(ahnd, handle, 4096, 0);
>  
> -	memset(reloc, 0, 2 * sizeof(*reloc));
> +	memset(reloc, 0, 3 * sizeof(*reloc));
>  	reloc[0].target_handle = handle;
>  	reloc[0].offset = 64 + 1 * sizeof(uint32_t);
>  	reloc[1].target_handle = handle;
> -	reloc[1].offset = 64 + 6 * sizeof(uint32_t);
> +	reloc[1].offset = 64 + 5 * sizeof(uint32_t);
> +	reloc[1].delta = 4;
> +	reloc[2].target_handle = handle;
> +	reloc[2].offset = 64 + 10 * sizeof(uint32_t);
>  
>  	if (ahnd) {
>  		cs[1] = *poffset;
>  		cs[2] = *poffset >> 32;
> -		cs[6] = *poffset;
> -		cs[7] = *poffset >> 32;
> +		cs[5] = *poffset + 4;
> +		cs[6] = (*poffset + 4) >> 32;
> +		cs[10] = *poffset;
> +		cs[11] = *poffset >> 32;
>  	}
>  
>  	gem_write(gem_fd, handle, 64, cs, sizeof(cs));
> @@ -856,10 +867,10 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
>  	};
>  	uint64_t total, sema, busy;
>  	uint64_t start[2], val[2];
> -	struct drm_i915_gem_relocation_entry reloc[2];
> +	struct drm_i915_gem_relocation_entry reloc[3];
>  	struct drm_i915_gem_exec_object2 obj = {
>  		.handle = create_sema(gem_fd, ahnd, reloc, &obj.offset),
> -		.relocation_count = !ahnd ? 2 : 0,
> +		.relocation_count = !ahnd ? 3 : 0,
>  		.relocs_ptr = to_user_pointer(reloc),
>  		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
>  	};
> @@ -872,19 +883,32 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
>  	};
>  	igt_spin_t *spin;
>  	uint32_t *map;
> +	struct timespec tv = {};
> +	int timeout = 3;
>  
>  	/* Time spent being busy includes time waiting on semaphores */
>  	igt_assert(busy_pct >= sema_pct);
>  
>  	gem_quiescent_gpu(gem_fd);
>  
> -	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
> +	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_READ | PROT_WRITE);
>  	gem_execbuf(gem_fd, &eb);
> +	igt_assert(gem_bo_busy(gem_fd, obj.handle));

This assert here prevents your warnings below to happen, maybe
just store this as boolean for later ?

--
Kamil

>  	spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
>  
> -	/* Wait until the batch is executed and the semaphore is busy-waiting */
> -	while (!READ_ONCE(*map) && gem_bo_busy(gem_fd, obj.handle))
> +	/*
> +	 * Wait until the batch is executed and the semaphore is busy-waiting.
> +	 * Also stop on timeout.
> +	 */
> +	igt_nsec_elapsed(&tv);
> +	while (READ_ONCE(map[1]) != 2 && gem_bo_busy(gem_fd, obj.handle) &&
> +	       igt_seconds_elapsed(&tv) < timeout)
>  		;
> +	if (igt_seconds_elapsed(&tv) >= timeout)
> +		igt_warn("timeout: [%u/%u]\n", igt_seconds_elapsed(&tv), timeout);
> +	if (!gem_bo_busy(gem_fd, obj.handle))
> +		igt_warn("Bo != busy, map[0] = %u, map[1] = %u\n", map[0], map[1]);
> +	igt_assert(map[0] == 1);
>  	igt_assert(gem_bo_busy(gem_fd, obj.handle));
>  	gem_close(gem_fd, obj.handle);
>  
> -- 
> 2.34.1
> 

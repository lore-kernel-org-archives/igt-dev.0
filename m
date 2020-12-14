Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201214105123.542518-1-chris@chris-wilson.co.uk>
 <20201214105123.542518-3-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <db3f4d96-1143-168b-dfa0-f49fd856832d@linux.intel.com>
Date: Mon, 14 Dec 2020 15:57:59 +0000
MIME-Version: 1.0
In-Reply-To: <20201214105123.542518-3-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] i915/gem_shrink: Refactor
 allocation sizing based on available memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 14/12/2020 10:51, Chris Wilson wrote:
> Refactor the allocation such that we utilise just enough memory pressure
> to invoke the shrinker, and just enough processes to spread across the
> CPUs and contend on the shrinker.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/gem_shrink.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index 023db8c56..e8a814fe6 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -426,6 +426,7 @@ igt_main
>   	int num_processes = 0;
>   
>   	igt_fixture {
> +		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>   		uint64_t mem_size = intel_get_total_ram_mb();
>   		int fd;
>   
> @@ -434,16 +435,16 @@ igt_main
>   
>   		/*
>   		 * Spawn enough processes to use all memory, but each only
> -		 * uses half the available mappable aperture ~128MiB.
> +		 * uses half of the available per-cpu memory.
>   		 * Individually the processes would be ok, but en masse
>   		 * we expect the shrinker to start purging objects,
>   		 * and possibly fail.
>   		 */
> -		alloc_size = gem_mappable_aperture_size(fd) / 2;
> -		num_processes = 1 + (mem_size / (alloc_size >> 20));
> +		alloc_size = (mem_size + ncpus - 1) / ncpus / 2;

Div round up with thousands divided by small integers okay, safe on very 
old smp boxes. :)

> +		num_processes = ncpus + (mem_size / alloc_size);

Hm, now what does this add up to..

ncpus + mem_size / (mem_size / ncpus / 2) = ... ?

Regards,

Tvrtko

>   
> -		igt_info("Using %d processes and %'lluMiB per process\n",
> -			 num_processes, (long long)(alloc_size >> 20));
> +		igt_info("Using %d processes and %'"PRIu64"MiB per process\n",
> +			 num_processes, alloc_size);
>   
>   		intel_require_memory(num_processes, alloc_size,
>   				     CHECK_SWAP | CHECK_RAM);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

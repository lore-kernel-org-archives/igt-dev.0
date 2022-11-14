Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <8926f9d4-e88d-fdb0-1b2d-ec51ae4a3c84@intel.com>
Date: Mon, 14 Nov 2022 12:07:14 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20221107120426.22849-1-matthew.auld@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20221107120426.22849-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915/gem_mmap_offset:
 use cpu_size in always_clear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 07.11.2022 13:04, Matthew Auld wrote:
> If we can't fit the buffer in the CPU visible portion of lmem, then the
> kernel will be unable to migrate the pages on fault on small-bar
> systems.  Note that this doesn't restrict where the pages are allocated,
> but should just ensure we don't SIGBUS, if we need to migrate the pages.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7382
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/i915/gem_mmap_offset.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 0adeb0b5..b27920de 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -750,7 +750,7 @@ static void always_clear(int i915, const struct gem_memory_region *r, int timeou
>   	struct thread_clear arg = {
>   		.i915 = i915,
>   		.region = r->ci,
> -		.max = r->size / 2 >> 12, /* in pages */
> +		.max = r->cpu_size / 2 >> 12, /* in pages */
>   		.timeout = timeout,
>   	};
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);

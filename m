Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <c2087eac-b2ae-e26a-4431-19212e078e9e@linux.intel.com>
Date: Tue, 28 Jun 2022 12:24:25 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220627161004.70153-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220627161004.70153-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/i915/gem_eio: fix uaf
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The series is Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 6/27/2022 6:10 PM, Matthew Auld wrote:
> ../tests/i915/gem_eio.c:277:20: warning: pointer ‘ctx’ used after ‘free’ [-Wuse-after-free]
>    277 |         igt_assert(igt_sysfs_printf(ctx->debugfs, "i915_drop_caches",
> ../lib/igt_core.h:667:20: note: in definition of macro ‘igt_assert’
>    667 |         do { if (!(expr)) \
>        |                    ^~~~
> ../tests/i915/gem_eio.c:274:9: note: call to ‘free’ here
>    274 |         free(ctx);
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/i915/gem_eio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 913a21f9..6cbae6eb 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -270,11 +270,11 @@ static void hang_handler(union sigval arg)
>   		  igt_nsec_elapsed(&ctx->delay) / 1000.0);
>   
>   	igt_assert_eq(timer_delete(ctx->timer), 0);
> -	free(ctx);
>   
>   	/* flush any excess work before we start timing our reset */
>   	igt_assert(igt_sysfs_printf(ctx->debugfs, "i915_drop_caches",
>   				    "%d", DROP_RCU));
> +	free(ctx);
>   
>   	igt_nsec_elapsed(ts);
>   	igt_assert(igt_sysfs_printf(dir, "i915_wedged", "%llu", -1ull));

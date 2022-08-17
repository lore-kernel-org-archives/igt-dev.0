Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 17 Aug 2022 14:55:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220817145554.2602f9d7@maurocar-mobl2>
In-Reply-To: <20220812095346.45379-2-janusz.krzysztofik@linux.intel.com>
References: <20220812095346.45379-1-janusz.krzysztofik@linux.intel.com>
 <20220812095346.45379-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 2/3]
 tests/gem_exec_fence: Exclude 0 from use in store batches
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.carvalho.chehab@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 12 Aug 2022 11:53:45 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> When i = 0, condition out[i] == i will be true even if a batch supposed
> to store i in out[i] fails.  Don't use i = 0 in batches that store values
> in out[i].
> 
> v2: still check for out[0] == 0 (Chris)
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>


LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/i915/gem_exec_fence.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 048870053a..78d83460f7 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -334,6 +334,8 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
>  		if (!gem_class_can_store_dword(fd, e2->class))
>  			continue;
>  
> +		i++;
> +
>  		if (flags & NONBLOCK) {
>  			igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
>  				       scratch, scratch_offset, i, i);
> @@ -345,8 +347,6 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
>  				put_ahnd(ahnd);
>  			}
>  		}
> -
> -		i++;
>  	}
>  
>  	igt_spin_busywait_until_started(spin);
> @@ -356,7 +356,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
>  	if ((flags & HANG) == 0) {
>  		/* Check for invalidly completing the task early */
>  		igt_assert(fence_busy(spin->out_fence));
> -		for (int n = 0; n < i; n++)
> +		for (int n = 0; n <= i; n++)
>  			igt_assert_eq_u32(out[n], 0);
>  
>  		igt_spin_end(spin);
> @@ -366,8 +366,11 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
>  
>  	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
>  	igt_assert(!fence_busy(spin->out_fence));
> -	while ((flags & HANG) == 0 && i--)
> -		igt_assert_eq_u32(out[i], i);
> +	if ((flags & HANG) == 0) {
> +		do
> +			igt_assert_eq_u32(out[i], i);
> +		while (i--);
> +	}
>  	munmap(out, 4096);
>  
>  	igt_spin_free(fd, spin);

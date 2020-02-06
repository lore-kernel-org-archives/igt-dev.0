Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20200206100639.2386558-1-chris@chris-wilson.co.uk>
 <20200206100639.2386558-2-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <e35a1725-55f7-2587-9131-5fdebc23cd84@intel.com>
Date: Thu, 6 Feb 2020 07:55:43 -0800
MIME-Version: 1.0
In-Reply-To: <20200206100639.2386558-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t 2/2] i915/gem_ctx_sseu: Extend the
 mmapped parameters test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 06/02/20 02:06, Chris Wilson wrote:
> The current implementation of the test only maps the arguments in gtt,
> but we have similar problems arising from any of our own custom
> pagefault handlers.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>

For the series:

Reviewed-by: Antonio Argenziano <antonio.argenziano@intel.com>

> ---
>   tests/i915/gem_ctx_sseu.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
> index 38dc584bc..d558c8baa 100644
> --- a/tests/i915/gem_ctx_sseu.c
> +++ b/tests/i915/gem_ctx_sseu.c
> @@ -364,7 +364,7 @@ test_invalid_args(int fd)
>    * Verify that ggtt mapped area can be used as the sseu pointer.
>    */
>   static void
> -test_ggtt_args(int fd)
> +test_mmapped_args(int fd, const struct mmap_offset *t)
>   {
>   	struct drm_i915_gem_context_param_sseu *sseu;
>   	struct drm_i915_gem_context_param arg = {
> @@ -372,17 +372,19 @@ test_ggtt_args(int fd)
>   		.ctx_id = gem_context_create(fd),
>   		.size = sizeof(*sseu),
>   	};
> +	void *ptr;
>   	uint32_t bo;
>   
>   	bo = gem_create(fd, 4096);
> -	arg.value = to_user_pointer(gem_mmap__gtt(fd, bo, 4096,
> -						  PROT_READ | PROT_WRITE));
> +	ptr = __gem_mmap_offset(fd, bo, 0, 4096, PROT_WRITE, t->type);
> +	gem_close(fd, bo);
> +	igt_require(ptr);
>   
> +	arg.value = to_user_pointer(ptr);
>   	igt_assert_eq(__gem_context_get_param(fd, &arg), 0);
>   	igt_assert_eq(__gem_context_set_param(fd, &arg), 0);
>   
>   	munmap((void *)(uintptr_t)arg.value, 4096);
> -	gem_close(fd, bo);
>   	gem_context_destroy(fd, arg.ctx_id);
>   }
>   
> @@ -528,8 +530,12 @@ igt_main
>   		igt_subtest("invalid-sseu")
>   			test_invalid_sseu(fd);
>   
> -		igt_subtest("ggtt-args")
> -			test_ggtt_args(fd);
> +		igt_subtest_with_dynamic("mmap-args") {
> +			for_each_mmap_offset_type(t) {
> +				igt_dynamic_f("%s", t->name)
> +					test_mmapped_args(fd, t);
> +			}
> +		}
>   
>   		igt_subtest("engines")
>   			test_engines(fd);
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

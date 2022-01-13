Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 12:18:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113201854.GA28094@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-9-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-9-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v3 i-g-t 08/15]
 tests/i915/i915_hangman: Add alive-ness test after error capture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 11:59:40AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Added a an extra step to the i915_hangman tests to check that the
> system is still alive after the hang and recovery. This submits a
> simple batch to each engine which does a write to memory and checks
> that the write occurred.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Looks good to me but can't help but think this could be a library
function as I really doubt this is the only test where at the end of the
test we want to verify all engines are alive. Something to keep an eye /
do in a follow up.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 59 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 5a0c9497c..918418760 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -48,8 +48,57 @@
>  static int device = -1;
>  static int sysfs = -1;
>  
> +#define OFFSET_ALIVE	10
> +
>  IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
>  
> +static void check_alive(void)
> +{
> +	const struct intel_execution_engine2 *engine;
> +	const intel_ctx_t *ctx;
> +	uint32_t scratch, *out;
> +	int fd, i = 0;
> +	uint64_t ahnd, scratch_addr;
> +
> +	fd = drm_open_driver(DRIVER_INTEL);
> +	igt_require(gem_class_can_store_dword(fd, 0));
> +
> +	ctx = intel_ctx_create_all_physical(fd);
> +	ahnd = get_reloc_ahnd(fd, ctx->id);
> +	scratch = gem_create(fd, 4096);
> +	scratch_addr = get_offset(ahnd, scratch, 4096, 0);
> +	out = gem_mmap__wc(fd, scratch, 0, 4096, PROT_WRITE);
> +	gem_set_domain(fd, scratch,
> +			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +
> +	for_each_physical_engine(fd, engine) {
> +		igt_assert_eq_u32(out[i + OFFSET_ALIVE], 0);
> +		i++;
> +	}
> +
> +	i = 0;
> +	for_each_ctx_engine(fd, ctx, engine) {
> +		if (!gem_class_can_store_dword(fd, engine->class))
> +			continue;
> +
> +		/* +OFFSET_ALIVE to ensure engine zero doesn't get a false negative */
> +		igt_store_word(fd, ahnd, ctx, engine, -1, scratch, scratch_addr,
> +			       i + OFFSET_ALIVE, i + OFFSET_ALIVE);
> +		i++;
> +	}
> +
> +	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
> +
> +	while (i--)
> +		igt_assert_eq_u32(out[i + OFFSET_ALIVE], i + OFFSET_ALIVE);
> +
> +	munmap(out, 4096);
> +	gem_close(fd, scratch);
> +	put_ahnd(ahnd);
> +	intel_ctx_destroy(fd, ctx);
> +	close(fd);
> +}
> +
>  static bool has_error_state(int dir)
>  {
>  	bool result;
> @@ -231,6 +280,8 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
>  	check_error_state(e->name, offset, batch);
>  	munmap(batch, 4096);
>  	put_ahnd(ahnd);
> +
> +	check_alive();
>  }
>  
>  static void
> @@ -289,6 +340,8 @@ test_engine_hang(const intel_ctx_t *ctx,
>  		put_ahnd(ahndN);
>  	}
>  	put_ahnd(ahnd);
> +
> +	check_alive();
>  }
>  
>  static int hang_count;
> @@ -321,6 +374,8 @@ static void test_hang_detector(const intel_ctx_t *ctx,
>  
>  	/* Did it work? */
>  	igt_assert(hang_count == 1);
> +
> +	check_alive();
>  }
>  
>  /* This test covers the case where we end up in an uninitialised area of the
> @@ -356,6 +411,8 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
>  		igt_force_gpu_reset(device);
>  		igt_assert_f(0, "unterminated batch did not trigger a hang!\n");
>  	}
> +
> +	check_alive();
>  }
>  
>  static void do_tests(const char *name, const char *prefix,
> @@ -433,6 +490,8 @@ igt_main
>  		igt_assert(sysfs != -1);
>  
>  		igt_require(has_error_state(sysfs));
> +
> +		gem_require_mmap_wc(device);
>  	}
>  
>  	igt_describe("Basic error capture");
> -- 
> 2.25.1
> 

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A2F10E2B5
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 15:04:35 +0000 (UTC)
Date: Thu, 27 Apr 2023 17:04:17 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230427170417.53901fb2@maurocar-mobl2>
In-Reply-To: <20230420182440.49442-3-kamil.konieczny@linux.intel.com>
References: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
 <20230420182440.49442-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/i915_hangman: make device var
 local
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 20 Apr 2023 20:24:39 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Global device variable make it hard to use with multiGPU tests,
> so make it local.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/i915/i915_hangman.c | 71 ++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 274a0ede1..d76d0a037 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -45,8 +45,6 @@
>  #define I915_PARAM_CMD_PARSER_VERSION       28
>  #endif
>  
> -static int device = -1;
> -
>  #define OFFSET_ALIVE	10
>  
>  IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
> @@ -146,7 +144,7 @@ static void clear_error_state(int sysfs)
>  	igt_sysfs_write(sysfs, "error", "", 1);
>  }
>  
> -static void test_error_state_basic(int i915, int sysfs)
> +static void test_error_state_basic(int device, int sysfs)
>  {
>  	int fd;
>  
> @@ -175,7 +173,7 @@ static FILE *open_error(int sysfs)
>  	return fdopen(fd, "r");
>  }
>  
> -static bool uses_cmd_parser(void)
> +static bool uses_cmd_parser(int device)
>  {
>  	int parser_version = 0;
>  	drm_i915_getparam_t gp;
> @@ -187,11 +185,12 @@ static bool uses_cmd_parser(void)
>  	return parser_version > 0;
>  }
>  
> -static void check_error_state(int sysfs, const char *expected_ring_name,
> +static void check_error_state(int device, int sysfs,
> +			      const char *expected_ring_name,
>  			      uint64_t expected_offset,
>  			      const uint32_t *batch)
>  {
> -	bool cmd_parser = uses_cmd_parser();
> +	bool cmd_parser = uses_cmd_parser(device);
>  	FILE *file = open_error(sysfs);
>  	char *line = NULL;
>  	size_t line_size = 0;
> @@ -258,7 +257,8 @@ static void check_error_state(int sysfs, const char *expected_ring_name,
>  	igt_assert(found);
>  }
>  
> -static void test_error_state_capture(int sysfs, const intel_ctx_t *ctx,
> +static void test_error_state_capture(int device, int sysfs,
> +				     const intel_ctx_t *ctx,
>  				     const struct intel_execution_engine2 *e)
>  {
>  	uint32_t *batch;
> @@ -277,7 +277,7 @@ static void test_error_state_capture(int sysfs, const intel_ctx_t *ctx,
>  
>  	igt_post_hang_ring(device, hang);
>  
> -	check_error_state(sysfs, e->name, offset, batch);
> +	check_error_state(device, sysfs, e->name, offset, batch);
>  	munmap(batch, 4096);
>  	put_ahnd(ahnd);
>  
> @@ -310,7 +310,7 @@ static void chk_err(int *dst, int err, int expected)
>  #define ERR_FENCE_STAT 4
>  
>  static void
> -test_engine_hang(const intel_ctx_t *ctx,
> +test_engine_hang(int device, const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
>  {
>  	const struct intel_execution_engine2 *other;
> @@ -392,7 +392,7 @@ static void sig_io(int sig)
>  	hang_count++;
>  }
>  
> -static void test_hang_detector(const intel_ctx_t *ctx,
> +static void test_hang_detector(int device, const intel_ctx_t *ctx,
>  			       const struct intel_execution_engine2 *e)
>  {
>  	igt_hang_t hang;
> @@ -425,7 +425,7 @@ static void test_hang_detector(const intel_ctx_t *ctx,
>   * case and it takes a lot more time to wrap, so the acthd can potentially keep
>   * increasing for a long time
>   */
> -static void hangcheck_unterminated(const intel_ctx_t *ctx)
> +static void hangcheck_unterminated(int device, const intel_ctx_t *ctx)
>  {
>  	/* timeout needs to be greater than ~5*hangcheck */
>  	int64_t timeout_ns = 100ull * NSEC_PER_SEC; /* 100 seconds */
> @@ -456,7 +456,7 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
>  	check_alive();
>  }
>  
> -static void do_tests(int sysfs, const char *name, const char *prefix,
> +static void do_tests(int device, int sysfs, const char *name, const char *prefix,
>  		     const intel_ctx_t *ctx)
>  {
>  	const struct intel_execution_engine2 *e;
> @@ -468,7 +468,7 @@ static void do_tests(int sysfs, const char *name, const char *prefix,
>  	igt_subtest_with_dynamic(buff) {
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_error_state_capture(sysfs, ctx, e);
> +				test_error_state_capture(device, sysfs, ctx, e);
>  		}
>  	}
>  
> @@ -489,7 +489,7 @@ static void do_tests(int sysfs, const char *name, const char *prefix,
>  
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_engine_hang(ctx, e, 0);
> +				test_engine_hang(device, ctx, e, 0);
>  		}
>  	}
>  
> @@ -509,7 +509,7 @@ static void do_tests(int sysfs, const char *name, const char *prefix,
>  
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
> +				test_engine_hang(device, ctx, e, IGT_SPIN_INVALID_CS);
>  		}
>  	}
>  }
> @@ -521,68 +521,69 @@ igt_main
>  	struct gem_engine_properties saved_params[GEM_MAX_ENGINES];
>  	int num_engines = 0;
>  	int sysfs_fd = -1;
> +	int i915 = -1;
>  
>  	igt_fixture {
>  		const struct intel_execution_engine2 *e;
>  
> -		device = drm_open_driver(DRIVER_INTEL);
> -		igt_require_gem(device);
> +		i915 = drm_open_driver(DRIVER_INTEL);
> +		igt_require_gem(i915);
>  
> -		ctx = intel_ctx_create_all_physical(device);
> +		ctx = intel_ctx_create_all_physical(i915);
>  
> -		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
> +		hang = igt_allow_hang(i915, ctx->id, HANG_ALLOW_CAPTURE);
>  
> -		sysfs_fd = igt_sysfs_open(device);
> +		sysfs_fd = igt_sysfs_open(i915);
>  		igt_assert(sysfs_fd != -1);
>  
>  		igt_require(has_error_state(sysfs_fd));
>  
> -		gem_require_mmap_device_coherent(device);
> +		gem_require_mmap_device_coherent(i915);
>  
> -		for_each_physical_engine(device, e) {
> +		for_each_physical_engine(i915, e) {
>  			saved_params[num_engines].engine = e;
>  			saved_params[num_engines].preempt_timeout = 500;
>  			saved_params[num_engines].heartbeat_interval = 1000;
> -			gem_engine_properties_configure(device, saved_params + num_engines++);
> +			gem_engine_properties_configure(i915, saved_params + num_engines++);
>  		}
>  	}
>  
>  	igt_describe("Basic error capture");
>  	igt_subtest("error-state-basic")
> -		test_error_state_basic(sysfs_fd, device);
> +		test_error_state_basic(i915, sysfs_fd);
>  
>  	igt_describe("Check that executing unintialised memory causes a hang");
>  	igt_subtest("hangcheck-unterminated")
> -		hangcheck_unterminated(ctx);
> +		hangcheck_unterminated(i915, ctx);
>  
>  	igt_describe("Check that hang detector works");
>  	igt_subtest_with_dynamic("detector") {
>  		const struct intel_execution_engine2 *e;
>  
> -		for_each_ctx_engine(device, ctx, e) {
> +		for_each_ctx_engine(i915, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_hang_detector(ctx, e);
> +				test_hang_detector(i915, ctx, e);
>  		}
>  	}
>  
> -	do_tests(sysfs_fd, "GT", "gt", ctx);
> +	do_tests(i915, sysfs_fd, "GT", "gt", ctx);
>  
>  	igt_fixture {
> -		igt_disallow_hang(device, hang);
> +		igt_disallow_hang(i915, hang);
>  
> -		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
> +		hang = igt_allow_hang(i915, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
>  	}
>  
> -	do_tests(sysfs_fd, "engine", "engine", ctx);
> +	do_tests(i915, sysfs_fd, "engine", "engine", ctx);
>  
>  	igt_fixture {
>  		int i;
>  
>  		for (i = 0; i < num_engines; i++)
> -			gem_engine_properties_restore(device, saved_params + i);
> +			gem_engine_properties_restore(i915, saved_params + i);
>  
> -		igt_disallow_hang(device, hang);
> -		intel_ctx_destroy(device, ctx);
> -		close(device);
> +		igt_disallow_hang(i915, hang);
> +		intel_ctx_destroy(i915, ctx);
> +		close(i915);
>  	}
>  }

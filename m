Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200929091459.509146-1-chris@chris-wilson.co.uk>
References: <20200928220027.417167-1-chris@chris-wilson.co.uk>
 <20200929091459.509146-1-chris@chris-wilson.co.uk>
Date: Tue, 29 Sep 2020 16:19:30 +0300
Message-ID: <87tuvgyb31.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gen9_exec_parse: Check parsing
 of large objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Simply check that we support parsing of batches as large as the uAPI
> allows.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
> Try a few intermediate object sizes since CI machines do not have enough
> memory to reach the upper bounds of the uAPI.
> ---
>  tests/i915/gen9_exec_parse.c | 47 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
> index 8cd82f568..f735e7e1c 100644
> --- a/tests/i915/gen9_exec_parse.c
> +++ b/tests/i915/gen9_exec_parse.c
> @@ -566,6 +566,50 @@ static void test_bb_start(const int i915, const uint32_t handle, int test)
>  	gem_close(i915, target_bo);
>  }
>  
> +static void test_bb_large(int i915)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	static const uint32_t sizes[] = {
> +		(1ull << 30) - 4096,
> +		(1ull << 30) + 4096,
> +		(2ull << 30) - 4096,
> +		(2ull << 30) + 4096,
> +		(3ull << 30) - 4096,
> +		(3ull << 30) + 4096,
> +		(4ull << 30) - 4096,
> +	};
> +	struct drm_i915_gem_exec_object2 obj = {};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = I915_EXEC_BLT,
> +	};
> +	uint64_t required, total;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
> +		if (!__intel_check_memory(2, sizes[i], CHECK_RAM,
> +					  &required, &total))
> +			break;
> +
> +		igt_debug("Using object size %#x\n", sizes[i]);
> +		obj.handle = gem_create(i915, sizes[i]),
> +		gem_write(i915, obj.handle, sizes[i] - 64, &bbe, sizeof(bbe));
> +
> +		execbuf.batch_start_offset = 0;
> +		igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
> +
> +		execbuf.batch_start_offset = sizes[i] - 64;
> +		igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
> +
> +		gem_close(i915, obj.handle);
> +	}
> +
> +	igt_require_f(i > 0 && sizes[i - 1] > 1ull << 31,
> +		      "Insufficient free memory, require at least %'"PRIu64"MiB but only have %'"PRIu64"MiB available",
> +		      required >> 20, total >> 20);
> +}
> +
>  static void test_bb_chained(const int i915, const uint32_t handle)
>  {
>  	const uint32_t batch[] = {
> @@ -1053,6 +1097,9 @@ igt_main
>  	igt_subtest("bb-start-far")
>  		test_bb_start(i915, handle, BB_START_FAR);
>  
> +	igt_subtest("bb-large")
> +		test_bb_large(i915);
> +
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		gem_close(i915, handle);
> -- 
> 2.28.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

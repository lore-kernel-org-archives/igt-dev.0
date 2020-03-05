Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200304205243.106854-1-matthew.auld@intel.com>
References: <20200304205243.106854-1-matthew.auld@intel.com>
Date: Thu, 05 Mar 2020 14:05:39 +0200
Message-ID: <87wo7z3t2k.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] i915/gem_exec_params: add
 test_invalid_batch_start
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
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Matthew Auld <matthew.auld@intel.com> writes:

> Sanity check that kernel rejects too large batch_start_offset.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_exec_params.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index cf7ea306..afc8d2c7 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -268,6 +268,23 @@ static void mmapped(int i915)
>  	gem_close(i915, buf);
>  }
>  
> +static void test_invalid_batch_start(int fd)
> +{
> +	struct drm_i915_gem_exec_object2 exec = {
> +		.handle = batch_create(fd),
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&exec),
> +		.buffer_count = 1,
> +		.batch_start_offset = 4096, /* space jump */

If we could get batch size from the handle would be
more documentative.

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> +	};
> +
> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> +
> +	gem_sync(fd, exec.handle);
> +	gem_close(fd, exec.handle);
> +}
> +
>  struct drm_i915_gem_execbuffer2 execbuf;
>  struct drm_i915_gem_exec_object2 gem_exec[1];
>  uint32_t batch[2] = {MI_BATCH_BUFFER_END};
> @@ -507,6 +524,9 @@ igt_main
>  	igt_subtest("batch-first")
>  		test_batch_first(fd);
>  
> +	igt_subtest("invalid-batch-start-offset")
> +		test_invalid_batch_start(fd);
> +
>  #define DIRT(name) \
>  	igt_subtest(#name "-dirt") { \
>  		execbuf.flags = 0; \
> -- 
> 2.20.1
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200203214518.723198-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <93539b03-152c-eec9-5f1b-266433925782@intel.com>
Date: Mon, 3 Feb 2020 14:45:54 -0800
MIME-Version: 1.0
In-Reply-To: <20200203214518.723198-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_basic: Drop per-engine
 testing of *execbuf
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



On 03/02/20 13:45, Chris Wilson wrote:
> The gtt/readonly tests are nothing to do with execution and engines;
> they are strictly checking the copy-from-user of the ioctl arguments.
> Drop the silly per-engine tests.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>

LGTM.

Reviewed-by: Antonio Argenziano <antonio.argenziano@intel.com>

> ---
>   tests/i915/gem_exec_basic.c  | 109 +++++------------------------------
>   tests/i915/gem_exec_params.c |  61 ++++++++++++++++++++
>   2 files changed, 76 insertions(+), 94 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 70dce34b5..0d05819ce 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -36,84 +36,6 @@ static uint32_t batch_create(int fd)
>   	return handle;
>   }
>   
> -static void batch_fini(int fd, uint32_t handle)
> -{
> -	gem_sync(fd, handle); /* catch any GPU hang */
> -	gem_close(fd, handle);
> -}
> -
> -static void noop(int fd, uint64_t flags)
> -{
> -	struct drm_i915_gem_execbuffer2 execbuf;
> -	struct drm_i915_gem_exec_object2 exec;
> -
> -	gem_require_ring(fd, flags);
> -
> -	memset(&exec, 0, sizeof(exec));
> -
> -	exec.handle = batch_create(fd);
> -
> -	memset(&execbuf, 0, sizeof(execbuf));
> -	execbuf.buffers_ptr = to_user_pointer(&exec);
> -	execbuf.buffer_count = 1;
> -	execbuf.flags = flags;
> -	gem_execbuf(fd, &execbuf);
> -
> -	batch_fini(fd, exec.handle);
> -}
> -
> -static void readonly(int fd, uint64_t flags)
> -{
> -	struct drm_i915_gem_execbuffer2 *execbuf;
> -	struct drm_i915_gem_exec_object2 exec;
> -
> -	gem_require_ring(fd, flags);
> -
> -	memset(&exec, 0, sizeof(exec));
> -	exec.handle = batch_create(fd);
> -
> -	execbuf = mmap(NULL, 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> -	igt_assert(execbuf != NULL);
> -
> -	execbuf->buffers_ptr = to_user_pointer(&exec);
> -	execbuf->buffer_count = 1;
> -	execbuf->flags = flags;
> -	igt_assert(mprotect(execbuf, 4096, PROT_READ) == 0);
> -
> -	gem_execbuf(fd, execbuf);
> -
> -	munmap(execbuf, 4096);
> -
> -	batch_fini(fd, exec.handle);
> -}
> -
> -static void gtt(int fd, uint64_t flags)
> -{
> -	struct drm_i915_gem_execbuffer2 *execbuf;
> -	struct drm_i915_gem_exec_object2 *exec;
> -	uint32_t handle;
> -
> -	gem_require_ring(fd, flags);
> -
> -	handle = gem_create(fd, 4096);
> -
> -	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> -	execbuf = gem_mmap__gtt(fd, handle, 4096, PROT_WRITE);
> -	exec = (struct drm_i915_gem_exec_object2 *)(execbuf + 1);
> -	gem_close(fd, handle);
> -
> -	exec->handle = batch_create(fd);
> -
> -	execbuf->buffers_ptr = to_user_pointer(exec);
> -	execbuf->buffer_count = 1;
> -	execbuf->flags = flags;
> -
> -	gem_execbuf(fd, execbuf);
> -
> -	batch_fini(fd, exec->handle);
> -	munmap(execbuf, 4096);
> -}
> -
>   igt_main
>   {
>   	const struct intel_execution_engine2 *e;
> @@ -121,30 +43,29 @@ igt_main
>   
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_INTEL);
> -		igt_require_gem(fd);
> -
> +		/* igt_require_gem(fd); // test is mandatory */
>   		igt_fork_hang_detector(fd);
>   	}
>   
>   	igt_subtest_with_dynamic("basic") {
> -		__for_each_physical_engine(fd, e) {
> -			igt_dynamic_f("%s", e->name)
> -				noop(fd, e->flags);
> -		}
> -	}
> +		struct drm_i915_gem_exec_object2 exec = {
> +			.handle = batch_create(fd),
> +		};
>   
> -	igt_subtest_with_dynamic("readonly") {
>   		__for_each_physical_engine(fd, e) {
> -			igt_dynamic_f("%s", e->name)
> -				readonly(fd, e->flags);
> +			igt_dynamic_f("%s", e->name) {
> +				struct drm_i915_gem_execbuffer2 execbuf = {
> +					.buffers_ptr = to_user_pointer(&exec),
> +					.buffer_count = 1,
> +					.flags = e->flags,
> +				};
> +
> +				gem_execbuf(fd, &execbuf);
> +			}
>   		}
> -	}
>   
> -	igt_subtest_with_dynamic("gtt") {
> -		__for_each_physical_engine(fd, e) {
> -			igt_dynamic_f("%s", e->name)
> -				gtt(fd, e->flags);
> -		}
> +		gem_sync(fd, exec.handle); /* catch any GPU hang */
> +		gem_close(fd, exec.handle);
>   	}
>   
>   	igt_fixture {
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index 9c3525698..094fa904c 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -206,6 +206,61 @@ static int has_secure_batches(const int fd)
>   	return v > 0;
>   }
>   
> +static uint32_t batch_create(int fd)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t handle;
> +
> +	handle = gem_create(fd, 4096);
> +	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> +
> +	return handle;
> +}
> +
> +static void readonly(int i915)
> +{
> +	struct drm_i915_gem_execbuffer2 *execbuf;
> +	struct drm_i915_gem_exec_object2 exec = {
> +		batch_create(i915)
> +	};
> +
> +	execbuf = mmap(NULL, 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> +	igt_assert(execbuf != MAP_FAILED);
> +
> +	execbuf->buffers_ptr = to_user_pointer(&exec);
> +	execbuf->buffer_count = 1;
> +	igt_assert(mprotect(execbuf, 4096, PROT_READ) == 0);
> +
> +	gem_execbuf(i915, execbuf);
> +	gem_close(i915, exec.handle);
> +
> +	munmap(execbuf, 4096);
> +}
> +
> +static void mmapped(int i915)
> +{
> +	struct drm_i915_gem_execbuffer2 *execbuf;
> +	struct drm_i915_gem_exec_object2 *exec;
> +	uint32_t handle;
> +
> +	handle = gem_create(i915, 4096);
> +
> +	gem_set_domain(i915, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> +	execbuf = gem_mmap__gtt(i915, handle, 4096, PROT_WRITE);
> +	exec = (struct drm_i915_gem_exec_object2 *)(execbuf + 1);
> +	gem_close(i915, handle);
> +
> +	exec->handle = batch_create(i915);
> +
> +	execbuf->buffers_ptr = to_user_pointer(exec);
> +	execbuf->buffer_count = 1;
> +
> +	gem_execbuf(i915, execbuf);
> +	gem_close(i915, exec->handle);
> +
> +	munmap(execbuf, 4096);
> +}
> +
>   struct drm_i915_gem_execbuffer2 execbuf;
>   struct drm_i915_gem_exec_object2 gem_exec[1];
>   uint32_t batch[2] = {MI_BATCH_BUFFER_END};
> @@ -256,6 +311,12 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest("readonly")
> +		readonly(fd);
> +
> +	igt_subtest("mmapped")
> +		mmapped(fd);
> +
>   #define RUN_FAIL(expected_errno) do { \
>   		igt_assert_eq(__gem_execbuf(fd, &execbuf), -expected_errno); \
>   	} while(0)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
 <20200710093234.1438712-4-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e872c938-9029-6722-e76e-435d134b1767@linux.intel.com>
Date: Fri, 10 Jul 2020 15:11:02 +0100
MIME-Version: 1.0
In-Reply-To: <20200710093234.1438712-4-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] i915/gem_close: Adapt to allow
 duplicate handles
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


On 10/07/2020 10:32, Chris Wilson wrote:
> With an upcoming change, we can relax the rule about handles not being
> duplicated in the execocbj[]. Duplicate handles must not otherwise
> conflict in their placements (e.g. two EXEC_OBJECT_PINNED at different
> offsets), but otherwise if they are able to be resolved to the same GPU
> address, then the operation is harmless and decreed legal.
> 
> Since this is a relaxation in the negative ABI, update the test case to
> allow the permissible duplicate handles.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/gem_close.c | 51 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
> index 4fdc1ad79..a9bf2d2d4 100644
> --- a/tests/i915/gem_close.c
> +++ b/tests/i915/gem_close.c
> @@ -24,21 +24,57 @@
>   #include "i915/gem.h"
>   #include "igt.h"
>   
> -static bool has_duplicate(int err)
> +static int batch_create(int fd)
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
> +static int allows_duplicate(int fd)
> +{
> +	struct drm_i915_gem_exec_object2 obj[2] = {
> +		{ .handle = batch_create(fd), },
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(obj),
> +		.buffer_count = 1,
> +	};
> +	int err;
> +
> +	gem_execbuf(fd, &execbuf);
> +
> +	obj[1] = obj[0];
> +	execbuf.buffer_count = 2;
> +
> +	err = __gem_execbuf(fd, &execbuf);
> +	gem_close(fd, obj[0].handle);
> +
> +	return err;
> +}
> +
> +static bool is_duplicate(int err)
>   {
>   	return err == -EINVAL || err == -EALREADY;
>   }
>   
>   static void test_many_handles(int fd)
>   {
> -	uint32_t bbe = MI_BATCH_BUFFER_END;
>   	struct drm_i915_gem_execbuffer2 execbuf;
>   	struct drm_i915_gem_exec_object2 obj[2];
>   	uint32_t clones[128]; /* XXX try with 1024 */
>   	uint32_t original;
> +	int expected;
> +
> +	expected = allows_duplicate(fd);
> +	if (expected)
> +		igt_assert(is_duplicate(expected));
>   
> -	original = gem_create(fd, 4096);
> -	gem_write(fd, original, 0, &bbe, sizeof(bbe));
> +	original = batch_create(fd);
>   
>   	memset(&execbuf, 0, sizeof(execbuf));
>   	execbuf.buffers_ptr = to_user_pointer(obj);
> @@ -54,7 +90,8 @@ static void test_many_handles(int fd)
>   		gem_execbuf(fd, &execbuf);
>   	}
>   
> -	/* We do not allow the sam object to be referenced multiple times
> +	/*
> +	 * We do not allow the same object to be referenced multiple times
>   	 * within an execbuf; hence why this practice of cloning a handle
>   	 * is only found within test cases.
>   	 */
> @@ -62,11 +99,11 @@ static void test_many_handles(int fd)
>   	obj[0].handle = original;
>   	for (int i = 0; i < ARRAY_SIZE(clones); i++) {
>   		obj[1].handle = clones[i];
> -		igt_assert(has_duplicate(__gem_execbuf(fd, &execbuf)));
> +		igt_assert_eq(__gem_execbuf(fd, &execbuf), expected);
>   	}
>   	/* Any other clone pair should also be detected */
>   	obj[1].handle = clones[0];  /* (last, first) */
> -	igt_assert(has_duplicate(__gem_execbuf(fd, &execbuf)));
> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), expected);
>   	execbuf.buffer_count = 1;
>   
>   	/* Now close the original having used every clone */
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F901127C0
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 16:35:24 +0000 (UTC)
Message-ID: <9bebc5ee-55eb-91bc-65dd-1e0692e42a6a@linux.intel.com>
Date: Fri, 4 Mar 2022 16:35:20 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>, igt-dev@lists.freedesktop.org
References: <20220304051509.44816-1-chuansheng.liu@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220304051509.44816-1-chuansheng.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_mmap_gtt: add test
 mmap_closed_bo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


Hi,

Some nits, some questions below.

On 04/03/2022 05:15, Chuansheng Liu wrote:
> Recently we figured out one memory leak in i915 driver when running
> below alike test:
> 
> create_bo
> gem_mmap_gtt bo
> gem_mmap_gtt bo twice
> close_bo
> 
> then the memory leak is detected. More details can be referred in
> https://patchwork.freedesktop.org/patch/475802/?series=100532&rev=2
> 
> For detecting such issue, this test case mmap_closed_bo is created,
> it will close the bo with keeping one mmap, then second mmap the bo,
> in normal situation, we expect second mmap failure with EACCESS. But
> it will succeed if driver has the vm_node allowance leak.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> ---
>   tests/i915/gem_mmap_gtt.c | 42 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index 92bbb5d2..0f4d5385 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -318,6 +318,46 @@ test_wc(int fd)
>   		     5*gtt_writes/256., 5*cpu_writes/256.);
>   }
>   
> +static void mmap_closed_bo(int fd)
> +{
> +	struct drm_i915_gem_mmap_gtt mmap_arg;
> +	void *p1, *p2;
> +	int loop = 0, i = 0;

Nits - don't need to init i, mmap_arg, p1 and p2 could be declared in 
the loop.

> +
> +	while (loop++ < 2) {
> +		memset(&mmap_arg, 0, sizeof(mmap_arg));
> +
> +		mmap_arg.handle = gem_create(fd, OBJECT_SIZE);
> +		igt_assert(mmap_arg.handle);
> +
> +		i = loop;
> +		while (i--) {
> +			/* get offset, here we tries a loop to call GEM_MMAP_GTT many times,

If I may suggest:

/*
  * Get mmap offset by calling GEM_MMAP_GTT one or multiple times in
  * order to try to provoke a memory leak in the driver.
  */

> +			 * it could trigger driver memory leak issue easily.
> +			 */
> +			do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> +		}
> +
> +		p1 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_SHARED, fd, mmap_arg.offset);
> +		igt_assert(p1 != MAP_FAILED);
> +
> +		gem_close(fd, mmap_arg.handle);
> +		gem_quiescent_gpu(fd);

What is quiescent for? I usually expect to see it when test created some 
GPU activity, which isn't the case here. If there is a subtle reason 
please put a comment here.

> +
> +		p2 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_SHARED, fd, mmap_arg.offset);
> +
> +		munmap(p1, OBJECT_SIZE);
> +
> +		/* we expect mmapping p2 would fail, otherwise the driver
> +		 * may not clean up the allowance of vm_node, it would
> +		 * cause memory leak.
> +		 */
> +		igt_assert(p2 == MAP_FAILED);

I get this - mmap(p2) should fail after object close regardless of how 
many time DRM_IOCTL_I915_GEM_MMAP_GTT was called.

Excellent that you found a way to test for the leak without the need for 
kmemleak! At least that's how I read the posting of this test. :)

Regards,

Tvrtko

> +	}
> +}
> +
>   static int mmap_gtt_version(int i915)
>   {
>   	int val = 0;
> @@ -1305,6 +1345,8 @@ igt_main
>   		test_write(fd);
>   	igt_subtest("basic-write-gtt")
>   		test_write_gtt(fd);
> +	igt_subtest("mmap_closed_bo")
> +		mmap_closed_bo(fd);
>   	igt_subtest("ptrace")
>   		test_ptrace(fd);
>   	igt_subtest("coherency")

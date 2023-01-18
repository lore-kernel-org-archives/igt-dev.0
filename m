Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <a369e472-6f67-0013-8ab1-246493a45e29@linux.intel.com>
Date: Wed, 18 Jan 2023 10:33:10 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
References: <20221222100403.256775-1-tvrtko.ursulin@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221222100403.256775-1-tvrtko.ursulin@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/22/2022 11:04 AM, Tvrtko Ursulin wrote:
> From: Chuansheng Liu <chuansheng.liu@intel.com>
>
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
> V2: (Tvrtko) some variable placement and comments tuning.
> V3: (Tvrtko) Using igt_drop_caches_set(fd, DROP_FREED) directly.
> v4: [tursulin] Fixed a conflict, added igt_describe.
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/gem_mmap_gtt.c | 49 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
>
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index c14ab50eeee7..68f5e8412af6 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -320,6 +320,52 @@ test_wc(int fd)
>   		     5*gtt_writes/256., 5*cpu_writes/256.);
>   }
>   
> +static void mmap_closed_bo(int fd)
> +{
> +	int loop = 0;
> +
> +	while (loop++ < 2) {
> +		struct drm_i915_gem_mmap_gtt mmap_arg;
> +		void *p1, *p2;
> +		int i = loop;
> +
> +		memset(&mmap_arg, 0, sizeof(mmap_arg));
> +		mmap_arg.handle = gem_create(fd, OBJECT_SIZE);
> +		igt_assert(mmap_arg.handle);
> +
> +		while (i--) {
> +			/*
> +			 * Get mmap offset by calling GEM_MMAP_GTT one or multiple times in
> +			 * order to try to provoke a memory leak in the driver.
> +			 */
> +			do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> +		}
> +
> +		p1 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_SHARED, fd, mmap_arg.offset);
> +		igt_assert(p1 != MAP_FAILED);
> +
> +		gem_close(fd, mmap_arg.handle);
> +
> +		/*
> +		 * Drop the freed objects for consistent 2nd mmap result.
> +		 */
> +		igt_drop_caches_set(fd, DROP_FREED);
> +
> +		p2 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +			MAP_SHARED, fd, mmap_arg.offset);
> +
> +		munmap(p1, OBJECT_SIZE);
> +
> +		/*
> +		 * we expect mmapping p2 would fail, otherwise the driver
> +		 * may not clean up the allowance of vm_node, it would
> +		 * cause memory leak.
> +		 */
> +		igt_assert(p2 == MAP_FAILED);
> +	}
> +}
> +
>   static int mmap_gtt_version(int i915)
>   {
>   	int val = 0;
> @@ -1315,6 +1361,9 @@ igt_main
>   		     "writes into it from another GTT mmapped.");
>   	igt_subtest("basic-write-gtt")
>   		test_write_gtt(fd);
> +	igt_describe("Check mmap of a closed handle is rejected.");
> +	igt_subtest("mmap-closed-bo")
> +		mmap_closed_bo(fd);
>   	igt_describe("Inspect a GTT mmap using ptrace().");
>   	igt_subtest("ptrace")
>   		test_ptrace(fd);

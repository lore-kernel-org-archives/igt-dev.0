Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636989E63
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 08:19:13 +0000 (UTC)
Message-ID: <bdda45f5-978b-b391-a36c-3a35bcdbb83e@linux.intel.com>
Date: Mon, 28 Mar 2022 09:19:07 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>, igt-dev@lists.freedesktop.org
References: <20220325012747.33249-1-chuansheng.liu@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220325012747.33249-1-chuansheng.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/gem_mmap_gtt: add test
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


On 25/03/2022 01:27, Chuansheng Liu wrote:
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
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> ---
>   tests/i915/gem_mmap_gtt.c | 48 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index 92bbb5d2..ed9590c4 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -318,6 +318,52 @@ test_wc(int fd)
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
> @@ -1305,6 +1351,8 @@ igt_main
>   		test_write(fd);
>   	igt_subtest("basic-write-gtt")
>   		test_write_gtt(fd);
> +	igt_subtest("mmap-closed-bo")
> +		mmap_closed_bo(fd);
>   	igt_subtest("ptrace")
>   		test_ptrace(fd);
>   	igt_subtest("coherency")

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I don't remember if I suggested it before but putting this into 
gem_mmap_offset might be a better place. See for instance the basic_uaf 
subtest which iterates all mmap offset types.

And maybe this test could do some offset type mixing to verfiy they are 
indepepdently tracked (goto insert vs goto out in i915 mmap_offset_attach).

But as it is the same underlying implementation so not a hard 
requirement I think. It's good enough to have this patch only.

Btw if you wanted to see that the test passes with the fixed i915 in CI, 
you would resend the i915 patch with a Test-with tag in the cover 
letter. The tag should reference a msg-id of the IGT patch series it 
should be ran against. In this case that would be:

Test-with: 20220325012747.33249-1-chuansheng.liu@intel.com

Then you would see that the new test passes. Would you like to try that 
or you are confident everything is good so I can merge it already?

Regards,

Tvrtko

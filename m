Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3E6EEB4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Mar 2021 06:58:59 +0000 (UTC)
Date: Fri, 26 Mar 2021 07:58:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210326065853.GA3927@zkempczy-mobl2>
References: <20210326043303.67982-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326043303.67982-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Skip two subsets when
 pread/pwrite are unavailable
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 09:33:03PM -0700, Ashutosh Dixit wrote:
> The pread/pwrite replacement implemented in
> ad5eb02eb3f1 ("lib/ioctl_wrappers: Keep IGT working without pread/pwrite
> ioctls") uses gem_set_domain which pins all pages which have to be
> read/written. When the read/write size is large this causes gem_set_domain
> to return -ENOMEM with a trace such as:
> 
> ioctl_wrappers-CRITICAL: Test assertion failure function gem_set_domain, file ../lib/ioctl_wrappers.c:563:
> ioctl_wrappers-CRITICAL: Failed assertion: __gem_set_domain(fd, handle, read, write) == 0
> ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate memory
> ioctl_wrappers-CRITICAL: error: -12 != 0
> igt_core-INFO: Stack trace:
> igt_core-INFO:   #0 ../lib/igt_core.c:1746 __igt_fail_assert()
> igt_core-INFO:   #1 [gem_set_domain+0x44]
> igt_core-INFO:   #2 ../lib/ioctl_wrappers.c:367 gem_write()
> igt_core-INFO:   #3 ../tests/prime_mmap.c:67 test_aperture_limit()
> igt_core-INFO:   #4 ../tests/prime_mmap.c:578 __real_main530()
> igt_core-INFO:   #5 ../tests/prime_mmap.c:530 main()
> 
> Skip these tests when pread/pwrite are unavailable because they cannot pass
> with the pread/pwrite replacement.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_exec_params.c | 2 ++
>  tests/prime_mmap.c           | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index 6840cf40ce..a7bcd39d32 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -314,6 +314,8 @@ static void test_larger_than_life_batch(int fd)
>  	 */
>  	igt_require(size < gem_aperture_size(fd));
>  	intel_require_memory(2, size, CHECK_RAM); /* batch + shadow */
> +	/* Prevent gem_set_domain -ENOMEM failures */
> +	gem_require_pread_pwrite(fd);

I have doubts regarding that test. 

What is real cause we got -ENOMEM in that subtest? And on which 
machines? I've enforced on my SKL (gen9) to use mmap/set_domain 
and I see success on that test.

Why require:

	igt_require(size < gem_aperture_size(fd));

comes after:

	uint64_t size = 1ULL << 32; /* batch_len is __u32 as per the ABI */
	struct drm_i915_gem_exec_object2 exec = {
		.handle = batch_create_size(fd, size),
	};

I think require before mmap/set_domain would catch this issue.

--
Zbigniew
 
>  
>  	__for_each_physical_engine(fd, e) {
>  		/* Keep the batch_len implicit [0] */
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index cdf2d51497..af313917da 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -451,6 +451,8 @@ test_aperture_limit(void)
>  	uint64_t size1 = (gem_mappable_aperture_size(fd) * 7) / 8;
>  	uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
>  
> +	/* Prevent gem_set_domain -ENOMEM failures */
> +	gem_require_pread_pwrite(fd);
>  	handle1 = gem_create(fd, size1);
>  	fill_bo(handle1, BO_SIZE);
>  
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

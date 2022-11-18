Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4510E75F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 14:54:44 +0000 (UTC)
Message-ID: <42fed476-5f00-90e2-83ba-df17a9acc73a@intel.com>
Date: Fri, 18 Nov 2022 14:54:40 +0000
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221115190513.30821-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221115190513.30821-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix memory
 requirement assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 15/11/2022 19:05, Niranjana Vishwanathapura wrote:
> The reclaim subtest do not require the alloc_size memory
> allocations. Ensure the memory requirement assert is only
> applied for other subtests.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   tests/i915/gem_shrink.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index e3e20dfc9..380d2c846 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -456,9 +456,6 @@ igt_main
>   			 num_processes, alloc_size);
>   
>   		alloc_size <<= 20;
> -		igt_require_memory(num_processes, alloc_size,
> -				   CHECK_SWAP | CHECK_RAM);
> -

If that's the case then all the other stuff in the fixture is not really 
used either (like alloc_size, num_processes etc). Maybe just move the 
fixture instead?

igt_subtest_group {
	igt_fixture {

	}

	for(const struct test *t = tests; t->name; t++) {
	....	
}

igt_subtest("reclaim")
...

>   		close(fd);
>   	}
>   
> @@ -467,9 +464,12 @@ igt_main
>   
>   	for(const struct test *t = tests; t->name; t++) {
>   		for(const struct mode *m = modes; m->suffix; m++) {
> -			igt_subtest_f("%s%s", t->name, m->suffix)
> +			igt_subtest_f("%s%s", t->name, m->suffix) {
> +				igt_require_memory(num_processes, alloc_size,
> +						   CHECK_SWAP | CHECK_RAM);
>   				run_test(num_processes, alloc_size,
>   					 t->func, m->flags);
> +			}



>   		}
>   	}
>   }

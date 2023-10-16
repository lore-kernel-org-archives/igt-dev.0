Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767A610E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 15:19:08 +0000 (UTC)
Message-ID: <98a7af5d-c45d-e9b0-2ac7-6d2e1694a006@linux.intel.com>
Date: Mon, 16 Oct 2023 17:19:00 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_create: Remove
 create-invalid-size subtest
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

Hi, Zbigniew, Maarten

On 10/12/23 09:01, Zbigniew Kempczyński wrote:
> Test exercises kernel returns EINVAL on bo create ioctl with unaligned
> size what was never merged and according to discussion with Thomas
> will never be. Lets remove this test as it is incorrect in this case.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I have been looking at an implementation over the weekend where the 
buffer object size alignment restrictions are pushed out to the ttm 
resources, so that a buffer object has a 4K-aligned size and any other 
size alignment restrictions are solved by allocating the TTM resource 
larger when needed.

It turns out that this requires changes with TTM, that accounts memory 
using the buffer object size, but also would, I figure, require 
non-standard dma-buf scatter-gather lists if attempting to bind p2p vram 
buffers if not using PCI p2p.

So given the relative simplicity of the -EINVAL solution for unaligned 
buffer objects and the fact that we could relax this in the future if we 
implement pushing out the alignment to TTM resources I can indeed see 
the benefit of using the -EINVAL solution for now.

That would mean keeping this test and adding the check for -EINVAL for 
unaligned size buffer objects.

/Thomas

> ---
>   tests/intel/xe_create.c | 52 -----------------------------------------
>   1 file changed, 52 deletions(-)
>
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 8d845e5c86..541fc2b335 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -39,54 +39,6 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
>   	return ret;
>   }
>   
> -/**
> - * SUBTEST: create-invalid-size
> - * Functionality: ioctl
> - * Test category: negative test
> - * Description: Verifies xe bo create returns expected error code on invalid
> - *              buffer sizes.
> - */
> -static void create_invalid_size(int fd)
> -{
> -	struct drm_xe_query_mem_region *memregion;
> -	uint64_t memreg = all_memory_regions(fd), region;
> -	uint32_t vm;
> -	uint32_t handle;
> -	int ret;
> -
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> -
> -	xe_for_each_mem_region(fd, memreg, region) {
> -		memregion = xe_mem_region(fd, region);
> -
> -		/* first try, use half of possible min page size */
> -		ret = __create_bo(fd, vm, memregion->min_page_size >> 1,
> -				  region, &handle);
> -		if (!ret) {
> -			gem_close(fd, handle);
> -			xe_vm_destroy(fd, vm);
> -		}
> -		igt_assert_eq(ret, -EINVAL);
> -
> -		/*
> -		 * second try, add page size to min page size if it is
> -		 * bigger than page size.
> -		 */
> -		if (memregion->min_page_size > PAGE_SIZE) {
> -			ret = __create_bo(fd, vm,
> -					  memregion->min_page_size + PAGE_SIZE,
> -					  region, &handle);
> -			if (!ret) {
> -				gem_close(fd, handle);
> -				xe_vm_destroy(fd, vm);
> -			}
> -			igt_assert_eq(ret, -EINVAL);
> -		}
> -	}
> -
> -	xe_vm_destroy(fd, vm);
> -}
> -
>   enum exec_queue_destroy {
>   	NOLEAK,
>   	LEAK
> @@ -214,10 +166,6 @@ igt_main
>   	igt_fixture
>   		xe = drm_open_driver(DRIVER_XE);
>   
> -	igt_subtest("create-invalid-size") {
> -		create_invalid_size(xe);
> -	}
> -
>   	igt_subtest("create-execqueues-noleak")
>   		create_execqueues(xe, NOLEAK);
>   

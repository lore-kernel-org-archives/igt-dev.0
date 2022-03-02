Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0377F10E8B2
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 11:49:34 +0000 (UTC)
Message-ID: <261ba339-2e7d-f9ff-6f5f-ccca457ef1b8@intel.com>
Date: Wed, 2 Mar 2022 13:49:25 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220301075803.117058-1-zbigniew.kempczynski@intel.com>
 <20220301075803.117058-3-zbigniew.kempczynski@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220301075803.117058-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/prime_mmap: Iterate over
 dma-buf supported memory regions
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

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Tested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

If the https://patchwork.freedesktop.org/series/100737/ patch (currently 
under review) is applied to the i915, you can see that the 
igt@prime_mmap test works normally in dg1.

On 3/1/22 9:58 AM, Zbigniew Kempczyński wrote:
> To avoid code duplication (prime_mmap_coherency uses similar code)
> use helper function which returns dma-buf set of supported regions.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/prime_mmap.c | 34 ++++++----------------------------
>   1 file changed, 6 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index e0cb9a25b..d53185ff1 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -483,31 +483,6 @@ test_aperture_limit(uint32_t region, int size)
>   	gem_close(fd, handle2);
>   }
>   
> -static int
> -check_for_dma_buf_mmap(struct igt_collection *set)
> -{
> -	struct igt_collection *region;
> -	uint32_t reg;
> -	int dma_buf_fd;
> -	char *ptr;
> -	uint32_t handle;
> -	int ret = 1;
> -
> -	for_each_combination(region, 1, set) {
> -		reg = igt_collection_get_value(region, 0);
> -		handle = gem_create_in_memory_regions(fd, BO_SIZE, reg);
> -
> -		dma_buf_fd = prime_handle_to_fd(fd, handle);
> -		ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
> -		if (ptr != MAP_FAILED)
> -			ret = 0;
> -		munmap(ptr, BO_SIZE);
> -		gem_close(fd, handle);
> -		close(dma_buf_fd);
> -	}
> -	return ret;
> -}
> -
>   #define SKIP_LMEM (1 << 0)
>   #define SKIP_USERPTR (1 << 1)
>   
> @@ -527,7 +502,7 @@ static bool check_skip(uint32_t skip, uint32_t region)
>   
>   igt_main
>   {
> -	struct igt_collection *set, *regions;
> +	struct igt_collection *set, *regions, *dma_buf_set;
>   	struct drm_i915_query_memory_regions *query_info;
>   	struct {
>   		const char *name;
> @@ -560,13 +535,15 @@ igt_main
>   
>   		set = get_memory_region_set(query_info, I915_SYSTEM_MEMORY,
>   					    I915_DEVICE_MEMORY);
> -		igt_assert(check_for_dma_buf_mmap(set) == 0);
> +
> +		dma_buf_set = get_dma_buf_mmap_supported_set(fd, set);
> +		igt_require_f(dma_buf_set, "No dma-buf region supported\n");
>   		errno = 0;
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tests); i++)
>   		igt_subtest_with_dynamic(tests[i].name) {
> -			for_each_combination(regions, 1, set) {
> +			for_each_combination(regions, 1, dma_buf_set) {
>   				region = igt_collection_get_value(regions, 0);
>   				size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
>   				size = max(size, BO_SIZE);
> @@ -582,6 +559,7 @@ igt_main
>   	igt_fixture {
>   		free(query_info);
>   		igt_collection_destroy(set);
> +		igt_collection_destroy(dma_buf_set);
>   		close(fd);
>   	}
>   }
> 

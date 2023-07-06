Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8BF10E498
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 09:04:31 +0000 (UTC)
Message-ID: <a7d506db-a89c-f82c-8df1-a335d8a89b24@intel.com>
Date: Thu, 6 Jul 2023 11:04:09 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
 <20230706060555.282757-2-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230706060555.282757-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 01/16] tests/api_intel_allocator:
 Don't use allocator ahnd aliasing api
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6.07.2023 08:05, Zbigniew Kempczyński wrote:
> There's no tests (apart this one) which are using aliasing ahnd
> - intel_allocator_open_vm_as(). Additionally it is problematic
> on adopting allocator to xe where I need to track allocations
> to support easy vm binding. Let's adopt "open-vm" to not to use
> this api.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tests/i915/api_intel_allocator.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index b7e3efb87f..238e76c9fd 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -612,32 +612,27 @@ static void reopen_fork(int fd)
>   
>   static void open_vm(int fd)
>   {
> -	uint64_t ahnd[4], offset[4], size = 0x1000;
> +	uint64_t ahnd[3], offset[3], size = 0x1000;
>   	int i, n = ARRAY_SIZE(ahnd);
>   
>   	ahnd[0] = intel_allocator_open_vm(fd, 1, INTEL_ALLOCATOR_SIMPLE);
>   	ahnd[1] = intel_allocator_open_vm(fd, 1, INTEL_ALLOCATOR_SIMPLE);
> -	ahnd[2] = intel_allocator_open_vm_as(ahnd[1], 2);
> -	ahnd[3] = intel_allocator_open(fd, 3, INTEL_ALLOCATOR_SIMPLE);
> +	ahnd[2] = intel_allocator_open(fd, 2, INTEL_ALLOCATOR_SIMPLE);
>   
>   	offset[0] = intel_allocator_alloc(ahnd[0], 1, size, 0);
>   	offset[1] = intel_allocator_alloc(ahnd[1], 2, size, 0);
>   	igt_assert(offset[0] != offset[1]);
>   
> -	offset[2] = intel_allocator_alloc(ahnd[2], 3, size, 0);
> -	igt_assert(offset[0] != offset[2] && offset[1] != offset[2]);
> -
> -	offset[3] = intel_allocator_alloc(ahnd[3], 1, size, 0);
> -	igt_assert(offset[0] == offset[3]);
> +	offset[2] = intel_allocator_alloc(ahnd[2], 1, size, 0);
> +	igt_assert(offset[0] == offset[2]);
>   
>   	/*
> -	 * As ahnd[0-2] lead to same allocator check can we free all handles
> +	 * As ahnd[0-1] lead to same allocator check can we free all handles

nit: Shouldn't this we "we can free" instead of "can we free"?

Apart from that, I think the test update looks correct:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

>   	 * using selected ahnd.
>   	 */
> -	intel_allocator_free(ahnd[0], 1);
> -	intel_allocator_free(ahnd[0], 2);
> -	intel_allocator_free(ahnd[0], 3);
> -	intel_allocator_free(ahnd[3], 1);
> +	igt_assert_eq(intel_allocator_free(ahnd[0], 1), true);
> +	igt_assert_eq(intel_allocator_free(ahnd[1], 2), true);
> +	igt_assert_eq(intel_allocator_free(ahnd[2], 1), true);
>   
>   	for (i = 0; i < n - 1; i++)
>   		igt_assert_eq(intel_allocator_close(ahnd[i]), (i == n - 2));

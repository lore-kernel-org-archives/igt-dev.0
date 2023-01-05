Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C69510E6D0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 09:22:28 +0000 (UTC)
Message-ID: <ec0a6ca8-0d5f-0de9-ba2f-92af421fafec@amd.com>
Date: Thu, 5 Jan 2023 10:22:19 +0100
Content-Language: en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20230105005320.157831-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230105005320.157831-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/4] lib/amdgpu: rename function parameter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 jiadong.zhu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Christian König <christian.koenig@amd.com> for patch #1 and #2.

Acked-by: Christian König <christian.koenig@amd.com> fro patch #3 and #4.

Thanks,
Christian.

Am 05.01.23 um 01:53 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> No functional change just cosmetic.
> Rename flags parameter to alloc_flags for clarity.
> There are mapping flags.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   lib/amdgpu/amd_memory.c | 10 ++++------
>   lib/amdgpu/amd_memory.h |  2 +-
>   2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
> index 0aa400ac8..e3432a954 100644
> --- a/lib/amdgpu/amd_memory.c
> +++ b/lib/amdgpu/amd_memory.c
> @@ -41,7 +41,7 @@
>   				      uint64_t size,
>   				      uint64_t alignment,
>   				      uint32_t type,
> -				      uint64_t flags,
> +				      uint64_t alloc_flags,
>   				      uint64_t *vmc_addr,
>   				      amdgpu_va_handle *va_handle)
>   {
> @@ -49,7 +49,7 @@
>   		.alloc_size = size,
>   		.phys_alignment = alignment,
>   		.preferred_heap = type,
> -		.flags = flags,
> +		.flags = alloc_flags,
>   	};
>   	amdgpu_bo_handle buf_handle;
>   	int r;
> @@ -57,10 +57,8 @@
>   	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
>   	igt_assert_eq(r, 0);
>   
> -	r = amdgpu_va_range_alloc(device_handle,
> -				  amdgpu_gpu_va_range_general,
> -				  size, alignment, 0, vmc_addr,
> -				  va_handle, 0);
> +	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
> +				   size, alignment, 0, vmc_addr, va_handle, 0);
>   	igt_assert_eq(r, 0);
>   
>   	r = amdgpu_bo_va_op(buf_handle, 0, size, *vmc_addr, 0, AMDGPU_VA_OP_MAP);
> diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
> index 77fd099b0..a06f88923 100644
> --- a/lib/amdgpu/amd_memory.h
> +++ b/lib/amdgpu/amd_memory.h
> @@ -35,7 +35,7 @@ gpu_mem_alloc(amdgpu_device_handle device_handle,
>   				      uint64_t size,
>   				      uint64_t alignment,
>   				      uint32_t type,
> -				      uint64_t flags,
> +				      uint64_t alloc_flags,
>   				      uint64_t *vmc_addr,
>   				      amdgpu_va_handle *va_handle);
>   int

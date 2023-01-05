Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C110E73F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 14:29:04 +0000 (UTC)
Date: Thu, 5 Jan 2023 15:29:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7berZW1tpjYb3og@kamilkon-desk1>
References: <20230105005320.157831-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105005320.157831-1-vitaly.prosyak@amd.com>
Subject: Re: [igt-dev] [PATCH 1/4] lib/amdgpu: rename function parameter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vitaly,

On 2023-01-04 at 19:53:17 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> No functional change just cosmetic.
> Rename flags parameter to alloc_flags for clarity.
> There are mapping flags.
--^
Maybe put these in same sentence ?

> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_memory.c | 10 ++++------
>  lib/amdgpu/amd_memory.h |  2 +-
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
> index 0aa400ac8..e3432a954 100644
> --- a/lib/amdgpu/amd_memory.c
> +++ b/lib/amdgpu/amd_memory.c
> @@ -41,7 +41,7 @@
>  				      uint64_t size,
>  				      uint64_t alignment,
>  				      uint32_t type,
> -				      uint64_t flags,
> +				      uint64_t alloc_flags,
>  				      uint64_t *vmc_addr,
>  				      amdgpu_va_handle *va_handle)
>  {
> @@ -49,7 +49,7 @@
>  		.alloc_size = size,
>  		.phys_alignment = alignment,
>  		.preferred_heap = type,
> -		.flags = flags,
> +		.flags = alloc_flags,
>  	};
>  	amdgpu_bo_handle buf_handle;
>  	int r;
> @@ -57,10 +57,8 @@
>  	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_va_range_alloc(device_handle,
> -				  amdgpu_gpu_va_range_general,
> -				  size, alignment, 0, vmc_addr,
> -				  va_handle, 0);
> +	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
> +				   size, alignment, 0, vmc_addr, va_handle, 0);

This is unrelated to description.

Regards,
Kamil

>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_bo_va_op(buf_handle, 0, size, *vmc_addr, 0, AMDGPU_VA_OP_MAP);
> diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
> index 77fd099b0..a06f88923 100644
> --- a/lib/amdgpu/amd_memory.h
> +++ b/lib/amdgpu/amd_memory.h
> @@ -35,7 +35,7 @@ gpu_mem_alloc(amdgpu_device_handle device_handle,
>  				      uint64_t size,
>  				      uint64_t alignment,
>  				      uint32_t type,
> -				      uint64_t flags,
> +				      uint64_t alloc_flags,
>  				      uint64_t *vmc_addr,
>  				      amdgpu_va_handle *va_handle);
>  int
> -- 
> 2.25.1
> 

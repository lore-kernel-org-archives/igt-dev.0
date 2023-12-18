Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0210E1FB
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:27:19 +0000 (UTC)
Message-ID: <ef38ef9e-35dd-4a50-8a28-1de607f94fb9@amd.com>
Date: Mon, 18 Dec 2023 12:32:09 +0100
Subject: Re: [PATCH i-g-t V3] tests/amdgpu: fix VM test issue
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231218025307.1837517-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231218025307.1837517-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



Am 18.12.23 um 03:53 schrieb Jesse Zhang:
> Test case name:igt@amdgpu/amd_vm@amdgpu-vm-unaligned-map
> Fail error: "Starting subtest: amdgpu-vm-unaligned-map
> (amd_vm:8876) CRITICAL: Test assertion failure function amdgpu_vm_unaligned_map, file ../tests/amdgpu/amd_vm.c:131:
> (amd_vm:8876) CRITICAL: Failed assertion: r == 0
> (amd_vm:8876) CRITICAL: Last errno: 12, Cannot allocate memory
> (amd_vm:8876) CRITICAL: error: -12 != 0
> Subtest amdgpu-vm-unaligned-map failed.
>
> V3:
>     - Split the test into two, one for the 2M (using 8M allocations)
>       case and one for the 1G case (using 4G allocation). (Christian)
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>

Vitaly is currently on vacation, but in general that looks good to me.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   tests/amdgpu/amd_vm.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
> index 11be25ae8..dab91f291 100644
> --- a/tests/amdgpu/amd_vm.c
> +++ b/tests/amdgpu/amd_vm.c
> @@ -115,11 +115,11 @@ amdgpu_vmid_reserve_test(amdgpu_device_handle device_handle,
>   static void
>   amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>   {
> -	const uint64_t map_size = (4ULL << 30) - (2 << 12);
> +	uint64_t map_size = (4ULL << 30) - (2 << 12);
>   	struct amdgpu_bo_alloc_request request = {};
>   	amdgpu_bo_handle buf_handle;
>   	amdgpu_va_handle handle;
> -	uint64_t vmc_addr;
> +	uint64_t vmc_addr, alignment = 1ULL << 30;
>   	int r;
>   
>   	request.alloc_size = 4ULL << 30;
> @@ -127,11 +127,18 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>   	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>   	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>   
> -	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
> +		/* Try allocate on the device of small memory */
> +		request.alloc_size = 8ULL << 20;
> +		map_size = (8ULL << 20) - (2 << 12);
> +		alignment = 2ULL << 20;
> +		r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	}
> +
>   	igt_assert_eq(r, 0);
>   
>   	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
> -				4ULL << 30, 1ULL << 30, 0, &vmc_addr,
> +				request.alloc_size, alignment, 0, &vmc_addr,
>   				&handle, 0);
>   	igt_assert_eq(r, 0);
>   

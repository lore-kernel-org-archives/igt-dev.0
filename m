Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF7110E922
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 09:53:38 +0000 (UTC)
Message-ID: <cadc9180-d2b4-4dee-890b-96c3dc5402d3@amd.com>
Date: Thu, 14 Dec 2023 10:53:31 +0100
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix VM test issue
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231214090749.1711421-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231214090749.1711421-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Am 14.12.23 um 10:07 schrieb Jesse Zhang:
> In some cases, the size of Vram and GTT is not large, such as mobile devices.
> It should be skipped.

Well how much memory is actually needed? The unaligned mmap test should 
be able to work with something like 2-8MiB.

Maybe we are just using something to big here, that below looks like we 
are using a 1GiB buffer.

Christian.

>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
> ---
>   tests/amdgpu/amd_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
> index 11be25ae8..0dde28e2e 100644
> --- a/tests/amdgpu/amd_vm.c
> +++ b/tests/amdgpu/amd_vm.c
> @@ -127,8 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>   	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>   	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>   
> -	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> -	igt_assert_eq(r, 0);
> +	/* Don't let the test fail if the device doesn't have enough VRAM */
> +	igt_skip_on(amdgpu_bo_alloc(device_handle, &request, &buf_handle));
>   
>   	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
>   				4ULL << 30, 1ULL << 30, 0, &vmc_addr,

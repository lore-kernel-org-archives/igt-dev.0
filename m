Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1457A10E598
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 09:43:41 +0000 (UTC)
Message-ID: <0bc50215-ecb2-4e10-8b00-e239e3ffe840@amd.com>
Date: Fri, 5 Jan 2024 10:43:33 +0100
Subject: Re: [PATCH i-g-t] tests/amdgpu:fix vm test issue
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20240105051828.3679085-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240105051828.3679085-1-jesse.zhang@amd.com>
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

Am 05.01.24 um 06:18 schrieb Jesse Zhang:
> Initialize the variable "r" before using it.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>   tests/amdgpu/amd_vm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
> index dab91f291..bb7b6f173 100644
> --- a/tests/amdgpu/amd_vm.c
> +++ b/tests/amdgpu/amd_vm.c
> @@ -127,7 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>   	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>   	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>   
> -	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
> +	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	if (-ENOMEM == r) {

For the kernel it's usually preferred to write "r == -ENOMEM", but could 
be that it's just the other way around here.  Not sure what coding style 
the IGT tests prefer.

Either way Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

>   		/* Try allocate on the device of small memory */
>   		request.alloc_size = 8ULL << 20;
>   		map_size = (8ULL << 20) - (2 << 12);

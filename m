Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6096F10E597
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 09:42:38 +0000 (UTC)
Date: Fri, 5 Jan 2024 10:42:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/amdgpu:fix vm test issue
Message-ID: <20240105094224.a3jx72xmmlqlta7z@kamilkon-desk.igk.intel.com>
References: <20240105051828.3679085-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240105051828.3679085-1-jesse.zhang@amd.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,
On 2024-01-05 at 13:18:28 +0800, Jesse Zhang wrote:

write in subject what test do you fix. Note also a space after
':', s/:fix/: fix/

Instead of:

[PATCH i-g-t] tests/amdgpu:fix vm test issue
-------------------------^-^

this should be:

[PATCH i-g-t] tests/amdgpu/amd_vm: fix vm test issue

Note also a space after ':', ":fix" --> ": fix".

> Initialize the variable "r" before using it.

Write also which (sub)test(s) it fixes.

> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

Remove this empty line. You could add here gitlab link it fixes here
(if there is any you know).

> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
> index dab91f291..bb7b6f173 100644
> --- a/tests/amdgpu/amd_vm.c
> +++ b/tests/amdgpu/amd_vm.c
> @@ -127,7 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
>  	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
>  	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
>  
> -	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
> +	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	if (-ENOMEM == r) {

Why not other way around?
	if (r == -ENOMEM) {

looks better.

Regards,
Kamil

>  		/* Try allocate on the device of small memory */
>  		request.alloc_size = 8ULL << 20;
>  		map_size = (8ULL << 20) - (2 << 12);
> -- 
> 2.25.1
> 

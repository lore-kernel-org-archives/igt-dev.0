Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF310E212
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 12:26:56 +0000 (UTC)
Date: Thu, 9 Nov 2023 13:26:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231109122652.peh4wo4dp5x2jpap@kamilkon-desk.igk.intel.com>
References: <20231109024150.2950150-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231109024150.2950150-1-jesse.zhang@amd.com>
Subject: Re: [igt-dev] [PATCH V4 i-g-t 2/3] lib/amdgpu: add apu check for
 pciplug test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,
On 2023-11-09 at 10:41:50 +0800, Jesse Zhang wrote:
> It is integrated with cpu,
> for APU(Accelerated Processing Unit CPU + iGPU).

Thank you for writing out what APU means.

> So hotplug test should be unnecessary for it.

I am not so sure about it, I will add Janusz to Cc
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Btw is core test: core_hotunplug working for amdgpu APU?

> 
> V4:
>  - place the APU check in particular subtests.(Kamil)
>  - Add igt_info about skipping tests (Vitaly) 
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Tim Huang <tim.huang@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_pci_unplug.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
> index 047a8700b..b7af95dec 100644
> --- a/lib/amdgpu/amd_pci_unplug.c
> +++ b/lib/amdgpu/amd_pci_unplug.c
> @@ -92,6 +92,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
>  	bool ret = false;
>  	int r;
>  	uint32_t  major_version, minor_version;
> +	struct amdgpu_gpu_info gpu_info = {0};
>  
>  	unplug->num_devices = amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
>  											  unplug->drm_amdgpu_fds);
> @@ -118,6 +119,12 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
>  	if (minor_version < setup->minor_version_req)
>  		goto release;
>  
> +	/* skip hotplug test on APU (Accelerated Processing Unit CPU + iGPU) */
> +	r = amdgpu_query_gpu_info(unplug->device_handle, &gpu_info);
> +	igt_assert_eq(r, 0);
> +	if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION)
> +		igt_skip_on_f(!ret, "SKIP ... APU does not require this test\n");
---------------------------- ^^^^^^^^
No need for SKIP, it will be printed by igt_skip_on.

> +
>  	if (!setup->open_device) {
>  			/* device handle is not always required for test */
>  			/* but for drm version is required always */
> @@ -132,6 +139,11 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
>  			goto release;
>  		if (minor_version < setup->minor_version_req)
>  			goto release;
> +
> +		r = amdgpu_query_gpu_info(unplug->device_handle2, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION)
> +			igt_skip_on_f(!ret, "SKIP ... APU does not require this test\n");
-------------------------------- ^^^^^^^^
Same here.

Regards,
Kamil

>  	}
>  	ret = true;
>  release:
> -- 
> 2.25.1
> 

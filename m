Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C3C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 15:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2059010EF06;
	Fri, 17 May 2024 15:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIQuyHpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BC710EF06
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715958889; x=1747494889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rQIWNRzfny8yOXDwXGfSkL1Y1oJfsbhknXFSWZG6l7M=;
 b=EIQuyHpH084N6Jmyylz3/w4nYpdorKRDt11ooPOGApuTTpnXtfCcAZUU
 L6bfTA6QX6GtTEu/ouda3fn47SL7tVpZ535n3rBZO187adyD9sTDAzs43
 j02Ry1FFIq/9vLvWadlcG00HAUBJTuHpHTZKZlAd7HYElHjGoBIBAO9+S
 LUopAY0LXjlu1x3q9Bpf/Gkc96uWo2PY0tvwLXqdmZfENo6ENXKMp1Vnl
 0I8YQc3ecnsrV4sVXlNqMn54l7x+uHDO+tTM2Jce2OvXvncKqfrErelhh
 x8mwSxCb4MlBymTIZtkEcsDArRgR3FbnDGUVU/uwgEITFTx2AsBM8NryR A==;
X-CSE-ConnectionGUID: Bh+1UaAeTLWPncMO/xKciw==
X-CSE-MsgGUID: sFShhX6sQJiS7KLXh8Ebog==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12250856"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12250856"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 08:13:37 -0700
X-CSE-ConnectionGUID: IuRsQ8yaQIKDE3d/vyHM/Q==
X-CSE-MsgGUID: nHm9GFtNTOaK3mcJb9wYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55035907"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:13:36 -0700
Date: Fri, 17 May 2024 17:13:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, francois.dugast@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <20240517151319.zu5ldkk6i3uopnmk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, francois.dugast@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516181015.149824-1-rodrigo.vivi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Rodrigo,
On 2024-05-16 at 14:10:11 -0400, Rodrigo Vivi wrote:
> Xe is no longer holding a runtime pm reference for the life
> of a VM or exec_queue.
> 
> Also, IGT changes autosuspend time to a minimal time, so we
> cannot guarantee that rpm is still suspended after the execution
> has finished.
> 
> So, the reference usage is not a reliable reference.
> 
> Hence, start using runtime_active_time as the indicator
> that runtime_pm resumed upon our actions.
> 
> v2: Usage of runtime_active_pm and inclusion of mmap tests.
> v3: Add doc for the exported lib function (Kamil)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_pm.c        | 24 ++++++++++++++
>  lib/igt_pm.h        |  1 +
>  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
>  3 files changed, 53 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index fe7692960..928b72685 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1412,6 +1412,30 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  	return -1;
>  }
>  
> +/**
> + * igt_pm_get_runtime_active_time:
> + * @pci_dev: PCI device struct
> + *
> + * Return: The total time that the device has been active.
> + */
> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
-- ^^^

> +{
> +	char time_str[64];
> +	int time, time_fd;
> +

Is the time in seconds or miliseconds? From str size it looks
like miliseconds, so why not uint64 for time?

Regards,
Kamil

> +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> +		igt_assert(sscanf(time_str, "%d", &time) > 0);
> +
> +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
> +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> +
> +		return time;
> +	}
> +
> +	return -1;
> +}
> +
>  /**
>   * igt_pm_get_runtime_usage:
>   * @pci_dev: pci device
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 91ee05cd1..b71f7c440 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
>  bool i915_is_slpc_enabled(int drm_fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9cb00c7f1..9e1f1723d 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -185,34 +185,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  	return true;
>  }
>  
> -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> -{
> -	uint16_t val;
> -
> -	/* Runtime resume needs to be immediate action without any wait */
> -	if (runtime_usage_available(device.pci_xe) &&
> -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> -		return false;
> -
> -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> -		return false;
> -
> -	switch (state) {
> -	case IGT_ACPI_D3Hot:
> -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> -						      &val, 0xd4), 0);
> -		return (val & 0x3) == 0;
> -	case IGT_ACPI_D3Cold:
> -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> -			IGT_ACPI_D0;
> -	default:
> -		igt_info("Invalid D3 State\n");
> -		igt_assert(0);
> -	}
> -
> -	return true;
> -}
> -
>  static void close_fw_handle(int sig)
>  {
>  	if (fw_handle < 0)
> @@ -323,27 +295,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	int i, b, rpm_usage;
> +	int i, b, active_time;
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	igt_assert(n_execs > 0);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
>  		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(device.fd_xe, bo_size);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	if (flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  		memset(data, 0, bo_size);
> @@ -381,8 +353,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
>  				     bo_size, sync, 1, 0);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> +	if (check_rpm) {
> +		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> @@ -426,9 +400,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  				NULL));
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
>  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> @@ -456,15 +427,13 @@ NULL));
>  		free(data);
>  	}
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> -	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> -
>  	xe_vm_destroy(device.fd_xe, vm);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  		igt_assert(in_d3(device, d_state));
> +	}
>  }
>  
>  /**
> @@ -558,10 +527,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
>  	uint32_t bo;
> -	int i;
> +	int i, active_time;
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
>  
>  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> @@ -572,7 +544,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  
>  	igt_assert(fw_handle >= 0);
> -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		   active_time);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_1;
> @@ -582,22 +555,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  
>  	/* Runtime suspend and validate the pattern and changed the pattern */
>  	close(fw_handle);
> +	sleep(1);
> +
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		igt_assert(map[i] == MAGIC_1);
>  
>  	/* dgfx page-fault on mmaping should wake the gpu */
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_2;
>  
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  
> -- 
> 2.44.0
> 

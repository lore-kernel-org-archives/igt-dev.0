Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D73D24470
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 17:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25A310EBB6;
	Fri, 11 Oct 2024 17:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUphOQII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552C10EBB6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728667252; x=1760203252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vn5AC+VrvJgpxJ2uxVP7q3RCGW/UOpwPdmhsqw3nu5c=;
 b=jUphOQII2rM+s09AUYouE5B2XV6lpDNokDWmExSvXGXstSeAek5x8rZ0
 EwAYvDM0Jo+1K5j/P5BAtY0Db/EUy/UmvDSiTtIxfGnUM6WPPu/VLdOvB
 T5chPyE1SXtxR8bJ0A5FW/59eZwUPuaB49cIANE5JULG98fpnIWkDaE+g
 BW8jy3WDRqueFePVZvcTf9Pmu9LvX4tUS5ufMpl1QERqn4xd6rTIs3YeU
 0NG8NuiVYYPSQbg4Sm1L6ayyKE/hLgxHIVPasK6hUGqNPoZzC9RXFXUM3
 bt3qCHrkuJYbieFS2x54VV599hA3w230T6HUJqUSw8c/NWWz+1cj7e1ni g==;
X-CSE-ConnectionGUID: qyB05kUDREuYReXAAEPzUA==
X-CSE-MsgGUID: mu8Dj/5AQ8WPlkZ+O37jSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38640854"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="38640854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:20:51 -0700
X-CSE-ConnectionGUID: OZnJGGw+RZ2lpuWp65Wdfg==
X-CSE-MsgGUID: ilCi77EPTL2aUNi3qlKDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="76979792"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:20:50 -0700
Date: Fri, 11 Oct 2024 19:20:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/5] igt: Use is_intel_dgfx()
Message-ID: <20241011172047.syijmkzk5loolydq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916201841.29592-3-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-16 at 23:18:38 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Replace the hand rolled copies of is_intel_dgfx() with
> the real thing.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_power.c          | 6 ++----
>  tests/intel/kms_pm_dc.c  | 6 ++----
>  tests/intel/kms_pm_rpm.c | 6 ++----
>  tests/kms_addfb_basic.c  | 9 ++++-----
>  4 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_power.c b/lib/igt_power.c
> index f4d3efcf0cec..e891da87acf3 100644
> --- a/lib/igt_power.c
> +++ b/lib/igt_power.c
> @@ -12,7 +12,7 @@
>  #include "igt_power.h"
>  #include "igt_sysfs.h"
>  
> -#include "xe/xe_query.h"
> +#include "intel_common.h"
>  
>  static const char *rapl_domains[] = { "cpu", "gpu", "pkg", "ram" };
>  
> @@ -101,13 +101,11 @@ static inline void rapl_close(struct rapl *r)
>  int igt_power_open(int fd, struct igt_power *p, const char *domain)
>  {
>  	int i;
> -	bool is_dgfx;
>  
>  	p->hwmon_fd = -1;
>  	p->rapl.fd = -1;
>  
> -	is_dgfx = fd >= 0 && (is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd));
> -	if (is_dgfx) {
> +	if (fd >= 0 && is_intel_dgfx(fd)) {
>  		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
>  			p->hwmon_fd = igt_hwmon_open(fd);
>  			if (p->hwmon_fd >= 0)
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 07b140ce5b16..362c9b6edb25 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -46,7 +46,7 @@
>  #include "limits.h"
>  #include "time.h"
>  #include "igt_pm.h"
> -#include "xe/xe_query.h"
> +#include "intel_common.h"
>  
>  /**
>   * SUBTEST: dc3co-vpb-simulation
> @@ -711,7 +711,6 @@ static void kms_poll_state_restore(int sig)
>  igt_main
>  {
>  	data_t data = {};
> -	bool is_dgfx;
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> @@ -805,8 +804,7 @@ igt_main
>  
>  	igt_describe("This test validates display engine entry to DC9 state");
>  	igt_subtest("dc9-dpms") {
> -		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> -		if (!is_dgfx)
> +		if (!is_intel_dgfx(data.drm_fd))
>  			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  				      "PC8+ residencies not supported\n");
>  		test_dc9_dpms(&data);
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 852e9cb5f84d..990c509156f3 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -39,8 +39,8 @@
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "intel_blt.h"
> +#include "intel_common.h"
>  #include "xe/xe_ioctl.h"
> -#include "xe/xe_query.h"
>  
>  /**
>   * SUBTEST: basic-pci-d3-state
> @@ -1116,7 +1116,6 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
>  static void pci_d3_state_subtest(void)
>  {
>  	struct pci_device *pci_dev, *bridge_pci_dev;
> -	bool is_dgfx;
>  
>  	igt_require(has_runtime_pm);
>  
> @@ -1126,8 +1125,7 @@ static void pci_d3_state_subtest(void)
>  	disable_all_screens_and_wait(&ms_data);
>  	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
>  
> -	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
> -	if (is_dgfx)
> +	if (is_intel_dgfx(drm_fd))
>  		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
>  			      "pci bridge device does not bind with pcieport driver\n");
>  
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 8fe22ec05166..b22818592e57 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -51,6 +51,7 @@
>  #include "igt_rand.h"
>  #include "igt_device.h"
>  #include "i915/intel_memory_region.h"
> +#include "intel_common.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> @@ -303,13 +304,11 @@ static void invalid_tests(int fd)
>  			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
>  		igt_calc_fb_size(&fb);
>  
> -		if (is_i915_device(fd)) {
> -			igt_require(gem_has_lmem(fd));
> +		igt_require(is_intel_dgfx(fd));
> +		if (is_i915_device(fd))
>  			handle = gem_create_in_memory_regions(fd, fb.size, REGION_SMEM);
> -		} else {
> -			igt_require(xe_has_vram(fd));
> +		else
>  			handle = xe_bo_create(fd, 0, fb.size, system_memory(fd), 0);
> -		}
>  
>  		f.handles[0] = handle;
>  		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
> -- 
> 2.44.2
> 

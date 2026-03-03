Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC85EC1427
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 10:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139410E774;
	Tue,  3 Mar 2026 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKhI0rFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296210E774
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772534262; x=1804070262;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4l+LzH+No8Oty4BO6PpLjN3Ch3AVcSOklrwmHVLyx8A=;
 b=OKhI0rFY+R8EbpiLQlBmRcHyIDj2+dYx14Mxrux5/wAzVFNWIAabVILa
 /4GI9SB7NyEe7P2hhPZq042UVgizMhDfRYIzcZWbqrQnyoz211OKg0nnK
 rGw6MApQ1QAFQfsGHMDOYpX0o5u1n9EAZfmOIgsxpnj3a7s8CvOYgw72G
 C38rR/ze2QJsq43i4WLCakTcUvqlbYcFwTfiE94IxmRE+MHMismHUcMn4
 PBBkv5CoOiLHy3D61k8o2J9uMPzHShIGGYZSzNWSR0NCwa63IpL6fmcgH
 9/x4C/EQ8mR69eo/tOQOsGAcIijnpxdrnyU2v01/XV4Tvh5gq0L/ittZJ Q==;
X-CSE-ConnectionGUID: uMxunA4tQ/KcjTYDTyKXGQ==
X-CSE-MsgGUID: jl3aLWH2Rgmp75/2IUbByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73268074"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73268074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:37:42 -0800
X-CSE-ConnectionGUID: ev6h7WiaSZKzP4X82/aghQ==
X-CSE-MsgGUID: 34JQujnWShuupfX0x7cJwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="215488063"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.26])
 ([10.245.245.26])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:37:40 -0800
Message-ID: <4524e97d-4da5-4776-a877-493ca023c801@intel.com>
Date: Tue, 3 Mar 2026 10:37:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
References: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
 <20260303043853.1656156-6-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260303043853.1656156-6-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03/03/2026 04:38, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test the scenarios when media is on/off.
> When media is off/on, for xa app transient buffer, data should be coherent
> between cpu and gpu. Coherency should be maintained from KMD side
> irrespective of media engine on/off.
> 
> v2: Added comment to explain the reason of forcewaking.
> Added 2way also in the index along with XA.(Matt)
> Reordered headers.(Kamil)
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   tests/intel/xe_pat.c | 103 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 103 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index aeb84dbb7..dbeb7c7d9 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -16,11 +16,17 @@
>   #include "igt.h"
>   #include "igt_syncobj.h"
>   #include "igt_vgem.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
>   #include "intel_blt.h"
>   #include "intel_mocs.h"
>   #include "intel_pat.h"
>   #include "linux_scaffold.h"
>   
> +#include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_util.h"
> @@ -29,6 +35,8 @@
>   #define XE_COH_AT_LEAST_1WAY 2
>   
>   static bool do_slow_check;
> +static char bus_addr[NAME_MAX];
> +static struct pci_device *pci_dev;
>   
>   static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>   			      bool force_cpu_wc);
> @@ -1184,6 +1192,12 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
>   	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>   };
>   
> +const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
> +	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
> +	{ NULL, 19, false, "xa-l3-2way", XE_COH_AT_LEAST_1WAY },

Nit: there is no 2way+xa, so the string here is not really accurate.

> +	{ NULL, 2,  false, "2way",       XE_COH_AT_LEAST_1WAY },
> +};
> +
>   /*
>    * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
>    * PAT bits, so make sure we test with and without huge-pages. Also ensure we
> @@ -1248,6 +1262,18 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>    * Description: Check some of the xe2 pat_index modes.
>    */
>   
> +/**
> + * SUBTEST: xa-app-transient-media-off
> + * Test category: functionality test
> + * Description: Check some of the xe4-lpg pat_index modes with media off.
> + */
> +
> +/**
> + * SUBTEST:  xa-app-transient-media-on
> + * Test category: functionality test
> + * Description: Check some of the xe3p-lpg pat_index modes with media on.
> + */
> +
>   static void subtest_pat_index_modes_with_regions(int fd,
>   						 const struct pat_index_entry *modes_arr,
>   						 int n_modes)
> @@ -1561,6 +1587,53 @@ static void false_sharing(int fd)
>   	}
>   }
>   
> +static void reset(int sig)
> +{
> +	int configfs_fd;
> +
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	/* Drop all custom configfs settings from subtests */
> +	configfs_fd = igt_configfs_open("xe");
> +	if (configfs_fd >= 0)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	close(configfs_fd);
> +
> +	/* Bind again a clean driver with no custom settings */
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void xa_app_transient_test(int configfs_device_fd, bool media_on)
> +{
> +	int fd, fw_handle, gt;
> +
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	if (media_on)
> +		igt_assert(igt_sysfs_set(configfs_device_fd,
> +					 "gt_types_allowed", "primary,media"));
> +	else
> +		igt_assert(igt_sysfs_set(configfs_device_fd,
> +					 "gt_types_allowed", "primary"));
> +
> +	igt_kmod_bind("xe", bus_addr);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +
> +	/* To prevent entering into rc6 for the duration of test. */

"Prevent entering C6 for the duration of the test, since this can result 
in randomly flushing the entire device side caches, invalidating our XA 
testing."

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

But please do keep an eye on:
https://patchwork.freedesktop.org/patch/708272/?series=158017&rev=6

Anything which claims to be rejected by uAPI we will want a negative test.


> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_require(fw_handle >= 0);
> +
> +	subtest_pat_index_modes_with_regions(fd, xe3p_lpg_coherency_pat_index_modes,
> +					     ARRAY_SIZE(xe3p_lpg_coherency_pat_index_modes));
> +
> +	/* check status of c state, it should not be in c6 due to forcewake. */
> +	xe_for_each_gt(fd, gt)
> +		igt_assert(!xe_gt_is_in_c6(fd, gt));
> +
> +	close(fw_handle);
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	switch (opt) {
> @@ -1652,6 +1725,36 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   		false_sharing(fd);
>   	}
>   
> +	igt_subtest_group() {
> +		int configfs_fd, configfs_device_fd;
> +
> +		igt_fixture() {
> +			igt_require(intel_graphics_ver(dev_id) == IP_VER(35, 10));
> +
> +			pci_dev = igt_device_get_pci_device(fd);
> +			snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +				 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +			configfs_fd = igt_configfs_open("xe");
> +			igt_require(configfs_fd != -1);
> +			configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr,
> +							       S_IRWXU | S_IRGRP | S_IXGRP |
> +							       S_IROTH | S_IXOTH);
> +			igt_install_exit_handler(reset);
> +		}
> +
> +		igt_subtest_with_dynamic("xa-app-transient-media-off")
> +			xa_app_transient_test(configfs_device_fd, false);
> +
> +		igt_subtest_with_dynamic("xa-app-transient-media-on")
> +			xa_app_transient_test(configfs_device_fd, true);
> +
> +		igt_fixture() {
> +			close(configfs_device_fd);
> +			close(configfs_fd);
> +		}
> +	}
> +
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }


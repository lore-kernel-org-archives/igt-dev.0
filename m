Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4C5E6816B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 12:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7D10E4CF;
	Tue, 17 Feb 2026 12:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi29A2Zk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A610E4CF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771331442; x=1802867442;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uXpWUjS8Ut4+ATqs9k+ioIWiLMx76s+P3uT7PHZ8dLo=;
 b=Qi29A2Zka2e8JpxeM+T0IIBtYey2i/UY/OMJ5ujKTQqZh7/g7yIL50/I
 0ECWK7cJKoR2wgFMZJGQhP/dL1+Npz5dKTD1MEX1IO/7pkYeK5+SKy+kd
 7/dWyfPZ4Go+SW2tFQZmbFu97pB32Roy1OCo8h0L067pV2AQ9FAHTq6os
 xSccps0VeUlBDYkBVGTcO5e34+rgGAsLHPg9RAjDqLnPzbz9JKT7gv50b
 gEm2dnhrWUXeFG3/lBdceb3EbHCmi2JohZfYLe1nEDYvKU/dN2vOKlEIo
 bwTgtWGTcM27OlCIfLFtCnUSe/M15hydc2oBr5M12NswfrkAXWFpewk9m Q==;
X-CSE-ConnectionGUID: i84rK//sRRC0b7t07zFRdQ==
X-CSE-MsgGUID: 3UUQQdNsQyKTSyd6nVf9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="74997013"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="74997013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:30:42 -0800
X-CSE-ConnectionGUID: QYjy1SSXQkOaWr8iRZOLBQ==
X-CSE-MsgGUID: xhYyG8fjStW+8IlNHiPQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="218398573"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:30:40 -0800
Message-ID: <2967e3e4-4f55-46d2-a482-dd6db54085bc@intel.com>
Date: Tue, 17 Feb 2026 12:30:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-6-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260213084603.1404162-6-priyanka.dandamudi@intel.com>
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

On 13/02/2026 08:46, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test the scenarios when media is on/off.
> When media is off/on, for xa app transient buffer, data should be coherent
> between cpu and gpu. Coherency should be maintained from KMD side
> irrespective of media engine on/off.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

+ Thomas, in case he has some input here.

> ---
>   tests/intel/xe_pat.c | 101 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 101 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index f2dff62a9..30e427634 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -19,16 +19,24 @@
>   #include "intel_blt.h"
>   #include "intel_mocs.h"
>   #include "intel_pat.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
>   #include "linux_scaffold.h"
>   
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_util.h"
> +#include "xe/xe_gt.h"
>   
>   #define XE_COH_NONE          1
>   #define XE_COH_AT_LEAST_1WAY 2
>   
>   static bool do_slow_check;
> +static char bus_addr[NAME_MAX];
> +static struct pci_device *pci_dev;
>   
>   static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>   			      bool force_cpu_wc);
> @@ -1118,6 +1126,11 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
>   	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>   };
>   
> +const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
> +	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
> +	{ NULL, 19, false, "xa-l3-2way", XE_COH_AT_LEAST_1WAY },

Both of these are XA, so the string is not really accurate here?

Also should we maybe add 2WAY here also?

> +};
> +
>   /*
>    * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
>    * PAT bits, so make sure we test with and without huge-pages. Also ensure we
> @@ -1182,6 +1195,18 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
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
> @@ -1495,6 +1520,52 @@ static void false_sharing(int fd)
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
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);

I think comment here to explain that this is to prevent entering rc6 for 
the duration of the test, which would otherwise invoke full PPC flushes.

> +	igt_require(fw_handle >= 0);
> +
> +	subtest_pat_index_modes_with_regions(fd, xe3p_lpg_coherency_pat_index_modes,
> +					     ARRAY_SIZE(xe3p_lpg_coherency_pat_index_modes));

Ok, so this will hammer these indexes accross blt, render and dw 
(partial cache-lines), including mixing CPU/GPU access.

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
> @@ -1586,6 +1657,36 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
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

And this will repeat the above, one with Media forcibly off, and with it 
potentially on. Hopefully giving us both paths.

Some other angles to potentially consider:

1) userptr. Still TBD on the exact KMD behaviour with allowing 
non-XA/non-2WAY, or banning it. If we ban it then we should verify that. 
If we allow it, then what we could maybe do is submit a GPU workload to 
fill some userptr, then do something to trigger an invalidation to the 
CPU mapping, then read from the CPU to check that we see the GPU writes 
(this would be with Media off). KMD should flush those cachelines upon 
triggering invalidation.

2) dma-buf. Still TBD on this also. But same as above where we would 
want to add some validation for this. If this ends up being banned we 
should validate that somewhere. If allowed then I guess we need 
something to at least attempt to write to it from the GPU on importer 
side using non-xa (exported from vgem), then maybe destroy the importer 
side and read it from the CPU on exporter/native side? In theory it 
should all be flushed, so we should see the GPU writes. Thomas, any 
ideas here?

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


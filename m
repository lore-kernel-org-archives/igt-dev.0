Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B44FC44532
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 13:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E110E34C;
	Tue, 21 Jul 2026 13:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDE2PdSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73110E349
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784640501; x=1816176501;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cuWsxx61L6bZTcn0gN2/iHbhD6L1ojhAeG0d16yaViA=;
 b=SDE2PdSj0X8Ljpr77dKEbnNcmq2eG+WdmCLvyVGpZNUCZkID5vTFHdVm
 yY9YFV/cVuKXwuVcOe7oENgD5gRznTFN8uAsOqrslKQ3/Oh/xL1ILgeca
 q5vTW3x5KdJcBeiqRgKTkR4ss9Qt3zawDA8YDV35rs+vlCFEO5zGXfeJS
 mBG/GuF7vpaPnYPMeWCytFR0c+wIEfPVXdZtHqv0gG0wY+nVPV3ksNRB0
 G3lIHULCFWPNDW2Xk4ViH0fugkMvlsfpHaMmBsJUOlNsMnJpt/rK8heLz
 i/sIJ12V3zE5Vpuih83JlBA98GsmbvfoD1N7PW2W30bDcHGenp/v48R/N g==;
X-CSE-ConnectionGUID: KQmilrdtSmCEqFxnak28qA==
X-CSE-MsgGUID: cNFqCvk8QyG1kE/t6Ibtmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96757068"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96757068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:28:20 -0700
X-CSE-ConnectionGUID: vDB1XCiQR12vFo3CWvNFjA==
X-CSE-MsgGUID: CyMaGH6ESKWrbAgxGnt16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="251436143"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:28:18 -0700
Message-ID: <644d9054-0171-4358-9dcb-ba8daa7ede05@linux.intel.com>
Date: Tue, 21 Jul 2026 15:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/sriov_basic: Validate PF unbind with VFs enabled
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, jakub1.kolakowski@intel.com,
 adam.miszczak@linux.intel.com
References: <20260717134406.2627519-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260717134406.2627519-1-lukasz.laguna@intel.com>
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


On 7/17/2026 3:44 PM, Lukasz Laguna wrote:
> Add new subtests covering PF driver unbind with VFs enabled in two
> scenarios:
> - with all VFs enabled,
> - with one VF enabled and probed.
>
> The tests verify that PF ends up unbound and VFs are disabled.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/sriov_basic.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 1e563cee9..1c5bb878e 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -3,8 +3,13 @@
>    * Copyright(c) 2023 Intel Corporation. All rights reserved.
>    */
>   
> +#include <limits.h>
> +#include <dirent.h>
> +
>   #include "drmtest.h"
>   #include "igt_core.h"
> +#include "igt_device.h"
> +#include "igt_pci.h"
>   #include "igt_sriov_device.h"
>   
>   IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
> @@ -118,6 +123,51 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
>   	igt_sriov_disable_vfs(pf_fd);
>   }
>   
> +static unsigned int count_pci_virtfn_entries(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	unsigned int count = 0;
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s", pci_slot);
> +	dir = opendir(path);
> +	igt_assert_f(dir, "Failed to open %s\n", path);
> +
> +	while ((de = readdir(dir))) {
> +		if (!strncmp(de->d_name, "virtfn", strlen("virtfn")))
> +			count++;
> +	}
> +
> +	closedir(dir);
> +
> +	return count;
> +}
> +
> +/**
> + * SUBTEST: pf-unbind-with-vfs-enabled-numvfs-all
> + * Description:
> + *   Verify the PF driver unbind when all VFs are enabled.
> + *
> + * SUBTEST: pf-unbind-with-vf-probed
> + * Description:
> + *   Verify the PF driver unbind when one VF is enabled and probed.
> + */
> +static void pf_unbind_with_vfs_enabled(int pf_fd, unsigned int num_vfs, bool vf_probe)
> +{
> +	char pci_slot[NAME_MAX];
> +
> +	vf_probe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +		   igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	igt_device_get_pci_slot_name(pf_fd, pci_slot);
> +	igt_assert_eq(count_pci_virtfn_entries(pci_slot), num_vfs);
> +	igt_assert(!igt_pci_device_unbind(pci_slot));
Is hot-unbind with the PF fd kept open intentional ?
> +	igt_assert(!igt_pci_get_bound_driver_name(pci_slot, NULL, 0));
> +	igt_assert_eq(count_pci_virtfn_entries(pci_slot), 0);
> +}
> +
>   int igt_main()
>   {
>   	int pf_fd;
> @@ -210,7 +260,39 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_subtest_group() {
> +		char pci_slot[NAME_MAX];
> +		char driver[NAME_MAX];
> +
> +		igt_fixture() {
> +			igt_device_get_pci_slot_name(pf_fd, pci_slot);
> +			igt_assert(igt_pci_get_bound_driver_name(pci_slot, driver, sizeof(driver)));
> +		}
> +
> +		igt_describe("Test unbinds the PF driver when all VFs are enabled");
> +		igt_subtest("pf-unbind-with-vfs-enabled-numvfs-all") {
> +			for_max_sriov_num_vfs(pf_fd, num_vfs) {
> +				pf_unbind_with_vfs_enabled(pf_fd, num_vfs, false);
> +			}
> +		}
> +
> +		igt_describe("Test unbinds the PF driver when one VF is enabled and probed");
> +		igt_subtest("pf-unbind-with-vf-probed") {
> +			pf_unbind_with_vfs_enabled(pf_fd, 1, true);
> +		}
> +
> +		igt_fixture() {
> +			if (!igt_pci_get_bound_driver_name(pci_slot, NULL, 0)) {
> +				close(pf_fd);
> +				pf_fd = -1;
> +				igt_assert(!igt_pci_driver_bind(driver, pci_slot));
> +				pf_fd = drm_open_driver(DRIVER_ANY);
We should ensure we reopen the same PF device, especially in multi-GPU 
configurations, by setting a device filter as in igt@core_hotunplug.
> +			}
> +		}
> +	}
> +
>   	igt_fixture() {
> +		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");

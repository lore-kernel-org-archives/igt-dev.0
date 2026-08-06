Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD533C55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 10:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682B710E2DF;
	Thu,  6 Aug 2026 10:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVrMh1b6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D899D10E2DF
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786011149; x=1817547149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GP9YnK3/FKqKRKvOdHdMt69Xq3cX1i6gGvwWDX2IFKQ=;
 b=bVrMh1b6Huz5WqHqzDpBcDz3UezjFH93PxgYqN9TUijLozjNSfnqjVWC
 ngQnixpGEgIYmueHFjJHopPtqElM35bwIHcnw6k97/I0B6Wll4AF19Bto
 6W8V7mu2u9R73a9oP7nkSI7Txd3C3jF49i7jcMq8maY/isSrxqAfpFiHp
 6/vz4gYKf9LP5w7IjdL/7Qul73TdZSrypmc5CY4x95eyX0MpPlACtHu27
 /x73Vq+2fvW49sbIP+0KjpsIDHKHqkiqu/s/ApdUzcQ6SNuPyG9k9XWfk
 bT22COMuB7EoQL6Rjjy3v3Adf0QhnhyOUizha5nmrq3AnORuRykVplcdv A==;
X-CSE-ConnectionGUID: XvsYOuAsTO2HygFu6qSgsA==
X-CSE-MsgGUID: iBCPdqBUTT+JMAny1pOE7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="112154130"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="112154130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 03:12:28 -0700
X-CSE-ConnectionGUID: ReOj7WpzTUK3JAOwglEG8w==
X-CSE-MsgGUID: 8EfsFSxmQDK5jmhnf27D1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="255803842"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 03:12:27 -0700
Message-ID: <582e9353-c5e4-4257-acce-be88bf55ff50@linux.intel.com>
Date: Thu, 6 Aug 2026 12:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] tests/sriov_basic: Validate PF unbind with VFs
 enabled
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
References: <20260806100332.1228103-1-lukasz.laguna@intel.com>
 <20260806100332.1228103-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260806100332.1228103-3-lukasz.laguna@intel.com>
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


On 8/6/2026 12:03 PM, Lukasz Laguna wrote:
> Add new subtests covering PF driver unbind with VFs enabled in two
> scenarios:
> - with all VFs enabled,
> - with one VF enabled and probed.
>
> The tests verify that PF ends up unbound and VFs are disabled.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v4:
>   - Fix unspecified values of local variables after longjmp (Marcin)
> ---
>   tests/sriov_basic.c | 98 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 1e563cee9..050d209b1 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -3,8 +3,13 @@
>    * Copyright(c) 2023 Intel Corporation. All rights reserved.
>    */
>   
> +#include <dirent.h>
> +
>   #include "drmtest.h"
>   #include "igt_core.h"
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
> +#include "igt_pci.h"
>   #include "igt_sriov_device.h"
>   
>   IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
> @@ -118,10 +123,71 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
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
> +static void pf_unbind_with_vfs_enabled(int *pf_fd, unsigned int num_vfs, bool vf_probe)
> +{
> +	char pci_slot[NAME_MAX];
> +
> +	vf_probe ? igt_sriov_enable_driver_autoprobe(*pf_fd) :
> +		   igt_sriov_disable_driver_autoprobe(*pf_fd);
> +	igt_sriov_enable_vfs(*pf_fd, num_vfs);
> +
> +	igt_device_get_pci_slot_name(*pf_fd, pci_slot);
> +	igt_assert_eq(count_pci_virtfn_entries(pci_slot), num_vfs);
> +	igt_assert(!drm_close_driver(*pf_fd));
> +	*pf_fd = -1;
> +	igt_assert(!igt_pci_device_unbind(pci_slot));
> +	igt_assert(!igt_pci_get_bound_driver_name(pci_slot, NULL, 0));
> +	igt_assert_eq(count_pci_virtfn_entries(pci_slot), 0);
> +}
> +
> +static void restore_pf_after_unbind(int *pf_fd, const char *pci_slot, const char *driver)
> +{
> +	int ret;
> +
> +	ret = igt_pci_get_bound_driver_name(pci_slot, NULL, 0);
> +	if (!ret)
> +		igt_assert(!igt_pci_driver_bind(driver, pci_slot));
> +	else
> +		igt_assert_eq(ret, 1);
> +
> +	if (*pf_fd < 0)
> +		*pf_fd = drm_open_driver(DRIVER_ANY);
> +}
> +
>   int igt_main()
>   {
> -	int pf_fd;
> -	bool autoprobe;
> +	static int pf_fd = -1;
> +	static bool autoprobe;
>   
>   	igt_fixture() {
>   		pf_fd = drm_open_driver(DRIVER_ANY);
> @@ -210,7 +276,35 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_subtest_group() {
> +		static char pci_slot[NAME_MAX];
> +		static char driver[NAME_MAX];
> +
> +		igt_fixture() {
> +			igt_device_set_filter_from_fd(pf_fd);
> +			igt_device_get_pci_slot_name(pf_fd, pci_slot);
> +			igt_assert(igt_pci_get_bound_driver_name(pci_slot, driver, sizeof(driver)));
> +		}
> +
> +		igt_describe("Test unbinds the PF driver when all VFs are enabled");
> +		igt_subtest("pf-unbind-with-vfs-enabled-numvfs-all") {
> +			for_max_sriov_num_vfs(pf_fd, num_vfs) {
> +				pf_unbind_with_vfs_enabled(&pf_fd, num_vfs, false);
> +			}
> +		}
> +
> +		igt_describe("Test unbinds the PF driver when one VF is enabled and probed");
> +		igt_subtest("pf-unbind-with-vf-probed") {
> +			pf_unbind_with_vfs_enabled(&pf_fd, 1, true);
> +		}
> +
> +		igt_fixture() {
> +			restore_pf_after_unbind(&pf_fd, pci_slot, driver);
> +		}
> +	}
> +
>   	igt_fixture() {
> +		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>


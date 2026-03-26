Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2538A10A1E7C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708F10E98A;
	Thu, 26 Mar 2026 11:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGQUkH2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3E710E982
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774525321; x=1806061321;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9BG5sQZHf3vuL1D4Lmch4vsYDzm1Oo4DvZsqfLsUKWc=;
 b=CGQUkH2jKbZ3y1qnHYOBH7D/Y8bKcZxNErB4W5QbLKZV9S1JmHpbp20I
 fQbQ72TdXb2QAq5wYwlU8d/heRCaxBft6YxXQCn0eOq+rwx0Y9iW23ZJu
 0T67OodH1UzxZ0nQ4x18PtozM3VPLZloR1tKalt2AGMnYn1Fv75Yzj2Dl
 hFtW+6wzd5nlJy0lnuWBuEnWhxa+U9PhVsCSAISmosj71pEQxPhlZ1Npt
 ybwmDd1MdUsJ0IUzpw/Kagb769yPuXcfgyc16xcYMR8L4JxYcegesHiAr
 iUAsJ8OI8akL4TQCaIlTugkr5awWapvUtFWW/YRG/qf1h98fNZKwxICvB g==;
X-CSE-ConnectionGUID: ++mQc/TYQCGS/f5gBEVJxg==
X-CSE-MsgGUID: pJ3r+C4DRxS2efB39tzCcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74762147"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74762147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:42:01 -0700
X-CSE-ConnectionGUID: fCLr2Q8BT16RNffYYkQyRw==
X-CSE-MsgGUID: vfqYiA5BQ8eyINvZVC4GQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229429027"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO [10.246.16.239])
 ([10.246.16.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:41:59 -0700
Message-ID: <8d4b9edb-0aee-4cce-b611-b93ba64860de@linux.intel.com>
Date: Thu, 26 Mar 2026 12:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_sriov_vfio: Add module
 load/unload subtests
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-2-marcin.bernatowicz@linux.intel.com>
 <756e09f7-c2b9-4529-92b7-ad00ecac3d53@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <756e09f7-c2b9-4529-92b7-ad00ecac3d53@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 3/24/2026 2:54 PM, Laguna, Lukasz wrote:
>
> On 3/18/2026 17:14, Marcin Bernatowicz wrote:
>> Introduce subtests that verify xe_vfio_pci can be loaded and unloaded,
>> while reporting already-loaded or already-unloaded initial state as
>> success. The unload path still skips when xe-vfio-pci has bound devices,
>> to avoid attempting removal while the driver is in use.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_vfio.c | 88 +++++++++++++++++++++++++++++++++++++
>>   tests/meson.build           |  1 +
>>   2 files changed, 89 insertions(+)
>>   create mode 100644 tests/intel/xe_sriov_vfio.c
>>
>> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
>> new file mode 100644
>> index 000000000..2fe0137e1
>> --- /dev/null
>> +++ b/tests/intel/xe_sriov_vfio.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#include <ctype.h>
>> +#include <dirent.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_kmod.h"
>> +
>> +/**
>> + * TEST: xe_sriov_vfio
>> + * Category: Core
>> + * Mega feature: SR-IOV
>> + * Sub-category: SR-IOV VFIO
>> + * Functionality: VFIO module
>> + * Description: Verify basic xe-vfio-pci module operations.
>> + *
>> + * SUBTEST: load-xe-vfio-pci
>> + * Description: Attempt to load xe_vfio_pci module.
>> + *
>> + * SUBTEST: unload-xe-vfio-pci
>> + * Description: Attempt to unload xe_vfio_pci module (skips if busy).
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
>> +
>> +static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
>> +static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
>> +
>> +static bool pci_driver_has_any_bound_devices(const char *driver)
>> +{
>> +    char path[PATH_MAX];
>> +    DIR *dir;
>> +    struct dirent *de;
>> +
>> +    snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
>> +    dir = opendir(path);
>> +    if (!dir)
>> +        return false;
>> +
>> +    while ((de = readdir(dir))) {
>> +        if (de->d_type != DT_LNK)
>> +            continue;
>> +        if (!isdigit(de->d_name[0]))
>> +            continue;
>> +
>> +        closedir(dir);
>> +        return true;
>> +    }
>> +
>> +    closedir(dir);
>> +    return false;
>> +}
>> +
>> +int igt_main()
>> +{
>> +    igt_describe("Attempt to load xe_vfio_pci module.");
>> +    igt_subtest("load-xe-vfio-pci") {
>> +        int ret;
>> +
>> +        if (igt_kmod_is_loaded(XE_VFIO_PCI_MOD))
>> +            igt_info("%s already loaded\n", XE_VFIO_PCI_MOD);
>
> I think it would be better to skip in such case.

This may be problematic in CI and depends on tests execution order and 
configuration.

> And igt_kmod_load will print "Module %s already inserted\n", so this 
> info seems to be redundant anyway.
igt_kmod_load does not print that info if no options are passed, which 
is our case.
>
>
>> +
>> +        ret = igt_kmod_load(XE_VFIO_PCI_MOD, NULL);
>> +        igt_assert_f(ret == 0, "Failed to load %s (%d)\n", 
>> XE_VFIO_PCI_MOD, ret);
>> +        igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD));
>> +    }
>> +
>> +    igt_describe("Attempt to unload xe_vfio_pci module (skips if 
>> busy).");
>> +    igt_subtest("unload-xe-vfio-pci") {
>> +        int ret;
>> +
>> +        if (!igt_kmod_is_loaded(XE_VFIO_PCI_MOD)) {
>> +            igt_info("%s already unloaded\n", XE_VFIO_PCI_MOD);
>> +            igt_success();
>
> Maybe it would be better to have one subtest "xe-vfio-pci-load-unload" ?

If we do not need load/unload tests leaving the driver loaded/unloaded 
then we can do this

and simplify some other parts.

>> +        }
>> +
>> +        if (pci_driver_has_any_bound_devices(XE_VFIO_PCI_DRV))
>> +            igt_skip("%s has bound devices; not attempting 
>> unload\n", XE_VFIO_PCI_DRV);
>> +
>> +        ret = igt_kmod_unload(XE_VFIO_PCI_MOD);
>> +        igt_assert_f(ret == 0, "Failed to unload %s (%d)\n", 
>> XE_VFIO_PCI_MOD, ret);
>> +        igt_assert_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD), "%s still 
>> loaded\n",
>> +                 XE_VFIO_PCI_MOD);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index cecb4a8ae..26d9345ec 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -337,6 +337,7 @@ intel_xe_progs = [
>>       'xe_sriov_admin',
>>       'xe_sriov_auto_provisioning',
>>       'xe_sriov_flr',
>> +    'xe_sriov_vfio',
>>       'xe_sriov_scheduling',
>>           'xe_survivability',
>>       'xe_sriov_vram',

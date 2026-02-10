Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2567BE7E0DB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 11:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF69610E555;
	Tue, 10 Feb 2026 11:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0B/2/Kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD55910E555
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770722632; x=1802258632;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xc7b2HHl3MxpwuMQJOq1Y8uNqnn2hqUkWMYSAuDvDeI=;
 b=c0B/2/Kjgn2CPDU3QlpaUl2m7vljgiw/+0xuOzX8xOJHo7KEVv2ZEYCz
 vlDNxH/sfTgv2nqz55Ch0mqvLuwI0Iq82ZMwFVMhnvq9uoRudcY8TRzMx
 hJyFOkjx0E5adwuheF5hgtFbVQleiMI9Ndtk3HzDhLiAM9vqI4Z47Q4Zt
 pT0GsFbG0hBCs/3SCKi4M0NFBr1YWcmkE2Dn+OSRPDlwPtfSX0ZQLDPa+
 W4ttWqQPBBnN1bQ4/50q0mvbhUT8MU7mVhElQ7RC8+mJixDNGPHbT0jJ+
 SVqGk5qH4eO0HNmn161NpwjWG86cuUcYhZdCyCYMtQ7BDbpRomcusq8+U A==;
X-CSE-ConnectionGUID: 3cMX9lQESgCj2tWItAYY3g==
X-CSE-MsgGUID: GslA8Q2/QnKWRDheu1Xf8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83286631"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83286631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:23:52 -0800
X-CSE-ConnectionGUID: tp7/SH4RRmya2/ERArCFGA==
X-CSE-MsgGUID: CVE6r2q8TWmOcp4FgLQ/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216856309"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.57])
 ([172.28.182.57])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 03:23:50 -0800
Message-ID: <bf66b0d7-d0d6-466e-ab9b-f6bc60cf8dec@linux.intel.com>
Date: Tue, 10 Feb 2026 12:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 7/7] tests/intel/xe_sriov_flr: Skip xe-vfio-pci
 load/bind when IOMMU is off
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-8-marcin.bernatowicz@linux.intel.com>
 <17a502c4-87ec-40dd-b45f-72201485bc16@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <17a502c4-87ec-40dd-b45f-72201485bc16@intel.com>
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


On 2/9/2026 11:42 AM, Laguna, Lukasz wrote:
>
> On 2/4/2026 17:32, Marcin Bernatowicz wrote:
>> When the IOMMU is disabled VFs typically lack an iommu_group, and
>> xe-vfio-pci binding may fail. Skip load/bind in that case.
>
> I'm not sure if checking for IOMMU groups is enough.
> I think it's possible that the device has the IOMMU group and vfio-pci 
> still fail to bind if e.g. CONFIG_VFIO_IOMMU_TYPE1 is disabled.
>
> We have a control on the environment where test is executed, so I'm 
> not sure if this patch is needed. We prefer to use the approach with 
> xe-vfio-pci, so if it fails because of the system configuration than I 
> think it would be better to fix the configuration.


Maybe it's good time to add xe_sriov_vfio test with some basic checks:

igt@xe_sriov_vfio@load-xe-vfio-pci
igt@xe_sriov_vfio@unload-xe-vfio-pci
igt@xe_sriov_vfio@bind-unbind-vf
igt@xe_sriov_vfio@open-basic

?

>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>   tests/intel/xe_sriov_flr.c | 43 +++++++++++++++++++++++++++++++++++---
>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>> index b73727787..3fc84bbf9 100644
>> --- a/tests/intel/xe_sriov_flr.c
>> +++ b/tests/intel/xe_sriov_flr.c
>> @@ -13,6 +13,7 @@
>>   #include "igt_kmod.h"
>>   #include "igt_pci.h"
>>   #include "igt_sriov_device.h"
>> +#include "igt_sysfs.h"
>>   #include "intel_chipset.h"
>>   #include "intel_vram.h"
>>   #include "linux_scaffold.h"
>> @@ -325,6 +326,44 @@ static void vf_unbind_driver_override(int pf_fd, 
>> unsigned int vf_id)
>>       free(slot);
>>   }
>>   +static bool vf_has_iommu_group(int pf_fd, unsigned int vf_id)
>> +{
>> +    int sysfs;
>> +    bool present;
>> +
>> +    sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_id);
>> +    if (sysfs < 0)
>> +        return false;
>> +
>> +    present = igt_sysfs_has_attr(sysfs, "iommu_group");
>> +    close(sysfs);
>> +
>> +    return present;
>> +}
>> +
>> +static bool vfs_have_iommu_groups(int pf_fd, int num_vfs)
>> +{
>> +    for (int vf_id = 1; vf_id <= num_vfs; vf_id++)
>> +        if (!vf_has_iommu_group(pf_fd, vf_id))
>> +            return false;
>> +
>> +    return true;
>> +}
>> +
>> +static bool try_load_xe_vfio_pci(int pf_fd, int num_vfs)
>> +{
>> +    if (!g_use_xe_vfio_pci)
>> +        return false;
>> +
>> +    if (!vfs_have_iommu_groups(pf_fd, num_vfs)) {
>> +        igt_info("Disabling xe-vfio-pci binding: missing VF IOMMU 
>> group(s) (IOMMU off?)\n");
>> +        g_use_xe_vfio_pci = false;
>> +        return false;
>> +    }
>> +
>> +    return igt_kmod_load("xe_vfio_pci", NULL) >= 0;
>> +}
>> +
>>   /**
>>    * flr_exec_strategy - Function pointer for FLR execution strategy
>>    * @pf_fd: File descriptor for the Physical Function (PF).
>> @@ -386,9 +425,7 @@ static void verify_flr(int pf_fd, int num_vfs, 
>> struct subcheck *checks,
>>       if (igt_warn_on(igt_pci_system_reinit()))
>>           goto disable_vfs;
>>   -    xe_vfio_loaded = false;
>> -    if (g_use_xe_vfio_pci)
>> -        xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
>> +    xe_vfio_loaded = try_load_xe_vfio_pci(pf_fd, num_vfs);
>>       if (xe_vfio_loaded) {
>>           vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
>>           igt_assert(vf_bound);

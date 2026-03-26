Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A3810A1E7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83010E97F;
	Thu, 26 Mar 2026 11:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me8DnNNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528410E97F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774525502; x=1806061502;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=37BaoBGLz6arpP50T+NSmVy3M2AYDpdomsabtzDYhJc=;
 b=Me8DnNNMJRDlRBQx0NZY3QxFYR08RNldGLBut1SzzSbrEa3q891sHYsb
 tF2Dcp0oieAmKctsWCNbqnjxkJYaJE5+8Nfty3uetCEqgFlHqLtzoUG6D
 qXCUM553MahwzHeZ04v2UsN2jAwxShjo7uOIYB7l+b9GkjOqgvYId9Vik
 Hb1Eubjk5HC6EKxxTD5S5mTN02V4JAIQeWvXZSRmDJXxWh8mA1vDZHQDb
 XJ4p8V0g57iwcsPsuUxNjHFuZyGyCycB7/jpTFwiD7wMX/VbjiYeN4CP5
 hMvcqObK25bg7YJEHmPQez+fQpHxNEDoVb+fOQ606sGJqyCsW08jxzXTN A==;
X-CSE-ConnectionGUID: Tpzdz8KzRQKHmM+hnMl9Ug==
X-CSE-MsgGUID: BYca3VAKQpS7yVRcl1JFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74762401"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="74762401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:45:01 -0700
X-CSE-ConnectionGUID: LH0U+HeiSFaoL39RNuE7KQ==
X-CSE-MsgGUID: Y6bo/pWfSgSMIVLZKDckJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229429494"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO [10.246.16.239])
 ([10.246.16.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:45:00 -0700
Message-ID: <5f733529-87fe-4c67-90a0-4f89f1a4af02@linux.intel.com>
Date: Thu, 26 Mar 2026 12:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_sriov_vfio: Add open-basic
 subtest
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-4-marcin.bernatowicz@linux.intel.com>
 <37cf5ef3-6247-4c2a-bb24-25b640a929bf@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <37cf5ef3-6247-4c2a-bb24-25b640a929bf@intel.com>
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


On 3/24/2026 3:17 PM, Laguna, Lukasz wrote:
>
> On 3/18/2026 17:14, Marcin Bernatowicz wrote:
>> The subtest binds a VF to xe-vfio-pci, opens its VFIO group, and
>> verifies basic VFIO access with a minimal group status query. This
>> provides a simple smoke test for VFIO device setup.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_vfio.c | 136 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>
>> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
>> index a2b2959e2..6a5cc536b 100644
>> --- a/tests/intel/xe_sriov_vfio.c
>> +++ b/tests/intel/xe_sriov_vfio.c
>> @@ -6,6 +6,8 @@
>>   #include <ctype.h>
>>   #include <dirent.h>
>>   #include <fcntl.h>
>> +#include <linux/vfio.h>
>> +#include <sys/ioctl.h>
>>     #include "drmtest.h"
>>   #include "igt_core.h"
>> @@ -29,6 +31,9 @@
>>    *
>>    * SUBTEST: bind-unbind-vfs
>>    * Description: Enable VFs and bind/unbind each one to xe-vfio-pci 
>> via driver_override.
>> + *
>> + * SUBTEST: open-basic
>> + * Description: Bind VF to xe-vfio-pci and perform minimal VFIO 
>> group open and status ioctl.
>>    */
>>     IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
>> @@ -199,6 +204,109 @@ static void restore_xe_vfio_module(void)
>>       restore_xe_vfio_on_exit = false;
>>   }
>>   +static bool vf_iommu_group_id_alloc(const char *pci_slot, char 
>> **out_group_id)
>> +{
>> +    char path[PATH_MAX];
>> +    char link[PATH_MAX];
>> +    ssize_t len;
>> +    const char *base;
>> +
>> +    igt_assert(out_group_id);
>> +    *out_group_id = NULL;
>> +
>> +    snprintf(path, sizeof(path), 
>> "/sys/bus/pci/devices/%s/iommu_group", pci_slot);
>> +    len = readlink(path, link, sizeof(link) - 1);
>> +    if (len < 0)
>> +        return false;
>> +
>> +    link[len] = '\0';
>> +    base = strrchr(link, '/');
>> +    if (!base || !base[1])
>> +        return false;
>> +
>> +    *out_group_id = strdup(base + 1);
>> +    igt_assert(*out_group_id);
>> +
>> +    return true;
>> +}
>> +
>> +struct vfio_dev_fds {
>> +    int container_fd;
>> +    int group_fd;
>> +    int device_fd;
>> +    char *group_id;
>> +};
>> +
>> +static void vfio_open_group(const char *pci_slot, struct 
>> vfio_dev_fds *out,
>> +                struct vfio_group_status *out_group_status)
>> +{
>> +    char group_path[PATH_MAX];
>> +    int ret;
>> +
>> +    igt_assert(out);
>> +    *out = (struct vfio_dev_fds){
>> +        .container_fd = -1,
>> +        .group_fd = -1,
>> +        .device_fd = -1,
>> +        .group_id = NULL,
>> +    };
>> +
>> +    if (out_group_status)
>> +        *out_group_status = (struct vfio_group_status){
>> +                    .argsz = sizeof(*out_group_status)
>> +                    };
>> +
>> +    if (!vf_iommu_group_id_alloc(pci_slot, &out->group_id))
>> +        igt_skip("No IOMMU group (IOMMU disabled or not exposed)\n");
>> +
>> +    out->container_fd = open("/dev/vfio/vfio", O_RDWR | O_CLOEXEC);
>> +    if (out->container_fd < 0)
>> +        igt_skip("/dev/vfio/vfio not available\n");
>> +
>> +    snprintf(group_path, sizeof(group_path), "/dev/vfio/%s", 
>> out->group_id);
>> +    out->group_fd = open(group_path, O_RDWR | O_CLOEXEC);
>> +    igt_require_f(out->group_fd >= 0, "Failed to open %s (%d)\n", 
>> group_path, -errno);
>> +
>> +    if (out_group_status) {
>> +        ret = ioctl(out->group_fd, VFIO_GROUP_GET_STATUS, 
>> out_group_status);
>> +        igt_require_f(ret == 0, "VFIO_GROUP_GET_STATUS failed 
>> (%d)\n", -errno);
>> +    }
>> +}
>> +
>> +static void vfio_close_device(struct vfio_dev_fds *fds)
>> +{
>> +    if (!fds)
>> +        return;
>> +
>> +    if (fds->device_fd >= 0)
>> +        close(fds->device_fd);
>> +
>> +    if (fds->group_fd >= 0 && fds->container_fd >= 0)
>> +        ioctl(fds->group_fd, VFIO_GROUP_UNSET_CONTAINER, 
>> &fds->container_fd);
>> +
>> +    if (fds->group_fd >= 0)
>> +        close(fds->group_fd);
>> +    if (fds->container_fd >= 0)
>> +        close(fds->container_fd);
>> +
>> +    free(fds->group_id);
>> +
>> +    fds->container_fd = -1;
>> +    fds->group_fd = -1;
>> +    fds->device_fd = -1;
>> +    fds->group_id = NULL;
>> +}
>> +
>> +static void vfio_open_basic(const char *pci_slot)
>> +{
>> +    struct vfio_dev_fds fds;
>> +    struct vfio_group_status group_status;
>> +
>> +    vfio_open_group(pci_slot, &fds, &group_status);
>> +    igt_info("VFIO group %s status flags=0x%x\n", fds.group_id, 
>> group_status.flags);
>> +    vfio_close_device(&fds);
>> +}
>> +
>>   int igt_main()
>>   {
>>       igt_fixture() {
>> @@ -250,6 +358,34 @@ int igt_main()
>>           }
>>       }
>>   +    igt_describe("Bind VF to xe-vfio-pci and do minimal VFIO open 
>> and GET_STATUS.");
>> +    igt_subtest("open-basic") {
>> +        char *slot = NULL;
>> +
>> +        igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
>> +                  "Failed to load %s\n", XE_VFIO_PCI_MOD);
>> +        restore_xe_vfio_on_exit = true;
>> +
>> +        open_pf();
>> +
>> +        igt_sriov_disable_driver_autoprobe(pf_fd);
>> +        igt_sriov_enable_vfs(pf_fd, 1);
>
> Maybe vf_num = 1 and then use variable?
ok
>
>> +
>> +        igt_require_f(!igt_pci_system_reinit(), "Failed to refresh 
>> PCI state\n");
>> +        igt_sriov_enable_driver_autoprobe(pf_fd);
>> +
>> +        slot = vf_pci_slot_alloc(1);
>> +
>> +        vf_unbind_override(1);
>
> The same as in previous patch - is this unbind needed?
can be removed, thanks
>
>> +        vf_bind_override(1, XE_VFIO_PCI_DRV);
>> +
>> +        vfio_open_basic(slot);
>> +
>> +        vf_unbind_override(1);
>> +        free(slot);
>> +        igt_sriov_disable_vfs(pf_fd);
>> +    }
>> +
>>       igt_fixture() {
>>           cleanup_pf();
>>           restore_xe_vfio_module();

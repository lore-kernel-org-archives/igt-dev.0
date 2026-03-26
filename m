Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5F210A1E81
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812FF10E9B0;
	Thu, 26 Mar 2026 11:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VN0jLJe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408A910E9AD
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774525796; x=1806061796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gEYdoBtaMaZ3LbyOdMNcvpzl3jgaOU8oF2KwLy5yiuM=;
 b=VN0jLJe59nzNLy/fMJIV4VVi03vnlGsssOjhjumR2p+ulnBIOBnergFt
 iofBZGZzax0C0u20ucHEroGefpK525PeEQKhh3WzLkStiY66AaY0sm8JX
 mqJO11/yONaRshXeWPdf+NFmypbUx/iDtT+yYNFIFdts3DdOHIKcsTAx4
 FCgY9ML8mWayhNjE3R1lnLVjPul5flP2MzhCCanzmLvXRDlBXHF2Pl0rw
 2fPMGf5ZQ5cADdPfNiQ/6evkDfP0nTEvc5hQ/7vUij+GC6cNp7Bxy/5vA
 4SG2o9n56Yog+u8Fei7DRBpQloAxvWzVEwnj36SYOelYS+JL/xwr2roQx Q==;
X-CSE-ConnectionGUID: odDj4HlATT2C0SE7/77erw==
X-CSE-MsgGUID: jFfPz4eIQ0WJic6+yW2o0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79178659"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="79178659"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:49:56 -0700
X-CSE-ConnectionGUID: qXsIYKBRSHGcFdxSiWkvOQ==
X-CSE-MsgGUID: zyoc5LYEQiO/vWm4cLPVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220132184"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO [10.246.16.239])
 ([10.246.16.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:49:53 -0700
Message-ID: <54099c57-2c66-43b3-b74d-db3b2ad621c4@linux.intel.com>
Date: Thu, 26 Mar 2026 12:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_sriov_vfio: Add dynamic
 bind-unbind-vfs subtest
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
 <20260318161447.961840-3-marcin.bernatowicz@linux.intel.com>
 <1c217884-ad18-4731-a1f8-2f8b0f9efe7d@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <1c217884-ad18-4731-a1f8-2f8b0f9efe7d@intel.com>
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


On 3/24/2026 3:14 PM, Laguna, Lukasz wrote:
>
> On 3/18/2026 17:14, Marcin Bernatowicz wrote:
>> For each supported numvfs-N configuration, enable N VFs and
>> bind/unbind each VF to xe-vfio-pci through driver_override.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_vfio.c | 169 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 169 insertions(+)
>>
>> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
>> index 2fe0137e1..a2b2959e2 100644
>> --- a/tests/intel/xe_sriov_vfio.c
>> +++ b/tests/intel/xe_sriov_vfio.c
>> @@ -5,9 +5,13 @@
>>     #include <ctype.h>
>>   #include <dirent.h>
>> +#include <fcntl.h>
>>   +#include "drmtest.h"
>>   #include "igt_core.h"
>>   #include "igt_kmod.h"
>> +#include "igt_pci.h"
>> +#include "igt_sriov_device.h"
>>     /**
>>    * TEST: xe_sriov_vfio
>> @@ -22,13 +26,23 @@
>>    *
>>    * SUBTEST: unload-xe-vfio-pci
>>    * Description: Attempt to unload xe_vfio_pci module (skips if busy).
>> + *
>> + * SUBTEST: bind-unbind-vfs
>> + * Description: Enable VFs and bind/unbind each one to xe-vfio-pci 
>> via driver_override.
>>    */
>>     IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
>>   +#define DRIVER_OVERRIDE_TIMEOUT_MS 200
>> +
>>   static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
>>   static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
>>   +static int pf_fd = -1;
>> +static bool autoprobe;
>> +static bool xe_vfio_loaded_initially;
>> +static bool restore_xe_vfio_on_exit;
>> +
>>   static bool pci_driver_has_any_bound_devices(const char *driver)
>>   {
>>       char path[PATH_MAX];
>> @@ -54,8 +68,143 @@ static bool 
>> pci_driver_has_any_bound_devices(const char *driver)
>>       return false;
>>   }
>>   +static void assert_bound_driver_is(const char *pci_slot, const 
>> char *expected)
>
> I think it would be better to have two helpers: assert_driver_bound() 
> and assert_driver_unbound()
>
>> +{
>> +    char bound[64];
>> +    int ret;
>> +
>> +    ret = igt_pci_get_bound_driver_name(pci_slot, bound, 
>> sizeof(bound));
>> +    igt_assert_f(ret >= 0, "Failed to read bound driver for %s 
>> (%d)\n", pci_slot, ret);
>> +
>> +    if (!expected) {
>> +        igt_assert_f(ret == 0, "Expected %s to be unbound, but is 
>> bound to %s\n",
>> +                 pci_slot, bound);
>> +        return;
>> +    }
>> +
>> +    igt_assert_f(ret > 0, "Expected %s to be bound to %s, but it is 
>> unbound\n",
>> +             pci_slot, expected);
>> +    igt_assert_f(!strcmp(bound, expected), "Expected %s to be bound 
>> to %s, got %s\n",
>> +             pci_slot, expected, bound);
>> +}
>> +
>> +static char *vf_pci_slot_alloc(unsigned int vf_id)
>> +{
>> +    char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
>> +
>> +    igt_assert_f(slot, "Failed to get VF%u PCI slot\n", vf_id);
>> +    return slot;
>> +}
>> +
>> +static void vf_bind_override(unsigned int vf_id, const char *driver)
>> +{
>> +    char *slot = vf_pci_slot_alloc(vf_id);
>> +    int ret;
>> +
>> +    ret = igt_pci_bind_driver_override(slot, driver, 
>> DRIVER_OVERRIDE_TIMEOUT_MS);
>> +    igt_assert_f(ret == 0, "bind %s (VF%u) to %s failed (%d)\n", 
>> slot, vf_id, driver, ret);
>> +    assert_bound_driver_is(slot, driver);
>> +
>> +    free(slot);
>> +}
>> +
>> +static void vf_unbind_override(unsigned int vf_id)
>> +{
>> +    char *slot = vf_pci_slot_alloc(vf_id);
>> +    int ret;
>> +
>> +    ret = igt_pci_unbind_driver_override(slot, 
>> DRIVER_OVERRIDE_TIMEOUT_MS);
>> +    igt_assert_f(ret == 0, "unbind %s (VF%u) failed (%d)\n", slot, 
>> vf_id, ret);
>> +    assert_bound_driver_is(slot, NULL);
>> +
>> +    free(slot);
>> +}
>> +
>> +static void bind_unbind_vfs(unsigned int num_vfs)
>> +{
>> +    igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +
>> +    igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI 
>> state\n");
>> +
>> +    igt_sriov_enable_driver_autoprobe(pf_fd);
>> +
>> +    for (unsigned int vf_id = 1; vf_id <= num_vfs; vf_id++) {
>> +        vf_unbind_override(vf_id);
>
> Why unbind here?
Good catch, not needed when VFs created with autoprobe disabled
>
>> +        vf_bind_override(vf_id, XE_VFIO_PCI_DRV);
>> +        vf_unbind_override(vf_id);
>> +    }
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +}
>> +
>> +static void open_pf(void)
>> +{
>> +    int fd;
>> +
>> +    if (pf_fd >= 0)
>> +        return;
>> +
>> +    fd = drm_open_driver(DRIVER_XE);
>> +    igt_assert_fd(fd);
>> +
>> +    if (!igt_sriov_is_pf(fd)) {
>> +        drm_close_driver(fd);
>> +        igt_skip("Xe device is not an SR-IOV PF\n");
>> +    }
>> +
>> +    if (igt_sriov_get_enabled_vfs(fd) != 0) {
>> +        drm_close_driver(fd);
>> +        igt_skip("VFs must be disabled before running this test\n");
>> +    }
>> +
>> +    autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>> +    pf_fd = fd;
>> +}
>> +
>> +static void cleanup_pf(void)
>> +{
>> +    if (pf_fd < 0)
>> +        return;
>> +
>> +    igt_sriov_disable_vfs(pf_fd);
>> +    igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to 
>> disable VF(s)\n");
>> +    autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>> +           igt_sriov_disable_driver_autoprobe(pf_fd);
>> +    igt_abort_on_f(autoprobe != 
>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>> +               "Failed to restore sriov_drivers_autoprobe value\n");
>> +    drm_close_driver(pf_fd);
>> +    pf_fd = -1;
>> +}
>> +
>> +static void restore_xe_vfio_module(void)
>> +{
>> +    if (!restore_xe_vfio_on_exit)
>
> If you go with one subtest (load-unload) approach, then I think we 
> should always leave the environment in the original state, so this 
> variable would not be needed. 
>> +        return;
>> +
>> +    if (xe_vfio_loaded_initially) {
>> +        igt_abort_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
>> +                   "Failed to restore %s load state\n",
>> +                   XE_VFIO_PCI_MOD);
>> +        igt_abort_on_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD),
>> +                   "%s should be loaded after cleanup\n",
>> +                   XE_VFIO_PCI_MOD);
>> +    } else if (igt_kmod_is_loaded(XE_VFIO_PCI_MOD)) {
>> +        igt_abort_on_f(igt_kmod_unload(XE_VFIO_PCI_MOD),
>> +                   "Failed to unload %s\n", XE_VFIO_PCI_MOD);
>
> I think it should be consistent - "Failed to restore %s load state".
>
>> + igt_abort_on_f(igt_kmod_is_loaded(XE_VFIO_PCI_MOD),
>> +                   "%s still loaded\n", XE_VFIO_PCI_MOD);
>
> If it's an abort I would say something like "Failed to do sth" or 
> "Can't do sth"
>
> Maybe use err variable, and at the end use one igt_abort_on_f(err, 
> "Failed to restore %s module load state") ?
>
yes, thanks
>> +    }
>> +
>> +    restore_xe_vfio_on_exit = false;
>> +}
>> +
>>   int igt_main()
>>   {
>> +    igt_fixture() {
>> +        xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
>> +    }
>> +
>>       igt_describe("Attempt to load xe_vfio_pci module.");
>>       igt_subtest("load-xe-vfio-pci") {
>>           int ret;
>> @@ -85,4 +234,24 @@ int igt_main()
>>           igt_assert_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD), "%s 
>> still loaded\n",
>>                    XE_VFIO_PCI_MOD);
>>       }
>> +
>> +    igt_describe("Enable VFs and bind/unbind each one to xe-vfio-pci 
>> via driver_override.");
>> +    igt_subtest_with_dynamic("bind-unbind-vfs") {
>> +        igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
>> +                  "Failed to load %s\n", XE_VFIO_PCI_MOD);
>> +        restore_xe_vfio_on_exit = true;
>> +
>> +        open_pf();
>> +
>> +        for_each_sriov_num_vfs(pf_fd, num_vfs) {
>> +            igt_dynamic_f("numvfs-%u", num_vfs) {
>> +                bind_unbind_vfs(num_vfs);
>> +            }
>> +        }
>> +    }
>> +
>> +    igt_fixture() {
>> +        cleanup_pf();
>> +        restore_xe_vfio_module();
>> +    }
>>   }

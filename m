Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB8FD64074
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 17:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8A410E273;
	Fri,  8 Nov 2024 17:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QO+b1utH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B9210E273
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731088323; x=1762624323;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7OZCRR6gTiFz0XIuojuBBkZlid+t3JIoLcdt5kaMjgY=;
 b=QO+b1utH62EBsA+QOtTcQW92dmCkxtZH3g/qiSEPW3RPGP9H4iwS/VAF
 sP1WfcxUaXNaJkV6CuiG7+1hvqUfcGFfxmn0uwCuaZZ4baqOmQa+8mH7W
 yVeSEP/zEgJvsHGL7APmhKSeDZtYhpokQzfj5psZo0iqhFIJWNtjgeHLu
 pDaOLboRPtrwnlyEfa337EJTV63AGAC7G4hAqHdEmAmOXmJ00LF7fVcDR
 JhEIS8P5wf2en+mzMwbEOpC1VIOF5zdNaxYzuEJn66Imw5ai7T2484J4A
 4ibtvUIEIJ9xzHXNWcFi6vhYt034xn3agZxEIMQudlNwlTaMb7GZStJFE w==;
X-CSE-ConnectionGUID: HqIUM3qaQZ+HVz6pJ0CtQQ==
X-CSE-MsgGUID: bV9O17l+QBCjU+zC3m9woA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31209824"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31209824"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:52:02 -0800
X-CSE-ConnectionGUID: XndYgYbZQLupA9wUN8RNwA==
X-CSE-MsgGUID: RC0d0pCgSF2J7KAfv9grug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="90480533"
Received: from unknown (HELO [10.24.12.70]) ([10.24.12.70])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 09:52:03 -0800
Message-ID: <61f3bf56-3a9b-4544-9f30-59641e129eb4@linux.intel.com>
Date: Fri, 8 Nov 2024 09:51:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, jani.nikula@intel.com,
 clinton.a.taylor@intel.com, zbigniew.kempczynski@intel.com
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <20241108144916.ejpqphj6lmig7iko@kamilkon-desk.igk.intel.com>
 <sojqnvnniougw7y4yo5wmvstmxtuxvrhd2i376g6lig24r3jsm@islqlychrne4>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <sojqnvnniougw7y4yo5wmvstmxtuxvrhd2i376g6lig24r3jsm@islqlychrne4>
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




On 2024-11-08 07:50, Lucas De Marchi wrote:
> On Fri, Nov 08, 2024 at 03:49:16PM +0100, Kamil Konieczny wrote:
>> Hi Ngai-Mint,
>> On 2024-11-07 at 15:14:45 -0800, Ngai-Mint Kwan wrote:
>>> Synch with kernel commit that uses common PCI ID macros:
>>> 3c1d5ced18db ("drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.")
>
> $ git branch --contains 3c1d5ced18db8a67251c8436cf9bdc061f972bdb
> + drm-intel-next
> + drm-tip
> * tip
>
>>
>> I couldn't find this commit on drm-tip, did I miss something?
>>
>> What I found using google was:
>> https://lore.kernel.org/all/2c1c07f5-920b-4f6e-87dc-752ae3725a2c@intel.com/T/ 
>>
>>
>> and in that commit there are only additions to i915_pciids.h
>
> the commit describes the state of the branch... there may be previous
> changes being carried together. As long as it's an exact copy of the
> kernel header in that specific commit I think we are fine.
>
>
> Lucas De Marchi
>
>>
>> Please provide link to lore.kernel.org to a commit you are
>> referring and also which kernel tree you are using.
>>
>> When this rename reach drm-tip?

This is the commit from drm-tip that this patch is referring to:
https://gitlab.freedesktop.org/drm/tip/-/commit/3c1d5ced18db8a67251c8436cf9bdc061f972bdb

Regards,
Ngai-Mint Kwan

>>
>>
>> Regards,
>> Kamil
>>
>>>
>>> Refactor lib to use new macro definitions and pciids.h header file.
>>>
>>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>>> ---
>>>  docs/reference/igt-gpu-tools/meson.build |   3 +-
>>>  lib/i915/perf.c                          |   2 +-
>>>  lib/i915_pciids_local.h                  |   2 +-
>>>  lib/intel_device_info.c                  |   8 +-
>>>  lib/{i915_pciids.h => pciids.h}          | 106 ++++++++---
>>>  lib/xe/xe_oa.c                           |  12 +-
>>>  lib/xe_pciids.h                          | 218 -----------------------
>>>  7 files changed, 90 insertions(+), 261 deletions(-)
>>>  rename lib/{i915_pciids.h => pciids.h} (92%)
>>>  delete mode 100644 lib/xe_pciids.h
>>>
>>> diff --git a/docs/reference/igt-gpu-tools/meson.build 
>>> b/docs/reference/igt-gpu-tools/meson.build
>>> index d5db95e40..8d70a49b8 100644
>>> --- a/docs/reference/igt-gpu-tools/meson.build
>>> +++ b/docs/reference/igt-gpu-tools/meson.build
>>> @@ -10,7 +10,6 @@ ignore_headers = [
>>>      'gpgpu_fill.h',
>>>      'i830_reg.h',
>>>      'i915_3d.h',
>>> -    'i915_pciids.h',
>>>      'i915_reg.h',
>>>      'igt_edid_template.h',
>>>      'intel_reg.h',
>>> @@ -21,8 +20,8 @@ ignore_headers = [
>>>      'media_spin.h',
>>>      'media_fill_gen9.h',
>>>      'gen9_render.h',
>>> +    'pciids.h',
>>>      'version.h',
>>> -    'xe_pciids.h',
>>>  ]
>>>
>>>  test_groups = [
>>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>>> index ef2f74be8..9eb1141d4 100644
>>> --- a/lib/i915/perf.c
>>> +++ b/lib/i915/perf.c
>>> @@ -37,7 +37,7 @@
>>>
>>>  #include <i915_drm.h>
>>>
>>> -#include "i915_pciids.h"
>>> +#include "pciids.h"
>>>  #include "i915_pciids_local.h"
>>>
>>>  #include "intel_chipset.h"
>>> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
>>> index c404a51af..b85cfd779 100644
>>> --- a/lib/i915_pciids_local.h
>>> +++ b/lib/i915_pciids_local.h
>>> @@ -5,7 +5,7 @@
>>>  #ifndef _I915_PCIIDS_LOCAL_H_
>>>  #define _I915_PCIIDS_LOCAL_H_
>>>
>>> -#include "i915_pciids.h"
>>> +#include "pciids.h"
>>>
>>>  /* MTL perf */
>>>  #ifndef INTEL_MTL_M_IDS
>>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>>> index 2a118eda6..546b9c65a 100644
>>> --- a/lib/intel_device_info.c
>>> +++ b/lib/intel_device_info.c
>>> @@ -1,7 +1,6 @@
>>>  #include "intel_chipset.h"
>>> -#include "i915_pciids.h"
>>> +#include "pciids.h"
>>>  #include "i915_pciids_local.h"
>>> -#include "xe_pciids.h"
>>>
>>>  #include <strings.h> /* ffs() */
>>>
>>> @@ -635,12 +634,13 @@ static const struct pci_id_match 
>>> intel_device_match[] = {
>>>      INTEL_ATS_M_IDS(INTEL_PCI_ID_INIT, &intel_ats_m_info),
>>>
>>>      INTEL_MTL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>>> +    INTEL_ARL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>>>
>>>      INTEL_PVC_IDS(INTEL_PCI_ID_INIT, &intel_pontevecchio_info),
>>>
>>> -    XE_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>>> +    INTEL_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>>>
>>> -    XE_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>>> +    INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>>>
>>>      INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>>>  };
>>> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>>> similarity index 92%
>>> rename from lib/i915_pciids.h
>>> rename to lib/pciids.h
>>> index 3e39d644e..32480b556 100644
>>> --- a/lib/i915_pciids.h
>>> +++ b/lib/pciids.h
>>> @@ -22,30 +22,23 @@
>>>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>   * DEALINGS IN THE SOFTWARE.
>>>   */
>>> -#ifndef _I915_PCIIDS_H
>>> -#define _I915_PCIIDS_H
>>> -
>>> -/*
>>> - * A pci_device_id struct {
>>> - *    __u32 vendor, device;
>>> - *      __u32 subvendor, subdevice;
>>> - *    __u32 class, class_mask;
>>> - *    kernel_ulong_t driver_data;
>>> - * };
>>> - * Don't use C99 here because "class" is reserved and we want to
>>> - * give userspace flexibility.
>>> - */
>>> -#define INTEL_VGA_DEVICE(id, info) { \
>>> -    0x8086,    id, \
>>> -    ~0, ~0, \
>>> -    0x030000, 0xff0000, \
>>> -    (unsigned long) info }
>>> -
>>> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>>> -    0x8086,    0x16a, \
>>> -    0x152d,    0x8990, \
>>> -    0x030000, 0xff0000, \
>>> -    (unsigned long) info }
>>> +#ifndef __PCIIDS_H__
>>> +#define __PCIIDS_H__
>>> +
>>> +#ifdef __KERNEL__
>>> +#define INTEL_VGA_DEVICE(_id, _info) { \
>>> +    PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>>> +    .class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>>> +    .driver_data = (kernel_ulong_t)(_info), \
>>> +}
>>> +
>>> +#define INTEL_QUANTA_VGA_DEVICE(_info) { \
>>> +    .vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
>>> +    .subvendor = 0x152d, .subdevice = 0x8990, \
>>> +    .class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>>> +    .driver_data = (kernel_ulong_t)(_info), \
>>> +}
>>> +#endif
>>>
>>>  #define INTEL_I810_IDS(MACRO__, ...) \
>>>      MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
>>> @@ -771,16 +764,71 @@
>>>      INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
>>>      INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>>
>>> +/* ARL */
>>> +#define INTEL_ARL_H_IDS(MACRO__, ...) \
>>> +    MACRO__(0x7D51, ## __VA_ARGS__), \
>>> +    MACRO__(0x7DD1, ## __VA_ARGS__)
>>> +
>>> +#define INTEL_ARL_U_IDS(MACRO__, ...) \
>>> +    MACRO__(0x7D41, ## __VA_ARGS__) \
>>> +
>>> +#define INTEL_ARL_S_IDS(MACRO__, ...) \
>>> +    MACRO__(0x7D67, ## __VA_ARGS__), \
>>> +    MACRO__(0xB640, ## __VA_ARGS__)
>>> +
>>> +#define INTEL_ARL_IDS(MACRO__, ...) \
>>> +    INTEL_ARL_H_IDS(MACRO__, ## __VA_ARGS__), \
>>> +    INTEL_ARL_U_IDS(MACRO__, ## __VA_ARGS__), \
>>> +    INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>>> +
>>>  /* MTL */
>>>  #define INTEL_MTL_IDS(MACRO__, ...) \
>>>      MACRO__(0x7D40, ## __VA_ARGS__), \
>>> -    MACRO__(0x7D41, ## __VA_ARGS__), \
>>>      MACRO__(0x7D45, ## __VA_ARGS__), \
>>> -    MACRO__(0x7D51, ## __VA_ARGS__), \
>>>      MACRO__(0x7D55, ## __VA_ARGS__), \
>>>      MACRO__(0x7D60, ## __VA_ARGS__), \
>>> -    MACRO__(0x7D67, ## __VA_ARGS__), \
>>> -    MACRO__(0x7DD1, ## __VA_ARGS__), \
>>>      MACRO__(0x7DD5, ## __VA_ARGS__)
>>>
>>> -#endif /* _I915_PCIIDS_H */
>>> +/* PVC */
>>> +#define INTEL_PVC_IDS(MACRO__, ...) \
>>> +    MACRO__(0x0B69, ## __VA_ARGS__), \
>>> +    MACRO__(0x0B6E, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD4, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD5, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD6, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD7, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD8, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BD9, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BDA, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BDB, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BE0, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BE1, ## __VA_ARGS__), \
>>> +    MACRO__(0x0BE5, ## __VA_ARGS__)
>>> +
>>> +/* LNL */
>>> +#define INTEL_LNL_IDS(MACRO__, ...) \
>>> +    MACRO__(0x6420, ## __VA_ARGS__), \
>>> +    MACRO__(0x64A0, ## __VA_ARGS__), \
>>> +    MACRO__(0x64B0, ## __VA_ARGS__)
>>> +
>>> +/* BMG */
>>> +#define INTEL_BMG_IDS(MACRO__, ...) \
>>> +    MACRO__(0xE202, ## __VA_ARGS__), \
>>> +    MACRO__(0xE20B, ## __VA_ARGS__), \
>>> +    MACRO__(0xE20C, ## __VA_ARGS__), \
>>> +    MACRO__(0xE20D, ## __VA_ARGS__), \
>>> +    MACRO__(0xE212, ## __VA_ARGS__)
>>> +
>>> +/* PTL */
>>> +#define INTEL_PTL_IDS(MACRO__, ...) \
>>> +    MACRO__(0xB080, ## __VA_ARGS__), \
>>> +    MACRO__(0xB081, ## __VA_ARGS__), \
>>> +    MACRO__(0xB082, ## __VA_ARGS__), \
>>> +    MACRO__(0xB090, ## __VA_ARGS__), \
>>> +    MACRO__(0xB091, ## __VA_ARGS__), \
>>> +    MACRO__(0xB092, ## __VA_ARGS__), \
>>> +    MACRO__(0xB0A0, ## __VA_ARGS__), \
>>> +    MACRO__(0xB0A1, ## __VA_ARGS__), \
>>> +    MACRO__(0xB0A2, ## __VA_ARGS__)
>>> +
>>> +#endif /* __PCIIDS_H__ */
>>> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>>> index 17abfa454..db614b732 100644
>>> --- a/lib/xe/xe_oa.c
>>> +++ b/lib/xe/xe_oa.c
>>> @@ -21,9 +21,9 @@
>>>  #include "intel_hwconfig_types.h"
>>>  #include "ioctl_wrappers.h"
>>>  #include "linux_scaffold.h"
>>> +#include "pciids.h"
>>>  #include "xe_ioctl.h"
>>>  #include "xe_oa.h"
>>> -#include "xe_pciids.h"
>>>  #include "xe_query.h"
>>>
>>>  #include "xe_oa_metrics_tglgt1.h"
>>> @@ -119,8 +119,8 @@ static bool
>>>  is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
>>>  {
>>>      static const uint32_t devids[] = {
>>> -        XE_DG2_G11_IDS(DEVID),
>>> -        XE_ATS_M75_IDS(DEVID),
>>> +        INTEL_DG2_G11_IDS(DEVID),
>>> +        INTEL_ATS_M75_IDS(DEVID),
>>>      };
>>>      for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>>          if (devids[i] == devinfo->devid)
>>> @@ -134,7 +134,7 @@ static bool
>>>  is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
>>>  {
>>>      static const uint32_t devids[] = {
>>> -        XE_DG2_G12_IDS(DEVID),
>>> +        INTEL_DG2_G12_IDS(DEVID),
>>>      };
>>>      for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>>          if (devids[i] == devinfo->devid)
>>> @@ -148,8 +148,8 @@ static bool
>>>  is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
>>>  {
>>>      static const uint32_t devids[] = {
>>> -        XE_DG2_G10_IDS(DEVID),
>>> -        XE_ATS_M150_IDS(DEVID),
>>> +        INTEL_DG2_G10_IDS(DEVID),
>>> +        INTEL_ATS_M150_IDS(DEVID),
>>>      };
>>>      for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>>          if (devids[i] == devinfo->devid)
>>> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
>>> deleted file mode 100644
>>> index 73d972a8a..000000000
>>> --- a/lib/xe_pciids.h
>>> +++ /dev/null
>>> @@ -1,218 +0,0 @@
>>> -/* SPDX-License-Identifier: MIT */
>>> -/*
>>> - * Copyright © 2022 Intel Corporation
>>> - */
>>> -
>>> -#ifndef _XE_PCIIDS_H_
>>> -#define _XE_PCIIDS_H_
>>> -
>>> -/*
>>> - * Lists below can be turned into initializers for a struct 
>>> pci_device_id
>>> - * by defining INTEL_VGA_DEVICE:
>>> - *
>>> - * #define INTEL_VGA_DEVICE(id, info) { \
>>> - *    0x8086, id,            \
>>> - *    ~0, ~0,                \
>>> - *    0x030000, 0xff0000,        \
>>> - *    (unsigned long) info }
>>> - *
>>> - * And then calling like:
>>> - *
>>> - * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
>>> - *
>>> - * To turn them into something else, just provide a different macro 
>>> passed as
>>> - * first argument.
>>> - */
>>> -
>>> -/* TGL */
>>> -#define XE_TGL_GT1_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x9A60, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9A68, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9A70, ## __VA_ARGS__)
>>> -
>>> -#define XE_TGL_GT2_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x9A40, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9A49, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9A59, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9A78, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9AC0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9AC9, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9AD9, ## __VA_ARGS__),    \
>>> -    MACRO__(0x9AF8, ## __VA_ARGS__)
>>> -
>>> -#define XE_TGL_IDS(MACRO__, ...)        \
>>> -    XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
>>> -    XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>>> -
>>> -/* RKL */
>>> -#define XE_RKL_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x4C80, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4C8A, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4C8B, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4C8C, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4C90, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4C9A, ## __VA_ARGS__)
>>> -
>>> -/* DG1 */
>>> -#define XE_DG1_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x4905, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4906, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4907, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4908, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4909, ## __VA_ARGS__)
>>> -
>>> -/* ADL-S */
>>> -#define XE_ADLS_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x4680, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4682, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4688, ## __VA_ARGS__),    \
>>> -    MACRO__(0x468A, ## __VA_ARGS__),    \
>>> -    MACRO__(0x468B, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4690, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4692, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4693, ## __VA_ARGS__)
>>> -
>>> -/* ADL-P */
>>> -#define XE_ADLP_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x46A0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46A1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46A2, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46A3, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46A6, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46A8, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46AA, ## __VA_ARGS__),    \
>>> -    MACRO__(0x462A, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4626, ## __VA_ARGS__),    \
>>> -    MACRO__(0x4628, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46B0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46B1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46B2, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46B3, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46C0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46C1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46C2, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46C3, ## __VA_ARGS__)
>>> -
>>> -/* ADL-N */
>>> -#define XE_ADLN_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x46D0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46D1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x46D2, ## __VA_ARGS__)
>>> -
>>> -/* RPL-S */
>>> -#define XE_RPLS_IDS(MACRO__, ...)        \
>>> -    MACRO__(0xA780, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA781, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA782, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA783, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA788, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA789, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA78A, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA78B, ## __VA_ARGS__)
>>> -
>>> -/* RPL-U */
>>> -#define XE_RPLU_IDS(MACRO__, ...)        \
>>> -    MACRO__(0xA721, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7A1, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7A9, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7AC, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7AD, ## __VA_ARGS__)
>>> -
>>> -/* RPL-P */
>>> -#define XE_RPLP_IDS(MACRO__, ...)        \
>>> -    XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA720, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7A0, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7A8, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7AA, ## __VA_ARGS__),    \
>>> -    MACRO__(0xA7AB, ## __VA_ARGS__)
>>> -
>>> -/* DG2 */
>>> -#define XE_DG2_G10_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x5690, ## __VA_ARGS__),    \
>>> -    MACRO__(0x5691, ## __VA_ARGS__),    \
>>> -    MACRO__(0x5692, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A2, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BE, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BF, ## __VA_ARGS__)
>>> -
>>> -#define XE_DG2_G11_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x5693, ## __VA_ARGS__),    \
>>> -    MACRO__(0x5694, ## __VA_ARGS__),    \
>>> -    MACRO__(0x5695, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A5, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A6, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56B0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56B1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BA, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BB, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BC, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56BD, ## __VA_ARGS__)
>>> -
>>> -#define XE_DG2_G12_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x5696, ## __VA_ARGS__),    \
>>> -    MACRO__(0x5697, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A3, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56A4, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56B2, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56B3, ## __VA_ARGS__)
>>> -
>>> -#define XE_DG2_IDS(MACRO__, ...)        \
>>> -    XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
>>> -    XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
>>> -    XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>>> -
>>> -#define XE_ATS_M150_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x56C0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x56C2, ## __VA_ARGS__)
>>> -
>>> -#define XE_ATS_M75_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x56C1, ## __VA_ARGS__)
>>> -
>>> -#define XE_ATS_M_IDS(MACRO__, ...)        \
>>> -    XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>>> -    XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>> -
>>> -/* MTL / ARL */
>>> -#define XE_MTL_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x7D40, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7D41, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7D45, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7D51, ## __VA_ARGS__),        \
>>> -    MACRO__(0x7D55, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7D60, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7D67, ## __VA_ARGS__),    \
>>> -    MACRO__(0x7DD1, ## __VA_ARGS__),        \
>>> -    MACRO__(0x7DD5, ## __VA_ARGS__)
>>> -
>>> -/* PVC */
>>> -#define XE_PVC_IDS(MACRO__, ...)        \
>>> -    MACRO__(0x0B69, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0B6E, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD4, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD5, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD6, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD7, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD8, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BD9, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BDA, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BDB, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BE0, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BE1, ## __VA_ARGS__),    \
>>> -    MACRO__(0x0BE5, ## __VA_ARGS__)
>>> -
>>> -#define XE_LNL_IDS(MACRO__, ...) \
>>> -    MACRO__(0x6420, ## __VA_ARGS__), \
>>> -    MACRO__(0x64A0, ## __VA_ARGS__), \
>>> -    MACRO__(0x64B0, ## __VA_ARGS__)
>>> -
>>> -#define XE_BMG_IDS(MACRO__, ...) \
>>> -    MACRO__(0xE202, ## __VA_ARGS__), \
>>> -    MACRO__(0xE20B, ## __VA_ARGS__), \
>>> -    MACRO__(0xE20C, ## __VA_ARGS__), \
>>> -    MACRO__(0xE20D, ## __VA_ARGS__), \
>>> -    MACRO__(0xE212, ## __VA_ARGS__)
>>> -
>>> -#endif
>>> -- 
>>> 2.43.0
>>>


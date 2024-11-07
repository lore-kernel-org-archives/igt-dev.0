Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1999D5D67A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A01610E1A1;
	Thu,  7 Nov 2024 17:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0H2CknN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F17610E1A1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731000676; x=1762536676;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RIhiAD7nTe8FNZ5EaisrQ8a5UeM0v8nTwiludZ+mYYc=;
 b=n0H2CknNNTv804S2RhRj9jkawUaJp0cEVRPCZ5uCqHQt2NhC+d2gEwTL
 lcIB0gRRUA7dFgqVRYX7DtqbKtPOA2e2Wo70402pHrGqd1D7zBGkfJCCG
 pxyjy/CppVCpkr4+PbcjrNVGwGt1iJXhWebfdBd39r2L59gNbjx6IilLC
 YMHcePGQaU0ZUopGs/CeaRwo2CZvD8HSUl6OmhhADuY7SxHhCxXtehn+P
 YruVqCIV4DJt8y7Tol+JuUOrKE+vR5hsX0UbbTW6gKxQGeJJLCwzbDPFn
 bzbMR/ClhOFOo3UXtqYsA/IAVnFHdoXEdVG9DA1TJjvaXDGINFjgV0TuG A==;
X-CSE-ConnectionGUID: YZtgcHvnT2GZBLx0o9MEXQ==
X-CSE-MsgGUID: q+ZgD7TzTf6CWb4RFUxGFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="18486898"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="18486898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:31:15 -0800
X-CSE-ConnectionGUID: pJBRnQOcSTag+RWkNymFXQ==
X-CSE-MsgGUID: 5XJxLBH7SwiedJ1oHRIE5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85264162"
Received: from nkwan-mobl.amr.corp.intel.com (HELO [10.124.114.229])
 ([10.124.114.229])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:31:13 -0800
Message-ID: <fc929c83-0ff6-4d42-9a3e-f4e6e1bf5ae7@linux.intel.com>
Date: Thu, 7 Nov 2024 09:31:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <87r07ne6ae.fsf@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <87r07ne6ae.fsf@intel.com>
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

On 2024-11-07 01:34, Jani Nikula wrote:
> On Wed, 06 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
>> Latest kernel switched to common PCI ID macros.
> Please reference the kernel commit id you're backporting from. "Latest
> kernel" goes stale pretty fast. ;)
Understood, I'll send out a new version with the specific commit ID!
> See 'git log -- lib/i915_pciids.h'.
>
> I've also updated this with more granularity in the past, creating an
> igt commit for each kernel PCI ID change, but I'm not sure if that's
> really required, and I'm not insisting.
We debated going that approach, but the concern was that individual 
patches might cause compile issues with IGT.
Thus, we decided on the single patch.

Regards,
Ngai-Mint Kwan
> Other than that, LGTM.
>
> BR,
> Jani.
>
>> Refactor lib to use new macro definitions and pciids.h header file.
>>
>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>> ---
>>   docs/reference/igt-gpu-tools/meson.build |   3 +-
>>   lib/i915/perf.c                          |   2 +-
>>   lib/i915_pciids_local.h                  |   2 +-
>>   lib/intel_device_info.c                  |   8 +-
>>   lib/{i915_pciids.h => pciids.h}          |  97 +++++++---
>>   lib/xe/xe_oa.c                           |  12 +-
>>   lib/xe_pciids.h                          | 218 -----------------------
>>   7 files changed, 81 insertions(+), 261 deletions(-)
>>   rename lib/{i915_pciids.h => pciids.h} (93%)
>>   delete mode 100644 lib/xe_pciids.h
>>
>> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
>> index d5db95e40..0f5434677 100644
>> --- a/docs/reference/igt-gpu-tools/meson.build
>> +++ b/docs/reference/igt-gpu-tools/meson.build
>> @@ -10,7 +10,6 @@ ignore_headers = [
>>   	'gpgpu_fill.h',
>>   	'i830_reg.h',
>>   	'i915_3d.h',
>> -	'i915_pciids.h',
>>   	'i915_reg.h',
>>   	'igt_edid_template.h',
>>   	'intel_reg.h',
>> @@ -22,7 +21,7 @@ ignore_headers = [
>>   	'media_fill_gen9.h',
>>   	'gen9_render.h',
>>   	'version.h',
>> -	'xe_pciids.h',
>> +	'pciids.h',
>>   ]
>>   
>>   test_groups = [
>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>> index ef2f74be8..4ce92b591 100644
>> --- a/lib/i915/perf.c
>> +++ b/lib/i915/perf.c
>> @@ -37,8 +37,8 @@
>>   
>>   #include <i915_drm.h>
>>   
>> -#include "i915_pciids.h"
>>   #include "i915_pciids_local.h"
>> +#include "pciids.h"
>>   
>>   #include "intel_chipset.h"
>>   #include "perf.h"
>> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
>> index c404a51af..b85cfd779 100644
>> --- a/lib/i915_pciids_local.h
>> +++ b/lib/i915_pciids_local.h
>> @@ -5,7 +5,7 @@
>>   #ifndef _I915_PCIIDS_LOCAL_H_
>>   #define _I915_PCIIDS_LOCAL_H_
>>   
>> -#include "i915_pciids.h"
>> +#include "pciids.h"
>>   
>>   /* MTL perf */
>>   #ifndef INTEL_MTL_M_IDS
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index 2a118eda6..b077af46c 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -1,7 +1,6 @@
>>   #include "intel_chipset.h"
>> -#include "i915_pciids.h"
>>   #include "i915_pciids_local.h"
>> -#include "xe_pciids.h"
>> +#include "pciids.h"
>>   
>>   #include <strings.h> /* ffs() */
>>   
>> @@ -635,12 +634,13 @@ static const struct pci_id_match intel_device_match[] = {
>>   	INTEL_ATS_M_IDS(INTEL_PCI_ID_INIT, &intel_ats_m_info),
>>   
>>   	INTEL_MTL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>> +	INTEL_ARL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
>>   
>>   	INTEL_PVC_IDS(INTEL_PCI_ID_INIT, &intel_pontevecchio_info),
>>   
>> -	XE_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>> +	INTEL_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
>>   
>> -	XE_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>> +	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>>   
>>   	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>>   };
>> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>> similarity index 93%
>> rename from lib/i915_pciids.h
>> rename to lib/pciids.h
>> index 3e39d644e..7632507af 100644
>> --- a/lib/i915_pciids.h
>> +++ b/lib/pciids.h
>> @@ -22,30 +22,23 @@
>>    * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>> -#ifndef _I915_PCIIDS_H
>> -#define _I915_PCIIDS_H
>> -
>> -/*
>> - * A pci_device_id struct {
>> - *	__u32 vendor, device;
>> - *      __u32 subvendor, subdevice;
>> - *	__u32 class, class_mask;
>> - *	kernel_ulong_t driver_data;
>> - * };
>> - * Don't use C99 here because "class" is reserved and we want to
>> - * give userspace flexibility.
>> - */
>> -#define INTEL_VGA_DEVICE(id, info) { \
>> -	0x8086,	id, \
>> -	~0, ~0, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> -
>> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>> -	0x8086,	0x16a, \
>> -	0x152d,	0x8990, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> +#ifndef __PCIIDS_H__
>> +#define __PCIIDS_H__
>> +
>> +#ifdef __KERNEL__
>> +#define INTEL_VGA_DEVICE(_id, _info) { \
>> +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>> +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> +	.driver_data = (kernel_ulong_t)(_info), \
>> +}
>> +
>> +#define INTEL_QUANTA_VGA_DEVICE(_info) { \
>> +	.vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
>> +	.subvendor = 0x152d, .subdevice = 0x8990, \
>> +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> +	.driver_data = (kernel_ulong_t)(_info), \
>> +}
>> +#endif
>>   
>>   #define INTEL_I810_IDS(MACRO__, ...) \
>>   	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
>> @@ -771,16 +764,62 @@
>>   	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
>>   	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>>   
>> +/* ARL */
>> +#define INTEL_ARL_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D41, ## __VA_ARGS__), \
>> +	MACRO__(0x7D51, ## __VA_ARGS__), \
>> +	MACRO__(0x7D67, ## __VA_ARGS__), \
>> +	MACRO__(0x7DD1, ## __VA_ARGS__), \
>> +	MACRO__(0xB640, ## __VA_ARGS__)
>> +
>>   /* MTL */
>>   #define INTEL_MTL_IDS(MACRO__, ...) \
>>   	MACRO__(0x7D40, ## __VA_ARGS__), \
>> -	MACRO__(0x7D41, ## __VA_ARGS__), \
>>   	MACRO__(0x7D45, ## __VA_ARGS__), \
>> -	MACRO__(0x7D51, ## __VA_ARGS__), \
>>   	MACRO__(0x7D55, ## __VA_ARGS__), \
>>   	MACRO__(0x7D60, ## __VA_ARGS__), \
>> -	MACRO__(0x7D67, ## __VA_ARGS__), \
>> -	MACRO__(0x7DD1, ## __VA_ARGS__), \
>>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>>   
>> -#endif /* _I915_PCIIDS_H */
>> +/* PVC */
>> +#define INTEL_PVC_IDS(MACRO__, ...) \
>> +	MACRO__(0x0B69, ## __VA_ARGS__), \
>> +	MACRO__(0x0B6E, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD4, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD5, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD6, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD7, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD8, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD9, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDA, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDB, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE0, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE1, ## __VA_ARGS__), \
>> +	MACRO__(0x0BE5, ## __VA_ARGS__)
>> +
>> +/* LNL */
>> +#define INTEL_LNL_IDS(MACRO__, ...) \
>> +	MACRO__(0x6420, ## __VA_ARGS__), \
>> +	MACRO__(0x64A0, ## __VA_ARGS__), \
>> +	MACRO__(0x64B0, ## __VA_ARGS__)
>> +
>> +/* BMG */
>> +#define INTEL_BMG_IDS(MACRO__, ...) \
>> +	MACRO__(0xE202, ## __VA_ARGS__), \
>> +	MACRO__(0xE20B, ## __VA_ARGS__), \
>> +	MACRO__(0xE20C, ## __VA_ARGS__), \
>> +	MACRO__(0xE20D, ## __VA_ARGS__), \
>> +	MACRO__(0xE212, ## __VA_ARGS__)
>> +
>> +/* PTL */
>> +#define INTEL_PTL_IDS(MACRO__, ...) \
>> +	MACRO__(0xB080, ## __VA_ARGS__), \
>> +	MACRO__(0xB081, ## __VA_ARGS__), \
>> +	MACRO__(0xB082, ## __VA_ARGS__), \
>> +	MACRO__(0xB090, ## __VA_ARGS__), \
>> +	MACRO__(0xB091, ## __VA_ARGS__), \
>> +	MACRO__(0xB092, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
>> +	MACRO__(0xB0A2, ## __VA_ARGS__)
>> +
>> +#endif /* __PCIIDS_H__ */
>> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>> index 17abfa454..db614b732 100644
>> --- a/lib/xe/xe_oa.c
>> +++ b/lib/xe/xe_oa.c
>> @@ -21,9 +21,9 @@
>>   #include "intel_hwconfig_types.h"
>>   #include "ioctl_wrappers.h"
>>   #include "linux_scaffold.h"
>> +#include "pciids.h"
>>   #include "xe_ioctl.h"
>>   #include "xe_oa.h"
>> -#include "xe_pciids.h"
>>   #include "xe_query.h"
>>   
>>   #include "xe_oa_metrics_tglgt1.h"
>> @@ -119,8 +119,8 @@ static bool
>>   is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
>>   {
>>   	static const uint32_t devids[] = {
>> -		XE_DG2_G11_IDS(DEVID),
>> -		XE_ATS_M75_IDS(DEVID),
>> +		INTEL_DG2_G11_IDS(DEVID),
>> +		INTEL_ATS_M75_IDS(DEVID),
>>   	};
>>   	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>   		if (devids[i] == devinfo->devid)
>> @@ -134,7 +134,7 @@ static bool
>>   is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
>>   {
>>   	static const uint32_t devids[] = {
>> -		XE_DG2_G12_IDS(DEVID),
>> +		INTEL_DG2_G12_IDS(DEVID),
>>   	};
>>   	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>   		if (devids[i] == devinfo->devid)
>> @@ -148,8 +148,8 @@ static bool
>>   is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
>>   {
>>   	static const uint32_t devids[] = {
>> -		XE_DG2_G10_IDS(DEVID),
>> -		XE_ATS_M150_IDS(DEVID),
>> +		INTEL_DG2_G10_IDS(DEVID),
>> +		INTEL_ATS_M150_IDS(DEVID),
>>   	};
>>   	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>   		if (devids[i] == devinfo->devid)
>> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
>> deleted file mode 100644
>> index 73d972a8a..000000000
>> --- a/lib/xe_pciids.h
>> +++ /dev/null
>> @@ -1,218 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2022 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_PCIIDS_H_
>> -#define _XE_PCIIDS_H_
>> -
>> -/*
>> - * Lists below can be turned into initializers for a struct pci_device_id
>> - * by defining INTEL_VGA_DEVICE:
>> - *
>> - * #define INTEL_VGA_DEVICE(id, info) { \
>> - *	0x8086, id,			\
>> - *	~0, ~0,				\
>> - *	0x030000, 0xff0000,		\
>> - *	(unsigned long) info }
>> - *
>> - * And then calling like:
>> - *
>> - * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
>> - *
>> - * To turn them into something else, just provide a different macro passed as
>> - * first argument.
>> - */
>> -
>> -/* TGL */
>> -#define XE_TGL_GT1_IDS(MACRO__, ...)		\
>> -	MACRO__(0x9A60, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A68, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A70, ## __VA_ARGS__)
>> -
>> -#define XE_TGL_GT2_IDS(MACRO__, ...)		\
>> -	MACRO__(0x9A40, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A49, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A59, ## __VA_ARGS__),	\
>> -	MACRO__(0x9A78, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AC0, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AC9, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AD9, ## __VA_ARGS__),	\
>> -	MACRO__(0x9AF8, ## __VA_ARGS__)
>> -
>> -#define XE_TGL_IDS(MACRO__, ...)		\
>> -	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -/* RKL */
>> -#define XE_RKL_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4C80, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8A, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8B, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C8C, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C90, ## __VA_ARGS__),	\
>> -	MACRO__(0x4C9A, ## __VA_ARGS__)
>> -
>> -/* DG1 */
>> -#define XE_DG1_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4905, ## __VA_ARGS__),	\
>> -	MACRO__(0x4906, ## __VA_ARGS__),	\
>> -	MACRO__(0x4907, ## __VA_ARGS__),	\
>> -	MACRO__(0x4908, ## __VA_ARGS__),	\
>> -	MACRO__(0x4909, ## __VA_ARGS__)
>> -
>> -/* ADL-S */
>> -#define XE_ADLS_IDS(MACRO__, ...)		\
>> -	MACRO__(0x4680, ## __VA_ARGS__),	\
>> -	MACRO__(0x4682, ## __VA_ARGS__),	\
>> -	MACRO__(0x4688, ## __VA_ARGS__),	\
>> -	MACRO__(0x468A, ## __VA_ARGS__),	\
>> -	MACRO__(0x468B, ## __VA_ARGS__),	\
>> -	MACRO__(0x4690, ## __VA_ARGS__),	\
>> -	MACRO__(0x4692, ## __VA_ARGS__),	\
>> -	MACRO__(0x4693, ## __VA_ARGS__)
>> -
>> -/* ADL-P */
>> -#define XE_ADLP_IDS(MACRO__, ...)		\
>> -	MACRO__(0x46A0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A3, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A6, ## __VA_ARGS__),	\
>> -	MACRO__(0x46A8, ## __VA_ARGS__),	\
>> -	MACRO__(0x46AA, ## __VA_ARGS__),	\
>> -	MACRO__(0x462A, ## __VA_ARGS__),	\
>> -	MACRO__(0x4626, ## __VA_ARGS__),	\
>> -	MACRO__(0x4628, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46B3, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C2, ## __VA_ARGS__),	\
>> -	MACRO__(0x46C3, ## __VA_ARGS__)
>> -
>> -/* ADL-N */
>> -#define XE_ADLN_IDS(MACRO__, ...)		\
>> -	MACRO__(0x46D0, ## __VA_ARGS__),	\
>> -	MACRO__(0x46D1, ## __VA_ARGS__),	\
>> -	MACRO__(0x46D2, ## __VA_ARGS__)
>> -
>> -/* RPL-S */
>> -#define XE_RPLS_IDS(MACRO__, ...)		\
>> -	MACRO__(0xA780, ## __VA_ARGS__),	\
>> -	MACRO__(0xA781, ## __VA_ARGS__),	\
>> -	MACRO__(0xA782, ## __VA_ARGS__),	\
>> -	MACRO__(0xA783, ## __VA_ARGS__),	\
>> -	MACRO__(0xA788, ## __VA_ARGS__),	\
>> -	MACRO__(0xA789, ## __VA_ARGS__),	\
>> -	MACRO__(0xA78A, ## __VA_ARGS__),	\
>> -	MACRO__(0xA78B, ## __VA_ARGS__)
>> -
>> -/* RPL-U */
>> -#define XE_RPLU_IDS(MACRO__, ...)		\
>> -	MACRO__(0xA721, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A1, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A9, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AC, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AD, ## __VA_ARGS__)
>> -
>> -/* RPL-P */
>> -#define XE_RPLP_IDS(MACRO__, ...)		\
>> -	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
>> -	MACRO__(0xA720, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7A8, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AA, ## __VA_ARGS__),	\
>> -	MACRO__(0xA7AB, ## __VA_ARGS__)
>> -
>> -/* DG2 */
>> -#define XE_DG2_G10_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5690, ## __VA_ARGS__),	\
>> -	MACRO__(0x5691, ## __VA_ARGS__),	\
>> -	MACRO__(0x5692, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A1, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A2, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BE, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BF, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_G11_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5693, ## __VA_ARGS__),	\
>> -	MACRO__(0x5694, ## __VA_ARGS__),	\
>> -	MACRO__(0x5695, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A5, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A6, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B1, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BA, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BB, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BC, ## __VA_ARGS__),	\
>> -	MACRO__(0x56BD, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_G12_IDS(MACRO__, ...)		\
>> -	MACRO__(0x5696, ## __VA_ARGS__),	\
>> -	MACRO__(0x5697, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A3, ## __VA_ARGS__),	\
>> -	MACRO__(0x56A4, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B2, ## __VA_ARGS__),	\
>> -	MACRO__(0x56B3, ## __VA_ARGS__)
>> -
>> -#define XE_DG2_IDS(MACRO__, ...)		\
>> -	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M150_IDS(MACRO__, ...)		\
>> -	MACRO__(0x56C0, ## __VA_ARGS__),	\
>> -	MACRO__(0x56C2, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M75_IDS(MACRO__, ...)		\
>> -	MACRO__(0x56C1, ## __VA_ARGS__)
>> -
>> -#define XE_ATS_M_IDS(MACRO__, ...)		\
>> -	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>> -	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>> -
>> -/* MTL / ARL */
>> -#define XE_MTL_IDS(MACRO__, ...)		\
>> -	MACRO__(0x7D40, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D41, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D45, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D51, ## __VA_ARGS__),        \
>> -	MACRO__(0x7D55, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D60, ## __VA_ARGS__),	\
>> -	MACRO__(0x7D67, ## __VA_ARGS__),	\
>> -	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>> -	MACRO__(0x7DD5, ## __VA_ARGS__)
>> -
>> -/* PVC */
>> -#define XE_PVC_IDS(MACRO__, ...)		\
>> -	MACRO__(0x0B69, ## __VA_ARGS__),	\
>> -	MACRO__(0x0B6E, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD4, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD5, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD6, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD7, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD8, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BD9, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BDA, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BDB, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE0, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE1, ## __VA_ARGS__),	\
>> -	MACRO__(0x0BE5, ## __VA_ARGS__)
>> -
>> -#define XE_LNL_IDS(MACRO__, ...) \
>> -	MACRO__(0x6420, ## __VA_ARGS__), \
>> -	MACRO__(0x64A0, ## __VA_ARGS__), \
>> -	MACRO__(0x64B0, ## __VA_ARGS__)
>> -
>> -#define XE_BMG_IDS(MACRO__, ...) \
>> -	MACRO__(0xE202, ## __VA_ARGS__), \
>> -	MACRO__(0xE20B, ## __VA_ARGS__), \
>> -	MACRO__(0xE20C, ## __VA_ARGS__), \
>> -	MACRO__(0xE20D, ## __VA_ARGS__), \
>> -	MACRO__(0xE212, ## __VA_ARGS__)
>> -
>> -#endif


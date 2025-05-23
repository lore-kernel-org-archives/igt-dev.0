Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B5C54F2E
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 13:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9E810E819;
	Fri, 23 May 2025 13:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqOU/v/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01D10E7F5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748008618; x=1779544618;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=bLNu9qbWt1KZHSO0NAYTias6+i0fxhzwJYa9/bwYw04=;
 b=IqOU/v/VOeuphWukzmLb+SbWZo7fiGx3exb7Zr0mmLd8nbHE8fCOeIPj
 8PSNyTgkEdfHQR2m+4LvtA2iVXAdPZ5L8/5af7bn+dD1iGNBibQAbastQ
 vc7vqE2tcyezyiKyI2IyY38vNVe5XCaYpk67xMs98jcm5JUEy7x66Vqbj
 xO6IcoGLMvRHqwXEDqJOBuYEQYx1JXhwoB7miF6tTjDl+uj+Dd/EIcQ7C
 8bk4VQaDOWeI+dkRU/2rmLbhnZzOdn3GyO1feCI0JbspQx0yfWnrq93aR
 rvIdR6ARrxCJzyHs2JUaNdbFnO6yCnoIBN6KxpLQJtlIsY4AQsU061xQD Q==;
X-CSE-ConnectionGUID: 0dJlWhQ/SxKBoxpI3GG+IQ==
X-CSE-MsgGUID: XEz7T4QlTEixbf3EPKH8Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61416130"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61416130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:56:57 -0700
X-CSE-ConnectionGUID: K8OT08mKTfSlhetxHcr9Pw==
X-CSE-MsgGUID: e2IswhVFSKCyiP32NedZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="146142029"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.155])
 ([10.245.254.155])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:56:56 -0700
Message-ID: <9696a2b7-e85a-4fc1-b400-c16f4df1c31a@linux.intel.com>
Date: Fri, 23 May 2025 15:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
 <9eb53198-a170-4cb2-9f31-db5f3dbeb60d@linux.intel.com>
 <SJ0PR11MB6696245EB0A05F188D95AF06AC98A@SJ0PR11MB6696.namprd11.prod.outlook.com>
 <86c5c139-26e7-4862-85ae-3b838c514cf1@linux.intel.com>
Content-Language: en-US
In-Reply-To: <86c5c139-26e7-4862-85ae-3b838c514cf1@linux.intel.com>
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



On 5/23/2025 3:11 PM, Bernatowicz, Marcin wrote:
> Hi Jakub,
> 
> On 5/23/2025 2:23 PM, Kolakowski, Jakub1 wrote:
>> Hi Marcin,
>> I was trying to align the code of the IGT test with kernel code, where 
>> we have an explicit check for SR-IOV VF.
>> See https://gitlab.freedesktop.org/drm/tip/-/ 
>> commit/1d622a4fe2b9a30cd4af2e858d793d05f8a82774
>>
And with this approach, the kernel check itself isn't really being tested ;)
--
marcin>> Jakub
> 
> Still, I wonder if relying on VF checks is the best long-term approach -
> we might enable the feature on a VF at some point, and the test would 
> keep skipping.
> What about other apps using this feature - how should they detect 
> availability?
> If they just try to use it on a VF, do they get ENODEV or something else?
> Wouldn’t it be more robust to base this on a real feature check from 
> userspace if possible?
> -- 
> marcin
> 
>>
>> -----Original Message-----
>> From: Bernatowicz, Marcin <marcin.bernatowicz@linux.intel.com>
>> Sent: Friday, May 23, 2025 12:40 PM
>> To: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; igt- 
>> dev@lists.freedesktop.org
>> Cc: Chegondi, Harish <harish.chegondi@intel.com>; Dixit, Ashutosh 
>> <ashutosh.dixit@intel.com>; Adam Miszczak 
>> <adam.miszczak@linux.intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR- 
>> IOV VF
>>
>>
>>
>> On 5/22/2025 7:24 PM, Jakub Kolakowski wrote:
>>> EU stall sampling is not supported on SR-IOV VF. Skip the test on
>>> SR-IOV VF.
>>>
>>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> ---
>>>    tests/intel/xe_eu_stall.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
>>> index 411c30871..aa94d9565 100644
>>> --- a/tests/intel/xe_eu_stall.c
>>> +++ b/tests/intel/xe_eu_stall.c
>>> @@ -44,6 +44,7 @@
>>>    #include "igt.h"
>>>    #include "igt_core.h"
>>> +#include "igt_sriov_device.h"
>>>    #include "xe_drm.h"
>>>    #include "xe/xe_ioctl.h"
>>> @@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, 
>>> help_str, opt_handler, NULL)
>>>            drm_fd = drm_open_driver(DRIVER_XE);
>>>            igt_require_fd(drm_fd);
>>>            devid = intel_get_drm_devid(drm_fd);
>>> -        igt_require(IS_PONTEVECCHIO(devid) || 
>>> intel_graphics_ver(devid) >= IP_VER(20, 0));
>>> +        igt_require(!intel_is_vf_device(drm_fd) && 
>>> (IS_PONTEVECCHIO(devid)
>>> +|| intel_graphics_ver(devid) >= IP_VER(20, 0)));
>>>            igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu- 
>>> fill function\n");
>>>            igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no 
>>> observation_paranoid file\n");
>>>            if (output_file) {
>>
>> Don't we have another option to check the feature is unavailable (ex. 
>> an ioctl returning ENODEV) ?
>>
> 


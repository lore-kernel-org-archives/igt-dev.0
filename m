Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E6C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 13:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352B110E7D7;
	Fri, 23 May 2025 13:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwCTL/Dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122810E7D7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748005880; x=1779541880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qRA7KOUAAmaVjYuQbahBZ7dkLfOnsf3JA6Ckc7ipO2M=;
 b=DwCTL/DrOJsmcIFg4MghVLVAIZIG2Wux0RWt2K58hZ1HSUItkg9ZYmeg
 4zAFuoIUQB/U7cq8g1G2acEcw0xbmW6GQYO3hd/BDHwRSUnNtrIft6Pat
 1L+rsxYORX3SFRIYj6n76bLCttbkOZ/qCOrN6Tjiev5n6w8A2GDAviEcJ
 Mxc5tRDy/q3nN5zip1tU0lIWxZ7DCJFlOi4slTrPDMKZylcwsJsIY3ziJ
 ToRddzq6xhmZGqlWM1DFnw4D+mvEI986+AjB2jfuof2zto88NKNN6EktP
 P+S9kNrDDfiWVExV8SWVBCyJehzttxrTb1S62OK1zhgunQOYBLdbiXMDQ A==;
X-CSE-ConnectionGUID: l2/r7wOPRJO3jbqYB+SQbA==
X-CSE-MsgGUID: +UN2zgKoQqSI+OyAHIhxQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60318394"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="60318394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:11:19 -0700
X-CSE-ConnectionGUID: H4OhFgciQ3qUpVA4sLmS2A==
X-CSE-MsgGUID: 2l/Np0tpQ9a8fThVRYUcIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141198062"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.155])
 ([10.245.254.155])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 06:11:17 -0700
Message-ID: <86c5c139-26e7-4862-85ae-3b838c514cf1@linux.intel.com>
Date: Fri, 23 May 2025 15:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
 <9eb53198-a170-4cb2-9f31-db5f3dbeb60d@linux.intel.com>
 <SJ0PR11MB6696245EB0A05F188D95AF06AC98A@SJ0PR11MB6696.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <SJ0PR11MB6696245EB0A05F188D95AF06AC98A@SJ0PR11MB6696.namprd11.prod.outlook.com>
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

Hi Jakub,

On 5/23/2025 2:23 PM, Kolakowski, Jakub1 wrote:
> Hi Marcin,
> I was trying to align the code of the IGT test with kernel code, where we have an explicit check for SR-IOV VF.
> See https://gitlab.freedesktop.org/drm/tip/-/commit/1d622a4fe2b9a30cd4af2e858d793d05f8a82774
>
> Jakub

Still, I wonder if relying on VF checks is the best long-term approach -
we might enable the feature on a VF at some point, and the test would 
keep skipping.
What about other apps using this feature - how should they detect 
availability?
If they just try to use it on a VF, do they get ENODEV or something else?
Wouldn’t it be more robust to base this on a real feature check from 
userspace if possible?
--
marcin

> 
> -----Original Message-----
> From: Bernatowicz, Marcin <marcin.bernatowicz@linux.intel.com>
> Sent: Friday, May 23, 2025 12:40 PM
> To: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Chegondi, Harish <harish.chegondi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Adam Miszczak <adam.miszczak@linux.intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
> 
> 
> 
> On 5/22/2025 7:24 PM, Jakub Kolakowski wrote:
>> EU stall sampling is not supported on SR-IOV VF. Skip the test on
>> SR-IOV VF.
>>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> ---
>>    tests/intel/xe_eu_stall.c | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
>> index 411c30871..aa94d9565 100644
>> --- a/tests/intel/xe_eu_stall.c
>> +++ b/tests/intel/xe_eu_stall.c
>> @@ -44,6 +44,7 @@
>>    
>>    #include "igt.h"
>>    #include "igt_core.h"
>> +#include "igt_sriov_device.h"
>>    #include "xe_drm.h"
>>    #include "xe/xe_ioctl.h"
>>    
>> @@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
>>    		drm_fd = drm_open_driver(DRIVER_XE);
>>    		igt_require_fd(drm_fd);
>>    		devid = intel_get_drm_devid(drm_fd);
>> -		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
>> +		igt_require(!intel_is_vf_device(drm_fd) && (IS_PONTEVECCHIO(devid)
>> +|| intel_graphics_ver(devid) >= IP_VER(20, 0)));
>>    		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
>>    		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
>>    		if (output_file) {
> 
> Don't we have another option to check the feature is unavailable (ex. an ioctl returning ENODEV) ?
> 


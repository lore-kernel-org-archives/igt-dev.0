Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14F6C282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 15:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5128B10E474;
	Mon,  3 Mar 2025 15:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEa4NTfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925E910E474
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741016696; x=1772552696;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x6coorVORpUU4ZcMOXfQbja055NIwxfxDOVwe4eTIDc=;
 b=FEa4NTfxeoxo549sns++BlyoulbYL4Fw4asb08x9wcmJ/+lug94IkK12
 2WtI7oqZnptX9G0LDqrYJ2aBsnrxyw3GD2IjSPaq5UoetxhJkx9sTRWVP
 ezjnr6TZ2hC7kKqs6ZqWWIzZYanK1yDiFHEpzCJ03pgYQ8MqAGhnLa6Fj
 4DnNrMs5WLgPuPVW1B86nyE0W03YROuALAIDoQ05eoBPyEKiYeCDis28U
 jvFRC7J8U0IoMdzOX4Od5oL0rEA78Wj8Bpx10UyEwE2JECGu9OlX1Reca
 K90/acT/LMJOr48bJ1E/liQUyXxNrzQLUQ+tKGqYdcdf3uLII/Wf02P69 Q==;
X-CSE-ConnectionGUID: qOXend7NQsG3meeNhofdmQ==
X-CSE-MsgGUID: QvCkqe9VQ/qWQiY75sbMJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59308385"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="59308385"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 07:44:55 -0800
X-CSE-ConnectionGUID: +4L/J+cAT5KTlHOjmpLIBQ==
X-CSE-MsgGUID: tcW8XARTT9eqhOR94/oRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122186281"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 07:44:52 -0800
Message-ID: <3bb27413-e2c5-4553-9992-f2505ec5c2ad@linux.intel.com>
Date: Mon, 3 Mar 2025 16:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_sriov_device: Add intel_is_vf_device
 helper
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
 <20250219115314.180382-2-marcin.bernatowicz@linux.intel.com>
 <316c9106-cecf-4682-a28d-64951be3dde4@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <316c9106-cecf-4682-a28d-64951be3dde4@intel.com>
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



On 3/3/2025 9:20 AM, Laguna, Lukasz wrote:
> 
> On 2/19/2025 12:53, Marcin Bernatowicz wrote:
>> Introduce intel_is_vf_device helper to determine whether a given device
>> is a Virtual Function (VF). The function reads the VF_CAPABILITY_REGISTER
>> and checks if the least significant bit is set to identify VF device.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   lib/igt_sriov_device.c | 26 ++++++++++++++++++++++++++
>>   lib/igt_sriov_device.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>> index 2b83cd43c..ffa996d6b 100644
>> --- a/lib/igt_sriov_device.c
>> +++ b/lib/igt_sriov_device.c
>> @@ -14,6 +14,7 @@
>>   #include "igt_device.h"
>>   #include "igt_sriov_device.h"
>>   #include "igt_sysfs.h"
>> +#include "intel_io.h"
>>   #include "xe/xe_query.h"
>>   /**
>> @@ -464,3 +465,28 @@ bool igt_sriov_device_reset(int pf, unsigned int 
>> vf_num)
>>       return ret;
>>   }
>> +
>> +/**
>> + * intel_is_vf_device - Check if device is VF
>> + * @device: device file descriptor
>> + *
>> + * Determines if a device is a Virtual Function (VF)
>> + * by reading VF_CAPABILITY_REGISTER. If the least
>> + * significant bit is set the device is VF.
>> + *
>> + * Return:
>> + * True if device is VF, false otherwise.
>> + */
>> +bool intel_is_vf_device(int fd)
>> +{
>> +#define VF_CAP_REG        0x1901f8
>> +    struct intel_mmio_data mmio_data;
>> +    uint32_t value;
>> +
>> +    intel_register_access_init(&mmio_data, 
>> igt_device_get_pci_device(fd), false);
>> +    value = intel_register_read(&mmio_data, VF_CAP_REG);
>> +    intel_register_access_fini(&mmio_data);
>> +    igt_require((value & ~1) == 0);
> 
> Is it really needed?

This should protect against 0xFFFFFFFF reads.

> 
>> +
>> +    return (value & 1) != 0;
> 
> just return value & 1 ?
> 
>> +}
>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>> index 2b6acb6d7..912449086 100644
>> --- a/lib/igt_sriov_device.h
>> +++ b/lib/igt_sriov_device.h
>> @@ -33,6 +33,7 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned 
>> int vf_num);
>>   int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>> +bool intel_is_vf_device(int device);
>>   /**
>>    * __is_valid_range - Helper to check VF range is valid


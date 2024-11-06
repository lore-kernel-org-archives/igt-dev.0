Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D823D3E798
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 09:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1326210E692;
	Wed,  6 Nov 2024 09:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nfirh2JZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86610E696
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730884621; x=1762420621;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kdbw2+3sr7U3t5OBv3oezHOpExz6jsrkWjvaJltbXyY=;
 b=Nfirh2JZQAo704hWB09jUrc8IUOeCRn5Vh3Xh/0jDPsSOtJtF2Ai/XgV
 Mh6EW4lQIw1NdgeOeNpONVRwqwUTkjUBIvuNIKaFwHj1RCznJ2l4jRPLq
 AgJfk8jsGyUMqrjgYidRPjkdLuibYnBcBPRe5eZCggpKkPoHEam7yCQ5G
 emT9qfIw5gG+3ZEVcRx/0IcR5wmtomidIi+MWow4ke/ZXeLMhU7p7JBX8
 /fo4Jv8+yhY7iEobcBR6aNumzCIGVO9XpxGifeYZDAW4jbvE4T2VCHsK5
 bTO1oxyiWoy0sxyvhqUYjjq3sZbBg34U3Vm/qTweasUdu8BmMPRBs+qSg w==;
X-CSE-ConnectionGUID: 1/ea7PL6SeO4DgcBbZFRQg==
X-CSE-MsgGUID: lVBEM5MvTRa4GtkRn7a6aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42053957"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="42053957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:17:01 -0800
X-CSE-ConnectionGUID: QnJM0H+iRcuoMp4XztJoug==
X-CSE-MsgGUID: CImS9zqzSayNzK2tmzoUqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="89284688"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.97.88])
 ([10.245.97.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:09:20 -0800
Message-ID: <969600fa-2694-4e78-9420-e0c7835068b5@linux.intel.com>
Date: Wed, 6 Nov 2024 10:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Define resource
 types and provisioned range structure
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
 <20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com>
 <1698e1fe-2cdf-4659-9906-31ebf18fccc0@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <1698e1fe-2cdf-4659-9906-31ebf18fccc0@linux.intel.com>
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



On 11/5/2024 12:21 PM, Adam Miszczak wrote:
> 
> On 30.10.2024 20:36, Marcin Bernatowicz wrote:
>> Add shared resource enumeration, provisioned range structure definition,
>> and provide a function to convert shared resource enums to their string
>> representation. These types will be used in a subsequent patch to read
>> VF provisioned resources from the debug filesystem.
>>
>> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
>> Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski<michal.winiarski@intel.com>
>> Cc: Narasimha C V<narasimha.c.v@intel.com>
>> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
>> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> Cc: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   lib/meson.build                |  1 +
>>   lib/xe/xe_sriov_provisioning.c | 33 +++++++++++++++++++++++++
>>   lib/xe/xe_sriov_provisioning.h | 45 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 79 insertions(+)
>>   create mode 100644 lib/xe/xe_sriov_provisioning.c
>>   create mode 100644 lib/xe/xe_sriov_provisioning.h
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 3d5d68b75..3d459c7a3 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -117,6 +117,7 @@ lib_sources = [
>>   	'xe/xe_query.c',
>>   	'xe/xe_spin.c',
>>   	'xe/xe_sriov_debugfs.c',
>> +	'xe/xe_sriov_provisioning.c',
>>   	'xe/xe_util.c',
>>   ]
>>   
>> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
>> new file mode 100644
>> index 000000000..6a9ad411a
>> --- /dev/null
>> +++ b/lib/xe/xe_sriov_provisioning.c
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#include <stdlib.h>
>> +
>> +#include "xe/xe_sriov_provisioning.h"
>> +
>> +/**
>> + * xe_sriov_shared_res_to_string:
>> + * @key: The shared resource of type enum xe_sriov_shared_res
>> + *
>> + * Converts a shared resource enum to its corresponding string
>> + * representation. It is useful for logging and debugging purposes.
>> + *
>> + * Return: A string representing the shared resource key.
>> + */
>> +const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
>> +{
>> +	switch (res) {
>> +	case XE_SRIOV_SHARED_RES_CONTEXTS:
>> +		return "contexts";
>> +	case XE_SRIOV_SHARED_RES_DOORBELLS:
>> +		return "doorbells";
>> +	case XE_SRIOV_SHARED_RES_GGTT:
>> +		return "ggtt";
>> +	case XE_SRIOV_SHARED_RES_LMEM:
>> +		return "lmem";
>> +	}
>> +
>> +	return NULL;
>> +}
>> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
>> new file mode 100644
>> index 000000000..7b7b3db90
>> --- /dev/null
>> +++ b/lib/xe/xe_sriov_provisioning.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef __XE_SRIOV_PROVISIONING_H__
>> +#define __XE_SRIOV_PROVISIONING_H__
>> +
>> +#include <stdint.h>
>> +
>> +/**
>> + * enum xe_sriov_shared_res - Shared resource types
>> + * @XE_SRIOV_SHARED_RES_CONTEXTS: Contexts
>> + * @XE_SRIOV_SHARED_RES_DOORBELLS: Doorbells
>> + * @XE_SRIOV_SHARED_RES_GGTT: GGTT (Global Graphics Translation Table)
>> + * @XE_SRIOV_SHARED_RES_LMEM: Local memory
>> + *
>> + * This enumeration defines the types of shared resources
>> + * that can be provisioned to Virtual Functions (VFs).
>> + */
>> +enum xe_sriov_shared_res {
>> +	XE_SRIOV_SHARED_RES_CONTEXTS,
>> +	XE_SRIOV_SHARED_RES_DOORBELLS,
>> +	XE_SRIOV_SHARED_RES_GGTT,
>> +	XE_SRIOV_SHARED_RES_LMEM,
>> +};
>> +
>> +/**
>> + * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>> + * @vf_id: The ID of the VF
>> + * @start: The inclusive start of the provisioned range
>> + * @end: The inclusive end of the provisioned range
>> + *
>> + * This structure represents a range of resources that have been provisioned
>> + * for a specific VF, with both start and end values included in the range.
>> + */
>> +struct xe_sriov_provisioned_range {
>> +	unsigned int vf_id;
>> +	uint64_t start;
>> +	uint64_t end;
>> +};
>> +
> 
> Debugfs *_provisioned attributes carry also some additional data (e.g. 
> number of ctxs or ggtt size) which is not covered here.
> I understand it's not used by tests now, but assume this could be 
> extended if there's such demand (e.g. some test needs it), right?

But number of ctxs or ggtt size can be computed from range, or I miss 
something ?

number of ctxs = end - start + 1
ggtt size = end - start + 1

> 
>> +const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
> Is this really required as an interface? Is this used anywhere?

To have human readable shared resource name for debug purposes, as part 
of test name etc.

>> +
>> +#endif /* __XE_SRIOV_PROVISIONING_H__ */
> 
> Overall, LGTM:
> Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> 
> 


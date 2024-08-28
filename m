Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C913C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC61D10E551;
	Wed, 28 Aug 2024 14:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWk1iuPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0151710E551
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856367; x=1756392367;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=6Afil0jzv6YNf6Kc3d8DLTtT7wLTxDcn1d1gWOtJXxw=;
 b=lWk1iuPBgMppTEVnFwiKBO9az0VWRrdqW6TLg086ldFWP7N+3vlMh9NB
 7AnftiCYkY6NZcTgr6wfgkkZK+ueNHY/IZh8keOhPIcb0QzS+6bmcffgH
 Xqv5BMgWLte2v3/Mr3Rb0jAajrhvxjrGgMV6DAyevBLNvsOgaYo9qtm54
 GvgR+Skc41LXlOCOAELEZ253iMJoTHW1QMVTXVI8C5wdoNnt/XkgZrnlv
 /IxXC4Z1+dZoJIkG+48AiI9rUTST3FYD8VVjH79+8wkV5a4hvpc5/+hse
 4redQ96hLKX24HEDtuC/zYdyZPSVd07e92lo/0NMMMwjCICSG/d6M0EDo w==;
X-CSE-ConnectionGUID: cxZX20DxSSmrP2zrY6+lBw==
X-CSE-MsgGUID: eOpAPw05ScaEVtLMYSB/FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40867161"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="40867161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:46:06 -0700
X-CSE-ConnectionGUID: flybqhJUR0ONe0Lqk+WnbQ==
X-CSE-MsgGUID: SzLbHXnuTe6UTV7tHIfI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68130746"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:46:04 -0700
Message-ID: <b0387a16-5c3f-424f-9ca2-1f68929f13e9@linux.intel.com>
Date: Wed, 28 Aug 2024 16:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 01/10] tests/intel/xe_drm_fdinfo: Extend mercy to
 the upper end
From: Nirmoy Das <nirmoy.das@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-2-lucas.demarchi@intel.com>
 <6782e176-4a04-4f98-85be-871fc3967a33@linux.intel.com>
Content-Language: en-US
In-Reply-To: <6782e176-4a04-4f98-85be-871fc3967a33@linux.intel.com>
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


On 8/28/2024 4:44 PM, Nirmoy Das wrote:
>
> On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
>> When we are processing the fdinfo of each client, the gpu time is read
>> first, and then later all the exec queues are accumulated. It's thus
>> possible that the total gpu time is smaller than the time reported in
>> the exec queues. A preemption in the middle of second sample would
>> exaggerate the problem:
>>                   total_cycles          cycles
>>     s1: read exec queues times            *
>>     s1: read gpu time        |        *
>>     .                |        *
>>     .                |        *
>>     .                |        *
>>     -> xe_spin_end()        |        *
>>     s2: read exec queues times    |
>>     s2: read gpu time        |
>>
>> There's nothing guaranteeing and atomic read between the gpu time and
>> exec_queue time in either s1 or s2. Due to the call to xe_spin_end(),
>> in which exec_queue tick stops and gpu tick continues, it's much more
>> likely delta_total_cycles > cycles. However, if there was any additional
>> delay between the readout in s1, it could also go the other way.
>>
>> In a more realistic situation, as reported in CI:
>>
>>     (xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, 
>> total_cycles 5801623069
>>     (xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, 
>> total_cycles 5811276365
>>     (xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000
>>
>> Extend the same mercy to the upper end as we did to the lower end.
>> This also matches the tolerance applied on the i915 side in
>> tests/intel/drm_fdinfo.c:__assert_within_epsilon().
>>
>> v2: Fix the commit message since the problem is actually on sample1, not
>>      sample2
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> LGTM thanks for the detailed description.
>
> Reviewed-by: Nirmoy.das@intel.com

I was too quick.


Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>
>> ---
>>   tests/intel/xe_drm_fdinfo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 4696c6495..e3a99a2dc 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -484,7 +484,7 @@ check_results(struct pceu_cycles *s1, struct 
>> pceu_cycles *s2,
>>       igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>         if (flags & TEST_BUSY)
>> -        igt_assert(percent >= 95 && percent <= 100);
>> +        igt_assert(percent >= 95 && percent <= 105);
>>       else
>>           igt_assert(!percent);
>>   }

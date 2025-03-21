Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B8C35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 10:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E0C10E787;
	Fri, 21 Mar 2025 10:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Um1il7C7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F238E10E787
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742553460; x=1774089460;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3Izjh/PCfcexcB/tFjuaWx3TKLzFMU2sfletgzq2pv4=;
 b=Um1il7C7rEyi8CjG7dCjbK4FnBbFj1+q+EQawPyG6T5vzhBEppPWk65N
 0HLPiUk8Qaqsj7mwRiUjrAOVfzc7crHcPbjyv5JCS5R6Sax4G1ANTe/zO
 NydfyVHwz53IwLOY4rcLXzduV0NRUzu5mAOdCk8bkf6mzf9RPWOYSks+F
 Kz6wIs1cs8QTIDB0OE+QC0cIBbDDOiOSU0LtzIu92unZkMGdEZNHWHYFh
 dZ4Jd54dOO2GC0cg4qFznDmBU0gBDSwqPhLFYeSdjiaCXug7KShgioH0v
 +Z1CsVjLPUIjYQujdGuNszRzNbPncXgcm4MYMt060vPJS2kIKlFMhL0SX w==;
X-CSE-ConnectionGUID: xY/TENL8R8KRG7B14Wm3eA==
X-CSE-MsgGUID: zyV99XTXQS2qlfV0x0DFQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43741984"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43741984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:37:39 -0700
X-CSE-ConnectionGUID: 4X1IAvlnTRuwEaZJ01Esfw==
X-CSE-MsgGUID: OvHqPze9RpOvv1QhuyDB6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="154373725"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:37:38 -0700
Message-ID: <79c4c702-5a90-4e6c-8814-0cf9ef27f512@linux.intel.com>
Date: Fri, 21 Mar 2025 11:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/5] tests/intel/xe_fault_injection: Do not
 assert if the captured error is not same as injected error.
To: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-6-satyanarayana.k.v.p@intel.com>
 <Z8g7K-Mvf5yGptuK@fdugast-desk>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <Z8g7K-Mvf5yGptuK@fdugast-desk>
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



On 3/5/2025 12:53 PM, Francois Dugast wrote:
> On Wed, Feb 19, 2025 at 01:04:45PM +0530, Satyanarayana K V P wrote:
>> In the current implementation, test asserts if the captured error is not same as
>> injected error. It is a possible that the error received is translated to other
>> error which can be returned to application.
>>
>> Try to unbind the device at the end of inject_fault_probe() as this can be
>> executed in a loop if IGT_FAULT_INJECT_ITERATION environment variable is set.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   tests/intel/xe_fault_injection.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index cf0337733..82e338965 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -227,8 +227,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>>   	injection_list_do(INJECTION_LIST_ADD, function_name);
>>   	set_retval(function_name, INJECT_ERRNO);
>>   	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
>> -	igt_assert_eq(-errno, INJECT_ERRNO);
>>   	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
> 
> Those should be 2 separate patches.
> 
> 1. Try driver unbind after fault injection during probe
> 2. Accept returned error different than injected one
> 
> I am fine with 1. as it is, just the one line.
> 
> However removing the assert in 2. is not acceptable. This assert *IS*
> the real test performed for existing fault injection tests. If we
> remove it then we will not be able to detect when probing does not
> behave as expected in case of failure.

@Francois, What is recommended on successful probe? Should we treat
successful probe as not an error ?
That happens when error injected function is not called at all (ex. 
xe_wopcm_init, xe_guc_log_init, xe_guc_ads_init on VF probe)

	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
	err = -errno;
	injection_list_do(INJECTION_LIST_REMOVE, function_name);
	if (err)
		igt_assert_eq(err, INJECT_ERRNO);
	else
		/* do additional checks like simple_workload or too complex for this 
test? */
		igt_kmod_unbind("xe", pci_slot);

--
marcin

> 
> We need a more flexible solution to your problem, such as adding one
> parameter to inject_fault_probe() with the expected returned error
> code.
> 
> Francois
> 
>>   }
>>   
>>   /**
>> -- 
>> 2.35.3
>>


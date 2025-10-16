Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1AACCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 12:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C37410E9D3;
	Thu, 16 Oct 2025 12:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StX9EiL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4900410E2FA
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760619334; x=1792155334;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kUZ6eojhJjHlhEZ6E6ROv30yhTwpC64vs1jpYZpUqWk=;
 b=StX9EiL4c57mydX/wYH2bUUiYybxEVEpGD86/tqK8yESb8EccdkycLxI
 VJm1FzK6vFuNIe9OtFwcl29nNtCPHqYZ6h4tzL7OftPCgL0GiUL/ECJIW
 EUXfCHUO3huTU/jyhGSsV1bkuSMvBLHeBwMdghv450es8Cd6CafrE4Ept
 tcELQ/9SwrM5GNbdoNquIm+Eil+QFXkJciRn3lMhxBvk2vP9bingiPEdz
 /cEfBzsDsUfTDmwM0/ufnLCq3IBMgCx1s5zNdQfw9A9nF2XRRGSYwrawT
 J9s3I5M/Nve1at48+O7a0h5mMEkM/M56KnHCANKqRdFiEQfidbBZYyzN3 Q==;
X-CSE-ConnectionGUID: owvtBNQPTQeBLEv82QEJCQ==
X-CSE-MsgGUID: Ot5eqld3S96UvHvfpNLrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66672650"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66672650"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:55:34 -0700
X-CSE-ConnectionGUID: bI7ntpRdQtSzchEM5PAKdg==
X-CSE-MsgGUID: 17ONZfhTQLOu/vCN6EIBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182125507"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.85])
 ([172.28.182.85])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:55:31 -0700
Message-ID: <701a28a6-b6ce-4052-8737-19e31f6bac10@linux.intel.com>
Date: Thu, 16 Oct 2025 14:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_fault_injection: Set guc_wait_ucode pf
 only
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com,
 marcin.bernatowicz@intel.com
References: <20251001151857.104568-1-zhanjun.dong@intel.com>
 <20251008154250.cpg7bsj4vdy23woi@kamilkon-DESK.igk.intel.com>
 <243c339e-7e62-46df-968f-62e70429bd74@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <243c339e-7e62-46df-968f-62e70429bd74@intel.com>
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


On 10/8/2025 6:25 PM, Dong, Zhanjun wrote:
>
>
> On 2025-10-08 11:42 a.m., Kamil Konieczny wrote:
>> Hi Zhanjun,
>> On 2025-10-01 at 11:18:57 -0400, Zhanjun Dong wrote:
>>> guc_wait_ucode is pf only function, set the flag to run normally in 
>>> the VF
>>
>> s/normally/it/
>>
>> Did you mean 'to not run it in the VF'? Or in other words:
>> 'to run it only in PF'?
> Yes, I mean to run it only in PF.
> Form other hand, if CI can put this test in PF only test, maybe this 
> patch is not needed?

We want and are executing xe_fault_injection test in VM runs, so we need 
this patch.

When a PF-only function is tested on a VF device, we expect the probe to 
succeed.

With adjusted description.

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>
> Regards,
> Zhanjun Dong>
>>> environment.
>>>
>>
>> +cc Lukasz and Marcin
>>
>> Regards,
>> Kamil
>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   tests/intel/xe_fault_injection.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_fault_injection.c 
>>> b/tests/intel/xe_fault_injection.c
>>> index 9e98b3ada..5fca9aefa 100644
>>> --- a/tests/intel/xe_fault_injection.c
>>> +++ b/tests/intel/xe_fault_injection.c
>>> @@ -548,7 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, 
>>> NULL)
>>>           unsigned int flags;
>>>           bool pf_only;
>>>       } probe_fail_functions[] = {
>>> -        { "guc_wait_ucode" },
>>> +        { "guc_wait_ucode", 0, true },
>>>           { "wait_for_lmem_ready" },
>>>           { "xe_add_hw_engine_class_defaults" },
>>>           { "xe_device_create" },
>>> -- 
>>> 2.34.1
>>>
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B8DC47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 11:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978C610E567;
	Mon, 29 Jan 2024 11:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD210E567
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706527709; x=1738063709;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UQAbrt//snMMpRvUf9+FjpvKEDqaOeVNR1suIzU4+ls=;
 b=mfVOXLvS7wgBCtHpmEerGT3/KL+Aq/mbHETXqw9Yg2xfQA3tPX/S9iLB
 Qgcx/+rYwZ/zh7ELILb9yQIVcbpcLeOWRh/mOonVSxgmDfDcA/TA5MW4Z
 IuiPfJi95nsWGlkNycvs7VtiNn9a1xiHIDYsT6f0mk6OsakzJEZqmo+YE
 mxexe0sc1T8aptFpo+kmoiIUJDjEhDIkFkMtis8J2YQWZUy66T0uFx+bM
 ce0aQlMlrRnBnvUs0KQ8XzPxEt8sVVqyGZppcipAM8+Nc/mLmFMv+oziH
 STKmzmdaGAx7dAKJeJD00G3jW2Y9QuIFEwHJmlr4btBZ41zyVgvfy5OEa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9670621"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9670621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="29752312"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.92.201.92])
 ([10.92.201.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:28:26 -0800
Message-ID: <4d9a9241-57ea-4cc7-b902-a57bc5102c69@linux.intel.com>
Date: Mon, 29 Jan 2024 16:58:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 janga.rahul.kumar@intel.com
References: <20240129080155.31648-1-nirmoy.das@intel.com>
 <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
 <266dbc80-7c5c-48e7-ac4e-4aed3bd9f5a6@intel.com>
 <20240129105525.ytxcchtjvvr3lnig@kamilkon-desk.igk.intel.com>
 <e045c8f6-c15e-48ce-81d7-ac688ebe208d@intel.com>
 <20240129111243.figdlpqlph7uomxe@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240129111243.figdlpqlph7uomxe@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

On 1/29/2024 4:42 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-29 at 16:33:05 +0530, Nirmoy Das wrote:
>> Hi Kamil,
>>
>> On 1/29/2024 4:25 PM, Kamil Konieczny wrote:
>>> Hi Nirmoy,
>>> On 2024-01-29 at 14:39:17 +0530, Nirmoy Das wrote:
>>>> On 1/29/2024 2:17 PM, Kamil Konieczny wrote:
>>>>> Hi Nirmoy,
>>>>> On 2024-01-29 at 09:01:55 +0100, Nirmoy Das wrote:
>>>>>> Atomics on system memory for dGPU is not functional
>>>>>> at this moment hence skip on such configuration.
>>>>>>
>>>>>> v2: remove the skip_on.
>>>>>>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Thanks, Kamil. Please also help me  merge this one. Currently I don't have
>>>> access to my devel machine.
>>>>
>>>>
>>>> Nirmoy
>>>>
>>> I will wait for GitLab merge and xeBAT tests.
>>> While at this I will also change subject, you removed skip so:
>>>
>>> [PATCH i-g-t v2] tests/intel/xe_exec_atomic: don't test system memory
>> We do wan to test system memory but only on igfx so you can modify above
>> accordingly.
>>
>> Thanks,
>>
>> Nirmoy
>>
> You are right, what about:
>
> tests/intel/xe_exec_atomic: don't test unsupported config
>
> Atomics on system memory for dGPU is not functional
> at this moment hence don't test such configuration.

Works for me!


Thanks,

Nirmoy

>
> Regards,
> Kamil
>
>>> Regards,
>>> Kamil
>>>
>>>>>> ---
>>>>>>     tests/intel/xe_exec_atomic.c | 9 ++++-----
>>>>>>     1 file changed, 4 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
>>>>>> index 7ee80816c..48c70ec72 100644
>>>>>> --- a/tests/intel/xe_exec_atomic.c
>>>>>> +++ b/tests/intel/xe_exec_atomic.c
>>>>>> @@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>>>>>     static bool has_atomics(int fd, uint32_t region)
>>>>>>     {
>>>>>> -	/* System memory atomics on PVC doesn't work */
>>>>>> -	if (region == system_memory(fd) &&
>>>>>> -	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
>>>>>> +	/* System memory atomics on dGPU is not functional as of now */
>>>>>> +	if (region == system_memory(fd) && xe_has_vram(fd))
>>>>>>     		return false;
>>>>>>     	return true;
>>>>>> @@ -135,8 +134,8 @@ igt_main
>>>>>>     			uint64_t memreg = all_memory_regions(fd), region;
>>>>>>     			xe_for_each_mem_region(fd, memreg, region) {
>>>>>> -
>>>>>> -				igt_skip_on(!has_atomics(fd, region));
>>>>>> +				if (!has_atomics(fd, region))
>>>>>> +					continue;
>>>>>>     				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>>>>>>     					      xe_engine_class_string(hwe->engine_class),
>>>>>> -- 
>>>>>> 2.42.0
>>>>>>

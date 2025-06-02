Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520E5C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 13:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2510E515;
	Mon,  2 Jun 2025 13:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkprBIku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FFE10E515
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748869256; x=1780405256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lpdWRDM8EZUeKhpzNE6sdnG/RM4q6eUJQiFPsT/t58A=;
 b=bkprBIkubJnXaTN8gU8f2wYno3OELQlyVS4hx/It+VVIXV3+w1Ldme3W
 H68Pi4C5YNlUvSUhTO+oVrC3dmLLk3AJgVvKRJDVuLUoI5V/BlpO9/4hk
 +vdQLesEbv1TSOxOyxY/FpIRJRdld0eDaW85I9+7b4eElZFoj/mfUKpgQ
 zBMZJKPC9ZP4nUb8pIvlCT/EaReUuf6BAzKmSX30tH6xI/9746fCQAf0n
 AOq5+ZURWlfhPoDnXvIcWOVnAVaPffy8i+rja5emiz8dRmneBjep2yX/o
 rFtr4tP2eVyOXI4T1WCN7I+kum/1Oe5e8Gk0F/5wR9Tv9FwoS4tdfmke7 A==;
X-CSE-ConnectionGUID: l0dLo0JPSk+O3lJlj7Duiw==
X-CSE-MsgGUID: 9eFOFpDgSAKA3nAxanQ92Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62269179"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="62269179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 06:00:47 -0700
X-CSE-ConnectionGUID: iNER/7CDSkujvyL4BM804w==
X-CSE-MsgGUID: CejXrlG1Q0O1X7rRDyUwog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="175392510"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 02 Jun 2025 06:00:44 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7470433E89;
 Mon,  2 Jun 2025 14:00:43 +0100 (IST)
Message-ID: <7aa19e84-6bd4-4e6c-a70e-242cf96a102a@intel.com>
Date: Mon, 2 Jun 2025 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
 <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 29.05.2025 23:48, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Thursday, May 29, 2025 1:14 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors while injecting fault
>> On 29.05.2025 15:31, Satyanarayana K V P wrote:
>>> Currently, numerous fault messages have been included in the dmesg ignore list,
>>> and this list continues to expand. Each time a new fault injection point is
>>> introduced or a new feature is activated, additional fault messages appear,
>>> making it cumbersome to manage the dmesg ignore list.
>>>
>>> This new patch automatically ignores all error messages from dmesg, eliminating
>>> the need to add or maintain a dmesg ignore message list.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> ---
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>  tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
>>>  1 file changed, 7 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>>> index f9bd5c761..0dffbe5da 100644
>>> --- a/tests/intel/xe_fault_injection.c
>>> +++ b/tests/intel/xe_fault_injection.c
>>> @@ -64,30 +64,9 @@ static int fail_function_open(void)
>>>  	return debugfs_fail_function_dir_fd;
>>>  }
>>>  
>>> -static bool function_is_part_of_guc(const char function_name[])
>>> +static void ignore_faults_in_dmesg(void)
>>>  {
>>> -	return strstr(function_name, "_guc_") != NULL ||
>>> -	       strstr(function_name, "_uc_") != NULL ||
>>> -	       strstr(function_name, "_wopcm_") != NULL;
>>> -}
>>> -
>>> -static void ignore_faults_in_dmesg(const char function_name[])
>>> -{
>>> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
>>> -	char regex[1024] = "probe with driver xe failed with error -12";
>>> -
>>> -	/*
>>> -	 * If GuC module fault is injected, GuC is expected to fail,
>>> -	 * so also ignore GuC init failures in igt_runner.
>>> -	 */
>>> -	if (function_is_part_of_guc(function_name)) {
>>> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>>> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
>>> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
>>> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
>>> -	}
>>> -
>>> -	igt_emit_ignore_dmesg_regex(regex);
>>> +	igt_emit_ignore_dmesg_regex(".*");
>>
>> that will filter out all messages, no?
>>
>> maybe we should look for KERN_ERR level messages
>>
>> if IGT can't filter by level then at least look for our errors:
>>
>> 	xe 0000:00:02.0 [drm] *ERROR*
>> 	xe ... [drm] *ERROR*
>> 	[drm] *ERROR*
>> 	*ERROR*
> 
> The regex for that would probably look something like:
> 
> igt_emit_ignore_dmesg_regex("^((?!ERROR).)*$");
> 
> The above regex should filter out all CI warnings that don't contain errors.

I would prefer regex to match as much as possible and thus include DUT
BDF to avoid filtering out too much

> 
>>
>> and we want to catch/report all warn/WARN/BUG without just relying on
>> taint (and WARN will also catch our xe_asserts)
> 
> If you also want to catch WARNs and BUGs, then the filter would look
> more like:

we don't expect any WARNs or BUGs so we do not want them to be filtered
out, but highlighted instead

> 
> igt_emit_ignore_dmesg_regex("^((?!ERROR|WARN|BUG).)*$");
> 
> Would either of these be more amenable, Michal?
> -Jonathan Cavitt
> 
>>
>>


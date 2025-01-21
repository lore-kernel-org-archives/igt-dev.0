Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962CCC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 09:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41F10E51D;
	Tue, 21 Jan 2025 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvzZNVrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778C610E51D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737451814; x=1768987814;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pIOOl+TPEnNmEm4uMmt8j/BNx4xtj/JuSumBpe2ORCE=;
 b=GvzZNVrOselr45BlBc0gv7HUuGS7t7R8//YWDa+uebUucgGSZxYDkB21
 jk8k+CmkIOiiJIFT6S3pmIKOTj1vssJYlmENrrw39ZSzEFMdhfCw85lkX
 y2kKu71kfDd2M9FDs8Qvs5E3/8QcYlXoBMslurMS7on/Af29FwWd5+3Ho
 +Bn+cfCtQrRjgaJVV8m1HyQLMAXBZi8pTINf9v8RMXDl+vzcbTbueqlY1
 VkiYVDityraQRM6AByGF2idda/8L+SBZ0gReLQWfvZtyF8JvNbFcWGh/C
 FYYKgEZFZKw4ak5CMBfCdS6l31OZPVkP+G52/VQJm+tr9sLh5VUvP2WEj Q==;
X-CSE-ConnectionGUID: 8r/GgYQxS+6qP+7mwpEBEw==
X-CSE-MsgGUID: 7NM+anXzTtSnT6IK68NKow==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41615169"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="41615169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:30:13 -0800
X-CSE-ConnectionGUID: hyqfCH82QwCqLU4gX6SvLw==
X-CSE-MsgGUID: PEt72GquSRuxB4T9ib1MHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106581232"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:30:13 -0800
Message-ID: <b1c07be9-1122-4b87-aa1e-7b634a48518a@linux.intel.com>
Date: Tue, 21 Jan 2025 10:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-2-pravalika.gurram@intel.com>
 <21d050fd-f30f-4759-86b7-343d3f7b1015@linux.intel.com>
 <BL1PR11MB55257D034ACCBD6FF163A80584E62@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <BL1PR11MB55257D034ACCBD6FF163A80584E62@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Pravalika,

Please see my answers below.

>>>
>>> diff --git a/lib/igt_facts.c b/lib/igt_facts.c index
>>> 2e04a7c86..bd6742065 100644
>>> --- a/lib/igt_facts.c
>>> +++ b/lib/igt_facts.c
>>> @@ -748,7 +748,7 @@ static void igt_facts_test_mark_and_sweep(struct
>> igt_list_head *head)
>>>   *
>>>   * Returns: bool indicating if the tests passed
>>>   */
>>> -void igt_facts_test(void)
>>> +__noreturn void igt_facts_test(void)
>>
>> How did you find this? Is the compiler complaining?
>>
> When am fixing the check patch errors I have seen below error 
> 
> ninja: Entering directory `build'
> [2/835] Compiling C object lib/libigt-igt_facts_c.a.p/igt_facts.c.o
> ../lib/igt_facts.c: In function ‘igt_facts_test’:
> ../lib/igt_facts.c:751:6: warning: function might be candidate for attribute ‘noreturn’ [-Wsuggest-attribute=noreturn]
>   751 | void igt_facts_test(void)
>       |      ^~~~~~~~~~~~~~
> [6/6] Generating docs/testplan/intel-ci-tests with a custom command

Is your tree clean? What command line are you using? Asking because I see no
warnings when I build with:

 rm -rf build/ && meson build && ninja -C build


> 
> Then have added changes.
>>>  {
>>>  	const char *last_test = "Unit Testing";
>>>
>>> @@ -776,4 +776,6 @@ void igt_facts_test(void)
>>>  	/* Clean up the list and call igt_facts(). This should not crash */
>>>  	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
>>>  	igt_facts(last_test);
>>> +
>>> +	igt_exit();
>>>  }
>> Why adding igt_exit() here?
>>
>> How did you test this patch?
>>
> If we don’t explicitly specify igt_exit() I will below warning 
> 
> ninja: Entering directory `build'
> [43/999] Compiling C object lib/libigt-igt_facts_c.a.p/igt_facts.c.o
> ../lib/igt_facts.c: In function ‘igt_facts_test’:
> ../lib/igt_facts.c:779:1: warning: ‘noreturn’ function does return
>   779 | }
>       | ^
> I have compiled since these check patch errors

Curious with your command line to see these warning here too.

Compiling only is not enough testing. Please run unit testing, and a few
calls to igt_runner with facts enabled, with large test lists such as xe
bat or i915 bat, and in a RIL DUT. Compare the facts before and after
your changes to make sure nothing breaks.


> 
>> Thanks,
>>
>> Peter


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6ED5E12A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 05:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3CA10E1CA;
	Fri,  8 Nov 2024 05:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGg+8qIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8236910E1CA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731043867; x=1762579867;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D/zXvC5vwCSCcWrBo0yla7chL3jIF8+RkebBN019DZI=;
 b=NGg+8qIn1JnNp4WvL8s+EpRfFcai2ncRQaX4OybnRj5xEc113lCOC+ID
 YCUkgwA8PhfEs1NtOxQ5/hg3PIdlXtk1Mel4kO+tUYp/gFEj00/ifs9Ea
 1/cLdlL1EdVDWRMEPCDmnKe88AdD4S8BDOs4/a8/HW3InGX6VUF2ADawX
 FSZ8X1K32enr8NAtji9uSYo1DtsovJ9G34F7jLjxDvHP6v1Pns7smFOZW
 sjPpe7BP8KoB7fKRIGHwkZEc/3vJM2+qXFIizv5KXm5NC7jluqPjles9Y
 jSIN/UmK240M80eGigcrcG0mRFVvmZvgYM0mxlXtqD1FbPiJ+H59gVvU/ Q==;
X-CSE-ConnectionGUID: IYGgBaM4QseWsbZmOrvWSA==
X-CSE-MsgGUID: FaCM2HtGSgegnWvkYed+Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30332976"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30332976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:31:07 -0800
X-CSE-ConnectionGUID: saW89dNmQ7+gTYmCTz7cZQ==
X-CSE-MsgGUID: pbgLFS1DSCGgQ0RWydLMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="108673251"
Received: from askrebko-mobl1.ger.corp.intel.com (HELO [10.213.195.95])
 ([10.213.195.95])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:31:06 -0800
Message-ID: <51565249-4fd9-4e7c-a7fc-321ff9e40859@linux.intel.com>
Date: Fri, 8 Nov 2024 06:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] igt-runner fact checking
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 ryszard.knop@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
 <5a7f1522-b060-4721-a3b8-bdda40e3a7d9@linux.intel.com>
 <2znykwayxm74wqltmbbas45r6zhyllxcmr5g4jywcfuw5atzvu@46cr4rouvdil>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <2znykwayxm74wqltmbbas45r6zhyllxcmr5g4jywcfuw5atzvu@46cr4rouvdil>
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

Hi Lucas,

Thank you for your detailed message, and sorry for my broken word wrap in the
previous messages.

On 07.11.2024 20:29, Lucas De Marchi wrote:
> On Thu, Nov 07, 2024 at 06:48:39PM +0100, Peter Senna Tschudin wrote:
>> Hi Lucas,
>>
>> Thank you for your reply.
>>
>> On 07.11.2024 16:55, Lucas De Marchi wrote:
>>> +Ryszard to know if the CI part would be doable.
>>>
>>> On Thu, Nov 07, 2024 at 08:18:52AM +0100, Peter Senna Tschudin wrote:
>>>>>> +    scan_kernel_loaded_kmods(list, last_test);
>>>>>
>>>>>
>>>>> So... igt_facts() hardcodes what is the info collected. Maybe we
>>>>> should rather plug this into the hooks framework as part of
>>>>> "built-in hooks".
>>>>
>>>> I do not follow what you are trying to communicate here. Also, please see
>>>> what Zbigniew said here*. Facts are not test requirements, but the line is
>>>> blurry. In the context here a fact is something in the environment that can
>>>> change but that should not. An example is the disappearing GPU.
>>>
>>> $ ./build/runner/igt_runner --help | grep -A1 hook
>>>   --hook HOOK_STR
>>>                         Forward HOOK_STR to the --hook option of each test.
>>>   --help-hook
>>>                         Show detailed usage information for --hook.
>>>
>>> So... today we already have "generic support" for running arbitrary
>>> things before/after each test/subtest/dynamic-subtest.
>>>
>>>     $ cat << EOF > testlist.txt
>>>     igt@xe_exec_basic@once-basic
>>>     EOF
>>>     $ chmod +x lspci.sh
>>>     $ sudo ./build/runner/igt_runner \
>>>         --hook 'post-subtest:lspci -vv -d 8086:*:03xx' \
>>>         --test-list testlist.txt build/tests/ results/
>>>     $ head -n4 results/0/out.txt
>>>     03:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A580] (rev
>>> 08) (prog-if 00 [VGA controller])
>>>         Subsystem: Intel Corporation Device 1425
>>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>>> Stepping- SERR- FastB2B- DisINTx-
>>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>>> <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>
>>> So, instead of creating a separate thing called "igt_facts", what I'm
>>> proposing is that we build this on top of the hooks and these "facts"
>>> are simply built-in hooks that are commonly used. We may even keep them
>>> as scripts rather than translate to C.
>>
>> I fail to understand why one would want to do that. It feels hackish and
>> misses the point. I would support your suggestion if we were talking about a
>> temporary debug tool.
>>
>> The igt-facts are not meant to be temporary, I dislike the overhead, and I
>> dislike the hackish nature of this mechanism. Can you tell me what are the
>> benefits of using these hooks? This is an honest question, I do not understand.
> 
> Having it in C would be completely fine too if with that it feels less
> hackish to you. Key thing here is how it's integrated in igt_runner and
> tests. We already have a generic infra for that, yet we are trying to add
> another one.


In one hand having it in C can an improvement depending on how the hook calls
the c function. On the other is worse as it will require us shipping dead code
that requires a magic command line option to activate.

You have potential to make it faster, but you kill one of the value propositions
from the hook infra: the ability to add a hook without requiring changes to the
code.

> 
>>
>>>
>>> What I'd like is something liked this (with whatever name we decide):
>>>
>>>     sudo ./build/runner/igt_runner --builtin-hooks lspci,drm-cards
>>
>> This is far from what I am proposing in purpose and in architecture.
>>
>>>
>>> which is a shorthand or equivalent to:
>>>
>>>     sudo ./build/runner/igt_runner \
>>>         --hook post-subtest:$PWD/scripts/built-in-hooks/lspci.sh \
>>>         --hook post-subtest:$PWD/scripts/built-in-hooks/drm-cards.sh \
>>>         --test-list testlist.txt build/tests/ results/
>>
>> For me this feels like a bad idea. It is probably an order of magnitude slower
>> to run, and it is also granular in a way that I fail to understand. igt-facts
>> should not be selected at runtime by the user because we do not know when the
>> facts will change. Again, think of the disappearing GPU: it is a 1 in
>> 1'000'000 kind of event, but is super valuable to know when it happens.
> 
> So what? If we want it to run by default, we can:  CI just have to add
> it as argument that is passed by default. See all the additional options
> CI already passes. It's also not like 1 in 1'000'000 that's happening.
> For the next bug we are chasing, it's likely not about a card disappearing
> and rather about something else that we will have to add another hook/fact.
> I don't like the idea of infinitely adding these things without a quick
> way to enable/disable.
> 
> If you dislike the additional fork+exec, this would have the same effect
> of what you did:
> 
> sudo ./build/runner/igt_runner \
>     --hook post-subtest:builtin:scan_kernel_loaded_kmods \
>     ...
> 
> Again, I'm more concerned about the integration than if this is in C or
> in python or in bash.

Judging by your suggestion the hooks are not adequate for the igt-facts. My take
from "all the additional options CI already passes" is that we should fix that
instead of making this problem measurably worse.

The facts are supposed to be always enabled, and they should always run on CI
and on the developer machine. It is ok to add new functionality when the
existing hook infrastructure is meant to something different.

From the architectural perspective, current hook infrastructure is meant for:
 - quick, as in not requiring a patch, changes at run time
 - quick, as in just run this now please, tools or debug that are temporary

igt-facts are neither of these things.

So no, no hooks from the command line for igt-facts.

As for "It's also not like 1 in 1'000'000 that's happening.", I meant it
literally. Count how many subtests CI runs between each time CI detects a
disappearing GPU and I expect the number to be very large. For the V3 of my
patch I counted 20'942 subtests on "IGTPW_12057" alone which is only a fraction
of all subtests ran for a single patch.

Peter

[...]



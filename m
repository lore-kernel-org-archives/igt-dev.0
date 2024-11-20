Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4221D6E2C2
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 06:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F58310E149;
	Wed, 20 Nov 2024 06:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxMtlu+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108B10E149
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 06:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732082993; x=1763618993;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ug9rcq/Zmy4nKfwBFvqpGEnDonn8TxRK6nJx4NCpBTg=;
 b=gxMtlu+SC2G4oKD+6q5hqZJBwSyhCDT8yX9k/l1uX2Wm2w/tCAc6qFny
 HZMzSL2KKtqk5LnAtaPaGewkMM9hbn9uHGCcWqCIHiy2DXoNWVNOtvyB6
 HVwb/TX3K7naH1WM+e705fALK5UoCd4BNhWaO+AbSwSN1CR8akbeXyQe8
 R5k/kJK6L3jt5y4J3UifT2xwATWLQSIW6gnnp2/6HaDHEwDHfbwKbI7Jk
 YU/x97pKhG2PPNXVT5anhon35AaAJGTF3PyT+8A+zMn0JjvxRUrCSRRyO
 Ejn1G/4iRzRVxsMx+ihrx4DbdVYH+aXOVOX/JsRvFrzzrppxYH4PV1bmU g==;
X-CSE-ConnectionGUID: oVJNuXsfSEiwvSUtsvssAg==
X-CSE-MsgGUID: upCuAfT5QQOwNHnaub0pFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="34977626"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="34977626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 22:09:53 -0800
X-CSE-ConnectionGUID: mmTExuv/QJa8tUslJbwbOA==
X-CSE-MsgGUID: 4zVgyL0gQDyYFp0LVaTsZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89795875"
Received: from mpedus-mobl.ger.corp.intel.com (HELO [10.213.197.19])
 ([10.213.197.19])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 22:09:51 -0800
Message-ID: <dbf0f2ac-e17b-4c5f-9d60-d31d83f0fd44@linux.intel.com>
Date: Wed, 20 Nov 2024 07:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] igt-runner fact checking
To: Luca Coelho <luca@coelho.fi>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
References: <384b983e-b1f5-4266-aa14-5739397bc7a1@linux.intel.com>
 <b7299a2dc50db417a360d702c660ec57b8733f34.camel@coelho.fi>
 <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
 <51b9e5c77447517a40da09cc38222ef719801bb3.camel@coelho.fi>
 <ae7b998d-6675-480e-9ce6-c822208b5009@linux.intel.com>
 <549c203abba22cbff91b79546a5ab6a72cab26ea.camel@coelho.fi>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <549c203abba22cbff91b79546a5ab6a72cab26ea.camel@coelho.fi>
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



On 19.11.2024 11:24, Luca Coelho wrote:
> On Tue, 2024-11-19 at 11:07 +0100, Peter Senna Tschudin wrote:
>>
>> On 19.11.2024 09:19, Luca Coelho wrote:
>>> On Mon, 2024-11-18 at 17:03 +0100, Peter Senna Tschudin wrote:
>>>>
>>>> On 18.11.2024 14:07, Luca Coelho wrote:
>>>>> This makes me start thinking... it would be so much easier to make all
>>>>> this in python.  Would it be possible to glue a python script to igt-
>>>>> runner (or whoever calls it) and get the data from dmesg, lsmod etc.?
>>>>> Or otherwise aren't there any libraries already used by IGT that
>>>>> include list handling?
>>>>
>>>> Absolutely no python here. Never! :-)
>>>
>>> Oh, well.  Can't really argue against dogmas...
>>
>> Wow, that was a low punch.
> 
> Oh, sorry for that, it was not my intention to punch you at all, much
> less a low punch. ;) But it seemed like a dry, I-don't-even-want-to-
> talk-about-it statement to me, without any explanations, which looks
> like a dogma to me...
> 
> 
>> This code is going to run about 1M times / day in our CI. There is history
>> that precedes me working on IGT of issues created by trying to mix c and
>> python in igt. The reasons for not trying python again are runtime overhead
>> and the history of such attempts in igt that just made a bunch of people and
>> our CI very upset.
> 
> Okay, now that's an explanation. :) It makes some sense, and obviously
> I'm not trying to change how the entire IGT framework is implemented. 
> But looking at all this C code doing something that can be done in way
> fewer lines in python, just got me wondering.
> 
> I think the previous IGT trials with python were probably not really
> done right, because I'm pretty sure it could be made in a way that
> would be very efficient.  Probably not having C invoke a shell to run
> python, but some proper bindings, or maybe even better, having python
> wrap around the C code.
> 
> In this specific case, I think you could neatly wrap some python around
> igt-runner to gather these facts.  But TBH I don't even know the
> details of how igt-runner and everything else is invoked in IGT...
> 
> In any case, if using python is an established no-no in IGT, all this
> conversation is moot.

The way to go may be to create a new Python framework that uses igt
under the hood. This will allow us to reuse all existing tests, will
empower us to do stuff like you want, and open testing to a broader
audience.

Another way may be to go even higher level than with something like
Robot Framework as front-end and having igt as the back end (with some
probable python glue code in between).

How do you feel about these?

> 
> I'll reply to the rest of your email later, when I find some more time
> again.

Thanks again. After sending you the reply I remembered the reason why I
am hiding errors. This code I am adding is like the alarm in your car. I
like the car alarm analogy because the main value of igt-facts will be
to detect really weird stuff like a gpu disappearing from the pci bus.

With the volume of tests we run, this will be a rare occurrence at best
which kind of match the number of times someone tries to steal your car.

I am fairly confident that you do not want an check engine light and
having your car powering itself off when the ICU detects an issue in the
alarm sub-system.

In the same way, I evaluated that I do not want to abort igt-runner
verbosely if something weird goes on with igt-facts. So I decided that
it is ok for the igt-facts to fail silently so that igt-runner will
continue to run and do it's thing.

Is it ok for igt-facts to fail silently or do you prefer something else?

Thanks!

> 
> 
> --
> Cheers,
> Luca.




Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C17C44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9769410F542;
	Fri, 17 Jul 2026 12:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Gf4OzZp6";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0CE10F542
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=dGWDXiuSpfdFZMWe5gMBp8A1S4tYrx0BXYrR4XpzvTU=; b=Gf4OzZp6dNCw2crqhMsFqyf2sy
 2892VyOJdX0OpWMkPJ3YINKo1ZpZz+OKSfOn/iZXotHdDjDp3hb6U8cvoTWuzsZ2FudENDIcZfMl8
 Ihl7digwRS9VHqIpcIuR3nlwgEvz0AngOf3HrGDSkck1kPtzVk8uEpHfpCybxC5dIR+H5rLeGc4Ba
 Sm0b9F1n/3Y5H1gqjTwxBq35QXKO1QXV1DI2Ptt40BYnjY5osKXNvt6DAm3Xdb329r6ZcM0ltMFM6
 YIkE7iPkTror2xkNA7SlL3R10p0DuxUdAhJQC1PjKK7b9FuWjyd9+ypiYGKgWMyIJqUkcU92u93Ej
 XgoM0/hw==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wkhjg-00GRCV-4b; Fri, 17 Jul 2026 14:32:12 +0200
Message-ID: <334ad2b5-a477-4985-8dd4-ca4d2faa8603@igalia.com>
Date: Fri, 17 Jul 2026 13:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign
 + LR mode
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, lukasz.laguna@intel.com,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
 <87842c6f-f1b1-4a85-94bf-195a4930c247@igalia.com>
 <26e3b680-63d1-48c8-b5aa-b728650a8556@linux.intel.com>
 <7739fa70-a7f2-42a0-8c92-4645c9dedfe5@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7739fa70-a7f2-42a0-8c92-4645c9dedfe5@linux.intel.com>
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


On 17/07/2026 13:09, Bernatowicz, Marcin wrote:
> 
> On 7/17/2026 10:03 AM, Bernatowicz, Marcin wrote:
>>
>> On 7/15/2026 3:36 PM, Tvrtko Ursulin wrote:
>>>
>>> On 14/07/2026 16:12, Marcin Bernatowicz wrote:
>>>> This series extends gem_wsim VM management for Xe.
>>>>
>>>> Patch 1 adds explicit VM create/assign steps in workload descriptors:
>>>> V.N to create VM N and v.N.M to bind context M to VM N.
>>>>
>>>> Patch 2 adds c.N to enable compute/LR mode on selected VMs.
>>>> README is updated with syntax and VM usage examples.
>>>>
>>>> Marcin Bernatowicz (2):
>>>>    benchmarks/gem_wsim: add explicit VM create/assign steps
>>>>    benchmarks/gem_wsim: add compute/LR mode support for Xe VMs
>>>
>>> I see these two patches have my Suggested-by but to be honest I do 
>>> not remember any of it! :)
>>
>> That's a very old thread on the first patches adjusting the tool to 
>> Xe: https://lore.kernel.org/all/431b9135-1c7c-cbf7-cc3a- 
>> f8d52ff1f015@linux.intel.com/ ;)
>>
>>>
>>> Can I use the opportunity to ask how is the status of the tool on xe? 
>>> Do working set and working set dependencies work for example?
>> It's used for basic/simple workloads on VMs (Virtual Machines) with 
>> passed-through SR-IOV VF devices in regular runs (we use the expected 
>> duration of repeated workloads).
>>
>> Lately, it helped me investigate an RCS/CCS dependency issue: https:// 
>> lore.kernel.org/all/20260708100616.1050537-1- 
>> marcin.bernatowicz@linux.intel.com/
>>
>> So, I find it very useful for quick scheduling dependency checks 
>> without having to craft or adjust IGT tests.
>>
>> I haven't looked at working set / working set dependencies on Xe yet :/
> 
> I'm planning to send a follow-up series for working sets on Xe soon.

For the record I don't personally need it, but was just curious given a 
colleague is looking into TTM eviction behaviour so this reminded me how
  back in the day, when I added working set support to wsim, it was 
exactly for improving the eviction behaviour of i915 as we we adding 
discrete GPU support I believe. Details escape me.. But 61d49ef6f274 
("gem_wsim: Snippet of a workload extracted from carchase") suggests 
this demo was useful back then and I think I had a script which 
converted the trace log to this wsim. Plan being to make some more 
mirroring interesting games, with the benefit of not needing to install 
the actual game, etc, but if the system can run IGT that's it, done, it 
can be replayed to oblivion and kernel tweaks tested quickly and easily.

Anyway, I'll copy Cascardo just as a curiosity/visibility on 
crazy/interesting tools. If you go to read it, you will sure get 
confused by the .wsim syntax.

Essentially the tools allows to write a workload defining arbitrary 
dummy GPU jobs, each with arbitrary buffers and/or fence dependencies, 
loop them, run N in parallel or not etc. It could be useful for TTM 
improvements once Marcin brings the xe backend to feature parity with i915.

Regards,

Tvrtko


> 
>>
>> Regards,
>>
>> marcin
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>   benchmarks/gem_wsim.c  | 310 +++++++++++++++++++++++++++++++++++ 
>>>> +-----
>>>>   benchmarks/wsim/README |  32 +++++
>>>>   2 files changed, 311 insertions(+), 31 deletions(-)
>>>>
>>>


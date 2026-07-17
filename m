Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A48C44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4234910E45B;
	Fri, 17 Jul 2026 12:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HD4Kq/ab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9C10E43D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784290195; x=1815826195;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=MTknLjNd/Md1w57S9fGAhVHkK6im1MWaNvndSbH3RL0=;
 b=HD4Kq/absKVVk25bKrHyi7NtWEjSrys5hbYIsc3S1N3ouOw78wC6+reQ
 y/OHacKGR5CH+NrPkPRyTiskISFPAJYVgsOLqh8ogBs7UkXrDu/qQKHvw
 Y2OLden+mzjWPNamc0kR8gj37e38wn4zmVhs6NRZETxlZij5uMLV5sB03
 gdRTveA6pdbL6X3FJejTrAT3Au0cj0wKiAdzBZX4JYnOPwU4k3WYUf8aI
 PQDFgoe5m0XXHyCmvgPiY+VHl6gk0k4q8ARJROU0fs6L6/F56Ge0igJSx
 Zaiv9JE7YqbMgAHG1NQ9nVwo71gPJ7reiyehnfVHnMBR+Uw910IIJunae w==;
X-CSE-ConnectionGUID: 0pOTRiJtQuWoi8N0Sj2/qg==
X-CSE-MsgGUID: 1Evmh105S36tvNuNVZD4sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102386008"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="102386008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:09:54 -0700
X-CSE-ConnectionGUID: kY1IaYJtT2mQLLpG/lMqLg==
X-CSE-MsgGUID: MXFHToOGSQu8QXIv5qWSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286853558"
Received: from gcascio-mobl1.ger.corp.intel.com (HELO [10.94.249.102])
 ([10.94.249.102])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:09:52 -0700
Message-ID: <7739fa70-a7f2-42a0-8c92-4645c9dedfe5@linux.intel.com>
Date: Fri, 17 Jul 2026 14:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign
 + LR mode
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
References: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
 <87842c6f-f1b1-4a85-94bf-195a4930c247@igalia.com>
 <26e3b680-63d1-48c8-b5aa-b728650a8556@linux.intel.com>
Content-Language: en-US
In-Reply-To: <26e3b680-63d1-48c8-b5aa-b728650a8556@linux.intel.com>
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


On 7/17/2026 10:03 AM, Bernatowicz, Marcin wrote:
>
> On 7/15/2026 3:36 PM, Tvrtko Ursulin wrote:
>>
>> On 14/07/2026 16:12, Marcin Bernatowicz wrote:
>>> This series extends gem_wsim VM management for Xe.
>>>
>>> Patch 1 adds explicit VM create/assign steps in workload descriptors:
>>> V.N to create VM N and v.N.M to bind context M to VM N.
>>>
>>> Patch 2 adds c.N to enable compute/LR mode on selected VMs.
>>> README is updated with syntax and VM usage examples.
>>>
>>> Marcin Bernatowicz (2):
>>>    benchmarks/gem_wsim: add explicit VM create/assign steps
>>>    benchmarks/gem_wsim: add compute/LR mode support for Xe VMs
>>
>> I see these two patches have my Suggested-by but to be honest I do 
>> not remember any of it! :)
>
> That's a very old thread on the first patches adjusting the tool to 
> Xe: 
> https://lore.kernel.org/all/431b9135-1c7c-cbf7-cc3a-f8d52ff1f015@linux.intel.com/ 
> ;)
>
>>
>> Can I use the opportunity to ask how is the status of the tool on xe? 
>> Do working set and working set dependencies work for example?
> It's used for basic/simple workloads on VMs (Virtual Machines) with 
> passed-through SR-IOV VF devices in regular runs (we use the expected 
> duration of repeated workloads).
>
> Lately, it helped me investigate an RCS/CCS dependency issue: 
> https://lore.kernel.org/all/20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com/
>
> So, I find it very useful for quick scheduling dependency checks 
> without having to craft or adjust IGT tests.
>
> I haven't looked at working set / working set dependencies on Xe yet :/

I'm planning to send a follow-up series for working sets on Xe soon.


>
> Regards,
>
> marcin
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>>   benchmarks/gem_wsim.c  | 310 
>>> ++++++++++++++++++++++++++++++++++++-----
>>>   benchmarks/wsim/README |  32 +++++
>>>   2 files changed, 311 insertions(+), 31 deletions(-)
>>>
>>

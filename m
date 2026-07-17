Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08691C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B8610F495;
	Fri, 17 Jul 2026 08:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvLEz3Qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AAA10F48E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784275394; x=1815811394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7k4f68L8CSLa9Osvav7M7h8D/fTpfOfsP3w+zGZuim0=;
 b=lvLEz3QjRu+aOAO+sc16CssINoZTCBqVZ5JWzcdsE2sklz9PwqYYgW5A
 1efsSROfbDBotRVY0XpqHqWmBnzP+PnkqeSe2LuzPAIOyDR7RcCemE6FE
 fmRP3eId+VobnkwqKQSouowYyXr3bXIt4kjm1xwqIbwS8ClD6BUKz9Woe
 T6Hp+W+fCkJQoDvQ8+ejlskGta/c7DPxXrBa2h8Y5c9MslMxwOliZg6Dd
 YMdaCt8752EMbsu3nIqTnLLfYeaI74Hk6vS1g6Jxuj8xFYvS5ew03q1yO
 HdznQ2oRy1AwImMjBqUA4drs7CJXLdhirekdjsAwsFAM/J64dj+osOc8x w==;
X-CSE-ConnectionGUID: +MJJwkzNSsec0KODCfjUWg==
X-CSE-MsgGUID: n6V54LFUQ06nkq+FIVUtMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102496312"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="102496312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:03:14 -0700
X-CSE-ConnectionGUID: d0JrTLZcR0myWFXwNN7DXw==
X-CSE-MsgGUID: cdxoG+ofR46E/tdFUWP/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="252318855"
Received: from svinogra-mobl.ccr.corp.intel.com (HELO [10.245.81.243])
 ([10.245.81.243])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:03:12 -0700
Message-ID: <26e3b680-63d1-48c8-b5aa-b728650a8556@linux.intel.com>
Date: Fri, 17 Jul 2026 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign
 + LR mode
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
References: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
 <87842c6f-f1b1-4a85-94bf-195a4930c247@igalia.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <87842c6f-f1b1-4a85-94bf-195a4930c247@igalia.com>
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


On 7/15/2026 3:36 PM, Tvrtko Ursulin wrote:
>
> On 14/07/2026 16:12, Marcin Bernatowicz wrote:
>> This series extends gem_wsim VM management for Xe.
>>
>> Patch 1 adds explicit VM create/assign steps in workload descriptors:
>> V.N to create VM N and v.N.M to bind context M to VM N.
>>
>> Patch 2 adds c.N to enable compute/LR mode on selected VMs.
>> README is updated with syntax and VM usage examples.
>>
>> Marcin Bernatowicz (2):
>>    benchmarks/gem_wsim: add explicit VM create/assign steps
>>    benchmarks/gem_wsim: add compute/LR mode support for Xe VMs
>
> I see these two patches have my Suggested-by but to be honest I do not 
> remember any of it! :)

That's a very old thread on the first patches adjusting the tool to Xe: 
https://lore.kernel.org/all/431b9135-1c7c-cbf7-cc3a-f8d52ff1f015@linux.intel.com/ 
;)

>
> Can I use the opportunity to ask how is the status of the tool on xe? 
> Do working set and working set dependencies work for example?
It's used for basic/simple workloads on VMs (Virtual Machines) with 
passed-through SR-IOV VF devices in regular runs (we use the expected 
duration of repeated workloads).

Lately, it helped me investigate an RCS/CCS dependency issue: 
https://lore.kernel.org/all/20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com/

So, I find it very useful for quick scheduling dependency checks without 
having to craft or adjust IGT tests.

I haven't looked at working set / working set dependencies on Xe yet :/

Regards,

marcin

>
> Regards,
>
> Tvrtko
>
>>   benchmarks/gem_wsim.c  | 310 ++++++++++++++++++++++++++++++++++++-----
>>   benchmarks/wsim/README |  32 +++++
>>   2 files changed, 311 insertions(+), 31 deletions(-)
>>
>

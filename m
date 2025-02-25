Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8B9C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 18:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571E310E78D;
	Tue, 25 Feb 2025 18:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDfqWb2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4DD10E78D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740506784; x=1772042784;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=kq910mpCLTHNOBOD4VZi1qb4GMuUfk2O6E1JQ+la6QA=;
 b=LDfqWb2xshKb2xjlPLvMjNDurVSojaIOeKHjofap8L2/V0zIKNFawiub
 VvpFuN9kHeNV1jloeeL6pQnfY2rgKo61dVwpA3kBeiorlDpOe3quD3GnQ
 iM3+HOUEx7deEjWXGq5r65jvxiyf1GvCZhLoyzzh3aB/zDrAVGu/beYDs
 P/VLzzuYFtiFv8jl1rNyD+Le6PcAAAtHU2fgNCL4TMDSgprJdfDsE5KHY
 Rdl/YDv/p7X8GSS1YD4tV8y5MAq3CNyRzbi7A+a1dJm/Jcm3J3/Q5YDV/
 GVQXEo6ceIoE/FVpLhG0YwpyNF6C2TFHYnNYOPSYut+pubgpgTjPV/ikX Q==;
X-CSE-ConnectionGUID: r6EN8GNiTGSAiY4Al4wpWw==
X-CSE-MsgGUID: ac5xwgjgS+yycU5lwJP2oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41580215"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41580215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:06:24 -0800
X-CSE-ConnectionGUID: 3bF1TKzsSTGfUJ4T3kUHdQ==
X-CSE-MsgGUID: 4xSfpSTBSU2EoD0teoIAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121075239"
Received: from ykhaled-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:06:22 -0800
Message-ID: <5770f7ad-9a63-494a-a780-90520abc1977@linux.intel.com>
Date: Tue, 25 Feb 2025 19:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
 <d07d932d-bfb3-4cf4-b12c-a885c62867a9@linux.intel.com>
Content-Language: en-US
In-Reply-To: <d07d932d-bfb3-4cf4-b12c-a885c62867a9@linux.intel.com>
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

Hi Zbigniew,

On 25.02.2025 14:46, Peter Senna Tschudin wrote:
> Hi Zbigniew,
> 
> On 11.02.2025 17:17, Zbigniew Kempczyński wrote:
> [...]
> 
>>
>> I'm looking at the code and I have impression this should be part of
>> the runner, not igt library. Do I understand correctly that your
>> code will be used by the runner only and not by the tests?
>>
>> Regarding your above question, I think runner should use as much as
>> minimal from lib/ directory, because this is collection of functions
>> designed for tests, not for runner. I think generic code like data
>> structures (lists) are fine, but not the others. Imagine you'll
>> incidentally try to use igt_require() - follow the call and see
>> the pitfall there.
>>
>> So if my understanding is correct and this code should be part of the
>> runner only your test might be moved to the runner_tests.c.
>>
>> BTW please rebase on top of current master, there were changes in
>> the runner/settings.c file that affects this series.
> 
> I sent V5 a few moments ago and I included the AMD folks who sent a patch
> to add kmemleaks integration as a library for tests. Please have a look at
> the last comment from AMD explaining why adding a lib for tests:
> 
> https://patchwork.freedesktop.org/series/145011/
> 
> I feel we should work with them to avoid duplication functionality. What
> are your toughs?

I have a proposal: what about extending the kmemleak library to add an
additional option that to accept a test list file pointing to the
tests we want to collect kmemleak reports? At least in theory this will
allow the AMD folks to do what they want. Something like:
 - once: collect kmemleak reports after running all tests
 - each: collect kmemleak reports after running each test
 - file: collect kmemleak reports after each test on the file

Please let me know what you think.

Thanks,

Peter

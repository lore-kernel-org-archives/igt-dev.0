Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E282C021BC
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 09:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EB410E89E;
	Wed, 26 Feb 2025 09:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoV2S21a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D9C10E89E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740562998; x=1772098998;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ctfj0CwBcA4JggQiZoA491VVfCNsnFK8Bby06rOw5ko=;
 b=IoV2S21a+7AykWoOQy21bnS4pZlbOl0J6OJW8ZAusKT9JxLfC4TbJoKn
 CfzBDSGaeEuFJ0luIyb5G7Y6WZK3CMQz4xuga8s0IE1pjIWmI09ppEUw9
 UnVP8NqzdiNGcsV4yPo745GsGL4vStLJFrhB0EK7Anq4n/SoE2FbWGbpF
 srqItygPLmSOJdxbpjQ93NCjcWsfyRSnPHgvwaIsLOqMousMu4mA2lKjw
 3Xo8NPzsy+jfdia5GWRuND5qsP8i4ovTcISp67L8Rwmw/y/4SGKgNPtGC
 DirrpkHYezDyT8yqcMuYkgrl1vzv4ruGTUIUUz8EvjkyY+bQpCbi5BOvA A==;
X-CSE-ConnectionGUID: riYGuBuaQU22b1zN50MgrQ==
X-CSE-MsgGUID: oXM9KovdRIiI/ezoZHmBWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41598209"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41598209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:43:18 -0800
X-CSE-ConnectionGUID: ps93su6FTxehpR1WUokt1A==
X-CSE-MsgGUID: 5g3vaGHZTxSBy+A+/z+b5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117143380"
Received: from pbabighi-mobl1.amr.corp.intel.com (HELO [10.246.16.179])
 ([10.246.16.179])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:43:13 -0800
Message-ID: <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
Date: Wed, 26 Feb 2025 10:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 vitaly prosyak <vprosyak@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
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

Hello Vitaly,

On 26.02.2025 10:09, Zbigniew Kempczyński wrote:
> On Wed, Feb 19, 2025 at 12:50:49PM -0500, vitaly prosyak wrote:
>> Hi Kamil,
>>
>> Thanks for raising this question. Currently, only a single test uses the memleak feature. However, we are planning to add more. This effort requires careful selection, as we want to avoid unnecessary overhead or burden. Enabling the memleak configuration significantly slows down test execution—potentially increasing the duration by 2-3 times.
>>
>> Additionally, we aim to reach internal consensus on which tests should have this feature enabled. We also want to avoid enabling both KASAN and memleak simultaneously. These considerations are the reason for the delay.
>>
>> Thanks for your understanding!
>>
>> Vitaly
> 
> +Peter
> 
> Peter proposed solution which is global and vendor agnostic. I mean
> his changes https://patchwork.freedesktop.org/series/143996/
> allow you to selectively run with kmemleak on using runner (-k).
> Together with proper list selection passed to the runner you're
> able to run only tests which you want to check for memory leaks.

Thank you, Zbigniew! Just to clarify, my patch currently supports:
 -konce, which collects a single kmemleak log after all tests have run.
 -keach, which collects kmemleak logs after each test.

However, after reading this discussion, I came up with a proposal for a
new option: -kfile. With this mode, igt_runner will collect kmemleak
logs only after running the tests specified in a given text file.

Vitaly, can you confirm if -kfile would work for your use case? I'm
happy to adjust the implementation to better fit your needs.

Thank you,

Peter



> 
> --
> Zbigniew
> 
>>
>> On 2025-02-19 05:41, Kamil Konieczny wrote:
>>> Hi Vitaly,
>>> On 2025-02-18 at 06:43:41 -0500, vitaly.prosyak@amd.com wrote:
>>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>
>>>> refactor memory leak functions and add
>>>> them to the library for reuse across different tests.
>>>>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Alexander Deucher <alexander.deucher@amd.com>
>>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>
>>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>> ---
>>>>  lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
>>>>  lib/amdgpu/amd_mem_leak.h   |  17 ++++++
>>>>  lib/meson.build             |   1 +
>>>>  tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
>>>>
>>> [...cut...]
>>>
>>> Why moving to library when there is only one user?
>>>
>>> Regards,
>>> Kamil
>>>


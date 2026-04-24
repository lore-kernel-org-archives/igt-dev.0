Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0047FED3CD
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 14:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9DD10F5A8;
	Fri, 24 Apr 2026 14:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9ZPiyXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908F710F5A8
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777039483; x=1808575483;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lYOEOBVm4vrXbxnkwd7Og/jNQ5CyzZxN6NCVWkShdjk=;
 b=T9ZPiyXEwPug90DFd8Rh6sYrvNYHdOJNYW7Iut8d/gejdk2SdkJh3Y05
 yVo1i3ewsN1D/rptCWQI1nivmU/HkAi7EBB7xwXbkY4M1XoNmKKMJDHrB
 Oma11iWK620vxk7hZUehoFj/+dLkcf4+LWYO68W8TbEYmRrFKXcmKS4jn
 VyP1qJEdsbA6XgB48TFCxuPi8WwARgLOrh2Wr25/GwWJxOr2KmPG33f+8
 VSJgnJ8D2AxAooR3z8m2cH4Woj3YtgIQWeDdebNj7sivqvhWjR7Eq+3pC
 Kt67eJ7TtI6zNJleJq9tM938K4MI5C+jJaisqW6LwEp+yoyKxoNk5zOXd w==;
X-CSE-ConnectionGUID: GLPuEhX3SM+gST7AAiLIzQ==
X-CSE-MsgGUID: tHEEOlHWQHygaJPDWlslkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103481766"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="103481766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 07:04:43 -0700
X-CSE-ConnectionGUID: ibOc8A7ZRHyEaql9Mtnw8Q==
X-CSE-MsgGUID: Yc21ECfLRIiLTih0v+786A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="263367413"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 07:04:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: vitaly prosyak <vprosyak@amd.com>, vitaly.prosyak@amd.com,
 igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH] lib/amdgpu: Add ASIC filtering system with family ranges
In-Reply-To: <558d511c-e72c-486c-8f87-9a720ed3ae13@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260422041725.172582-1-vitaly.prosyak@amd.com>
 <4d020ccc16ddc6cc0d222a7366e4802af3bfcefa@intel.com>
 <558d511c-e72c-486c-8f87-9a720ed3ae13@amd.com>
Date: Fri, 24 Apr 2026 17:04:38 +0300
Message-ID: <5c99e331ee82b89449985c23ad0fd35b9fff2777@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 22 Apr 2026, vitaly prosyak <vprosyak@amd.com> wrote:
> On 2026-04-22 03:57, Jani Nikula wrote:
>> On Wed, 22 Apr 2026, <vitaly.prosyak@amd.com> wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Add comprehensive ASIC-based test filtering system following IGT
>>> coding standards with three-tier priority configuration.
>> I would have expected an attempt to make an IGT shared filtering system
>> generic enough to plug into any vendor's platforms, instead of going
>> all-in on AMD only.
>>
>> That should be the mindset anyway, try to make it generic first. At the
>> very least the commit message should explain why this is AMD specific,
>> what it would take to make it generic, and "we didn't even think about
>> it" is just not good enough.
>>
>> BR,
>> Jani.
>>
>>
> Hi Jani,
>
> Thanks for the feedback =E2=80=94 that=E2=80=99s a fair point, and I agre=
e with the general direction.
>
> My initial focus was to solve the immediate AMD CI problem (fragile user =
queue tests on specific ASICs), which is why the current implementation is =
AMD-specific and uses amdgpu_asic_addr.h definitions. That said, I do agree=
 the right long-term approach is to make this generic at the IGT framework =
level.
>
> A couple of thoughts on that:
>
> The filtering mechanism itself can be fully generic, but the data (ASIC t=
ables, ranges, identifiers) is inherently vendor-specific.
> What I have in mind is:
> A common IGT filtering framework (core logic)
> Per-vendor backends/tables/configs (e.g., AMD, Intel, others)
> Separate config sources per vendor (config file + env), while reusing the=
 same infrastructure
>
> One key benefit of integrating this into IGT core is that we avoid having=
 each test/subtest manually check whether it should run. Instead, the frame=
work can centrally decide, which keeps tests cleaner and avoids duplicated =
logic.
>
> Regarding your suggestion, I think it makes sense to:
>
> Rework the patch with generic naming and structure
> Clearly document:
> why the current version is AMD-specific
> what is required to generalize it
> Keep AMD as the first implementation backend, but not hardcode the design=
 around it
>
> My proposal would be:
>
> I update the patch in this direction (generic framework + AMD-specific ba=
ckend)
> We validate the approach in AMD CI for some time (since that=E2=80=99s wh=
ere the need is immediate)
> Then I follow up with results and iterate towards making it fully usable =
across IGT
>
> Does this approach sound reasonable?
>
> Appreciate your feedback =E2=80=94 it definitely helps steer this in the =
right direction.

I see that you're moving this to more generic direction, and already
sent patches to that effect. Thanks for that, appreciated.

That said, I'm afraid I don't have the bandwidth for detailed review of
it. Please ping the IGT maintainers.

BR,
Jani.


>
> BR,
> Vitaly
>>> Structure and Design:
>>> - Uses family range arrays similar to amd_queue_reset.c
>>> - Supports up to 4 ASIC ranges per skip rule
>>> - Intensive use of amdgpu_asic_addr.h definitions (FAMILY_*, AMDGPU_*_R=
ANGE)
>>> - No global variables - all state in struct asic_filter_context
>>> - Read-only static const tables (asic_table, builtin_skip_table)
>>>
>>> Three-Tier Priority System:
>>> 1. Built-in production array (checked first, requires rebuild)
>>> 2. Config file /etc/igt/asic_skip.conf (development, no rebuild)
>>> 3. Environment variable IGT_ASIC_SKIP_CONFIG (runtime, no rebuild)
>>>
>>> Features:
>>> - Family range structure: {family_id, chip_id_min, chip_id_max}
>>> - Glob pattern matching for subtests (fnmatch)
>>> - Comprehensive deployment guide in source code
>>> - 10 commented examples in builtin_skip_table[]
>>> - Complete family & range documentation
>>> - Dump functionality showing all three sources
>>>
>>> Documentation in Source:
>>> - 5-step deployment guide
>>> - Family & range reference (9 families, 18 ranges)
>>> - Glob patterns guide
>>> - 10 ready-to-use examples
>>>
>>> Files Added:
>>> - lib/amdgpu/amd_asic_filter.h - API and structures
>>> - lib/amdgpu/amd_asic_filter.c - Full implementation with guide
>>>
>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>> Signed-off Vitaly Prosyak <vitaly.prosyak@amd.com>

--=20
Jani Nikula, Intel

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB55C02196
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 08:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C110E3EB;
	Mon,  3 Feb 2025 08:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATE2lUxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD95D10E3EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738569887; x=1770105887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bda7gRcq7wA1MK/E9dVBmfVjYh3S+yzlyfHQtmAm+Rk=;
 b=ATE2lUxr7fqCRtybFwKCbdNMocqhNB743xgPkH5/7iFJvKuDvfzclwvr
 yUTfPqsjfrAemrvmrjrlhQzFTjTupEc3/YYXjNnDD8yW0MgEL35IcE72F
 +PV1fbr3Yo4JzMGRd+SgqMRu0iqWRbnXTpMBZsOSlE9h8IyJCmDmCCema
 w85FeMor+n4ipUvHYG9jfq0NJiTW4dHBC9twFlK0MGAHjRNDjjUjynPV4
 CcvYlBFkf7J02crIvMzXkuOuP1mVwwe5Apoyn/DYfwqDuSNoknySmWvXz
 PUBTiTtcr2J2Y+/kjuBEuTdobCAaXnhWgi8aTBjaWxAvmOUjrpoWxZ2lC A==;
X-CSE-ConnectionGUID: 5zpS2NHzTiqIdjaJazHrzw==
X-CSE-MsgGUID: A8/qiZWKTbq/bItqLPLKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39152099"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39152099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 00:04:47 -0800
X-CSE-ConnectionGUID: 8LjY7IFoTzug/ZYzyibrNg==
X-CSE-MsgGUID: 4mRYn8WoQf6gf1s4ip9U1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133470788"
Received: from vrao2-mobl1.gar.corp.intel.com (HELO [10.247.234.139])
 ([10.247.234.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 00:04:40 -0800
Message-ID: <b77f8c96-5c73-49cc-a5e6-d52646219ba0@intel.com>
Date: Mon, 3 Feb 2025 13:34:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] add test to validate uhbr/non-uhbr over sst/mst
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
 <87tt9ka16b.fsf@intel.com> <3cd82d89-a31b-4784-8b39-a87158e565e6@intel.com>
 <87bjvr9dzt.fsf@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <87bjvr9dzt.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hello Jani,

On 28-01-2025 20:34, Jani Nikula wrote:
> On Tue, 28 Jan 2025, "Joshi, Kunal1" <kunal1.joshi@intel.com> wrote:
>> Hello Jani,
>>
>> Thanks for taking a look,
>>
>> On 27-01-2025 18:01, Jani Nikula wrote:
>>> On Wed, 15 Jan 2025, Kunal Joshi<kunal1.joshi@intel.com> wrote:
>>>> Add new test validating UHBR and non-UHBR link rates for
>>>> both SST and MST configurations. The series comprises three patches:
>>>>
>>>> 1. tests/intel/kms_joiner_helper:
>>>>      - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
>>>>      - Moves common joiner-related logic out of kms_joiner.c.
>>>>
>>>> 2. tests/intel/kms_mst_helper:
>>>>      - Adds kms_mst_helper.c/h for MST-specific operations.
>>>>      - Centralizes code for identifying and assigning MST outputs.
>>>>
>>>> 3. tests/kms_feature_discovery:
>>>>      - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
>>>>      - Uses the new helpers for pipe assignments and topology discovery.
>>> AFAICT this adapts to what the driver reports. If the driver never
>>> enables DP SST UHBR, it'll happily pass, and just skip the tests. Am I
>>> right? Is that the kind of testing you want?
>>>
>>>
>>> BR,
>>> Jani.
>> The purpose of the |kms_feature_discovery| test is to verify that all
>> necessary configurations are in place. If a DP 2.1 SST monitor is not
>> connected in the CI environment, the test will be skipped, indicating
>> that SST UHBR coverage is missing. Since DP 2.1 SST support is already
>> provided by existing tests, this test simply confirms whether the
>> appropriate monitor is available to enable that coverage.
> I haven't been closely following IGT testing strategy lately, but you
> asked me to have a look at this regardless, so I did. I'm not going to
> comment on the details in this series or review it. The only question
> is, if the driver decides to incorrectly use non-UHBR SST on a UHBR SST
> capable sink, who is going to notice? Or if it works now, and breaks
> later, is some test going to fail instead of skip?
>
>
> BR,
> Jani.

Your concern is valid Jani, as of now we rely on driver to see what 
link_rate/lane_count
we are currently operating at, Will explore better ways to not rely on 
driver for this information.

For now I have added a fail criteria and link_status check.
Please have a look at the new revision.

Thanks and Regards
Kunal Joshi

>> Thanks and Regards Kunal Joshi
>>>
>>>> Kunal Joshi (4):
>>>>     tests/intel/kms_joiner_helper: helper for joiner-related functions
>>>>     tests/intel/kms_mst_helper: Add helper for MST-related functions
>>>>     tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
>>>>     HAX: DO NOT MERGE
>>>>
>>>>    tests/intel-ci/fast-feedback.testlist    |  14 ++
>>>>    tests/intel-ci/xe-fast-feedback.testlist |  14 ++
>>>>    tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
>>>>    tests/intel/kms_joiner.c                 |  15 +-
>>>>    tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
>>>>    tests/intel/kms_joiner_helper.h          |  15 ++
>>>>    tests/intel/kms_mst_helper.c             |  48 ++++++
>>>>    tests/intel/kms_mst_helper.h             |  10 ++
>>>>    tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
>>>>    tests/meson.build                        |   6 +
>>>>    10 files changed, 469 insertions(+), 37 deletions(-)
>>>>    create mode 100644 tests/intel/kms_joiner_helper.c
>>>>    create mode 100644 tests/intel/kms_joiner_helper.h
>>>>    create mode 100644 tests/intel/kms_mst_helper.c
>>>>    create mode 100644 tests/intel/kms_mst_helper.h

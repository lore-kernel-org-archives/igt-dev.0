Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE988C0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 15:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72E10E67B;
	Tue, 28 Jan 2025 15:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AILUljSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1FC10E67B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738076652; x=1769612652;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ZhGbAmQy2RuWgxbtvlzzWdPck0WLLDkcNr0flJ2SuTY=;
 b=AILUljSKHWby2Qv0DlRODhtNoxmlLkCPSQoQteNu65v24EzIHuh/fBYR
 JH6IEdX/LoBldjd9s1kFofVDeAA/9y9DzmJfZuzc735LRrZmyIZpi05Vg
 ZO4oiWqjkVspoi7Q5kTEgDQl8SMhMK5HPyEjoIkhA4F+itr0DrK+nSbu+
 1lF3izIM4CItk05QRpz0lDN7mTluhDpd7r5AJzS2Pe5aY7a75dykmqzAa
 xm1XzYAUEIiY3y0Oavv+AQXz2eKk+Hp2Ia3rJDAuRWeBv032oYIBUjL7A
 daODMMILkuYBcld+bC8uwjq8DvilfJ6Lr/ZKGF6qZaHF9Fcrgo/sz8Ys/ w==;
X-CSE-ConnectionGUID: rnZ/L7NmTwWIsaNnXMqgfw==
X-CSE-MsgGUID: /VLGCNjoTHqQwfcREFhX9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="26161911"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="26161911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:04:11 -0800
X-CSE-ConnectionGUID: 5VXvb/YpSc6JkdK6xGBKKg==
X-CSE-MsgGUID: 6lo3iBsdTlSpSj25oP8l0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113886539"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:04:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 0/4] add test to validate uhbr/non-uhbr over sst/mst
In-Reply-To: <3cd82d89-a31b-4784-8b39-a87158e565e6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
 <87tt9ka16b.fsf@intel.com>
 <3cd82d89-a31b-4784-8b39-a87158e565e6@intel.com>
Date: Tue, 28 Jan 2025 17:04:06 +0200
Message-ID: <87bjvr9dzt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 28 Jan 2025, "Joshi, Kunal1" <kunal1.joshi@intel.com> wrote:
> Hello Jani,
>
> Thanks for taking a look,
>
> On 27-01-2025 18:01, Jani Nikula wrote:
>> On Wed, 15 Jan 2025, Kunal Joshi<kunal1.joshi@intel.com> wrote:
>>> Add new test validating UHBR and non-UHBR link rates for
>>> both SST and MST configurations. The series comprises three patches:
>>>
>>> 1. tests/intel/kms_joiner_helper:
>>>     - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
>>>     - Moves common joiner-related logic out of kms_joiner.c.
>>>
>>> 2. tests/intel/kms_mst_helper:
>>>     - Adds kms_mst_helper.c/h for MST-specific operations.
>>>     - Centralizes code for identifying and assigning MST outputs.
>>>
>>> 3. tests/kms_feature_discovery:
>>>     - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
>>>     - Uses the new helpers for pipe assignments and topology discovery.
>> AFAICT this adapts to what the driver reports. If the driver never
>> enables DP SST UHBR, it'll happily pass, and just skip the tests. Am I
>> right? Is that the kind of testing you want?
>>
>>
>> BR,
>> Jani.
> The purpose of the |kms_feature_discovery| test is to verify that all 
> necessary configurations are in place. If a DP 2.1 SST monitor is not 
> connected in the CI environment, the test will be skipped, indicating 
> that SST UHBR coverage is missing. Since DP 2.1 SST support is already 
> provided by existing tests, this test simply confirms whether the 
> appropriate monitor is available to enable that coverage.

I haven't been closely following IGT testing strategy lately, but you
asked me to have a look at this regardless, so I did. I'm not going to
comment on the details in this series or review it. The only question
is, if the driver decides to incorrectly use non-UHBR SST on a UHBR SST
capable sink, who is going to notice? Or if it works now, and breaks
later, is some test going to fail instead of skip?


BR,
Jani.


>
> Thanks and Regards Kunal Joshi
>>
>>
>>> Kunal Joshi (4):
>>>    tests/intel/kms_joiner_helper: helper for joiner-related functions
>>>    tests/intel/kms_mst_helper: Add helper for MST-related functions
>>>    tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
>>>    HAX: DO NOT MERGE
>>>
>>>   tests/intel-ci/fast-feedback.testlist    |  14 ++
>>>   tests/intel-ci/xe-fast-feedback.testlist |  14 ++
>>>   tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
>>>   tests/intel/kms_joiner.c                 |  15 +-
>>>   tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
>>>   tests/intel/kms_joiner_helper.h          |  15 ++
>>>   tests/intel/kms_mst_helper.c             |  48 ++++++
>>>   tests/intel/kms_mst_helper.h             |  10 ++
>>>   tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
>>>   tests/meson.build                        |   6 +
>>>   10 files changed, 469 insertions(+), 37 deletions(-)
>>>   create mode 100644 tests/intel/kms_joiner_helper.c
>>>   create mode 100644 tests/intel/kms_joiner_helper.h
>>>   create mode 100644 tests/intel/kms_mst_helper.c
>>>   create mode 100644 tests/intel/kms_mst_helper.h

-- 
Jani Nikula, Intel

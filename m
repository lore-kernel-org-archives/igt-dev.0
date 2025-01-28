Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7DBC0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 07:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB2F10E277;
	Tue, 28 Jan 2025 07:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Isj4X/Py";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE71910E277
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 07:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738047929; x=1769583929;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=54vlIEqysZv6UNiiDcluUUI5XWJTiPdenBkzJsL3Sc0=;
 b=Isj4X/PyShC/UJbGuJWjNGVAIeBaxeBCwaBndhsO/klHfpBSmnXxu+bu
 xF9FR8nNgF2TBMZTmoXHMi4bw0DbgQnVMfrMbWi/2x+qiZwFXgeC9zoCE
 p9J6zXynFw4DHbyj++uVYQm2bqhT8Vve7Jtbqm7uewryUldF1D+E+WPZV
 X179BHOEaA2uE+MsmIqogebEbew7vnYlH5QDPFzfv5GescEkhb4Qq4iAz
 +Gg7VFGWaa+qdTchyu/GZIWbvTieQg5hHFuJEY1SGsB8cY1/+Ct+rdlld
 5xsKCqLDcOBDBBf4f2u7zkDf5BmyD/nAZb0+c5fRhqY1yw159+Zo1nDzz Q==;
X-CSE-ConnectionGUID: XtTNBBhRSb+BY24qugs8Dw==
X-CSE-MsgGUID: fgQbb3+xTTGcD6fEvivUlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60991131"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208,217";a="60991131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 23:05:29 -0800
X-CSE-ConnectionGUID: I7LlDEbdRJ6gvPW6kGMZCg==
X-CSE-MsgGUID: EcXqE9T0Ro+EPN3sxAVxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
 d="scan'208,217";a="108459384"
Received: from rajivsar-mobl.gar.corp.intel.com (HELO [10.247.228.36])
 ([10.247.228.36])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 23:05:27 -0800
Content-Type: multipart/alternative;
 boundary="------------ryZUqd1lXUX06qcXZw3iBUqE"
Message-ID: <3cd82d89-a31b-4784-8b39-a87158e565e6@intel.com>
Date: Tue, 28 Jan 2025 12:35:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] add test to validate uhbr/non-uhbr over sst/mst
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
 <87tt9ka16b.fsf@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <87tt9ka16b.fsf@intel.com>
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

This is a multi-part message in MIME format.
--------------ryZUqd1lXUX06qcXZw3iBUqE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jani,

Thanks for taking a look,

On 27-01-2025 18:01, Jani Nikula wrote:
> On Wed, 15 Jan 2025, Kunal Joshi<kunal1.joshi@intel.com> wrote:
>> Add new test validating UHBR and non-UHBR link rates for
>> both SST and MST configurations. The series comprises three patches:
>>
>> 1. tests/intel/kms_joiner_helper:
>>     - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
>>     - Moves common joiner-related logic out of kms_joiner.c.
>>
>> 2. tests/intel/kms_mst_helper:
>>     - Adds kms_mst_helper.c/h for MST-specific operations.
>>     - Centralizes code for identifying and assigning MST outputs.
>>
>> 3. tests/kms_feature_discovery:
>>     - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
>>     - Uses the new helpers for pipe assignments and topology discovery.
> AFAICT this adapts to what the driver reports. If the driver never
> enables DP SST UHBR, it'll happily pass, and just skip the tests. Am I
> right? Is that the kind of testing you want?
>
>
> BR,
> Jani.
The purpose of the |kms_feature_discovery| test is to verify that all 
necessary configurations are in place. If a DP 2.1 SST monitor is not 
connected in the CI environment, the test will be skipped, indicating 
that SST UHBR coverage is missing. Since DP 2.1 SST support is already 
provided by existing tests, this test simply confirms whether the 
appropriate monitor is available to enable that coverage.

Thanks and Regards
Kunal Joshi
>
>
>> Kunal Joshi (4):
>>    tests/intel/kms_joiner_helper: helper for joiner-related functions
>>    tests/intel/kms_mst_helper: Add helper for MST-related functions
>>    tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
>>    HAX: DO NOT MERGE
>>
>>   tests/intel-ci/fast-feedback.testlist    |  14 ++
>>   tests/intel-ci/xe-fast-feedback.testlist |  14 ++
>>   tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
>>   tests/intel/kms_joiner.c                 |  15 +-
>>   tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
>>   tests/intel/kms_joiner_helper.h          |  15 ++
>>   tests/intel/kms_mst_helper.c             |  48 ++++++
>>   tests/intel/kms_mst_helper.h             |  10 ++
>>   tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
>>   tests/meson.build                        |   6 +
>>   10 files changed, 469 insertions(+), 37 deletions(-)
>>   create mode 100644 tests/intel/kms_joiner_helper.c
>>   create mode 100644 tests/intel/kms_joiner_helper.h
>>   create mode 100644 tests/intel/kms_mst_helper.c
>>   create mode 100644 tests/intel/kms_mst_helper.h
--------------ryZUqd1lXUX06qcXZw3iBUqE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Jani,<br>
      <br>
      Thanks for taking a look,<br>
    </p>
    <div class="moz-cite-prefix">On 27-01-2025 18:01, Jani Nikula wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87tt9ka16b.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, 15 Jan 2025, Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add new test validating UHBR and non-UHBR link rates for
both SST and MST configurations. The series comprises three patches:

1. tests/intel/kms_joiner_helper:
   - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
   - Moves common joiner-related logic out of kms_joiner.c.

2. tests/intel/kms_mst_helper:
   - Adds kms_mst_helper.c/h for MST-specific operations.
   - Centralizes code for identifying and assigning MST outputs.

3. tests/kms_feature_discovery:
   - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
   - Uses the new helpers for pipe assignments and topology discovery.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
AFAICT this adapts to what the driver reports. If the driver never
enables DP SST UHBR, it'll happily pass, and just skip the tests. Am I
right? Is that the kind of testing you want?


BR,
Jani.</pre>
    </blockquote>
    The purpose of the <code>kms_feature_discovery</code> test is to
    verify that all necessary configurations are in place. If a DP 2.1
    SST monitor is not connected in the CI environment, the test will be
    skipped, indicating that SST UHBR coverage is missing. Since DP 2.1
    SST support is already provided by existing tests, this test simply
    confirms whether the appropriate monitor is available to enable that
    coverage.<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi<br>
    <blockquote type="cite" cite="mid:87tt9ka16b.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Kunal Joshi (4):
  tests/intel/kms_joiner_helper: helper for joiner-related functions
  tests/intel/kms_mst_helper: Add helper for MST-related functions
  tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
  HAX: DO NOT MERGE

 tests/intel-ci/fast-feedback.testlist    |  14 ++
 tests/intel-ci/xe-fast-feedback.testlist |  14 ++
 tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
 tests/intel/kms_joiner.c                 |  15 +-
 tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h          |  15 ++
 tests/intel/kms_mst_helper.c             |  48 ++++++
 tests/intel/kms_mst_helper.h             |  10 ++
 tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
 tests/meson.build                        |   6 +
 10 files changed, 469 insertions(+), 37 deletions(-)
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------ryZUqd1lXUX06qcXZw3iBUqE--

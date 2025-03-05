Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD3C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 16:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3079F10E7E5;
	Wed,  5 Mar 2025 16:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOGW+h3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFBD10E058
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741192309; x=1772728309;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Cf4HRPqmOBH2/RZ9TfoomAwkGUOn02YdxjGk8IqDsFg=;
 b=kOGW+h3kR342AKuZNbDnlyNKq312k4Nk477vsowO5da4t3Vlb9PRFMec
 Mju3Y3iZBbOki8aV3xrfEZNl45kxip1JV18LzV2MdiCtlT26VR9PFakEm
 q6D8vegJedHSK3xXcA3cBlSDrQJPs5TFHzNwauA3pHlkiS96ZETSat/jI
 MLdPe5rGhlW6h7jIuLxPZI7W36rOEAtuIfycVh7YmST9MI5RNiAdW+flj
 IUQxPksX0VJwmGPjm5vHhb0jjBEYYqdMCCYoUVuF6Hlx8qJp0Dk+nY2j1
 nGZvos+ALaHJ3ExJWq/lXebZ4G1Rbyu5UBUzsQJwXCRnN26iGwBuKTgQW Q==;
X-CSE-ConnectionGUID: DZNJDqpqTrCnDzI8Arlvww==
X-CSE-MsgGUID: q2V7FiJuRCuwQIXddCUJBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29747397"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="29747397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:31:47 -0800
X-CSE-ConnectionGUID: NJYQJyTzQzOykjjCC+zTsA==
X-CSE-MsgGUID: 9nn9Xr0+QfmT9jM1B/OTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122877480"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 08:31:45 -0800
Message-ID: <609f3be5-d1f7-427b-b7ee-c7065c4a50d2@linux.intel.com>
Date: Wed, 5 Mar 2025 17:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
 <20250305121514.tojpbo7jlwbwcqt3@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250305121514.tojpbo7jlwbwcqt3@kamilkon-desk.igk.intel.com>
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



On 3/5/2025 1:15 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2025-03-04 at 19:56:39 +0100, Marcin Bernatowicz wrote:
>> Wrap all utilization-related subtests in an igt_subtest_group and add
>> a fixture that ensures utilization data is available before running
>> them.
>>
>> Link: https://lore.kernel.org/r/20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
>>   1 file changed, 67 insertions(+), 55 deletions(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 7330b4330..d18fe10d8 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -735,10 +735,6 @@ igt_main
>>   	igt_subtest("basic-mem")
>>   		basic_memory(xe);
>>   
>> -	igt_describe("Check if basic fdinfo content is present for engine utilization");
>> -	igt_subtest("basic-utilization")
>> -		basic_engine_utilization(xe);
>> -
>>   	igt_describe("Create and compare total and resident memory consumption by client");
>>   	igt_subtest("mem-total-resident")
>>   		mem_total_resident(xe);
>> @@ -751,57 +747,73 @@ igt_main
> [...]
> 
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			struct drm_client_fdinfo info = { };
>> +
>> +			igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
>> +							 ARRAY_SIZE(engine_map),
>> +							 NULL, 0));
> 
> Problem with require placed here is that it will trigger also
> for all other test outside of group. That will clobber output.

Does it mean the igt_subtest_group is deprecated and the description
no more valid ?

"
/**
  * igt_subtest_group:

...

* This macro allows to group together a set of #igt_fixture and #igt_subtest
  * clauses. If any common setup in a fixture fails, only the subtests 
in this
  * group will fail or skip. Subtest groups can be arbitrarily nested.
"

> 
>> +			igt_require(info.num_engines);
> 
> Both these should be placed in each subtest wrapped in function
> (see below) but imho this looks like a global requires at begin
> of a test? Or am I missing something?
> 
>> +		}
>> +
> 
> Create function like:
> 
> void require_utilization(int xe, ... engine_map)
> {
> 	struct drm_client_fdinfo info = { };
> 
> 	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
> 					 ARRAY_SIZE(engine_map),
> 					 NULL, 0));
> 	igt_require(info.num_engines);
> }
> 
> and use it in each utulization subtest like:
> 
> 	igt_describe("Check if basic fdinfo content is present for engine utilization");
> 	igt_subtest("basic-utilization") {
> 		require_utilization(xe);
> 		basic_engine_utilization(xe);
> 	}

That is the repetition I wanted to avoid ;)

---
marcin

> 
> Regards,
> Kamil
> 
>> +		igt_describe("Check if basic fdinfo content is present for engine utilization");
>> +		igt_subtest("basic-utilization")
>> +			basic_engine_utilization(xe);
>> +
> 
> [...]
> 


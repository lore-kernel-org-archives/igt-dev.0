Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0329C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491E510E91C;
	Thu,  6 Mar 2025 09:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpmjQQQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B031310E91C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741252781; x=1772788781;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N4idujgU586ykQYG7FKO54X5cS1/HBtTaE7YyGxjy30=;
 b=MpmjQQQYJOXFiivgbIpqVxwE9a/RCSy+7A2w3MlB4EgOWE5D0nsIfEnv
 bs4YGgSEGHLwefvQIU9+gSKXjh3kp2yRCuNE0+MU/naGZBp1JEZMSuVO0
 IbfP2qm+1y8OfDX/u8/kZrvMRvkn6PlnxztR49MQurFP01WNkITPHD/p0
 iulu6ygsh1r/zlBB0/43uGA5ySstSY/q2k4qFxNtytbU1hOFq5qQKW4ZW
 xm5vAcyGBvgnZ4HZ0ft8KfX8i6HUbM0QIdtXMoLjqX9TSss+97kXN+UoH
 zthz2x4CPk6z2LsKixTE2P0qQqltC/Qkic4qUp0T3HNeU72OIlo1ar/ds A==;
X-CSE-ConnectionGUID: qG4bEDbTSQukkMkXfxgfRw==
X-CSE-MsgGUID: 0YmzghTDQyCu6K+dD8ttpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42450484"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42450484"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:19:41 -0800
X-CSE-ConnectionGUID: Re0ivU6TRwSzM59jm2Tcxw==
X-CSE-MsgGUID: FuCHyMyMQee9N+P+E2f7nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="124062608"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.116.143])
 ([10.245.116.143])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:19:40 -0800
Message-ID: <f78e21cc-d1f4-4974-92b8-b3d497a5c50f@linux.intel.com>
Date: Thu, 6 Mar 2025 10:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
 <ip3lgnjby4aeplweqxvtcjubj27hktvzciqvvu5r7u7vkzqs4n@y7uomewtoetr>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <ip3lgnjby4aeplweqxvtcjubj27hktvzciqvvu5r7u7vkzqs4n@y7uomewtoetr>
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



On 3/5/2025 6:08 PM, Lucas De Marchi wrote:
> On Tue, Mar 04, 2025 at 07:56:39PM +0100, Marcin Bernatowicz wrote:
>> Wrap all utilization-related subtests in an igt_subtest_group and add
>> a fixture that ensures utilization data is available before running
>> them.
>>
>> Link: https://lore.kernel.org/r/20250205191644.2550879-1- 
>> marcin.bernatowicz@linux.intel.com
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>> tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
>> 1 file changed, 67 insertions(+), 55 deletions(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 7330b4330..d18fe10d8 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -735,10 +735,6 @@ igt_main
>>     igt_subtest("basic-mem")
>>         basic_memory(xe);
>>
>> -    igt_describe("Check if basic fdinfo content is present for engine 
>> utilization");
>> -    igt_subtest("basic-utilization")
>> -        basic_engine_utilization(xe);
>> -
>>     igt_describe("Create and compare total and resident memory 
>> consumption by client");
>>     igt_subtest("mem-total-resident")
>>         mem_total_resident(xe);
>> @@ -751,57 +747,73 @@ igt_main
>>     igt_subtest("mem-active")
>>         mem_active(xe, xe_engine(xe, 0));
>>
>> -    igt_subtest("utilization-single-idle")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_single(xe, hwe, 0);
>> -
>> -    igt_subtest("utilization-single-full-load")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
>> -
>> -    igt_subtest("utilization-single-full-load-isolation")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_single(xe, hwe, TEST_BUSY | 
>> TEST_TRAILING_IDLE | TEST_ISOLATION);
>> -
>> -    igt_subtest("utilization-single-full-load-destroy-queue")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_single_destroy_queue(xe, hwe);
>> -
>> -    igt_subtest("utilization-others-idle")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_others_idle(xe, hwe);
>> -
>> -    igt_subtest("utilization-others-full-load")
>> -        xe_for_each_engine(xe, hwe)
>> -            utilization_others_full_load(xe, hwe);
>> -
>> -    igt_subtest("utilization-all-full-load")
>> -        utilization_all_full_load(xe);
>> -
>> -
>> -    for (const struct section *s = sections; s->name; s++) {
>> -        igt_subtest_f("%s-utilization-single-idle", s->name)
>> -            xe_for_each_gt(xe, gt)
>> -                xe_for_each_engine_class(class)
>> -                    utilization_multi(xe, gt, class, s->flags);
>> -
>> -        igt_subtest_f("%s-utilization-single-full-load", s->name)
>> -            xe_for_each_gt(xe, gt)
>> -                xe_for_each_engine_class(class)
>> -                    utilization_multi(xe, gt, class,
>> -                              s->flags |
>> -                              TEST_BUSY |
>> -                              TEST_TRAILING_IDLE);
>> -
>> -        igt_subtest_f("%s-utilization-single-full-load-isolation",
>> -                  s->name)
>> -            xe_for_each_gt(xe, gt)
>> -                xe_for_each_engine_class(class)
>> -                    utilization_multi(xe, gt, class,
>> -                              s->flags |
>> -                              TEST_BUSY |
>> -                              TEST_TRAILING_IDLE |
>> -                              TEST_ISOLATION);
>> +    igt_subtest_group {
>> +        igt_fixture {
>> +            struct drm_client_fdinfo info = { };
>> +
>> +            igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
>> +                             ARRAY_SIZE(engine_map),
>> +                             NULL, 0));
>> +            igt_require(info.num_engines);
> 
> humn... is this fixture exectuded in addition to the outer fixture
> for each each subtest? Otherwise it won't have the fd open and thus no
> client.

Yes, it is executed in addition to the outer fixture (but if the outer 
fixture fails, this one should not run), so xe is already opened. This 
fixture applies at the group scope - if it fails or is skipped, all 
tests in the group will also fail or be skipped.

However, as Kamil pointed out, fixtures are executed even if no test 
from the group is selected for execution. This means that if we run 
igt@xe_drm_fdinfo@basic-mem (which is outside this group), the fixture 
from the utilization group still runs, potentially logging an unmet 
requirement.

IIUC, the only solution is to move the checks inside the subtests.

> 
> Lucas De Marchi


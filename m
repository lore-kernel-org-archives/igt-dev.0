Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30ACC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 10:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5639C10E82B;
	Thu, 15 May 2025 10:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="km7GP3QF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97E110E82B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747305284; x=1778841284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t8kPSJ6MRdiWn1OV8KMc/UrZzlBcNzmhXMaqhFOgqvw=;
 b=km7GP3QFRcfs9lso3kqVbKw5X3Dy7Kfs5R+P+BPhDE5MPiWUwB9Coqr1
 aEQYWIqX+ssXhxnaP5JW0tWkhTAFd4jCLWhNgTlCsuRxoTw/N6cd2P+rg
 AFCAjKw7pEPAaJDUBPP2NWwdZshxYX1AE0V2rqZsbK94Ne3W/G+VaRq3O
 64Rk+hQf08WHZjHnyXrJPbW2D+5GOh75ahITAUCMRP6dinK8iKh/LBb6t
 +mli1a2qcYgoKGwoBbsdHSw0IeZ7dOGRcQNAOX7gLhFyQq/Qjqyp37a8t
 7r4CJhcj7m/1wyjxUZ/8JkaFjLWXOtFfiFHtdXW1irOem3x5dBf9XYXs9 A==;
X-CSE-ConnectionGUID: VaC53RxsTbSz+K8yHpxm8Q==
X-CSE-MsgGUID: dIAYAL+GRuSCkfWoKH+3fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59463271"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="59463271"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:34:44 -0700
X-CSE-ConnectionGUID: 14IvRPVvRJCHlJeGgNhl/g==
X-CSE-MsgGUID: 8+GDLvhwTsGUAW2rjQwAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="139321004"
Received: from amiron-mobl1.ger.corp.intel.com (HELO [10.245.81.154])
 ([10.245.81.154])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:34:41 -0700
Message-ID: <ba9bb18e-7e21-43b1-87a3-5359a577736c@linux.intel.com>
Date: Thu, 15 May 2025 12:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 i-g-t] tests/intel/xe_sec_exec_queue_timeslice: Timeslice
 Abuse on Exec Queues
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com
References: <20250507104111.446923-1-peter.senna@linux.intel.com>
 <20250508085145.566623-1-peter.senna@linux.intel.com>
 <duolwvitkqaqpcojm4yxkew3dsirqb4cawok6ahwrddgxjnhsr@pxaxnkx2geal>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <duolwvitkqaqpcojm4yxkew3dsirqb4cawok6ahwrddgxjnhsr@pxaxnkx2geal>
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



On 5/14/2025 11:26 PM, Michał Winiarski wrote:
> On Thu, May 08, 2025 at 10:51:43AM +0200, Peter Senna Tschudin wrote:
>> The objective is to test the behavior of the GPU scheduler under
>> conditions where one execution queue ("attacker") is configured with an
>> abnormally large timeslice, potentially disrupting the normal execution
>> of another queue ("attacked"). The explicit attack point is the ioctl
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY.
>>
>> This disables drm and xe logging to prevent it from slowing down and
>> serializing the tests using igt_drm_debug_level_update() that installs
>> an exit handler to restore the logging to its previous value.
>>
>> This RFC implements the first step that is reading timeslice values for
>> each engine and run the following tests on timeslice limits:
>>  - Boundary Value Analysis: Focuses on testing at the boundaries of
>>    input values with values such as max - 1, max, max + 1.
> 
> That should already be covered by xe_exec_queue_property test, right?
> 

The idea is to make a test that is complete, not to depends on other
tests. I am considering these "security igts" as a new category of test
so that we can decide what to do with them.

>>  - Equivalence Partitioning:  Divide values into partitions where all
>>    values behave similarly and test one value from each partition.
> 
> I don't understand this one - but looking at actual implementation, it
> looks pretty similar to boundary value analysis (except with min - 1,
> min).

Equivalence Partitioning and Boundary Value Analysis are two different
methods for testing values. These are not my creation, they are standard
practice. They are similar but complementary. The idea is to use common
practice tests to check more boxes that can be useful in the context of
an audit.

> 
>>  - Fuzz Testing: Basic fuzz tester for
>>       - Large numbers
>>       - Empty value
>>       - '\0'
> 
> But those are all constants. And empty value is just 0 :)
> I fail to see what we're "fuzzing" by trying same constants multiple
> times (again looks more like invalid values, similar to boundary value
> checks).

Similar with the previous one. These are corner cases that I could come up
with. The idea is to maximize coverage. This is a contrast to trying to make
an efficient test where we make sure each case gets tested only once. These
all come from a shallow analysis I did on what are the best practices for our
context.

> 
>>       - 1M u64 random values
>>  - Fuzz stress test: Create 50k threads for the fuzzing test with 500
>>    random numbers each taking about 30 seconds to run
> 
> Perhaps we can extend the xe_exec_queue_property test? If we want to go
> beyond boundary testing? We could then hit other properties as well.

To answer that I guess we need alignment on the goal. The goal for me is
to have as many check boxes as we can that are meaningful in the context of a
security audit. This is why I am very happy to have overlapping tests such as
Equivalence Partitioning and Boundary Value Analysis: they are similar but
they check for different potential issues.

Please note that I am not defending that my implementation is good. Up to this
point the RFC has about a day of coding effort.

> 
>>
>> The proposed steps are (this patch goes until 2a):
>>
>> 1. Determine the values for the following parameters:
>>         - `timeslice_duration_us`: Default timeslice duration in
>>            microseconds.
>>         - `timeslice_duration_min`: Minimum allowable timeslice duration.
>>         - `timeslice_duration_max`: Maximum allowable timeslice duration.
>>
>> 2. Create two execution queues with the following configurations:
>>         - `attacked`: Queue with standard/default settings.
>>         - `attacker`: Queue configured with an extended timeslice
>>                       duration. The goal is to:
>>                 a) Try to set timeslice to invalid values. This is
>>                    expected to fail.
>>
>>                 b) Create the attacker queue setting the timeslice to
>>                    `timeslice_duration_max`.
>>
>> 3. Submit tasks to both queues:
>>         - Submit a workload to the `attacked` queue with normal
>>            operations.
>>         - Submit a workload to the `attacker` queue designed to
>>           maximize its timeslice and potentially disrupt the GPU
>>           scheduler.
>>
>> 4. Verify the behavior of the `attacked` queue:
>>         - Ensure that tasks in the `attacked` queue execute within the
>>           expected time constraints and are not delayed or blocked due
>>           to the extended timeslice of the `attacker` queue.
>>         - Specifically, confirm that tasks in the `attacked` queue do
>>           not exceed `timeslice_duration_max` in terms of execution
>>           delays or interruptions.
> 
> I think we should separate functional timeslice testing (which is
> verifying whether Xe driver is indeed respecting what was set as a valid 
> timeslice by the user, and is a proposed future extension of this test),
> from checking uAPI abuse attempts (which is what this test is currently
> doing).

I am fine either way, but the current suggestion is based on the specification
of the adversary and attack point. My list of proposed actions use the same
adversary and attack point. Why do you want to separate them?

> 
> Thanks,
> -Michał


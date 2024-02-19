Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467BC54764
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 09:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAEC10E28A;
	Mon, 19 Feb 2024 09:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my3hJ1wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BE810E29C
 for <IGT-Dev@lists.freedesktop.org>; Mon, 19 Feb 2024 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708336440; x=1739872440;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KMXXGE3DsNFOSzAOJ0hH4TChIw1HaRqKoxVUqjqcPjw=;
 b=my3hJ1wkm8e8W0GMJx3psFOw3xS+gRm9npNacAH7pi4Za2FwesYUW7I0
 37pwAEwt52C5b0h83TeMHZgDzPkWVh3v2RdfKgbFDJaSDxCEIrMJ/Kwyw
 aqUom2zNDhn4MkP057fL5FujR8bC9YTql27TwewDbAbmH2ME/0VOC4Neo
 kJCj6QSGP7pF4o4sSDtCwd2owq8faUe3QAJDd3eOrChxaY9/nHSGhOy1u
 nIa6KS2xWnQMq6okZDsjl/zzRy1wq4zqxJHXLb5Y8vy74LVnx6Jk9x64v
 UfpS0qut14p7XY82g+eSnsmPtcWB0nTVnu3tyXwQBRc/Q8Rq3s8E5NoQ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19835057"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="19835057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 01:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4396487"
Received: from coldacre-mobl1.ger.corp.intel.com (HELO [10.213.215.68])
 ([10.213.215.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 01:53:59 -0800
Message-ID: <b838e58a-37a7-4de9-a774-c2a1df6a3cdb@linux.intel.com>
Date: Mon, 19 Feb 2024 09:53:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/gem_watchdog: Reduced timeouts for
 worst case scenario
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, IGT-Dev@Lists.FreeDesktop.Org
References: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
 <fc965672-a30a-4f5a-98af-2cdab1f53153@linux.intel.com>
 <addb89bd-2c2a-43a9-8492-ca541b48de33@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <addb89bd-2c2a-43a9-8492-ca541b48de33@intel.com>
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


On 16/02/2024 01:33, John Harrison wrote:
> On 2/13/2024 01:34, Tvrtko Ursulin wrote:
>> On 12/02/2024 21:23, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The watchdog test reduces the watchdog timer from 20s to 1s and then
>>> uses a 5s timeout waiting for the watchdog to do its stuff. This works
>>> fine in general, but if an engine reset is required by a context that
>>> is actually dead for real then a pre-emption timeout must be factored
>>> in. For RCS/CCS engines, that timeout is 7.5 seconds by default. Thus,
>>> the test timeout expires first and the test fails.
>>>
>>> Normally, the system is not so dead when running this test as to
>>> require an engine reset. A simple pre-emption works fine for the
>>> spinner contexts that is uses. However, there is a hardware workaround
>>> coming which prevents context switches when both RCS and CCS are busy.
>>>
>>> So add an explicit override of the pre-emption timeout as well as the
>>> watchdog timeout. That will allow the test to keep working after the
>>> new w/a lands.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   tests/intel/gem_watchdog.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
>>> index 1e4c350214c0..c9dd0deb51aa 100644
>>> --- a/tests/intel/gem_watchdog.c
>>> +++ b/tests/intel/gem_watchdog.c
>>> @@ -577,6 +577,16 @@ igt_main
>>>             i915 = drm_reopen_driver(i915); /* Apply modparam. */
>>>           ctx = intel_ctx_create_all_physical(i915);
>>> +
>>> +        for_each_ctx_engine(i915, ctx, e) {
>>> +            /*
>>> +             * Context termination by watchdog may require an engine 
>>> reset. That only
>>> +             * occurs after a pre-emption attempt has expired. For 
>>> RCS/CCS engines,
>>> +             * the pre-emption timeout is longer than this test is 
>>> wanting to wait.
>>> +             * So reduce that timeout in addition to the watchdog 
>>> timeout itself.
>>> +             */
>>> +            gem_engine_property_printf(i915, e->name, 
>>> "preempt_timeout_ms", "%d", 640);
>>> +        }
>>
>> Restore at test exit for subsequent tests to be in a known environment?
> IGT actually does the reverse. Part of the framework initialisation is 
> to forcibly reset all the sysfs parameters to the official defaults (as 
> exposed via the .default sysfs files). So in general, the tests don't 
> bother trying to preserve such values.

True, looks like I forgot about that.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> John.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       }
>>>         igt_subtest_group {
> 

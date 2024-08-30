Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E98CA0EF7
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 09:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007A910E8B4;
	Fri, 30 Aug 2024 09:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsU0LcH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078910E8B4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725009165; x=1756545165;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R/xyQ0As4OLJoDp0592z4SOVO+rCXxc041/sE8ZjXtc=;
 b=AsU0LcH5uV28aQ1yty1KyGAh2EuIw6fpMwRfcKN7l9aYJBUg3+Ltk1bc
 lt7wd3qotS9/Ri/lpiqSYI0LHctMUYApsircvhOxntAnyQP7532NwFfri
 lm0ZzgohSC/KjCe5U48FgEO1QqwFC/RIsrFOZZZz4ThKHpkFZgEGmlCNx
 FAZNbG8fmj5foiZOyvu/z4qdnUcjOu8VJ6+9O74EM13ICmQiv8++gd6wb
 BUbDIbEqeFEleBJOpjjV2RrN2iUJYgIYbIOgDMR4ZrBUA8+dyFBzkYYHS
 +J8eh19LIiRW4YfOHiubZ8rYI3FvbkzXMaK8OWd/cG4xtDt3EqZ+aVN2q Q==;
X-CSE-ConnectionGUID: PCv+Gx6HQ4KSqmLBxuOrkQ==
X-CSE-MsgGUID: w2MUcy9QQgWgQmZOhC6U8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27438764"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="27438764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:12:44 -0700
X-CSE-ConnectionGUID: J0OQ1/yXQjqstd9+cQm/3w==
X-CSE-MsgGUID: Lhtz3LnuTpyxY3f0PkJehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63838813"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.130.175])
 ([10.245.130.175])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:12:42 -0700
Message-ID: <1a10f7c6-f6a0-4e15-98d9-c3d4138f6873@linux.intel.com>
Date: Fri, 30 Aug 2024 11:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec_fault_mode: Don't return
 early
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240828095514.15613-1-nirmoy.das@intel.com>
 <652436ca-1186-4769-bd5c-ddb6d9d0073f@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <652436ca-1186-4769-bd5c-ddb6d9d0073f@intel.com>
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


On 8/28/2024 5:15 PM, Andrzej Hajda wrote:
>
>
> On 28.08.2024 11:55, Nirmoy Das wrote:
>> Tests that are causing pagefaults should wait for exec queue to be ban
>> otherwise pending engine resets because of on-going pagefaults would
>> cause failure in subsequent tests to fail.
>>
>> Set a larger 5 sec timeout if still tests fail, we can blame
>> driver in such case.
>
> I try to understand what causes such big delay, any ideas? Btw if the 
> driver is to blame, maybe it should be fixed instead of increasing 
> timeout in the test.
>
> In v2 there was one failure on PVC: 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html


Turns out not all exec will cause page fault. Some execs might just run 
successfully before the test pull the rug by destroying previously bound 
addr.


Regards,

Nirmoy

> This time it passed flawlessly (as well as in v1), but not due to 
> increased time limit (at least dmesg shows the test took much less 
> than 1second).
> Let's wait for xeFULL pass, maybe it will show some interesting results.
>
> Regards
> Andrzej
>>
>> v2: specify timeout reason and iterate over exec_queues(Andrzej)
>> v3: increase timeout
>>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_fault_mode.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c 
>> b/tests/intel/xe_exec_fault_mode.c
>> index 1f1f1e50b..e3e6047e7 100644
>> --- a/tests/intel/xe_exec_fault_mode.c
>> +++ b/tests/intel/xe_exec_fault_mode.c
>> @@ -36,6 +36,22 @@
>>   #define INVALID_VA    (0x1 << 8)
>>   #define ENABLE_SCRATCH  (0x1 << 9)
>>   +static int get_ban_property(int xe, struct 
>> drm_xe_engine_class_instance *eci,
>> +                uint32_t vm, uint32_t exec_queue)
>> +{
>> +    struct drm_xe_exec_queue_get_property args = {
>> +        .value = -1,
>> +        .reserved[0] = 0,
>> +        .property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
>> +    };
>> +
>> +    args.exec_queue_id = exec_queue;
>> +
>> +    do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
>> +
>> +    return args.value;
>> +}
>> +
>>   /**
>>    * SUBTEST: invalid-va
>>    * Description: Access invalid va and check for EIO through user 
>> fence.
>> @@ -324,6 +340,15 @@ test_exec(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>>                  bind_exec_queues[0], NSEC_PER_SEC);
>>   +    if ((flags & INVALID_FAULT)) {
>> +        igt_set_timeout(5, "waiting for ban");
>> +        for (i = 0; i < n_exec_queues; i++) {
>> +            while (!get_ban_property(fd, eci, vm, exec_queues[i]))
>> +                sched_yield();
>> +        }
>> +        igt_reset_timeout();
>> +    }
>> +
>>       if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>>           for (i = j; i < n_execs; i++)
>>                   igt_assert_eq(data[i].data, 0xc0ffee);
>

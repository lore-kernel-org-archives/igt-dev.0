Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E91C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 14:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABB810E337;
	Tue, 27 Aug 2024 14:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNCZ6gUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35A910E337
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724768862; x=1756304862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5iJ/3yNjNS8R8FNcC7xrlT+GZBeKz8xNdmIZZxWYsAE=;
 b=VNCZ6gUOHqxiI80+vFKodksYWftpvfd7uTV+8IEo6xkNOhk3k2OTEfNF
 QPr2ZIqPEu5UnbV6iH/biAf7rGWHc6F84WbpTNRUwxAkj27kn3zYzkkdP
 30EPugkC327v+wpbBwqCq95LKjEuETm8OGu6ZSwnW4SGqI3C9/gb2cABD
 9tgOih9nQk7fFNAgy0/4A0WbpgSV6VnxruZXdUfa0NA+Qz6ep0dsSTg/M
 auFnZGPeHLGrWBOhfAIO/mt32X0E33I5G9MF4KkR2Y9uLO30cojKLTuMv
 GUl3TCafzGwxa49HW3mt6ZI3KMfqzjkAC0y49qw2oUxmVrKmmjE78ruDs g==;
X-CSE-ConnectionGUID: /tUKljOfTgyczeH9PSqY2A==
X-CSE-MsgGUID: y6zTGzz5RYGBW84HhmtuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34660067"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34660067"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 07:27:42 -0700
X-CSE-ConnectionGUID: w+jNIHyCSzqAN1PNa5Fmrg==
X-CSE-MsgGUID: 6OW8fqYeS9uMD+hM62Vtkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63046433"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 07:27:39 -0700
Message-ID: <f04dd73d-d882-43c5-a4e7-5823837b0d1b@linux.intel.com>
Date: Tue, 27 Aug 2024 16:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Don't return early
To: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240827105222.13650-1-nirmoy.das@intel.com>
 <9a66f1bb-f7e0-42d1-991d-6175f73b628c@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <9a66f1bb-f7e0-42d1-991d-6175f73b628c@intel.com>
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


On 8/27/2024 4:07 PM, Andrzej Hajda wrote:
>
>
> On 27.08.2024 12:52, Nirmoy Das wrote:
>> Tests that are causing pagefaults should wait for exec queue to be ban
>> otherwise pending engine resets because of on-going pagefaults would
>> cause failure in subsequent tests to fail.
>>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_fault_mode.c | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c 
>> b/tests/intel/xe_exec_fault_mode.c
>> index 1f1f1e50b..339c79353 100644
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
>> @@ -324,6 +340,17 @@ test_exec(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>>                  bind_exec_queues[0], NSEC_PER_SEC);
>>   +    if ((flags & INVALID_FAULT)) {
>> +        igt_set_timeout(1, "");
> You can add "waiting for ban" or sth similar here for free.

+1


>> +        for (i = 0; i < n_execs; i++) {
>> +            int e = i % n_exec_queues;
>> +                while (!get_ban_property(fd, eci, vm,
>> +                             exec_queues[e]))
>> +                    sched_yield();
>> +        }
>> +        igt_reset_timeout();
>> +    }
>> +
>
> Why not iterate over exec queues instead of execs?

Do you mean why no iterate over n_exec_queues ? Wanted to keep same flow 
like the test is doing

while doing exec jobs. n_exec_queues should work too. I can change that 
if needed.


Regards,

Nirmoy

>
> Regards
> Andrzej
>
>>       if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>>           for (i = j; i < n_execs; i++)
>>                   igt_assert_eq(data[i].data, 0xc0ffee);
>

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43453C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 15:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12E610E0E8;
	Wed, 28 Aug 2024 15:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZLpbmXQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347DB10E0E8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724858857; x=1756394857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CHAy/61LAttWP8Ld2XXoJ4reDBEog09SQrQcpUN0AN8=;
 b=CZLpbmXQ1RdfdzAmSt/31fWn9VglGe5Li4J8v0iqUG5Se+KhLsggDxEl
 n8ogYY5SJxoTi3q+EOzngTsemfgOqDAwdT2T64kVXbZUJu0uFZd2HNViu
 lB9eLDH92TIX+akL3kThS3sKSJ2p7F4QAG+fj4jhUBP8yNWDHK+oM70KX
 y7YwHGq29lP6hlSIM1HsZk4XldsfVYXU48g/2DSjXXa7gShLFbPM2OxV7
 HR5aqrV5yCbZgwwREyIxTZK8i3Pbq6rd56uLf6UkW0cig0lZmFX/i4rRP
 3RWr1NOG9Nfe1rxdnHEo6oPpjj199CggEB7J08rGxTl+zPpjYwMqZXLOS w==;
X-CSE-ConnectionGUID: TxNvfbnuQn6P5CY43EnAAQ==
X-CSE-MsgGUID: L/q/6n3ARk+nGzSmXP4Ebw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34807646"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34807646"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:26:53 -0700
X-CSE-ConnectionGUID: genieDOcTnmehiP9m/Kd0A==
X-CSE-MsgGUID: hntpehYGRM6wjxHE3mNENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="94060522"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:26:51 -0700
Message-ID: <03eaaa4b-590e-430d-9e26-ee9f89bc9d44@linux.intel.com>
Date: Wed, 28 Aug 2024 17:26:48 +0200
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


 From this IGT test prospective, this subtest causes a engine reset and 
exec ban so  which it should wait. Now if that behavior doesn't met then 
we need

fix the driver but I think that is different topic.

>
> In v2 there was one failure on PVC: 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
> This time it passed flawlessly (as well as in v1), but not due to 
> increased time limit (at least dmesg shows the test took much less 
> than 1second).


Yes I saw that, it just mean the ctx wasn't banned which is strange. 
There is not enough info to debug.

> Let's wait for xeFULL pass, maybe it will show some interesting results.


Regards,

Nirmoy

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

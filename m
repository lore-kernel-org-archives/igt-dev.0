Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F6C54739
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC1510E373;
	Tue, 27 Aug 2024 16:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiFiZA+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD32210E373
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724775174; x=1756311174;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l6Ca9FdcHKYg8Sx1RDokzX5o/4cfMux3VyKUGBWnSjQ=;
 b=OiFiZA+xCaZMPzzmmBGWR/qHJcILeCdJP2V8Oz2aTXeiwmUgE66c65fK
 Dhtn0P54WtDz/hVLohiLsU+aRX+JXR2W9oP03HAN6356+P+TbpvtoTi7U
 ik9MTfEx8DCUM1KQ6Nsid9kHkZqrABLnaeU4oqRnYaUSuhjvIikuBzJL6
 JIgwwbMc71ZLEKGBuGu29r7YS0LXUFFRO///ut5PokMHuEVqnVaNIB5sp
 Dh6qKy4GSQTENGbAQP5+dJuZKJsnWHG8AS7JfacK9wQYCXQlz0FKEOzNA
 1r3DcG6kvbmK1Ugs2C1WWXMypEOrEwhKqPBbFnaIa225xIPtYPF9Y3t5s w==;
X-CSE-ConnectionGUID: aiAAxTzqR9eTYe1fKrHr+Q==
X-CSE-MsgGUID: bYkEkX7vRBeiBYGx0eJlfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13239825"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="13239825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:12:53 -0700
X-CSE-ConnectionGUID: QxUDHTy8RauzejbM8Y+PBw==
X-CSE-MsgGUID: 9m6X6dhBQ52KkZWPY2adQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67809385"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:12:51 -0700
Message-ID: <45e3b3d6-66b9-4ed6-8241-91cc24e0a559@linux.intel.com>
Date: Tue, 27 Aug 2024 18:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Don't return early
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240827105222.13650-1-nirmoy.das@intel.com>
 <Zs32L7Y9GePDfXUg@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zs32L7Y9GePDfXUg@DUT025-TGLU.fm.intel.com>
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


On 8/27/2024 5:52 PM, Matthew Brost wrote:
> On Tue, Aug 27, 2024 at 12:52:22PM +0200, Nirmoy Das wrote:
>> Tests that are causing pagefaults should wait for exec queue to be ban
>> otherwise pending engine resets because of on-going pagefaults would
>> cause failure in subsequent tests to fail.
>>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Hi Matt,


have sent a v2, with few minor suggestion Andrzej, could you please 
review that

https://patchwork.freedesktop.org/patch/610883/?series=137836&rev=2


Regards,

Nirmoy

>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_fault_mode.c | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
>> index 1f1f1e50b..339c79353 100644
>> --- a/tests/intel/xe_exec_fault_mode.c
>> +++ b/tests/intel/xe_exec_fault_mode.c
>> @@ -36,6 +36,22 @@
>>   #define INVALID_VA	(0x1 << 8)
>>   #define ENABLE_SCRATCH  (0x1 << 9)
>>   
>> +static int get_ban_property(int xe, struct drm_xe_engine_class_instance *eci,
>> +			    uint32_t vm, uint32_t exec_queue)
>> +{
>> +	struct drm_xe_exec_queue_get_property args = {
>> +		.value = -1,
>> +		.reserved[0] = 0,
>> +		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
>> +	};
>> +
>> +	args.exec_queue_id = exec_queue;
>> +
>> +	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
>> +
>> +	return args.value;
>> +}
>> +
>>   /**
>>    * SUBTEST: invalid-va
>>    * Description: Access invalid va and check for EIO through user fence.
>> @@ -324,6 +340,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>>   		       bind_exec_queues[0], NSEC_PER_SEC);
>>   
>> +	if ((flags & INVALID_FAULT)) {
>> +		igt_set_timeout(1, "");
>> +		for (i = 0; i < n_execs; i++) {
>> +			int e = i % n_exec_queues;
>> +				while (!get_ban_property(fd, eci, vm,
>> +							 exec_queues[e]))
>> +					sched_yield();
>> +		}
>> +		igt_reset_timeout();
>> +	}
>> +
>>   	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>>   		for (i = j; i < n_execs; i++)
>>   				igt_assert_eq(data[i].data, 0xc0ffee);
>> -- 
>> 2.42.0
>>

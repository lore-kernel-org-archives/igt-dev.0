Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F8CEBF8E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 10:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33C210ECB3;
	Fri, 27 Sep 2024 10:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOabcb5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E2F10ECB3
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727432548; x=1758968548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KBc20cE7NnCLxnAxcxaKQnWbxCy0TLFSrxm8uy6eBSI=;
 b=UOabcb5NSfk8nQeuKLDpsxEVLoRER1n6JoD5o2aHLl1B+SbWaenL3jts
 Kk6JKbQ/DRRVhhJU0hqNvEM7LeYUE3q5Y464vT1bRD9HDqgnH6XEiSUT/
 pkFyjwq7olkaj/59YZSl2Xe9h/vAh9Moydu7/+Nwum4R2fGsJzg/m35ip
 WIQ/IAAIuYkVVS0hq1ZLDLjqihajfhHCD6kMcDevCvr5qGf63t+v4Xg8e
 NsXv3BwNoBcp3yRnaf7fruR8c5C2V/8eLBx5p6X7OOqXAugt73wEIlPB4
 RGakJk4QpoWO34ePysVKg3wWzG3v4a8PmI1I1WNQvJanUKb3WFaZNOETL w==;
X-CSE-ConnectionGUID: +8V5imNTRQ+fVmOvr06Dgg==
X-CSE-MsgGUID: UTozZ0rhS8+PQmgqohsL+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37710581"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37710581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:22:27 -0700
X-CSE-ConnectionGUID: 1rQc7xFHTfixc1Tr9PoQkA==
X-CSE-MsgGUID: oxpTIxc1RDmV1S/+mzoC/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77005713"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.83])
 ([10.245.244.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:22:26 -0700
Message-ID: <53783573-6681-49ec-b400-cb85dfedcf8f@intel.com>
Date: Fri, 27 Sep 2024 11:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait during
 the gt_reset
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
 <05ef47a7-663a-4fc4-a069-0c3f3f4c385b@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <05ef47a7-663a-4fc4-a069-0c3f3f4c385b@linux.intel.com>
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

On 27/09/2024 11:05, Bernatowicz, Marcin wrote:
> 
> 
> On 9/25/2024 12:31 PM, Bommu Krishnaiah wrote:
>> From: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
>>
>> Skipping the syncobj_wait for the workloads which is submitted
>> before gt reset, since After gt reset There is no expectation
>> from the hardware/GuC/KMD that the workload will then
>> re-execute and complete.
>>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> ---
>>   tests/intel/xe_exec_reset.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>> index b5d5f43ea..b1a7548c6 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -263,8 +263,9 @@ test_balancer(int fd, int gt, int class, int 
>> n_exec_queues, int n_execs,
>>       }
>>       for (i = 0; i < n_exec_queues && n_execs; i++)
>> -        igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> -                    NULL));
>> +        if (!(flags & GT_RESET))
>> +            igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX,
> 
> What happens when the user waits on syncobj in case of GT reset ?
> Maybe there is no expectation that there will be re-execute, but 
> shouldn't the syncobj be notified or a timeout hit ?

Yeah, this sounds like KMD bug. Expectation is that dma fences should 
eventually signal no matter what, and in a reasonable amount of time.

Possibly relevant fix (very recently merged): 
https://patchwork.freedesktop.org/patch/605681/?series=136463&rev=1

> 
>> +                        0, NULL));
>>       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, 
>> NULL));
>>       sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> @@ -410,7 +411,8 @@ test_legacy_mode(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       }
>>       for (i = 0; i < n_exec_queues && n_execs; i++)
>> -        igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +        if (!(flags & GT_RESET))
>> +            igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>>                       NULL));
>>       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, 
>> NULL));
> 

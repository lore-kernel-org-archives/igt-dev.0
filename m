Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69FCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 17:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B0C10E6F6;
	Wed,  1 Oct 2025 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDR1EIbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF5210E6F6
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759340519; x=1790876519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1PkdFPc9wOd593FrfGg71BLDFWYr/PR4LP/Z4j5coWA=;
 b=oDR1EIbN7Q9yJKG/79Db976TGec24G26afvd6exCJIHh8xnCg6xuQZd4
 tljJImJO98JKERwUuPEH1mqhtElJwsXPsNqSCb0rNyLXgG5PRqwogGOew
 vOveEtdbSZGw+UsLlqpxzo0BlCwBCZsXf2P0DD/YNSpBl9q+sYnBBqq0q
 fikLYVchYWZg6332OWC43OKDo9dvnUjvgdsKCxCwgwi0v3SLiXFhKbexM
 fDC+8ecy4yWaDT11KqH+3gsIOxd/RMUbx1XDmQ5d+nNcomxKhUWzLFMEC
 E6DVdas5XGLQ/YC2MD9/awzR8XrxwqEX1jejePwv4UYqytDEf+CvXWNOG A==;
X-CSE-ConnectionGUID: iHoHpgUERZKEg+T7UjwwQw==
X-CSE-MsgGUID: 18/OZXAYR4Ca9bnKFav2qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79044437"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="79044437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 10:41:59 -0700
X-CSE-ConnectionGUID: u6i4WmRwQsqaRRFvAkGzIg==
X-CSE-MsgGUID: cf6tJjDTSj2gdLTRPOqENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178121426"
Received: from unknown (HELO [172.28.180.163]) ([172.28.180.163])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 10:42:00 -0700
Message-ID: <284c646d-2071-4510-adf9-d30c56c9b6e0@linux.intel.com>
Date: Wed, 1 Oct 2025 19:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <aae3e970-18d1-4aba-8c15-305ee9ce8425@linux.intel.com>
 <aNyQ1tPuegzSaDSx@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <aNyQ1tPuegzSaDSx@lstrano-desk.jf.intel.com>
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



On 10/1/2025 4:24 AM, Matthew Brost wrote:
> On Tue, Sep 30, 2025 at 04:29:13PM +0200, Bernatowicz, Marcin wrote:
>>
>>
>> On 9/23/2025 11:13 PM, Matthew Brost wrote:
>>> Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
>>> memory can be used during this test. Useful to test VF migration.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
>>>    tests/intel/xe_exec_reset.c |  8 ++++++++
>>>    2 files changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>>> index cb53a8cfc8..74432a4b3a 100644
>>> --- a/lib/xe/xe_legacy.c
>>> +++ b/lib/xe/xe_legacy.c
>>> @@ -9,9 +9,11 @@
>>>    #include "xe/xe_ioctl.h"
>>>    #include "xe/xe_legacy.h"
>>>    #include "xe/xe_spin.h"
>>> +#include "intel_pat.h"
>>>    /* Batch buffer element count, in number of dwords(u32) */
>>>    #define BATCH_DW_COUNT			16
>>> +#define COMPRESSION			(0x1 << 13)
>>>    #define SYSTEM				(0x1 << 12)
>>>    #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>>>    #define LONG_SPIN			(0x1 << 8)
>>> @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>>> +	if (flags & COMPRESSION)
>>> +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>>> +
>>>    	if (flags & CLOSE_FD)
>>>    		fd = drm_open_driver(DRIVER_XE);
>>> @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	bo_size = sizeof(*data) * (n_execs + extra_execs);
>>>    	bo_size = xe_bb_size(fd, bo_size);
>>> -	bo = xe_bo_create(fd, vm, bo_size,
>>> -			  flags & SYSTEM ?
>>> -			  system_memory(fd) :
>>> -			  vram_if_possible(fd, eci->gt_id),
>>> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +	if (flags & COMPRESSION) {
>>> +		bo = xe_bo_create_caching(fd, vm, bo_size,
>>> +					  flags & SYSTEM ?
>>> +					  system_memory(fd) :
>>> +					  vram_if_possible(fd, eci->gt_id),
>>> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>>> +					  DRM_XE_GEM_CPU_CACHING_WC);
>>> +	} else {
>>> +		bo = xe_bo_create(fd, vm, bo_size,
>>> +				  flags & SYSTEM ?
>>> +				  system_memory(fd) :
>>> +				  vram_if_possible(fd, eci->gt_id),
>>> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +	}
>>>    	data = xe_bo_map(fd, bo, bo_size);
>>>    	for (i = 0; i < n_exec_queues; i++) {
>>> @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	sync[0].handle = syncobj_create(fd, 0);
>>>    	/* Binding mechanism based on use_capture_mode */
>>> -	if (use_capture_mode) {
>>> +	if (flags & COMPRESSION) {
>>> +		int ret;
>>> +
>>> +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
>>> +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
>>> +				   intel_get_pat_idx_uc_comp(fd), 0);
>>> +		igt_assert(!ret);
>>> +	} else if (use_capture_mode) {
>>>    		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
>>>    				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>>>    	} else {
>>> @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    		xe_exec(fd, &exec);
>>> -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
>>> +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
>>> +		    !(flags & COMPRESSION))
>>>    			xe_spin_wait_started(&data[i].spin);
>>>    	}
>>> @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>>>    	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>>> -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
>>> +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>>>    		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
>>>    		     i < n_execs + extra_execs; i++)
>>>    			igt_assert_eq(data[i].data, 0xc0ffee);
>>
>> I'm not that familiar with compression, IIUC we are not able to access data
>> when compressed so we do not do any checks ?
> 
> Yes, the data will read out as compressed until our hardware supports a
> PCIe bar which does the uncompression or we'd have to copy the data with
> a BCS engine that triggers an uncompresion.

Not sure when the compression happens (perhaps after exec as before we 
can write the commands) but I think I was able to copy to uncompressed 
BO with MEM_COPY_CMD and verify 0xc0ffee (but my code is ugly and 
over-complicated).

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

> 
>> I can see the engines are busy while executing so assume that's enough
>> for basic check.
>>
> 
> That is the intent. This test quickly failed on BMG / PTL when migrating
> a VF as compression handling had bugs in VF migration. The intent of the
> test to include this in VM test benchmark to catch bugs like that.
> Checking job completion is sufficient to detect these types of bugs.
> 
> Matt
> 
>> Acked-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>
>>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>>> index 113ceb2178..f5db1ff8ba 100644
>>> --- a/tests/intel/xe_exec_reset.c
>>> +++ b/tests/intel/xe_exec_reset.c
>>> @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>>>    #define GT1				(0x1 << 10)
>>>    #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>>>    #define SYSTEM				(0x1 << 12)
>>> +#define COMPRESSION			(0x1 << 13)
>>>    /**
>>>     * SUBTEST: %s-cat-error
>>> @@ -702,6 +703,9 @@ static void *thread(void *data)
>>>     * SUBTEST: long-spin-sys-reuse-many-preempt-threads
>>>     * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
>>>     *
>>> + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
>>> + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
>>> + *
>>>     * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
>>>     * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
>>>     *
>>> @@ -878,6 +882,10 @@ igt_main
>>>    		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
>>>    			LONG_SPIN_REUSE_QUEUE);
>>> +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
>>> +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
>>> +			LONG_SPIN_REUSE_QUEUE);
>>> +
>>>    	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
>>>    		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
>>>    			LONG_SPIN_REUSE_QUEUE);
>>


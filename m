Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD189C5B54A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 15:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822E10E582;
	Wed, 28 Aug 2024 15:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYoduZYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FDC10E57E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 15:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724858135; x=1756394135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HUi+dPuYZJNhnANKWTI9iOcU/xI9zQIfGYdvhbgFrZ0=;
 b=XYoduZYoFQl051nAroarlGsNFaFHUL7p51A+GxY6pDMtSeO2nF0klaai
 Ur4mLJ3qlCQPaioVn2N1XL9wXc0yAiklXJsj5YziN4k0ZdRDS89QepZAK
 /yUOWksQpDXIjxSBDUO7PgaaWxBdqlaCpQj/gQjTlRAIoJCoPCnKDjw4i
 2UOHQq6BUru8RyTGj1wIWNs89mXanO1j2OwUihn8X6/p3EnAWqE3trnvl
 M/RCIZHhOA+0cbpAdfbpTdkfOEKQEOklr6bld0EI2qHXeuEqR80k3Qhv9
 Ck9tJrF1/FoU3yhoyCQBIzkf+qMHJ8shp28Sl6vL7KHv1S9e/rTSSGOm2 A==;
X-CSE-ConnectionGUID: SlQFvBzRQ26jeTnR1vWEXA==
X-CSE-MsgGUID: H0skojBTTIOb+xxehLJPYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23354609"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23354609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:15:35 -0700
X-CSE-ConnectionGUID: 5e5DSsLMSBC3Rw1zSvE2rg==
X-CSE-MsgGUID: oe3Gq1MzSGWb3Lu3Kem6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68102289"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 08:15:33 -0700
Message-ID: <652436ca-1186-4769-bd5c-ddb6d9d0073f@intel.com>
Date: Wed, 28 Aug 2024 17:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec_fault_mode: Don't return
 early
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240828095514.15613-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240828095514.15613-1-nirmoy.das@intel.com>
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



On 28.08.2024 11:55, Nirmoy Das wrote:
> Tests that are causing pagefaults should wait for exec queue to be ban
> otherwise pending engine resets because of on-going pagefaults would
> cause failure in subsequent tests to fail.
>
> Set a larger 5 sec timeout if still tests fail, we can blame
> driver in such case.

I try to understand what causes such big delay, any ideas? Btw if the 
driver is to blame, maybe it should be fixed instead of increasing 
timeout in the test.

In v2 there was one failure on PVC: 
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11646/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
This time it passed flawlessly (as well as in v1), but not due to 
increased time limit (at least dmesg shows the test took much less than 
1second).
Let's wait for xeFULL pass, maybe it will show some interesting results.

Regards
Andrzej
>
> v2: specify timeout reason and iterate over exec_queues(Andrzej)
> v3: increase timeout
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_exec_fault_mode.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..e3e6047e7 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -36,6 +36,22 @@
>   #define INVALID_VA	(0x1 << 8)
>   #define ENABLE_SCRATCH  (0x1 << 9)
>   
> +static int get_ban_property(int xe, struct drm_xe_engine_class_instance *eci,
> +			    uint32_t vm, uint32_t exec_queue)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.value = -1,
> +		.reserved[0] = 0,
> +		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	args.exec_queue_id = exec_queue;
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +
> +	return args.value;
> +}
> +
>   /**
>    * SUBTEST: invalid-va
>    * Description: Access invalid va and check for EIO through user fence.
> @@ -324,6 +340,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>   		       bind_exec_queues[0], NSEC_PER_SEC);
>   
> +	if ((flags & INVALID_FAULT)) {
> +		igt_set_timeout(5, "waiting for ban");
> +		for (i = 0; i < n_exec_queues; i++) {
> +			while (!get_ban_property(fd, eci, vm, exec_queues[i]))
> +				sched_yield();
> +		}
> +		igt_reset_timeout();
> +	}
> +
>   	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>   		for (i = j; i < n_execs; i++)
>   				igt_assert_eq(data[i].data, 0xc0ffee);


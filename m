Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF26C54734
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 14:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D210E30C;
	Tue, 27 Aug 2024 14:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gdmj6rMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840110E30C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724767809; x=1756303809;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HkCBoXPF64cI3WtcDmKqtNmf6PrXbyyjahO17Y39Xvo=;
 b=Gdmj6rMWKutJBfe0cVzbfKf+Ckmkv38232eTXBouCnCWNsBFKyKL53i5
 OdW/Fzu66cCnUNXWMaSvfWRO8CiYu/NHoBHbjl/CgkF6Q+BXZNu3UTU1I
 QOY+vOCw4Gwsh977Gi+nNoykd8/hXyKJY3gigmNevpc3IB0PdbR2GRx7k
 Pt7KXLQIK/XbP/4XS5SbCEHXxvHZc5sozsQCk1N3dNQ+egVRilWwklhYo
 CmMGUhV95JQGvuPYDO6DwGWH+O6SiSuJBddCrNgbMOcCUecARh5VqGvLG
 tN9rFQogY0oILIsY42ZI0zYbXUzvfIl39u47cCrbKGeoMmKP7h801RTHw g==;
X-CSE-ConnectionGUID: /tmOiUbZRMS8FusoeKt31w==
X-CSE-MsgGUID: DhDaBqrPQoy5qA7vrcoJhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33818553"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33818553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 07:07:52 -0700
X-CSE-ConnectionGUID: e9YD7mBSQWqL1YCOqZ8ZwA==
X-CSE-MsgGUID: WFTeFVT4QNCrSQIHsA+siQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67706370"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 07:07:50 -0700
Message-ID: <9a66f1bb-f7e0-42d1-991d-6175f73b628c@intel.com>
Date: Tue, 27 Aug 2024 16:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Don't return early
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240827105222.13650-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240827105222.13650-1-nirmoy.das@intel.com>
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



On 27.08.2024 12:52, Nirmoy Das wrote:
> Tests that are causing pagefaults should wait for exec queue to be ban
> otherwise pending engine resets because of on-going pagefaults would
> cause failure in subsequent tests to fail.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_exec_fault_mode.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..339c79353 100644
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
> @@ -324,6 +340,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>   		       bind_exec_queues[0], NSEC_PER_SEC);
>   
> +	if ((flags & INVALID_FAULT)) {
> +		igt_set_timeout(1, "");
You can add "waiting for ban" or sth similar here for free.
> +		for (i = 0; i < n_execs; i++) {
> +			int e = i % n_exec_queues;
> +				while (!get_ban_property(fd, eci, vm,
> +							 exec_queues[e]))
> +					sched_yield();
> +		}
> +		igt_reset_timeout();
> +	}
> +

Why not iterate over exec queues instead of execs?

Regards
Andrzej

>   	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>   		for (i = j; i < n_execs; i++)
>   				igt_assert_eq(data[i].data, 0xc0ffee);


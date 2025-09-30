Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F08DCCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 13:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFD410E2BF;
	Tue, 30 Sep 2025 13:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ss4sMK9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43B10E2BF
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759237815; x=1790773815;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EX0gmWUDjg4u9J6P7qlMRoMiO8tXNAmTQPMJ65qm3TM=;
 b=Ss4sMK9/y1c79YRHJUa2fNt3zOzZK3/wIkhZ8jQ3T7OKoUKwrrUtbqbp
 WZFmb05g3r6yjSCT51kcip5Q36ScmSpeYJfRyLj/b5AVRlCn7wZuef6LV
 2FAZ/ORNVOvqBeOaoo5ILCBUbgsGWSZEMCzGO85wSIA/wGrVvWdrK6PtG
 02NtuZCYK/S/CSQNo5izBoueZ2HaNhuTUCsJGb4PE8DMRgq9DksKHsa17
 cTaVzs7AQhEdojmRSxc0S1AbgwPmz7wcsjpOAEW7Xi7E2vR2wEoLsRp5k
 uwqn3QXr101CzQ/yP4hkTlGOGYPVClgPZ6oH/2e/VaVyy14yYTLYXI+4R w==;
X-CSE-ConnectionGUID: Br66HMN8RBaAweqrEUAC0w==
X-CSE-MsgGUID: WM0OLOfHQbGDsua4xnAx+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="86936934"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="86936934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:10:14 -0700
X-CSE-ConnectionGUID: PCaqnBY4RG+R5qyahP+dGw==
X-CSE-MsgGUID: boDdjAD2TPGBUwOCWKgOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="179284639"
Received: from unknown (HELO [172.28.180.93]) ([172.28.180.93])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:10:12 -0700
Message-ID: <c1dd9b99-c071-408c-8248-c112e28b49b3@linux.intel.com>
Date: Tue, 30 Sep 2025 15:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] tests/intel/xe_exec_reset: Add timeslice preempt
 test
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250923211333.766147-3-matthew.brost@intel.com>
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



On 9/23/2025 11:13 PM, Matthew Brost wrote:
> Add tests in which submit multiple preemptable spinners to same hardware
> engine ensuring a cumulative longer timeout and validating the restart
> paths in the DRM scheduler TDR (Timeout Detection and Recovery).
> 
> v3:
>   - Spell out TDR (Kamal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/xe/xe_legacy.c          |  5 +++--
>   tests/intel/xe_exec_reset.c | 25 +++++++++++++++++++++++--
>   2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 669ecff7aa..9d2da7f413 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -12,6 +12,7 @@
>   
>   /* Batch buffer element count, in number of dwords(u32) */
>   #define BATCH_DW_COUNT			16
> +#define CANCEL				(0x1 << 7)
>   #define PREEMPT				(0x1 << 6)
>   #define CAT_ERROR			(0x1 << 5)
>   #define CLOSE_EXEC_QUEUES		(0x1 << 2)
> @@ -100,7 +101,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   		u64 exec_addr;
>   		int e = i % n_exec_queues;
>   
> -		if (!i) {
> +		if (!i || flags & CANCEL) {
>   			spin_opts.addr = base_addr + spin_offset;
>   			xe_spin_init(&data[i].spin, &spin_opts);
>   			exec_addr = spin_opts.addr;
> @@ -155,7 +156,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
> -	if (!use_capture_mode && !(flags & GT_RESET)) {
> +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
>   		for (i = 1; i < n_execs; i++)
>   			igt_assert_eq(data[i].data, 0xc0ffee);
>   	}
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 72b85d3e7b..88e9df6fbb 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -117,6 +117,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>   #define PARALLEL			(0x1 << 4)
>   #define CAT_ERROR			(0x1 << 5)
>   #define PREEMPT				(0x1 << 6)
> +#define CANCEL				(0x1 << 7)
>   
>   /**
>    * SUBTEST: %s-cat-error
> @@ -302,6 +303,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>    * SUBTEST: cancel-preempt
>    * Description: Test job cancel with a preemptable job
>    *
> + * SUBTEST: cancel-timeslice-preempt
> + * Description: Test job cancel with 2 preemptable jobs
> + *
> + * SUBTEST: cancel-timeslice-many-preempt
> + * Description: Test job cancel with many preemptable jobs
> + *
>    * SUBTEST: gt-reset
>    * Description: Test GT reset
>    *
> @@ -396,7 +403,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   		uint64_t exec_addr;
>   		int e = i % n_exec_queues;
>   
> -		if (!i) {
> +		if (!i || flags & CANCEL) {
>   			spin_opts.addr = base_addr + spin_offset;
>   			xe_spin_init(&data[i].spin, &spin_opts);
>   			exec_addr = spin_opts.addr;
> @@ -451,7 +458,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>   	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>   
> -	if (!(flags & GT_RESET)) {
> +	if (!(flags & (GT_RESET | CANCEL))) {
>   		for (i = 1; i < n_execs; i++)
>   			igt_assert_eq(data[i].data, 0xc0ffee);
>   	}
> @@ -680,6 +687,20 @@ igt_main
>   			break;
>   		}
>   
> +	igt_subtest("cancel-timeslice-preempt")
> +		xe_for_each_engine(fd, hwe) {
> +			xe_legacy_test_mode(fd, hwe, 2, 2, CANCEL | PREEMPT,
> +					    LEGACY_MODE_ADDR, false);
> +			break;
> +		}
> +
> +	igt_subtest("cancel-timeslice-many-preempt")
> +		xe_for_each_engine(fd, hwe) {
> +			xe_legacy_test_mode(fd, hwe, 4, 4, CANCEL | PREEMPT,
> +					    LEGACY_MODE_ADDR, false);
> +			break;
> +		}
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	igt_subtest("gt-reset")
>   		xe_for_each_engine(fd, hwe)
>   			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,


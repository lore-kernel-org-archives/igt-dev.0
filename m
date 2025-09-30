Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542A0CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 13:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A27E10E2BF;
	Tue, 30 Sep 2025 13:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dz1CKNJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA910E2BF
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759238018; x=1790774018;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0InKYk51W+KQtGh0GSYV86fauCP8ThgpC3IOkMqdHsY=;
 b=Dz1CKNJ2kBQoKVXM712kgwGMe4w7moQ9JPyqIyVtK2MqxyeDL+9J3EvO
 uA4Co6KVYCo7qC6CrokgyqG5ezeINTor0dnhRNHBw3wt0sbA1xvIECnKL
 pAr8aWtFDjfwsHb/VNpvNh3luARMoqALtmju7A3VvdqBUPu0GJXkee8dA
 ViGsew+oa6RgnLQ7A9DqoKk7DjRmzkbiPITUvYu25AezR6Jqax44t2mga
 UFrCD5s/CZ4O70bp8215PQPLiLH1DXwELKxXKiacPkjP21cm3/K5qMq5D
 DUF2NEMHNFgkNxLuqW3Vbu7tRTPHDRIK0sBY4Gt48E5YC3zHcwvBYcQuF Q==;
X-CSE-ConnectionGUID: 1Itv1UEPTM+NPO9i12xFiw==
X-CSE-MsgGUID: zHg7XLfpTQqXecDweAhBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="49053594"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="49053594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:13:37 -0700
X-CSE-ConnectionGUID: 7IntV1zFSpe+biLMdG080Q==
X-CSE-MsgGUID: QgwRvPWRSMqLw+adk5/S5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182535162"
Received: from unknown (HELO [172.28.180.93]) ([172.28.180.93])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:13:36 -0700
Message-ID: <485fd4bf-0d7e-4d9e-bc69-105dfbd3223e@linux.intel.com>
Date: Tue, 30 Sep 2025 15:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] tests/intel/xe_exec_reset: Add
 long-spin-sys-reuse-many-preempt-threads
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250923211333.766147-5-matthew.brost@intel.com>
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
> Add long-spin-sys-reuse-many-preempt-threads which verifies system
> memory can be used during this test. Useful to test VF migration.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/xe/xe_legacy.c          | 3 +++
>   tests/intel/xe_exec_reset.c | 8 ++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index c0c0c4605c..cb53a8cfc8 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -12,6 +12,7 @@
>   
>   /* Batch buffer element count, in number of dwords(u32) */
>   #define BATCH_DW_COUNT			16
> +#define SYSTEM				(0x1 << 12)
>   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>   #define LONG_SPIN			(0x1 << 8)
>   #define CANCEL				(0x1 << 7)
> @@ -79,6 +80,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	bo_size = xe_bb_size(fd, bo_size);
>   
>   	bo = xe_bo_create(fd, vm, bo_size,
> +			  flags & SYSTEM ?
> +			  system_memory(fd) :
>   			  vram_if_possible(fd, eci->gt_id),
>   			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	data = xe_bo_map(fd, bo, bo_size);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 8685b84270..113ceb2178 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -122,6 +122,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>   #define GT0				(0x1 << 9)
>   #define GT1				(0x1 << 10)
>   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> +#define SYSTEM				(0x1 << 12)
>   
>   /**
>    * SUBTEST: %s-cat-error
> @@ -698,6 +699,9 @@ static void *thread(void *data)
>    * SUBTEST: long-spin-reuse-many-preempt-threads
>    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs
>    *
> + * SUBTEST: long-spin-sys-reuse-many-preempt-threads
> + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
> + *
>    * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
>    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
>    *
> @@ -870,6 +874,10 @@ igt_main
>   		threads(fd, 2, 16, LONG_SPIN | PREEMPT |
>   			LONG_SPIN_REUSE_QUEUE);
>   
> +	igt_subtest("long-spin-sys-reuse-many-preempt-threads")
> +		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
> +			LONG_SPIN_REUSE_QUEUE);
> +
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>> 
igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
>   		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
>   			LONG_SPIN_REUSE_QUEUE);


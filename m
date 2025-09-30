Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C4CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 11:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16910E2A8;
	Tue, 30 Sep 2025 11:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YV6UdY3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8255210E2A8
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759231278; x=1790767278;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Zsexgu+emqLZ9A6FY31bKCheH24amE445FJWhajbatQ=;
 b=YV6UdY3t0qDuiBtcfdEMfiTSk5GRrra2gqdClGPYOG8biL90N38551KY
 fKkJdfkPfpZg9+OQSq5e+fWKrxF/yiFeNDYZrKNBoJerjfbFkVrmc6xew
 0uZj5Zu9GOzVX91QlsIv+SVxmchf/02NKcMpaCxd4FdmYgHxkDpJwCgKG
 3HUkt/xTxZjobIIYc+zkBbXvw2EgUDg87SoDjpuPWfBJKRqfvE/vHcdDO
 LNtnyh0uPa/7rTYhgLrhd1D5hDigxorksNk8z2WjiM27rklbwJNTI3vbB
 30bncTtyZ4MZfuK1yZQip02xZniz00bbChtPanlYn7Nm9IhbbohL8cyYE w==;
X-CSE-ConnectionGUID: 2IZKF2iBRsC8pMJJZSt9Jw==
X-CSE-MsgGUID: 2mx/I6rvSqGmCHnT9Q7c2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72103298"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72103298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:21:12 -0700
X-CSE-ConnectionGUID: LNIB2XJ+TimLEun6++3uJA==
X-CSE-MsgGUID: FWcQInZvTb6lTgD7gawwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177626182"
Received: from unknown (HELO [172.28.180.93]) ([172.28.180.93])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:21:11 -0700
Message-ID: <000835ff-e8aa-4964-9886-7a31d804472b@linux.intel.com>
Date: Tue, 30 Sep 2025 13:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] tests/intel/xe_exec_reset: Add job cancel tests
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250923211333.766147-2-matthew.brost@intel.com>
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
> This test has pulled out when the ability to set the job timeout via
> IOCTL was removed from the uAPI while upstreaming Xe. Add this coverage
> back in but only run on a single hardware engine given by default jobs
> take 5 seconds to timeout.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/xe/xe_legacy.c          |  3 ++-
>   tests/intel/xe_exec_reset.c | 23 ++++++++++++++++++++++-
>   2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 6570cf1e6e..669ecff7aa 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -12,6 +12,7 @@
>   
>   /* Batch buffer element count, in number of dwords(u32) */
>   #define BATCH_DW_COUNT			16
> +#define PREEMPT				(0x1 << 6)
>   #define CAT_ERROR			(0x1 << 5)
>   #define CLOSE_EXEC_QUEUES		(0x1 << 2)
>   #define CLOSE_FD			(0x1 << 1)
> @@ -56,7 +57,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   		u64 pad;
>   		u32 data;
>   	} *data;
> -	struct xe_spin_opts spin_opts = { .preempt = false };
> +	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
>   	int i, b;
>   
>   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 7ae53c6790..72b85d3e7b 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -116,6 +116,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>   #define VIRTUAL				(0x1 << 3)
>   #define PARALLEL			(0x1 << 4)
>   #define CAT_ERROR			(0x1 << 5)
> +#define PREEMPT				(0x1 << 6)
>   
>   /**
>    * SUBTEST: %s-cat-error
> @@ -295,6 +296,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>    * SUBTEST: cat-error
>    * Description: Test cat error
>    *
> + * SUBTEST: cancel
> + * Description: Test job cancel
> + *
> + * SUBTEST: cancel-preempt
> + * Description: Test job cancel with a preemptable job
> + *
>    * SUBTEST: gt-reset
>    * Description: Test GT reset
>    *
> @@ -350,7 +357,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   		uint64_t exec_sync;
>   		uint32_t data;
>   	} *data;
> -	struct xe_spin_opts spin_opts = { .preempt = false };
> +	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
>   	int i, b;
>   
>   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> @@ -659,6 +666,20 @@ igt_main
>   			xe_legacy_test_mode(fd, hwe, 2, 2, CAT_ERROR,
>   					    LEGACY_MODE_ADDR, false);
>   
> +	igt_subtest("cancel")
> +		xe_for_each_engine(fd, hwe) {
> +			xe_legacy_test_mode(fd, hwe, 1, 1, 0,
> +					    LEGACY_MODE_ADDR, false);
> +			break;
> +		}
> +
> +	igt_subtest("cancel-preempt")
> +		xe_for_each_engine(fd, hwe) {
> +			xe_legacy_test_mode(fd, hwe, 1, 1, PREEMPT,
> +					    LEGACY_MODE_ADDR, false);
> +			break;
> +		}
> +
>   	igt_subtest("gt-reset")
>   		xe_for_each_engine(fd, hwe)
>   			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC86CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 12:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25D610E2B5;
	Wed, 10 Sep 2025 12:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkRIzdnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94710E2B5
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757508806; x=1789044806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+AVssmyxgIbmYQWIEJZo/4o0E8CqMYQ86zJGk23Qhvc=;
 b=LkRIzdnDcS7JA9gh+J9YpxOQoU6ePwe2ebO2oTKxa020dhx82jueAVJ8
 tN4liADwClu8YGRF4Bz9dTK34uhMmnnsi2c98EDcKiduYvrDJmevvGMYx
 2bUT+KoxxQTRCRa2lZskeEld4McwcgXgzl5HQOg+dYsYLZYqhm9xhE//Z
 C4hxl15d2nH4pI0pAyvP+2CNoXeHJYqq8JpK6y7HKYFJQctttCwYUtDy6
 JkYdiPqSzyhoWDBf54CS1hu+PjvQkZVVVPeS/bxSkTbEHVi3cPvPZoSOF
 71gQaAp+GzOc1gC872P8KcF/W0gWYnZIgKC9oN5ikD6AgLg33CJl8drip Q==;
X-CSE-ConnectionGUID: ECh20QnuQVO+niGQaEbA3Q==
X-CSE-MsgGUID: t5WlL5dHTcWHzahzxF4GNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59737610"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59737610"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 05:53:22 -0700
X-CSE-ConnectionGUID: MeItWRpWQYaBUCXNcGVqkg==
X-CSE-MsgGUID: tR/FA28kSm2w57/xwP7mWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="177419580"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:53:20 -0700
Date: Wed, 10 Sep 2025 14:52:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_mix_modes: Fix, refactor and cleanup
Message-ID: <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Daniel Charles <daniel.charles@intel.com>
References: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
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

Hi Balasubramani,
On 2025-09-10 at 18:09:46 +0530, Balasubramani Vivekanandan wrote:
> After the recent change of xe_exec_mix_modes, fixes were required for
> the following points
> - A local variable spin_arg was used uninitialized.
> - There were some variables and macros left unused.
> - There was an unnecessary loop.
> Along with these changes, also some refactoring done to simplify things.

Is it a revert of recent changes? If so, it would be better to make
it a revert + fixes, e.g. in two commits.

Please write all Cc before s-o-b:

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Daniel Charles <daniel.charles@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 49 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> index e65854d0d..b74247bc4 100644
> --- a/tests/intel/xe_exec_mix_modes.c
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -28,7 +28,6 @@
>  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
>  #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
>  
> -#define NUM_INTERRUPTING_JOBS	1
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  #define VM_DATA			0
>  #define SPIN_DATA		1
> @@ -96,9 +95,12 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>  	uint32_t bo = 0;
>  	unsigned int vm_flags = 0;
>  	struct xe_spin_opts spin_opts = { .preempt = true };
> -	struct timespec tv;
>  	enum engine_execution_mode interrupting_engine_execution_mode;
> -	int64_t timeout_short = 1;
> +	/*
> +	 * This is amount of time the test will wait on interrupting job fence
> +	 * to confirm it wasn't scheduled. It is set to 500ms.
> +	 */
> +	int64_t job_wait = NSEC_PER_SEC / 2;
>  
>  	if (engine_execution_mode == EXEC_MODE_LR) {
>  		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> @@ -153,55 +155,56 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>  		interrupting_engine_execution_mode = engine_execution_mode;
>  	}
>  
> -	if (allow_recursion) {
> -		igt_gettime(&tv);
> -		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> -		{
> -			struct xe_spin *spin_arg;
> -
> -			if (job_type == SPINNER_INTERRUPTED &&
> -			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> -			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> -				/**
> -				 * In this case, jobs in LR mode are submitted while a job in dma
> -				 * fence mode is running. It is expected that the KMD will wait
> -				 * for completion of the dma fence job before executing the jobs
> -				 * in LR mode. Provide a pointer to the spinner to the interrupting
> -				 * dma fence job so that it can check that it was blocked, then
> -				 * end the spinner, then check that it was unblocked and completed,
> -				 * see "if (dma_fence_job_spin) ... " below.
> -				 */
> -				spin_arg = &data[SPIN_DATA].spin;
> -
> -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> -				false, spin_arg);
> -
> -			if (job_type == SPINNER_INTERRUPTED &&
> -			    engine_execution_mode == EXEC_MODE_LR &&
> -			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> -				/**
> -				 * In that case, jobs in dma fence mode are submitted while a job
> -				 * in LR mode is running. It is expected that the KMD will preempt
> -				 * the LR mode job to execute the dma fence mode jobs. At this
> -				 * point the dma fence job has completed, check that the LR mode
> -				 * job is still running, meaning was successfully preempted.
> -				 */
> -				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> -								   USER_FENCE_VALUE,
> -								   0, &timeout_short));
> -			}
> +	if (allow_recursion) { /* Main job */
> +
> +		struct xe_spin *spin_arg = NULL;
> +
> +		if (job_type == SPINNER_INTERRUPTED &&
> +		    engine_execution_mode == EXEC_MODE_DMA_FENCE)
> +			/**
> +			 * In this case, jobs in LR mode are submitted while a job in dma
> +			 * fence mode is running. It is expected that the KMD will wait
> +			 * for completion of the dma fence job before executing the jobs
> +			 * in LR mode. Provide a pointer to the spinner to the interrupting
> +			 * dma fence job so that it can check that it was blocked, then
> +			 * end the spinner, then check that it was unblocked and completed,
> +			 * see "if (dma_fence_job_spin) ... " below.
> +			 */
> +			spin_arg = &data[SPIN_DATA].spin;
> +
> +		run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> +			false, spin_arg);
> +
> +		if (job_type == SPINNER_INTERRUPTED &&
> +		    engine_execution_mode == EXEC_MODE_LR)
> +			/*
> +			 * When main job is executed in EXEC_MODE_LR,
> +			 * interrupting job won't end it, main job should take
> +			 * care to end the spinner
> +			 */
> +			xe_spin_end(&data[SPIN_DATA].spin);
> +
> +	} else { /* Interrupting job */
> +
> +		if (dma_fence_job_spin) {
> +			/*
> +			 * A spinner job is executing in the DMA fence mode as
> +			 * main job. Until we end the spinner explicitly, the
> +			 * interrupting job won't be scheduled.
> +			 * Make sure the interrupting job is still not completed by
> +			 * waiting for on its user fence with a long timeout.
> +			 * Wait is expected to end with a timeout.
> +			 * After that send signal to end the spinner job. Once the
> +			 * spinner exits it will make way for the execution of
> +			 * interrupting DMA fence job.
> +			*/
> +			igt_assert_neq(0, __xe_wait_ufence(fd,
> +				       &data[EXEC_DATA].exec_sync,
> +				       USER_FENCE_VALUE, 0, &job_wait));
> +			xe_spin_end(dma_fence_job_spin);
>  		}
>  	}
>  
> -	if (dma_fence_job_spin) {
> -		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> -						   USER_FENCE_VALUE, 0, &timeout_short));
> -		xe_spin_end(dma_fence_job_spin);
> -	} else if (job_type == SPINNER_INTERRUPTED &&
> -		   engine_execution_mode == EXEC_MODE_LR) {
> -		xe_spin_end(&data[SPIN_DATA].spin);
> -	}
> -
>  	if (engine_execution_mode == EXEC_MODE_LR) {
>  		if (job_type == SPINNER_INTERRUPTED)
>  			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -- 
> 2.34.1
> 

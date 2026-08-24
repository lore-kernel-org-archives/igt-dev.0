Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00657C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 18:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812F710E826;
	Mon, 24 Aug 2026 18:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRAee1ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354910E826
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597701; x=1819133701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c7KcxFwkAjETMbe5GTF1P6N9xH1F6YgOrjckphgtiU8=;
 b=NRAee1roAhqbh9oZ0/dZ+Z6AbdXpNGePP9XQ9rP4Vevmtrm0eVE0suWg
 j3g98WxKJgUzHv6d6aJC5zYbQw35XY4ERifl/7Vbr6OlLnL/jlvh6Y0qr
 rA1TNTc3U3/hPUmCIy/i787wsOb7Io/eoesEP/TdfTJ9ouZ+VBfgkt150
 0I4BWZfhYYBAhr7kWKfX8YHaacLyly/Br4xb7Hip/m19V0AwnC2wSh9S4
 XhodJyZ8oYigCL0cxIjKkukXcdr/o9Btyzg4dLredG/iBQHxD4e3oE7CZ
 X3P/9e9L8zfqS8VqpZ+mBpyM6u+YnMFga/T3wBIcdPnXIh9uyORNoC40t w==;
X-CSE-ConnectionGUID: TgGpAAjwSbm+HXK3cbPsdw==
X-CSE-MsgGUID: Ev3vyVGmRGyRDKBeHya70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75594817"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75594817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:55:01 -0700
X-CSE-ConnectionGUID: L9sjGCjHQyylhWjxVnL7/g==
X-CSE-MsgGUID: rBH4gb6RRcORXUNNUZCepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263353330"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:54:59 -0700
Date: Mon, 24 Aug 2026 20:54:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 1/9] tests/intel/xe_exec_reset: Add concurrent GT
 reset submit stress test
Message-ID: <20260824185442.n2tviulignymutla@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-2-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-18 at 04:08:37 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add a dedicated stress subtest for concurrent GT reset and job submission.
> The new subtest exercises reset/submit overlap by running:
> 1. GT resets on a selected GT
> 2. Concurrent job submission threads creating queues and executing batches
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 40 ++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 044d8f007..134378974 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -650,6 +650,9 @@ struct gt_thread_data {
>  	int *go;
>  	int *exit;
>  	int *num_reset;
> +	int *num_submit;
> +	int *num_submit_fail;
> +	unsigned int flags;
>  	bool do_reset;
>  };
>  
> @@ -671,7 +674,7 @@ static void submit_jobs(struct gt_thread_data *t)
>  	uint32_t bo;
>  	uint32_t *data;
>  
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	data = xe_bo_map(fd, bo, bo_size);
>  	data[0] = MI_BATCH_BUFFER_END;
> @@ -682,7 +685,7 @@ static void submit_jobs(struct gt_thread_data *t)
>  		struct drm_xe_engine_class_instance instance = {
>  			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  			.engine_instance = 0,
> -			.gt_id = 0,
> +			.gt_id = t->gt,
>  		};
>  		struct drm_xe_exec exec = {
>  			.address = addr,
> @@ -692,11 +695,14 @@ static void submit_jobs(struct gt_thread_data *t)
>  
>  		/* GuC IDs can get exhausted */
>  		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
> -		if (ret)
> +		if (ret) {
> +			(*t->num_submit_fail)++;
>  			continue;
> +		}
>  
>  		xe_exec(fd, &exec);
>  		xe_exec_queue_destroy(fd, exec.exec_queue_id);
> +		(*t->num_submit)++;
>  	}
>  
>  	munmap(data, bo_size);
> @@ -726,14 +732,19 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress GT reset
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-concurrent-submit
> + * Description: Stress concurrent GT resets and job submissions
> + * Test category: stress test
> + *
>   */
>  static void
> -gt_reset(int fd, int n_threads, int n_sec)
> +gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
>  {
>  	struct gt_thread_data *threads;
>  	pthread_mutex_t mutex;
>  	pthread_cond_t cond;
>  	int go = 0, exit = 0, num_reset = 0, i;
> +	int num_submit = 0, num_submit_fail = 0;
>  
>  	threads = calloc(n_threads, sizeof(struct gt_thread_data));
>  	igt_assert(threads);
> @@ -745,10 +756,13 @@ gt_reset(int fd, int n_threads, int n_sec)
>  		threads[i].mutex = &mutex;
>  		threads[i].cond = &cond;
>  		threads[i].fd = fd;
> -		threads[i].gt = 0;
> +		threads[i].gt = gt;
> +		threads[i].flags = flags;
>  		threads[i].go = &go;
>  		threads[i].exit = &exit;
>  		threads[i].num_reset = &num_reset;
> +		threads[i].num_submit = &num_submit;
> +		threads[i].num_submit_fail = &num_submit_fail;
>  		threads[i].do_reset = (i == 0);
>  
>  		pthread_create(&threads[i].thread, 0, gt_reset_thread,
> @@ -766,8 +780,11 @@ gt_reset(int fd, int n_threads, int n_sec)
>  	for (i = 0; i < n_threads; i++)
>  		pthread_join(threads[i].thread, NULL);
>  
> -	igt_info("number of resets %d\n", num_reset);
> +	igt_info("number of resets %d, submissions %d, submit fails %d\n",
> +		 num_reset, num_submit, num_submit_fail);
>  
> +	igt_assert_neq(num_reset, 0);
> +	igt_assert_neq(num_submit, 0);
>  	free(threads);
>  }
>  
> @@ -934,6 +951,10 @@ int igt_main()
>  		{ "parallel", PARALLEL },
>  		{ NULL },
>  	};
> +	const struct section ssections[] = {
> +		{ "reset-concurrent-submit", 0 },
> +		{ NULL },
> +	};
>  	int gt;
>  	int class;
>  	int fd;
> @@ -1126,7 +1147,12 @@ int igt_main()
>  	}
>  
>  	igt_subtest("gt-reset-stress")
> -		gt_reset(fd, 4, 1);
> +		gt_reset(fd, 0, 4, 1, 0);
> +
> +	for (const struct section *s = ssections; s->name; s++) {
> +		igt_subtest_f("gt-stress-%s", s->name)
> +			gt_reset(fd, 0, 8, 2, 0);
> +	}
>  
>  	igt_subtest("gt-mocs-reset")
>  		xe_for_each_gt(fd, gt)
> -- 
> 2.43.0
> 

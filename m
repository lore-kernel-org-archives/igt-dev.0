Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76B606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYjUfx47
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82AC890B6;
	Thu, 22 Oct 2026 13:02:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA261125EC
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792674125; x=1824210125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=usmk9kkWLvh/WBNtSF1UhdoVS7z5U6o36PI5JgB2Pc4=;
 b=PYjUfx47RGGh2zdTjUDKubHRHcy0u7kteDhrkLNjPPoJZst1QYp+4ZVe
 bHq2AUVY7y6XkoATaeDk2QDy6znQiy98CE9SN4FPsnIY+/edMuwNf8PCC
 gat/vvwWuJ9KEka46MJviE3XJTuFFgQoONgIQfhdneP+1aPrzXvql5TUl
 oVOHoimZeK5alFo5nJtvyHzsaLcDErkfjlNi5RNVH6vEKZT+fjiZVYW8A
 3KJcAYDR61J+IwnTVEbQTsLcftsc8l4nWzIH5jw31VCpNcyMDD4GPXCWa
 eyd8B4x7UcjCLo/MNM639viAl9l3Cyv0n21IobK2B59BC+49pyssdEqPt w==;
X-CSE-ConnectionGUID: lhMIhj2JR6GsbnsCDlq1mw==
X-CSE-MsgGUID: nqXP5tqjTemlm67vn0jXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1321205"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1321205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:02:04 -0700
X-CSE-ConnectionGUID: nr6VrNVRRk6cTo9phq4PDw==
X-CSE-MsgGUID: QXYcE7LVSUuEM8fMkjQz1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3695953"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:02:03 -0700
Date: Thu, 22 Oct 2026 15:02:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe: fix missing thread cleanups in
 several tests
Message-ID: <20261022130200.t7bkghtaaudfyffi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
 <20261021050307.3268228-5-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021050307.3268228-5-priyanka.dandamudi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Priyanka,
On 2026-10-21 at 10:33:09 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Several Xe test functions created pthread mutexes/conds/barriers, a thread array,
> and a buf_ops context without releasing them.
> 
> Add the missing pthread_mutex_destroy()/pthread_cond_destroy(), free(), and
> buf_ops_destroy() calls:

Please move a fix for buf ops into separate patch.
Rest looks ok.

> 
> xe_prime_self_import.c: threads() leaked the calloc'd thread array.
> xe_exec_threads.c, xe_exec_reset.c, xe_evict.c, xe_compute.c,
> xe_exec_system_allocator.c : mutex/cond (and barrier, where
> applicable) initialized but never destroyed.
> xe_render_copy.c: per-thread mutex never destroyed; buf_ops_create()
> never matched with buf_ops_destroy().

Please remove above paragraph, it is already in patch itself.

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_compute.c               | 2 ++
>  tests/intel/xe_evict.c                 | 5 +++++
>  tests/intel/xe_exec_reset.c            | 4 ++++
>  tests/intel/xe_exec_system_allocator.c | 6 ++++++
>  tests/intel/xe_exec_threads.c          | 2 ++
>  tests/intel/xe_prime_self_import.c     | 1 +
>  tests/intel/xe_render_copy.c           | 6 +++++-
>  7 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 2f70f22910..e738c9dabd 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -489,6 +489,8 @@ test_eu_busy(uint64_t duration_sec)
>  		pthread_join(threads_data[n].thread, NULL);
>  
>  	free(threads_data);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  
>  	drm_close_driver(fd);
>  }
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 5a7298db04..961e94e88b 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -494,6 +494,11 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	for (i = 0; i < n_threads; ++i)
>  		pthread_join(threads_data[i].thread, NULL);
> +
> +	free(threads_data);
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  }
>  
>  static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 50771af535..e9579b169f 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -1040,6 +1040,8 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
>  	igt_assert_neq(num_reset, 0);
>  	igt_assert_neq(num_submit, 0);
>  	free(threads);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  }
>  
>  /**
> @@ -1192,6 +1194,8 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>  		pthread_join(threads_data[i].thread, NULL);
>  
>  	free(threads_data);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  }
>  
>  int igt_main()
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 305512dfd9..8c998b4ea1 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -312,6 +312,9 @@ check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
>  	for (i = 0; i < n_threads; ++i)
>  		pthread_join(threads_check_data[i].thread, NULL);
>  	free(threads_check_data);
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  }
>  
>  static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
> @@ -2187,6 +2190,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  			free(alloc);
>  	}
>  	free(threads_data);
> +	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  
>  	if (is_hugepg_enable)
>  		reset_nr_hugepages();
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 2974fc312d..7c6d145891 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1466,6 +1466,8 @@ static void threads(int fd, int flags)
>  		xe_vm_destroy(fd, vm_compute_mode);
>  	free(threads_data);
>  	pthread_barrier_destroy(&barrier);
> +	pthread_mutex_destroy(&mutex);
> +	pthread_cond_destroy(&cond);
>  }
>  
>  /*
> diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
> index b43269d4f1..5649304867 100644
> --- a/tests/intel/xe_prime_self_import.c
> +++ b/tests/intel/xe_prime_self_import.c
> @@ -339,6 +339,7 @@ static void *thread_fn_reimport_vs_close(void *p)
>  	}
>  
>  	pthread_barrier_destroy(&g_barrier);
> +	free(threads);
>  	drm_close_driver(fds[0]);
>  	close(fds[1]);
>  
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index e2e752e28b..a2a0f652d4 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -634,11 +634,15 @@ static void render_stress_copy(int fd, struct igt_collection *set,
>  		 render_duration_total / render_count,
>  		 render_duration_min, render_duration_max);
>  
> +	buf_ops_destroy(bops);
> +

Can this missing destroy affect testing? Or will it only
cause memory leaks? Just curious, also adding to +Cc
Francois Dugast <francois.dugast@intel.com>
Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>



Regards,
Kamil

>  	/* End all mem copy threads */
>  	for (int i = 0; i < thread_copy_count; i++)
>  		xe_spin_end(data_mem_copy[i].spin);
> -	for (int i = 0; i < thread_copy_count; i++)
> +	for (int i = 0; i < thread_copy_count; i++) {
>  		pthread_join(thread_mem_copy[i], NULL);
> +		pthread_mutex_destroy(&data_mem_copy[i].lock_init_spin);
> +	}
>  
>  	put_ahnd(ahnd);
>  	xe_vm_destroy(fd, vm);
> -- 
> 2.43.0
> 

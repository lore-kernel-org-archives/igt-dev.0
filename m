Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F5606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hThuUsyu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B727210F77B;
	Tue,  3 Nov 2026 18:53:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CA810F77B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793731959; x=1825267959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0YLlyTCUvwZMcu+OmipTSU84bnxoTUPmtnUxhZtIlxY=;
 b=hThuUsyu0ipl6R9/c+rNC8G1Cz2rrA9uUndcb1DkE6UqRpt6K/RWeMFV
 9YagFy8klSrgVDmQkrS9HwHBUuKAcWi5ah4LFEr71p+A4U1jmJsdKmFPb
 5mRrv1eS+fbcyCKgL28aJBe3iF4tmVNQr59PhrvzeM60LRBDzImEOXmp4
 uywVBBa0aavkz05gHDyRUGoVmWvN0zkuyPfMcp2oUHe2Mnk7e3ySh6C45
 QgCeeAdMyjdZzu7dHGcLKnMchEblnKMJor91B/+JTloyUsd/TpJFuMhor
 97f2Xr6AOf9vI0jZ0MbbJ6rOZX8AKa88mmMi+H2nG7S5X3KvqBEQqWT0z Q==;
X-CSE-ConnectionGUID: I5k5ZYqGTtuKnM+cWY2fTQ==
X-CSE-MsgGUID: RFz6GwguRjyIUB4hASAm3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2499714"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2499714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 10:52:38 -0800
X-CSE-ConnectionGUID: GZoIohylSxiybikS20/Erw==
X-CSE-MsgGUID: jB73gORrRCW9VfXr0v5dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6625805"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 10:52:37 -0800
Date: Tue, 3 Nov 2026 19:52:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe: fix missing thread cleanups in
 several tests
Message-ID: <pljoh4ikrx3psgiogfcckvzwjbtssrvlhtv4sswbx4u4lpcgsl@zikns2vmbsu2>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
 <20261103045241.3367590-6-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103045241.3367590-6-priyanka.dandamudi@intel.com>
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

Hi,
On 2026-11-03 at 10:22:43 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Several Xe test functions created pthread mutexes/conds/barriers, a thread array,
> without releasing them.
> Add the missing pthread_mutex_destroy()/pthread_cond_destroy(), free()
> calls.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_compute.c               | 2 ++
>  tests/intel/xe_evict.c                 | 5 +++++
>  tests/intel/xe_exec_reset.c            | 4 ++++
>  tests/intel/xe_exec_system_allocator.c | 6 ++++++
>  tests/intel/xe_exec_threads.c          | 2 ++
>  tests/intel/xe_prime_self_import.c     | 1 +
>  tests/intel/xe_render_copy.c           | 4 +++-
>  7 files changed, 23 insertions(+), 1 deletion(-)
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
> index 2303574190..1553ebfe30 100644
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
> index 3e8ca794b1..2dda4a9071 100644
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
> index 45ec628135..0d3767c14e 100644
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
> @@ -2215,6 +2218,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
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
> index e2e752e28b..c26c365c36 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -637,8 +637,10 @@ static void render_stress_copy(int fd, struct igt_collection *set,
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

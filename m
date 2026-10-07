Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20050CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 13:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114E10E5A7;
	Wed,  7 Oct 2026 13:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWuMV+6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4233910E5A7
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791380870; x=1822916870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QVu9Nikh36jrwNnxOlFrhf50iG/dEhAhvmCaBg4Mc5s=;
 b=bWuMV+6T0Dird1SlSBZ9HlTjw/X9FEKAXSr1sIPagzwrU+l2JelzMyTR
 lsKwW42KBAqQHsbRKArtjV9cq3y4ZZRaKUYYTKuND6cG2I+ga+zuL1MhM
 1F7HwozyxTTc4p4qn2qrPUkO80ZBktydFkqk8bIa3gkct1sbrGlezS0Ip
 5MDaTsD7MGa0XQ0n3TyunHT2Bt66d1qK7qAbttVnwKT7z4bgzm5AyIh6m
 LTnX9+GJKsCbk0CJs3t3RYuZ3na/CW5oS7XTJwgc200dEqwQeaqgNHgoE
 wOdCLeF6A/Aww4L9q2GPE84zl2ux6Fip8Fxb6qTVSMOTbtZ+FFbxqT/xo A==;
X-CSE-ConnectionGUID: MlXqqlLoT6KUJQ9I+y9E+Q==
X-CSE-MsgGUID: cg5n0q69SKC09lUQ2mqeTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="25279"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="25279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:47:49 -0700
X-CSE-ConnectionGUID: EVeSVALsRCukAPWAw316NA==
X-CSE-MsgGUID: 1BubdDGTSEm8d9cLtNM2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="168082"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:47:49 -0700
Date: Wed, 7 Oct 2026 15:47:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe: fix missing resource cleanup in
 several tests
Message-ID: <20261007134724.wezxubejgvyqbfb6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261005085943.3176069-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005085943.3176069-2-priyanka.dandamudi@intel.com>
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

Hi Priyanka,
On 2026-10-05 at 14:29:44 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Several Xe test functions created VMs, BOs, exec_queues, pthread
> mutexes/conds/barriers, a thread array, and a buf_ops context without
> releasing them.
> 
> Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy(),
> pthread_mutex_destroy()/pthread_cond_destroy(), free(), and
> buf_ops_destroy() calls:
> 
> xe_waitfence.c: waitfence(), invalid_flag(), invalid_ops() leaked
> vm/bo(s)/exec_queue entirely; exec_queue_reset_wait() leaked vm.
> xe_prime_self_import.c: threads() leaked the calloc'd thread array.
> xe_exec_threads.c, xe_exec_reset.c, xe_evict.c, xe_compute.c,
> xe_exec_system_allocator.c : mutex/cond (and barrier, where
> applicable) initialized but never destroyed.
> xe_render_copy.c: per-thread mutex never destroyed; buf_ops_create()
> never matched with buf_ops_destroy().
> xe_dma_buf_sync.c: test_export_dma_buf() never destroyed its two
> vm/exec_queue pairs.

Can you split this into more patches? I suggest first with all
pthread or memory leaks fixes, then vm fixes. See also below.

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_compute.c               |  2 ++
>  tests/intel/xe_dma_buf_sync.c          |  6 +++++-
>  tests/intel/xe_evict.c                 |  5 +++++
>  tests/intel/xe_exec_reset.c            |  4 ++++
>  tests/intel/xe_exec_system_allocator.c |  6 ++++++
>  tests/intel/xe_exec_threads.c          |  2 ++
>  tests/intel/xe_prime_self_import.c     |  1 +
>  tests/intel/xe_render_copy.c           |  6 +++++-
>  tests/intel/xe_waitfence.c             | 20 ++++++++++++++++++++
>  9 files changed, 50 insertions(+), 2 deletions(-)
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
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index f214866a17..7291f17674 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -219,11 +219,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  	for (i = 0; i < n_bo; ++i) {
>  		munmap(data[i], bo_size);
>  		gem_close(fd[0], bo[i]);
> +		gem_close(fd[1], import_bo[i]);
>  		close(dma_buf_fd[i]);
>  	}
>  
> -	for (i = 0; i < N_FD; ++i)
> +	for (i = 0; i < N_FD; ++i) {
> +		xe_exec_queue_destroy(fd[i], exec_queue[i]);
> +		xe_vm_destroy(fd[i], vm[i]);
>  		drm_close_driver(fd[i]);
> +	}
>  }
>  
>  int igt_main()
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

This fix imho should be in separate patch, can be
combined with below pthread fix.

> +
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
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index ecdce9f93b..91172eea7c 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -136,6 +136,18 @@ waitfence(int fd, enum waittype wt)
>  			  ", elapsed: %" PRId64 "\n",
>  			  timeout, signalled, signalled - current);
>  	}
> +
> +	if (wt == ENGINE)
> +		xe_exec_queue_destroy(fd, exec_queue);

This also should be in separate patch.



Regards,
Kamil

> +
> +	gem_close(fd, bo_1);
> +	gem_close(fd, bo_2);
> +	gem_close(fd, bo_3);
> +	gem_close(fd, bo_4);
> +	gem_close(fd, bo_5);
> +	gem_close(fd, bo_6);
> +	gem_close(fd, bo_7);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  /**
> @@ -208,6 +220,9 @@ invalid_flag(int fd)
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  static void
> @@ -232,6 +247,9 @@ invalid_ops(int fd)
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  static void
> @@ -304,6 +322,8 @@ exec_queue_reset_wait(int fd)
>  		munmap(data, bb_size);
>  		gem_close(fd, bo);
>  	}
> +
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  int igt_main()
> -- 
> 2.43.0
> 

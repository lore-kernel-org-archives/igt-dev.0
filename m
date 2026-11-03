Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE24606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 04:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jhJhVTFo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2826710E74E;
	Tue,  3 Nov 2026 04:55:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF72210E74E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 04:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793681566; x=1825217566;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZMZHjYlQoneR52VcuKd966owyTxwYe1sWuUGYiARKG4=;
 b=jhJhVTFobGauueLIxrCTBkDpLhCXHuq4T1ubzjF1Ym1qTHIpRpEB5Of6
 Z4M87KIMAcqBqlrLhgKVCROn6YTidThewt0wM9ioPhi/zEJJ9n6wGPhlx
 9RWd5Mo1/7hxYgGNIB6J2kvltZ5U0Sa3K1kXcsYcmjSh8UBoCdPegHcxC
 tsdm5QNrjbP4e9AUWeACPu8Fp2vu8OlcYkQvETFFZ+guH1R1uYsW8FG/I
 PXyho5ShRlH7wgMCO46GK8vmJVeQdIvx0aXaX3DU8JUccheOVoIoQ6KCq
 RL5DYBmK+vMw+5HQ50Wv6oiguKyG+oF4qkpXtnt8SlKvq9ghFOS16bYD+ A==;
X-CSE-ConnectionGUID: iPm+8g2HQdShaAuBFXNcPA==
X-CSE-MsgGUID: 7QvLSZvnQ8Gsgl08WfG9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2291378"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2291378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:52:46 -0800
X-CSE-ConnectionGUID: iQSIyNvXQWGmtMdX5/v1tQ==
X-CSE-MsgGUID: M1HGSwJFSxi2VqHlbJ3HLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6222843"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa004.jf.intel.com with ESMTP; 02 Nov 2026 20:52:44 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe: fix missing thread cleanups in
 several tests
Date: Tue,  3 Nov 2026 10:22:43 +0530
Message-ID: <20261103045241.3367590-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Several Xe test functions created pthread mutexes/conds/barriers, a thread array,
without releasing them.
Add the missing pthread_mutex_destroy()/pthread_cond_destroy(), free()
calls.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute.c               | 2 ++
 tests/intel/xe_evict.c                 | 5 +++++
 tests/intel/xe_exec_reset.c            | 4 ++++
 tests/intel/xe_exec_system_allocator.c | 6 ++++++
 tests/intel/xe_exec_threads.c          | 2 ++
 tests/intel/xe_prime_self_import.c     | 1 +
 tests/intel/xe_render_copy.c           | 4 +++-
 7 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 2f70f22910..e738c9dabd 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -489,6 +489,8 @@ test_eu_busy(uint64_t duration_sec)
 		pthread_join(threads_data[n].thread, NULL);
 
 	free(threads_data);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 
 	drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2303574190..1553ebfe30 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -494,6 +494,11 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < n_threads; ++i)
 		pthread_join(threads_data[i].thread, NULL);
+
+	free(threads_data);
+	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 }
 
 static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 3e8ca794b1..2dda4a9071 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -1040,6 +1040,8 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	igt_assert_neq(num_reset, 0);
 	igt_assert_neq(num_submit, 0);
 	free(threads);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 }
 
 /**
@@ -1192,6 +1194,8 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 		pthread_join(threads_data[i].thread, NULL);
 
 	free(threads_data);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 }
 
 int igt_main()
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 45ec628135..0d3767c14e 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -312,6 +312,9 @@ check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
 	for (i = 0; i < n_threads; ++i)
 		pthread_join(threads_check_data[i].thread, NULL);
 	free(threads_check_data);
+	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 }
 
 static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
@@ -2215,6 +2218,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 			free(alloc);
 	}
 	free(threads_data);
+	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 
 	if (is_hugepg_enable)
 		reset_nr_hugepages();
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2974fc312d..7c6d145891 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1466,6 +1466,8 @@ static void threads(int fd, int flags)
 		xe_vm_destroy(fd, vm_compute_mode);
 	free(threads_data);
 	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&mutex);
+	pthread_cond_destroy(&cond);
 }
 
 /*
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index b43269d4f1..5649304867 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -339,6 +339,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 	}
 
 	pthread_barrier_destroy(&g_barrier);
+	free(threads);
 	drm_close_driver(fds[0]);
 	close(fds[1]);
 
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index e2e752e28b..c26c365c36 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -637,8 +637,10 @@ static void render_stress_copy(int fd, struct igt_collection *set,
 	/* End all mem copy threads */
 	for (int i = 0; i < thread_copy_count; i++)
 		xe_spin_end(data_mem_copy[i].spin);
-	for (int i = 0; i < thread_copy_count; i++)
+	for (int i = 0; i < thread_copy_count; i++) {
 		pthread_join(thread_mem_copy[i], NULL);
+		pthread_mutex_destroy(&data_mem_copy[i].lock_init_spin);
+	}
 
 	put_ahnd(ahnd);
 	xe_vm_destroy(fd, vm);
-- 
2.43.0


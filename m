Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB6C30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 12:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E649810E894;
	Wed, 26 Jun 2024 12:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kolI0uJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3601910E894
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 12:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719405547; x=1750941547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drxWa5E9oacTejoNixAr097yXXtfJJO21375rD6Bo94=;
 b=kolI0uJ0rrxOoCu6DZ+rydhFTNrwLgBUOrd5SZ1pxRlGTP6X5LW6Xemz
 jJIJ0bPAR5JQ3BPcNYuVUx62/t4/P7Eq2eralvc3sDj0fMd+ahnZf73ps
 1mwT6SeNcyeqvhBxEWQs/dDIY7fNGQmWcM2KuqNqbDj8XpLJkmtRmnI/5
 W8oPpkCRyN3oLpq0v78PIF9/TGJLtyXX+D9qPFYsh2lLgNKeOPvv6qFiN
 uD2K9Krr8pt9b6NpaGbL9NZ8qSgvPWYtINB/4ThQKmvBcbFDQRQdxAZFc
 ZcTbBxY5TfYQ4CdfhiKd/eyjjQuvEllyna2EznPJvtcZA8LolAVl5YtMC A==;
X-CSE-ConnectionGUID: QLh1OLF9T1KbcNfS5o529w==
X-CSE-MsgGUID: 6sLdV0pMRYqkylWkQFpG3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="19363333"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="19363333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:39:07 -0700
X-CSE-ConnectionGUID: p4tkldyQStCTKL9ohSNiyQ==
X-CSE-MsgGUID: v/0mT7jnT56BwjkHQmW9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="75189753"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:39:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_evict: Reduce the "large" bo size
 for threaded eviction
Date: Wed, 26 Jun 2024 14:38:33 +0200
Message-ID: <20240626123833.3164-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

When calculating the number of bos that simultaneously fits in
VRAM + system memory, account for eviction pipelining by subtracting
one bo for ongoing pipelined evictions per thread.

With large bos this may lead to us not being able to use a working
set of 2 bos, which is the minimum, so reduce the large bo size for
threaded evictions, and instead increase the default number of bos.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_evict.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5691ad021..13e90d317 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -484,10 +484,16 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 	if (flags & MULTI_VM)
 		set_size *= 2;
 
-	/* All bos must fit in memory, assuming no swapping */
-	total_size = ((vram_size - 1) / bo_size + system_size / bo_size) /
+	/*
+	 * All bos must fit in memory, assuming no swapping. Subtract one bo per
+	 * thread for an active eviction.
+	 */
+	total_size = ((vram_size - 1) / bo_size + (system_size - 1) / bo_size - 1) /
 		num_threads;
 
+	igt_debug("num_threads: %d bo_size : %lu total_size : %lu \n", num_threads,
+		  bo_size, total_size);
+
 	if (set_size > total_size)
 		set_size = total_size;
 
@@ -741,13 +747,13 @@ igt_main
 			MIXED_THREADS | THREADED },
 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
 			THREADED },
-		{ "threads-large", 2, 2, 4, 3, 8,
+		{ "threads-large", 2, 2, 16, 3, 32,
 			THREADED },
-		{ "cm-threads-large", 2, 2, 4, 3, 8,
+		{ "cm-threads-large", 2, 2, 16, 3, 32,
 			COMPUTE_THREAD | THREADED },
-		{ "mixed-threads-large", 2, 2, 4, 3, 8,
+		{ "mixed-threads-large", 2, 2, 16, 3, 32,
 			MIXED_THREADS | THREADED },
-		{ "mixed-many-threads-large", 3, 2, 4, 3, 8,
+		{ "mixed-many-threads-large", 3, 2, 16, 3, 32,
 			THREADED },
 		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MULTI_VM | THREADED },
@@ -755,11 +761,11 @@ igt_main
 			COMPUTE_THREAD | MULTI_VM | THREADED },
 		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MIXED_THREADS | MULTI_VM | THREADED },
-		{ "threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "threads-large-multi-vm", 2, 2, 16, 3, 32,
 			MULTI_VM | THREADED },
-		{ "cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
 			COMPUTE_THREAD | MULTI_VM | THREADED },
-		{ "mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
 			MIXED_THREADS | MULTI_VM | THREADED },
 		{ "beng-threads-small", 2, 16, 128, 1, 128,
 			THREADED | BIND_EXEC_QUEUE },
@@ -769,13 +775,13 @@ igt_main
 			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
 		{ "beng-mixed-many-threads-small", 3, 16, 128, 1, 128,
 			THREADED | BIND_EXEC_QUEUE },
-		{ "beng-threads-large", 2, 2, 4, 3, 8,
+		{ "beng-threads-large", 2, 2, 16, 3, 32,
 			THREADED | BIND_EXEC_QUEUE },
-		{ "beng-cm-threads-large", 2, 2, 4, 3, 8,
+		{ "beng-cm-threads-large", 2, 2, 16, 3, 32,
 			COMPUTE_THREAD | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-threads-large", 2, 2, 4, 3, 8,
+		{ "beng-mixed-threads-large", 2, 2, 16, 3, 32,
 			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-many-threads-large", 3, 2, 4, 3, 8,
+		{ "beng-mixed-many-threads-large", 3, 2, 16, 3, 32,
 			THREADED | BIND_EXEC_QUEUE },
 		{ "beng-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
@@ -783,11 +789,11 @@ igt_main
 			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
 		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "beng-threads-large-multi-vm", 2, 2, 16, 3, 32,
 			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "beng-cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
 			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
-		{ "beng-mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
+		{ "beng-mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
 			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
 		{ NULL },
 	};
@@ -823,6 +829,7 @@ igt_main
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			test_evict(fd, hwe, s->n_exec_queues,
 				   min(ws, s->n_execs), bo_size,
 				   s->flags, NULL);
@@ -836,6 +843,7 @@ igt_main
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			test_evict_cm(fd, hwe, s->n_exec_queues,
 				      min(ws, s->n_execs), bo_size,
 				      s->flags, NULL);
@@ -849,6 +857,7 @@ igt_main
 					     s->n_threads, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			threads(fd, hwe, s->n_threads, s->n_exec_queues,
 				min(ws, s->n_execs), bo_size, s->flags);
 		}
-- 
2.44.0


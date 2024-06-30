Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D29C3064D
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 18:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE62D10E2AE;
	Sun, 30 Jun 2024 18:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QesrPl76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040A810E2AE
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719770745; x=1751306745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udMNmUpyylBwZJnr3Fketi+37ndzpAWXgFBXVbIV7pA=;
 b=QesrPl76/7G5+rVoo24GTdzpRHoQYjX1EMhAQe6/Q8fFGP2T882KmdGf
 bwnATaI8hJXivVNIUinyLu0d19RjTKeqYzPMQSrRLdLV2Jug0NbbjnWzc
 VAr8VZ1cHOlBUqwOiNMFOljIT3vhPh8D+maiJ2nDX27INQ4EE9FhysW6q
 Q03i9rhneoxaVoMLXINplhxAAF9pMfoAyezfDj9SAEbPAoW5MijJeHbTl
 iK/3yVFq9wuCRppSGd/5msu5RnA8YSZ5G8W+blHXDOs9sKjeUUnRjeSyA
 sVPrHJRkXl+mvyUtes8RYRx2zVUf49OWr6grRQvdHEhbuSrUAQJXe+vA7 Q==;
X-CSE-ConnectionGUID: d/XIz4e3RmeGCEcaIEx1FQ==
X-CSE-MsgGUID: URfdxt1gRvGESj6hdkGXXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20756550"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="20756550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 11:05:45 -0700
X-CSE-ConnectionGUID: XKkBm+/eS3WESNT6gIBnlg==
X-CSE-MsgGUID: v9dy1KSTSxmh185A3nKmQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="50170191"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 11:05:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_evict: Reduce the "large" bo size
 for threaded eviction
Date: Sun, 30 Jun 2024 20:05:02 +0200
Message-ID: <20240630180502.81556-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240630180502.81556-1-thomas.hellstrom@linux.intel.com>
References: <20240630180502.81556-1-thomas.hellstrom@linux.intel.com>
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

v3:
- Fix up number of bo calculation to *really* subtract one bo per
  thread. (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_evict.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 601c02ff7..9b71b6b74 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -486,10 +486,14 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 
 	/*
 	 * All bos must fit in, say 4 / 5 of memory to be sure.
-	 * Assume no swap-space available.
+	 * Assume no swap-space available. Subtract one bo per thread
+	 * for an active eviction.
 	 */
 	total_size = ((vram_size - 1) / bo_size + system_size * 4 / 5 / bo_size) /
-		num_threads;
+		num_threads - 1;
+
+	igt_debug("num_threads: %d bo_size : %lu total_size : %lu\n", num_threads,
+		  bo_size, total_size);
 
 	if (set_size > total_size)
 		set_size = total_size;
@@ -744,13 +748,13 @@ igt_main
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
@@ -758,11 +762,11 @@ igt_main
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
@@ -772,13 +776,13 @@ igt_main
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
@@ -786,11 +790,11 @@ igt_main
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
@@ -826,6 +830,7 @@ igt_main
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			test_evict(fd, hwe, s->n_exec_queues,
 				   min(ws, s->n_execs), bo_size,
 				   s->flags, NULL);
@@ -839,6 +844,7 @@ igt_main
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			test_evict_cm(fd, hwe, s->n_exec_queues,
 				      min(ws, s->n_execs), bo_size,
 				      s->flags, NULL);
@@ -852,6 +858,7 @@ igt_main
 					     s->n_threads, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			igt_skip_on_f(!ws, "System memory size is too small.\n");
 			threads(fd, hwe, s->n_threads, s->n_exec_queues,
 				min(ws, s->n_execs), bo_size, s->flags);
 		}
-- 
2.44.0


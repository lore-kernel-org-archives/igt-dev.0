Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD30FFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 23:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7459D10E8BE;
	Mon,  4 May 2026 23:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgvS7WKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631310E8C2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 23:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777937370; x=1809473370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9bMnjBVVQAtZnRFgPa9R1Y4ak5v9WEKfXDDgclB2Tv4=;
 b=DgvS7WKJFuGbMRuFjzuUbLI9xb/pmw1p4hbQO5Msn3lKHINkY0l3j/w4
 tPs8jLfAmge5bJjTd96WbA1lsP0kW2GAZh8WS3Q6h6MBN8a6kEXcBR7JH
 F5v6sQlmUdD6hozOq9IfS72eM6A+a9l0NehzxJcWdh68EI0dpL5TFlzUY
 nJQjsWres+eS2j6aljghhYTLnqoWdBZbxfVlg3XSiJmaqD/c9EWfgWsNh
 N5aaQSBysMsRBM8ZuAjHrduabgNn2RSZy/0l5Ayua4VSyGmM0Nt38a+cy
 q/pE8q3jN2w8peuzYF3H6IFHTZKzJw57+GEoSaZ39seKYR+3San9sGKXt A==;
X-CSE-ConnectionGUID: RHF1sbDqRJKdE50YtB7OFA==
X-CSE-MsgGUID: rCx+T+i0T52uomIM2eBLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78993543"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="78993543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:29:30 -0700
X-CSE-ConnectionGUID: jHGUfnidSge8nrV/bfQLIw==
X-CSE-MsgGUID: livjrWR8S3S4Fh5VcsvLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="232509844"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:29:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	x.wang@intel.com
Subject: [PATCH v3 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Date: Mon,  4 May 2026 16:29:20 -0700
Message-ID: <20260504232921.16367-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504232921.16367-4-niranjana.vishwanathapura@intel.com>
References: <20260504232921.16367-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
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

In __test_priority(), enable write_timestamp in xe_spin_init_opts()
and use timestamp value to determine the queue switch order. This
replaces the indeterminate sleep() with a more deterministic wait
based on the GPU timestamp.

Pre-set all spinners to preempt-wait before submission so each
queue, once scheduled by HW, blocks at the semaphore. This ensures
all queues are running on HW before testing priority-based scheduling.

v2: Read timestamp to check if queue is started
    Use usleep to ensure all semaphore updates are visible to GPU

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 57 +++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index ca96099d36..0b31dd7a3f 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -454,25 +454,24 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < num_queues; i++) {
 		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
 
-		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true);
+		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true,
+				  .write_timestamp = true);
+		/*
+		 * Pre-set all spinners to preempt-wait so each queue, once
+		 * scheduled, immediately blocks at the QUEUE_SWITCH_MODE semaphore
+		 * after writing its timestamp. The HW switches between queues at
+		 * this point, allowing all of them to schedule deterministically.
+		 */
+		xe_spin_preempt_wait(spin[i]);
 		sync.addr = spin_addr + (char *)&spin[i]->exec_sync - (char *)spin[i];
 		exec.exec_queue_id = exec_queues[i];
 		exec.address = spin_addr;
 		xe_exec(fd, &exec);
-
-		/* Wait for job on Q0 to start, other queues block behind Q0 */
-		if (!i)
-			xe_spin_wait_started(spin[i]);
 	}
 
-	sleep(sleep_duration);
-
-	/*
-	 * Expect the job on other queue to not get scheduled while the spinner
-	 * on q0 is not waiting on preempt condition.
-	 */
-	for (i = 1; i < num_queues; i++)
-		igt_assert(!xe_spin_started(spin[i]));
+	/* Wait for all queues to start and write timestamp */
+	for (i = 0; i < num_queues; i++)
+		while (!READ_ONCE(spin[i]->timestamp));
 
 	if (flags & DYN_PRIORITY) {
 		/* Assign increasing order of priority for secondary queues */
@@ -485,6 +484,36 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		sleep(sleep_duration);
 	}
 
+	/*
+	 * Clear timestamps and release all queues from the semaphore wait.
+	 * The order in which they next write a timestamp reveals the
+	 * priority-based scheduling order.
+	 */
+	for (i = 0; i < num_queues; i++) {
+		WRITE_ONCE(spin[i]->timestamp, 0);
+		xe_spin_preempt_nowait(spin[i]);
+
+		/*
+		 * For Q0, wait until it is running again to ensure it holds the engine
+		 * when priority arbitration is triggered.
+		 */
+		if (!i)
+			while (!READ_ONCE(spin[i]->timestamp));
+	}
+
+	/*
+	 * Sleep to allow xe_spin_preempt_nowait() to become visible to the GPU
+	 * for other queues before checking if they have been scheduled.
+	 */
+	usleep(10);
+
+	/*
+	 * Verify that secondary queues have not been scheduled while Q0
+	 * holds the engine.
+	 */
+	for (i = 1; i < num_queues; i++)
+		igt_assert(!READ_ONCE(spin[i]->timestamp));
+
 	/*
 	 * Trigger a queue switch by making the spinner on q0 to wait on preempt
 	 * condition, allowing job on q1 to get scheduled and finish. When we end
@@ -501,7 +530,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 	i = 1;
 	while (i < num_queues) {
 		for (j = 1; j < num_queues; j++) {
-			if (xe_spin_started(spin[j]) && ((already_in_order & (1 << j)) == 0)) {
+			if (READ_ONCE(spin[j]->timestamp) && ((already_in_order & (1 << j)) == 0)) {
 				start_order[i] = j;
 				xe_spin_end(spin[j]);
 				xe_wait_ufence(fd, &spin[j]->exec_sync, USER_FENCE_VALUE,
-- 
2.43.0


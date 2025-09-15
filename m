Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B703CAC59A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 15:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2536E10E4F9;
	Mon, 15 Sep 2025 15:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yint/pqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65E10E4FA
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757951678; x=1789487678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hl/CKxq05Z7VQceTKoTVx94wH1LMlIMxFxqeoZDvnQI=;
 b=Yint/pqeHzNdQE7p+MdpLEYOgTDvJgwBucfLzf5HGH60NrHduYrvMuZ0
 mI7//fjvntwYdkZi22yv5XTLeUS4XJV5A7qalvMlKdqir6rzZCeTtLUV8
 AZ7r+qXdmsxVs6VsG8QDRDDLXIcPTTDvLWNCTIFjY1CusgtdDZT39TNwh
 TlHdP3FmMXghQHdVWuiRGd3wkJpknNMvk+9bMMQNSrMp0Itbi1BurMMC5
 yD86xewlUwQF3I81F32lyBqRqNDOwb2xFnR6S9ps0IpplNlTT+0rrOi0w
 k429p89rxbMBeYyDMuUS2kfIKkQzrnlndl5X1N7LeH6NKFQWKj4DYchiM A==;
X-CSE-ConnectionGUID: 98Bzw7CMRM6VY74dlQKvbQ==
X-CSE-MsgGUID: H+W2A6ySSZSFZpVcUfmj7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62845903"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="62845903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:54:37 -0700
X-CSE-ConnectionGUID: /EqtNA6nQN+So1xwBpH6zA==
X-CSE-MsgGUID: Q7sQ15exRSCuu21f7aDG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175095604"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.107])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:54:35 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_exec_schedule: Improve synchronization
 in pi-ringfull
Date: Mon, 15 Sep 2025 17:54:28 +0200
Message-ID: <20250915155427.417074-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Move the interrupt timer from the parent thread to the child thread as
an explicit signal raise, and make sure the order of execution between
them is always the same. This reduces nondeterminism in the test, fixing
bugs like [1], where the child is starved out of CPU time up until the
parent gets signalled and monopolizes the CPU before the child could
submit its own execbuf, failing the test.

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_exec_schedule.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 84219b4cf..d387725d2 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -2446,6 +2446,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
 	unsigned int last, count;
 	struct itimerval itv;
 	IGT_CORK_HANDLE(c);
+	char volatile sync;
 	bool *result;
 
 	/*
@@ -2528,10 +2529,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
 
 	/* both parent + child on the same cpu, only parent is RT */
 	bind_to_cpu(0);
+	sync = 0;
 
 	igt_fork(child, 1) {
 		int err;
 
+		/* We want the parent to always go first */
+		if (!sync)
+			sched_yield();
+
 		/* Replace our batch to avoid conflicts over shared resources? */
 		if (!(flags & SHARED)) {
 			obj[1].handle = gem_create(fd, 4096);
@@ -2542,7 +2548,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
 
 		igt_debug("Waking parent\n");
 		kill(getppid(), SIGALRM);
-		sched_yield();
 		result[1] = true;
 
 		sigaction(SIGALRM, &sa, NULL);
@@ -2566,17 +2571,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
 
 		if (!(flags & SHARED))
 			gem_close(fd, obj[1].handle);
+
+		/* Interrupt parent's execbuf now that the child is done */
+		kill(getppid(), SIGALRM);
 	}
 
+	sync = 1;
+
 	/* Relinquish CPU just to allow child to create a context */
-	sleep(1);
+	pause();
 	igt_assert_f(result[0], "HP context (child) not created\n");
 	igt_assert_f(!result[1], "Child released too early!\n");
 
 	/* Parent sleeps waiting for ringspace, releasing child */
-	itv.it_value.tv_sec = 0;
-	itv.it_value.tv_usec = 50000;
-	setitimer(ITIMER_REAL, &itv, NULL);
 	igt_debug("LP parent executing\n");
 	igt_assert_eq(__execbuf(fd, &execbuf), -EINTR);
 	igt_assert_f(result[1], "Child was not released!\n");
-- 
2.45.2


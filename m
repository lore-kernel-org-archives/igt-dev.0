Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAB3EDF148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE0810E7D6;
	Fri, 13 Feb 2026 10:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyJVLieL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAD110E7D0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980355; x=1802516355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tF8ZD1UXTqptwfFpxb+swKoIVM8CKdZnb8PfCSheQtY=;
 b=XyJVLieLzaRU1E0LJIskBXOfCLhbugkdi9XfsKMQUrkG1Om9RQglyIru
 1ki7Ik00cmcypKqBWArxur4qkX+m5vh9Ds6knd9wTsMkbHvyeNr3yJ0oJ
 0mXDNMjdqeJP5YFtwmOFz+xboKc896/WlEhLON/mAVjriMWqiRkgWS8Mu
 FYAse62rvqiirzWsx0ffKdTD8rSY9cJFk4dM8R/xyM7dS+f5G6MtNhIyl
 oDjCMPRd7PQbLD7C64Yogn/W5bEqngivj4uzWJP36ZJZ3vDD4X64uDemH
 rdyF3W8RCGU5pWe7IgxtfyLgQEA0PV1WIOXhpkYu5Z2Bik6EINRfCW291 g==;
X-CSE-ConnectionGUID: ZfvhUp0WQvuCeWQtL1vdJg==
X-CSE-MsgGUID: 1yq4j1wpQ8WDAop2rzzdXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72258570"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72258570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:15 -0800
X-CSE-ConnectionGUID: jxIZZOVYSrmsYF3kOAR7WA==
X-CSE-MsgGUID: 5F8w6TI5Roq59y/If9RaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="243489847"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:13 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 1/5] tests/xe/xe_eudebug: Change pthread_join to
 pthread_timedjoin_np
Date: Fri, 13 Feb 2026 11:58:57 +0100
Message-ID: <20260213105855.3790052-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260213105855.3790052-7-christoph.manszewski@intel.com>
References: <20260213105855.3790052-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Change pthread_join to pthread_timedjoin_np in discovery-race* and
discovery-empty* tests to avoid hang before reaching cleanup in
igt_fixture.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 134f31766..6f5103a19 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1240,6 +1240,7 @@ static void test_race_discovery(int fd, unsigned int flags, int clients)
 	int count = clients * debuggers_per_client;
 	struct xe_eudebug_session *sessions, *s;
 	struct xe_eudebug_client *c;
+	struct timespec t = {};
 	pthread_t *threads;
 	int i, j;
 
@@ -1270,7 +1271,9 @@ static void test_race_discovery(int fd, unsigned int flags, int clients)
 	}
 
 	for (i = 0; i < count; i++) {
-		pthread_join(threads[i], NULL);
+		igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
+		t.tv_sec += XE_EUDEBUG_DEFAULT_TIMEOUT_SEC;
+		igt_assert_eq(pthread_timedjoin_np(threads[i], NULL, &t), 0);
 	}
 
 	for (i = count - 1; i > 0; i--) {
@@ -1322,6 +1325,7 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 	struct xe_eudebug_session **s;
 	pthread_t *threads;
 	int i, expected = flags & DISCOVERY_CLOSE_CLIENT ? 0 : RESOURCE_COUNT;
+	struct timespec t = {};
 
 	igt_assert(flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT));
 
@@ -1337,8 +1341,11 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 		pthread_create(&threads[i], NULL, attach_dettach_thread, s[i]);
 	}
 
-	for (i = 0; i < clients; i++)
-		pthread_join(threads[i], NULL);
+	for (i = 0; i < clients; i++) {
+		igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
+		t.tv_sec += XE_EUDEBUG_DEFAULT_TIMEOUT_SEC;
+		igt_assert_eq(pthread_timedjoin_np(threads[i], NULL, &t), 0);
+	}
 
 	for (i = 0; i < clients; i++) {
 		xe_eudebug_client_wait_done(s[i]->client);
-- 
2.47.1


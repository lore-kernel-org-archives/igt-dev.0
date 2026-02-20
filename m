Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A99C56208
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEC810E7F5;
	Fri, 20 Feb 2026 15:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkiu+Ads";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1986910E80E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771601898; x=1803137898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tF8ZD1UXTqptwfFpxb+swKoIVM8CKdZnb8PfCSheQtY=;
 b=fkiu+AdsGrtWaqeNsHZxhYawFxo8bQcJiM4ekjybrNiyx+o755FwBV7t
 RsvD3b0j670k+7V+EhL1VoTV16agvXKcrrg9ODsHlAdyiroimawg4hTt2
 iiXBlAqLUDbAFel5z2iNqg9o6ZZSaDw55xyeLAhu5FhVEPy1Ut+YV7Bys
 qbwqc41BJkJa715dpdnOC2NzD+T6t8gglgHbXN0oKcHDI/vxy6zOKZUNK
 SY+b3M0pyH3b0VZw+IUr8Uo5wQhqSnxVCPqpHPkKVe7htarq9Kvo0L9dq
 j5gFB46NIEZNC88/SVJ7i0i4Jxi0P8veDXViCLA0tghQ+9EG0FO7x2UXm g==;
X-CSE-ConnectionGUID: IWOdMdZLRlmvyltER2WfHw==
X-CSE-MsgGUID: dNR31HnMQ9e9j/zizmEljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90105377"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90105377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:18 -0800
X-CSE-ConnectionGUID: +jIfFHp0TWa0ProiFPf6KQ==
X-CSE-MsgGUID: EDvSL9I/RrqoTRZVAXUEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215007677"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:15 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 1/5] tests/xe/xe_eudebug: Change pthread_join to
 pthread_timedjoin_np
Date: Fri, 20 Feb 2026 16:37:50 +0100
Message-ID: <20260220153748.210381-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260220153748.210381-7-christoph.manszewski@intel.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
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


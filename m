Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E78C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBFD10E42C;
	Mon, 29 Jul 2024 16:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T143f9cf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6810510E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268988; x=1753804988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8BykPFfOXW1q9ub7yEN3r/tPu4ypaWYqtZYSS0DQKNo=;
 b=T143f9cfwyZ5kvsQv+oqykPWJm8bCs8S9l+PNIwgDDRd528TYOBQLjAk
 oTMdYPlbjTazP2r5enKEcBg3/Hy/0AdSrAxK0mKcpQm496S0TitxOiFJ7
 6dbDfrMYVMnZkGaEi3eXZvwWaAQZgbK6MDC4z8KKl1NL1rl8npQ6qywOk
 SAapaRHbGH0r4FTXxnhHZXk3HYeuwdjo0UeKyhergbbCIPoWLilVet34l
 vxFaODGuQwWBotUWhgA+0HeNNLmjrHLfkMJSZCH2ddM0sOz8aOJmS7bYQ
 bB2r0PsEA3hQhP8TTLD/IaGaQi+poajve67gy3QNpVa1JYdEE260KTr5u w==;
X-CSE-ConnectionGUID: //X21cWZSAyJKT3xx1GSvg==
X-CSE-MsgGUID: Ui9PIWsySVeh5HURTRSf2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426917"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:08 -0700
X-CSE-ConnectionGUID: ZOnX8hpqRaCtkRhod+efpQ==
X-CSE-MsgGUID: ssew+92pSnK2PpgHeDZFgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737562"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:03 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 14/66] tests/xe_eudebug: Race discovery against eudebug attach.
Date: Mon, 29 Jul 2024 18:01:07 +0200
Message-Id: <20240729160159.37036-15-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Validate eu debug resource discovery in a pretty cruel way.
Add subtests:

1) discovery-race - spawns N client proccesses, which create
   N+N*N resources each, then it creates M debugger
   threads competing for an access to the client proccess. After
   successful attach, with probability of 0.5 read and assert
   discovered resources, immediately detach otherwise.

2) discovery-empty[|-clients] - same as 1#, but destroy
   resources in flight (explicetly or by closing the client).
   Expect the last discovery not sending any events.

Currently N = 4, M = 3.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 244 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 5a11e7347..147836bd1 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -246,6 +246,241 @@ static void test_basic_sessions(int fd, unsigned int flags, int count)
 		xe_eudebug_session_destroy(s[i]);
 }
 
+#define RESOURCE_COUNT 16
+#define PRIMARY_THREAD			(1 << 0)
+#define DISCOVERY_CLOSE_CLIENT		(1 << 1)
+#define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
+static void run_discovery_client(struct xe_eudebug_client *c)
+{
+	int fd[RESOURCE_COUNT], i;
+	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
+
+	srand(getpid());
+
+	for (i = 0; i < RESOURCE_COUNT; i++) {
+		fd[i] = xe_eudebug_client_open_driver(c);
+
+		/*
+		 * Give the debugger a break in event stream after every
+		 * other client, that allows to read discovery and dettach in quiet.
+		 */
+		if (random() % 2 == 0 && !skip_sleep)
+			sleep(1);
+
+		for (int j = 0; j < RESOURCE_COUNT; j++) {
+			uint32_t vm = xe_eudebug_client_vm_create(c, fd[i], 0, 0);
+
+			if (c->flags & DISCOVERY_DESTROY_RESOURCES)
+				xe_eudebug_client_vm_destroy(c, fd[i], vm);
+		}
+
+		if (c->flags & DISCOVERY_CLOSE_CLIENT)
+			xe_eudebug_client_close_driver(c, fd[i]);
+	}
+}
+
+static void *discovery_race_thread(void *data)
+{
+	struct {
+		uint64_t client_handle;
+		int vm_count;
+	} clients[RESOURCE_COUNT];
+	struct xe_eudebug_session *s = data;
+	int expected = RESOURCE_COUNT * (1 + RESOURCE_COUNT);
+	const int tries = 100;
+	bool done = false;
+	int ret = 0;
+
+	for (int try = 0; try < tries && !done; try++) {
+
+		ret = xe_eudebug_debugger_attach(s->d, s->c);
+
+		if (ret == -EBUSY) {
+			usleep(100000);
+			continue;
+		}
+
+		igt_assert_eq(ret, 0);
+
+		if (random() % 2) {
+			struct drm_xe_eudebug_event *e = NULL;
+			int i = -1;
+
+			xe_eudebug_debugger_start_worker(s->d);
+			sleep(1);
+			xe_eudebug_debugger_stop_worker(s->d, 1);
+			igt_debug("Resources discovered: %lu\n", s->d->event_count);
+
+			xe_eudebug_for_each_event(e, s->d->log) {
+				if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
+					struct drm_xe_eudebug_event_client *eo = (void *)e;
+
+					if (i >= 0) {
+						igt_assert_eq(clients[i].vm_count,
+							      RESOURCE_COUNT);
+					}
+
+					igt_assert(++i < RESOURCE_COUNT);
+					clients[i].client_handle = eo->client_handle;
+					clients[i].vm_count = 0;
+				}
+
+				if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
+					clients[i].vm_count++;
+			};
+
+			igt_assert_lte(0, i);
+
+			for (int j = 0; j < i; j++)
+				for (int k = 0; k < i; k++) {
+					if (k == j)
+						continue;
+
+					igt_assert_neq(clients[j].client_handle,
+						       clients[k].client_handle);
+				}
+
+			if (s->d->event_count >= expected)
+				done = true;
+		}
+
+		xe_eudebug_debugger_dettach(s->d);
+		s->d->log->head = 0;
+		s->d->event_count = 0;
+	}
+
+	/* Primary thread must read everything */
+	if (s->flags & PRIMARY_THREAD) {
+		while ((ret = xe_eudebug_debugger_attach(s->d, s->c)) == -EBUSY)
+			usleep(100000);
+
+		igt_assert_eq(ret, 0);
+
+		xe_eudebug_debugger_start_worker(s->d);
+		xe_eudebug_client_wait_done(s->c);
+
+		if (READ_ONCE(s->d->event_count) != expected)
+			sleep(5);
+
+		xe_eudebug_debugger_stop_worker(s->d, 1);
+		xe_eudebug_debugger_dettach(s->d);
+	}
+
+	return NULL;
+}
+
+static void test_race_discovery(int fd, unsigned int flags, int clients)
+{
+	const int debuggers_per_client = 3;
+	int count = clients * debuggers_per_client;
+	struct xe_eudebug_session *sessions, *s;
+	struct xe_eudebug_client *c;
+	pthread_t *threads;
+	int i, j;
+
+	sessions = calloc(count, sizeof(*sessions));
+	threads = calloc(count, sizeof(*threads));
+
+	for (i = 0; i < clients; i++) {
+		c = xe_eudebug_client_create(fd, run_discovery_client, flags, NULL);
+		for (j = 0; j < debuggers_per_client; j++) {
+			s = &sessions[i * debuggers_per_client + j];
+			s->c = c;
+			s->d = xe_eudebug_debugger_create(fd, flags, NULL);
+			s->flags = flags | (!j ? PRIMARY_THREAD : 0);
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		if (sessions[i].flags & PRIMARY_THREAD)
+			xe_eudebug_client_start(sessions[i].c);
+
+		pthread_create(&threads[i], NULL, discovery_race_thread, &sessions[i]);
+	}
+
+	for (i = 0; i < count; i++)
+		pthread_join(threads[i], NULL);
+
+	for (i = count - 1; i > 0; i--) {
+		if (sessions[i].flags & PRIMARY_THREAD) {
+			igt_assert_eq(sessions[i].c->seqno-1, sessions[i].d->event_count);
+
+			xe_eudebug_event_log_compare(sessions[0].d->log,
+						     sessions[i].d->log, 0);
+
+			xe_eudebug_client_destroy(sessions[i].c);
+		}
+		xe_eudebug_debugger_destroy(sessions[i].d);
+	}
+}
+
+static void *attach_dettach_thread(void *data)
+{
+	struct xe_eudebug_session *s = data;
+	const int tries = 100;
+	int ret = 0;
+
+	for (int try = 0; try < tries; try++) {
+
+		ret = xe_eudebug_debugger_attach(s->d, s->c);
+
+		if (ret == -EBUSY) {
+			usleep(100000);
+			continue;
+		}
+
+		igt_assert_eq(ret, 0);
+
+		if (random() % 2 == 0) {
+			xe_eudebug_debugger_start_worker(s->d);
+			xe_eudebug_debugger_stop_worker(s->d, 1);
+		}
+
+		xe_eudebug_debugger_dettach(s->d);
+		s->d->log->head = 0;
+		s->d->event_count = 0;
+	}
+
+	return NULL;
+}
+
+static void test_empty_discovery(int fd, unsigned int flags, int clients)
+{
+	struct xe_eudebug_session **s;
+	pthread_t *threads;
+	int i, expected = flags & DISCOVERY_CLOSE_CLIENT ? 0 : RESOURCE_COUNT;
+
+	igt_assert(flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT));
+
+	s = calloc(clients, sizeof(struct xe_eudebug_session *));
+	threads = calloc(clients, sizeof(*threads));
+
+	for (i = 0; i < clients; i++)
+		s[i] = xe_eudebug_session_create(fd, run_discovery_client, flags, NULL);
+
+	for (i = 0; i < clients; i++) {
+		xe_eudebug_client_start(s[i]->c);
+
+		pthread_create(&threads[i], NULL, attach_dettach_thread, s[i]);
+	}
+
+	for (i = 0; i < clients; i++)
+		pthread_join(threads[i], NULL);
+
+	for (i = 0; i < clients; i++) {
+		xe_eudebug_client_wait_done(s[i]->c);
+		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->d, s[i]->c), 0);
+
+		xe_eudebug_debugger_start_worker(s[i]->d);
+		xe_eudebug_debugger_stop_worker(s[i]->d, 5);
+		xe_eudebug_debugger_dettach(s[i]->d);
+
+		igt_assert_eq(s[i]->d->event_count, expected);
+
+		xe_eudebug_session_destroy(s[i]);
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -272,6 +507,15 @@ igt_main
 	igt_subtest("basic-vms")
 		test_basic_sessions(fd, CREATE_VMS, 1);
 
+	igt_subtest("discovery-race")
+		test_race_discovery(fd, 0, 4);
+
+	igt_subtest("discovery-empty")
+		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
+
+	igt_subtest("discovery-empty-clients")
+		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1


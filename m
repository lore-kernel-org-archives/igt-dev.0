Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E99C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD310E420;
	Mon, 29 Jul 2024 16:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvAWel1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1398F10E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268965; x=1753804965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rw/jcfCsPf2vP53DuB3fcZvrSLcKNcnJw0UoTRGlH4=;
 b=XvAWel1OTBZzb6HS7Jv+TWp0Lf7kxzkA959IsMwHxn3lRYJ+pYOjrqSi
 wOCvrlaAS4xS8r3N3iv942RPRbQtI92X386Ih47GmSTjJ/jrs8xGBhppF
 D5PhY6ryIhO1XDjp4lWfhtqVacAmCmjtBKk74qC9q2ZN3txOF+C+ATQz4
 b5FZtbli7mACvLwDbHS+H+9Jj0uMGiz+fSYDfy17ByVtY8g1vyMXRvO5H
 8Vrv53Hjh8Sa9f886+6EiMMIKQQqOrL4q/WGh54XnrAwolD+LgHnK/Dsh
 Ea2jEU6lteC7L977mcvvGOqCEZeXRbawT3+ipY99uqAE4Lx/NiAmHDAWm w==;
X-CSE-ConnectionGUID: kX8jXdRcTg2j9f2KeJ1+9g==
X-CSE-MsgGUID: nmqa4h5fRsu+tTFDwY7I0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426824"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:45 -0700
X-CSE-ConnectionGUID: Eiqz1rkZSc2AJX5d3fOB5Q==
X-CSE-MsgGUID: CH1vaQm1TFSLr/vsdvrKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737154"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:25 -0700
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
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 03/66] lib/xe_eudebug: Allow client to wait for debugger
Date: Mon, 29 Jul 2024 18:00:56 +0200
Message-Id: <20240729160159.37036-4-christoph.manszewski@intel.com>
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

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

In some tests, we need to pause the client into a certain
stage it has setup so that debugger can then examine that
setup and crosscheck.

Add a possibility to pause client and debugger to signal
continuation.

We need to take into account that the debugger might
disappear before signaling continuation so a timeout
mechanism for all pipe token reads needs to be added.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 159 +++++++++++++++++++++++++++++++++-----------
 lib/xe/xe_eudebug.h |   8 ++-
 2 files changed, 129 insertions(+), 38 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 59cd33990..70769e532 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -24,6 +24,7 @@ struct event_trigger {
 #define CLIENT_RUN  2
 #define CLIENT_FINI 3
 #define CLIENT_STOP 4
+#define CLIENT_STAGE 5
 
 #define DEBUGGER_WORKER_INACTIVE  0
 #define DEBUGGER_WORKER_ACTIVE  1
@@ -129,9 +130,10 @@ static void catch_child_failure(void)
 	igt_assert_f(WEXITSTATUS(status) == 0, "Client failed!\n");
 }
 
-static int safe_pipe_read(int pipe[2], void *buf, int nbytes)
+static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 {
 	int ret;
+	int t = 0;
 	struct pollfd fd = {
 		.fd = pipe[0],
 		.events = POLLIN,
@@ -142,36 +144,33 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes)
 	 * the child process ended with an error.
 	 */
 	do {
-		ret = poll(&fd, 1, 1000);
+		const int interval_ms = 1000;
 
-		if (!ret)
+		ret = poll(&fd, 1, interval_ms);
+
+		if (!ret) {
 			catch_child_failure();
-	} while (!ret);
+			t += interval_ms;
+		}
+	} while (!ret && t < timeout_ms);
 
-	return read(pipe[0], buf, nbytes);
+	if (ret > 0)
+		return read(pipe[0], buf, nbytes);
+
+	return 0;
 }
 
-static uint64_t pipe_wait_u64(int pipe[2])
+static uint64_t pipe_read(int pipe[2], int timeout_ms)
 {
 	uint64_t in;
 	uint64_t ret;
 
-	ret = safe_pipe_read(pipe, &in, sizeof(in));
+	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
 	igt_assert(ret == sizeof(in));
 
 	return in;
 }
 
-#define pipe_wait pipe_wait_u64
-
-static void pipe_wait_token(int pipe[2], uint64_t token)
-{
-	uint64_t in;
-
-	in = pipe_wait_u64(pipe);
-	igt_assert_eq(token, in);
-}
-
 static void pipe_signal(int pipe[2], uint64_t token)
 {
 	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
@@ -186,6 +185,42 @@ static void pipe_close(int pipe[2])
 		close(pipe[1]);
 }
 
+static uint64_t __wait_token(int p[2], const uint64_t token, int timeout_ms)
+{
+	uint64_t in;
+
+	in = pipe_read(p, timeout_ms);
+
+	igt_assert_eq(in, token);
+
+	return pipe_read(p, timeout_ms);
+}
+
+static uint64_t client_wait_token(struct xe_eudebug_client *c,
+				 const uint64_t token)
+{
+	return __wait_token(c->p_in, token, c->timeout_ms);
+}
+
+static uint64_t wait_from_client(struct xe_eudebug_client *c,
+				 const uint64_t token)
+{
+	return __wait_token(c->p_out, token, c->timeout_ms);
+}
+
+static void token_signal(int p[2], const uint64_t token, const uint64_t value)
+{
+	pipe_signal(p, token);
+	pipe_signal(p, value);
+}
+
+static void client_signal(struct xe_eudebug_client *c,
+			  const uint64_t token,
+			  const uint64_t value)
+{
+	token_signal(c->p_out, token, value);
+}
+
 static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
 {
 	struct drm_xe_eudebug_connect param = {
@@ -735,24 +770,28 @@ void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
 /**
  * xe_eudebug_debugger_attach:
  * @d: pointer to the debugger
- * @target: pid of the process to attach debugger
+ * @c: pointer to the client
  *
- * Opens the xe eu debugger connection to the @target proccess.
+ * Opens the xe eu debugger connection to the process described by @c (c->pid)
  *
  * Returns: 0 if the debugger was successfully attached, -errno otherwise.
  */
-int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t target)
+int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
+			       struct xe_eudebug_client *c)
 {
 	int ret;
 
 	igt_assert_eq(d->fd, -1);
-	ret = xe_eudebug_connect(d->master_fd, target, 0);
+	igt_assert_neq(c->pid, 0);
+	ret = xe_eudebug_connect(d->master_fd, c->pid, 0);
 
 	if (ret < 0)
 		return ret;
 
 	d->fd = ret;
-	d->target_pid = target;
+	d->target_pid = c->pid;
+	d->p_client[0] = c->p_in[0];
+	d->p_client[1] = c->p_in[1];
 
 	igt_debug("debugger connected to %lu\n", d->target_pid);
 
@@ -848,6 +887,19 @@ void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
 	event_log_sort(d->log);
 }
 
+/**
+ * xe_eudebug_debugger_signal_stage:
+ * @d: pointer to the debugger
+ * @stage: stage to signal
+ *
+ * Signals to client, waiting in xe_eudebug_client_wait_stage(),
+ * releasing it to proceed.
+ */
+void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage)
+{
+	token_signal(d->p_client, CLIENT_STAGE, stage);
+}
+
 /**
  * xe_eudebug_client_create:
  * @master_fd: xe client used to open the debugger connection
@@ -879,8 +931,11 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 	c->done = 0;
 	c->ptr = data;
 	c->master_fd = master_fd;
+	c->timeout_ms = XE_EUDEBUG_DEFAULT_TIMEOUT_MS;
 
 	igt_fork(child, 1) {
+		int mypid;
+
 		igt_assert_eq(c->pid, 0);
 
 		close(c->p_out[0]);
@@ -888,17 +943,20 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 		close(c->p_in[1]);
 		c->p_in[1] = -1;
 
-		pipe_signal(c->p_out, CLIENT_PID);
-		pipe_signal(c->p_out, getpid());
+		mypid = getpid();
+		client_signal(c, CLIENT_PID, mypid);
 
-		pipe_wait_token(c->p_in, CLIENT_RUN);
-		work(c);
-		pipe_signal(c->p_out, CLIENT_FINI);
+		c->pid = client_wait_token(c, CLIENT_RUN);
+		igt_assert_eq(c->pid, mypid);
+		if (work)
+			work(c);
+
+		client_signal(c, CLIENT_FINI, c->seqno);
 
-		igt_assert_eq(c->pid, 0);
 		event_log_write_to_fd(c->log, c->p_out[1]);
-		pipe_signal(c->p_out, c->seqno);
-		pipe_wait_token(c->p_in, CLIENT_STOP);
+
+		c->pid = client_wait_token(c, CLIENT_STOP);
+		igt_assert_eq(c->pid, mypid);
 	}
 
 	close(c->p_out[1]);
@@ -906,8 +964,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 	close(c->p_in[0]);
 	c->p_in[0] = -1;
 
-	pipe_wait_token(c->p_out, CLIENT_PID);
-	c->pid = pipe_wait(c->p_out);
+	c->pid = wait_from_client(c, CLIENT_PID);
 
 	igt_info("client running with pid %d\n", c->pid);
 
@@ -927,7 +984,7 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
 
 		xe_eudebug_client_wait_done(c);
 
-		pipe_signal(c->p_in, CLIENT_STOP);
+		token_signal(c->p_in, CLIENT_STOP, c->pid);
 		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
 			      c->pid);
 		c->pid = 0;
@@ -971,7 +1028,7 @@ uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c)
  */
 void xe_eudebug_client_start(struct xe_eudebug_client *c)
 {
-	pipe_signal(c->p_in, CLIENT_RUN);
+	token_signal(c->p_in, CLIENT_RUN, c->pid);
 }
 
 /**
@@ -985,12 +1042,40 @@ void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
 {
 	if (!c->done) {
 		c->done = 1;
-		pipe_wait_token(c->p_out, CLIENT_FINI);
+		c->seqno = wait_from_client(c, CLIENT_FINI);
 		event_log_read_from_fd(c->log, c->p_out[0]);
-		c->seqno = pipe_wait(c->p_out);
 	}
 }
 
+/**
+ * xe_eudebug_client_wait_stage:
+ * @c: pointer to xe_eudebug_client structure
+ * @stage: stage to wait on
+ *
+ * Pauses client until the debugger has signalled the corresponding stage with
+ * xe_eudebug_debugger_signal_stage. This is only for situations where the
+ * actual event flow is not enough to coordinate between client/debugger and extra
+ * sync mechanism is needed.
+ *
+ */
+void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
+{
+	u64 stage_in;
+
+	if (c->done) {
+		igt_warn("client: %d already done before %lu\n", c->pid, stage);
+		return;
+	}
+
+	igt_debug("client: %d pausing for stage %lu\n", c->pid, stage);
+
+	stage_in = client_wait_token(c, CLIENT_STAGE);
+	igt_debug("client: %d stage %lu, expected %lu, stage\n", c->pid, stage_in, stage);
+
+	igt_assert_eq(stage_in, stage);
+}
+
+
 /**
  * xe_eudebug_session_create:
  * @fd: XE file descriptor
@@ -1031,7 +1116,7 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
 	struct xe_eudebug_debugger *debugger = s->d;
 	struct xe_eudebug_client *client = s->c;
 
-	igt_assert_eq(xe_eudebug_debugger_attach(debugger, client->pid), 0);
+	igt_assert_eq(xe_eudebug_debugger_attach(debugger, client), 0);
 
 	xe_eudebug_debugger_start_worker(debugger);
 
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index a0cae245d..5ec63e46b 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -36,6 +36,7 @@ struct xe_eudebug_debugger {
 	pthread_t worker_thread;
 	int worker_state;
 
+	int p_client[2];
 };
 
 struct xe_eudebug_client {
@@ -54,6 +55,8 @@ struct xe_eudebug_client {
 
 	/* Used to pickup right device (the one used in debugger) */
 	int master_fd;
+
+	int timeout_ms;
 };
 
 struct xe_eudebug_session {
@@ -110,13 +113,14 @@ void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l);
 struct xe_eudebug_debugger *
 xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
-int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t pid);
+int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
 void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
 void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
 void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
 				     xe_eudebug_trigger_fn fn);
+void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
 
 struct xe_eudebug_client *
 xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
@@ -124,6 +128,8 @@ void xe_eudebug_client_destroy(struct xe_eudebug_client *c);
 void xe_eudebug_client_start(struct xe_eudebug_client *c);
 void xe_eudebug_client_stop(struct xe_eudebug_client *c);
 void xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
+void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
+
 uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
 void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
 
-- 
2.34.1


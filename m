Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AB7C0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 13:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04F210E64B;
	Tue, 28 Jan 2025 13:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+jazJ91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C908810E64B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738071000; x=1769607000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/WjOgULW9+Rv8f0M4W0GeSlrqE6uzd6m7j8LoYOk2E=;
 b=a+jazJ91qo0pYj5t0NhD13XEXwpdssioWAb5bXzm2gyqvJ8o7OiRJP0N
 wrDsE6iFRKjaGjDpw1zHO0ZpU6x69BFxhSpHTiv+rjSF/Me6dHZHXhUcK
 lSnVWda7TM+AVkmaOEACn6nbIoJMYhmsNaMNlAsgq5JZFq5221DNVLq4P
 hjWJ/NDFK5shg+YEBVrYGvGKD5tHFs73BZAfpW6Aaui+HACLfrj2zVatR
 m8IALuRCn82ytIigJ6lpFsQA+kOaL5QrjDt9dL2gkujX+Cb4p7eSXD3YT
 AOAv+e6HZtZFdeZEhXOkc0IMcGlHEu418IJL5e4TBbBxT/9ma3WynKVlW A==;
X-CSE-ConnectionGUID: hog4RLWyQAWQvgXiqmZQbQ==
X-CSE-MsgGUID: wu0+KBbXRGOpFToyfGJCzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42487524"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="42487524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 05:30:00 -0800
X-CSE-ConnectionGUID: Zs7DKRW8QxyYzagiR3OSXw==
X-CSE-MsgGUID: k75XA066QjGdEuYqNSRaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="108544776"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.99])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 05:30:00 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug: Add discovery-race-sigint
 test
Date: Tue, 28 Jan 2025 14:29:30 +0100
Message-Id: <20250128132930.4778-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128132930.4778-1-dominik.karol.piatkowski@intel.com>
References: <20250128132930.4778-1-dominik.karol.piatkowski@intel.com>
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

Add a test that extends discovery-race test by interrupting the client
and checking if anything breaks.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 89 ++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 36 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 91e9ae885..da53aa881 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1093,6 +1093,7 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 #define DISCOVERY_CLOSE_CLIENT		(1 << 1)
 #define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
 #define DISCOVERY_VM_BIND		(1 << 3)
+#define DISCOVERY_SIGINT		(1 << 4)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
 	int fd[RESOURCE_COUNT], i;
@@ -1165,6 +1166,7 @@ static void run_discovery_client(struct xe_eudebug_client *c)
  * arg[1]:
  *
  * @race:		resources creation
+ * @race-sigint:	resources creation with client interruption
  * @race-vmbind:	vm-bind operations
  * @empty:		resources destruction
  * @empty-clients:	client closure
@@ -1200,56 +1202,61 @@ static void *discovery_race_thread(void *data)
 
 			xe_eudebug_debugger_start_worker(s->debugger);
 
-			/*
-			 * Thread can starve for more than one second. Make
-			 * sure we get at least one event before stopping.
-			 */
-			do
-				sleep(1);
-			while (!READ_ONCE(s->debugger->event_count) &&
-			       --max_worker_waits);
+			if (!s->client->done) {
+				/*
+				 * Thread can starve for more than one second. Make
+				 * sure we get at least one event before stopping.
+				 */
+				do
+					if (s->client->flags & DISCOVERY_SIGINT)
+						usleep(100000);
+					else
+						sleep(1);
+				while (!READ_ONCE(s->debugger->event_count) &&
+				       --max_worker_waits);
 
 			igt_assert(READ_ONCE(s->debugger->event_count));
+			}
 
 			xe_eudebug_debugger_stop_worker(s->debugger, 1);
 
 			igt_debug("Resources discovered: %lu\n", s->debugger->event_count);
+			if (!s->client->done) {
+				xe_eudebug_for_each_event(e, s->debugger->log) {
+					if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
+						struct drm_xe_eudebug_event_client *eo = (void *)e;
 
-			xe_eudebug_for_each_event(e, s->debugger->log) {
-				if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
-					struct drm_xe_eudebug_event_client *eo = (void *)e;
-
-					if (i >= 0) {
-						igt_assert_eq(clients[i].vm_count,
-							      RESOURCE_COUNT);
-
-						igt_assert_eq(clients[i].exec_queue_count,
-							      RESOURCE_COUNT);
+						if (i >= 0) {
+							igt_assert_eq(clients[i].vm_count,
+								      RESOURCE_COUNT);
 
-						if (s->client->flags & DISCOVERY_VM_BIND)
-							igt_assert_eq(clients[i].vm_bind_op_count,
+							igt_assert_eq(clients[i].exec_queue_count,
 								      RESOURCE_COUNT);
-					}
 
-					igt_assert(++i < RESOURCE_COUNT);
-					clients[i].client_handle = eo->client_handle;
-					clients[i].vm_count = 0;
-					clients[i].exec_queue_count = 0;
-					clients[i].vm_bind_op_count = 0;
-				}
+							if (s->client->flags & DISCOVERY_VM_BIND)
+								igt_assert_eq(clients[i].vm_bind_op_count,
+									      RESOURCE_COUNT);
+						}
 
-				if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
-					clients[i].vm_count++;
+						igt_assert(++i < RESOURCE_COUNT);
+						clients[i].client_handle = eo->client_handle;
+						clients[i].vm_count = 0;
+						clients[i].exec_queue_count = 0;
+						clients[i].vm_bind_op_count = 0;
+					}
 
-				if (e->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
-					clients[i].exec_queue_count++;
+					if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
+						clients[i].vm_count++;
 
-				if (e->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
-					clients[i].vm_bind_op_count++;
-			};
+					if (e->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
+						clients[i].exec_queue_count++;
 
-			igt_assert_lte(0, i);
+					if (e->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+						clients[i].vm_bind_op_count++;
+				};
 
+				igt_assert_lte(0, i);
+			}
 			for (int j = 0; j < i; j++)
 				for (int k = 0; k < i; k++) {
 					if (k == j)
@@ -1317,8 +1324,15 @@ static void test_race_discovery(int fd, unsigned int flags, int clients)
 		pthread_create(&threads[i], NULL, discovery_race_thread, &sessions[i]);
 	}
 
-	for (i = 0; i < count; i++)
+	if (flags & DISCOVERY_SIGINT) {
+		sleep(2);
+		sessions[0].client->done = 1;
+		kill(sessions[0].client->pid, SIGINT);
+	}
+
+	for (i = 0; i < count; i++) {
 		pthread_join(threads[i], NULL);
+	}
 
 	for (i = count - 1; i > 0; i--) {
 		if (sessions[i].flags & PRIMARY_THREAD) {
@@ -2913,6 +2927,9 @@ igt_main
 	igt_subtest("discovery-race-vmbind")
 		test_race_discovery(fd, DISCOVERY_VM_BIND, 4);
 
+	igt_subtest("discovery-race-sigint")
+		test_race_discovery(fd, DISCOVERY_SIGINT, 1);
+
 	igt_subtest("discovery-empty")
 		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
 
-- 
2.34.1


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D27C10E822
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 11:23:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 13:23:42 +0200
Message-Id: <20220525112342.37152-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_allocator: Add flag signalling
 multiprocess readyness
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently when children processes try to communicate to not existing
allocator thread they got crash with vague SIGSEGV.

Adding readyness flag and detailed explanation in assert should hint
the developer to add missing intel_allocator_multiprocess_start|stop)
functions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/intel_allocator.c            | 4 ++++
 lib/intel_allocator_msgchannel.c | 2 ++
 lib/intel_allocator_msgchannel.h | 1 +
 3 files changed, 7 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 340b888286..06803bf5e0 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -737,6 +737,10 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 		return 0;
 	}
 
+	igt_assert_f(channel->ready,
+		     "Allocator must be called in multiprocess mode, "
+		     "use intel_allocator_multiprocess_(start|stop)()\n");
+
 	ret = send_req_recv_resp(channel, req, resp);
 
 	if (ret < 0)
diff --git a/lib/intel_allocator_msgchannel.c b/lib/intel_allocator_msgchannel.c
index 172858d3df..cd0f0a5d26 100644
--- a/lib/intel_allocator_msgchannel.c
+++ b/lib/intel_allocator_msgchannel.c
@@ -75,6 +75,7 @@ static void msgqueue_init(struct msg_channel *channel)
 	msgdata->key = key;
 	msgdata->queue = queue;
 	channel->priv = msgdata;
+	channel->ready = true;
 }
 
 static void msgqueue_deinit(struct msg_channel *channel)
@@ -84,6 +85,7 @@ static void msgqueue_deinit(struct msg_channel *channel)
 	igt_debug("Deinit msgqueue\n");
 	msgctl(msgdata->queue, IPC_RMID, NULL);
 	free(channel->priv);
+	channel->ready = false;
 }
 
 static int msgqueue_send_req(struct msg_channel *channel,
diff --git a/lib/intel_allocator_msgchannel.h b/lib/intel_allocator_msgchannel.h
index ef129c3077..cefbf4ce33 100644
--- a/lib/intel_allocator_msgchannel.h
+++ b/lib/intel_allocator_msgchannel.h
@@ -140,6 +140,7 @@ struct alloc_resp {
 };
 
 struct msg_channel {
+	bool ready;
 	void *priv;
 	void (*init)(struct msg_channel *channel);
 	void (*deinit)(struct msg_channel *channel);
-- 
2.32.0

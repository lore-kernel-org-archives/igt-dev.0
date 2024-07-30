Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E72DC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628CA10E50A;
	Tue, 30 Jul 2024 11:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEuZCEey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A103E10E514
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340053; x=1753876053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZs/yC+CA/U5xLwmCrdMiK9DoOZDo2fGzWdAZ3TJupU=;
 b=AEuZCEeyr/62KRbBE04nPnAjDX+zRkXYrNJ1aglEjsPlGS+Ef5qD9FCB
 oUNM9Pa/Fx5DpnPPX4gwkZ0tSb9nHUT0hB7oC+vLERJq+9Wkx8Bv8v6O+
 6ztzxCc0p05j4Bm3+cIGcAajjmWMxUX/un3X1sg2vr8uQisK1uSvZ4g80
 dEvCbEBqEtXe52yNVcNzs+0C2ci2oQGYjS/FAj7/gQLDLOJgUZIi3PQ14
 f8s7EF8BvVtebuDA6BKVL/TXTMGnQ2hzn8DoRKA0ZNo6uMMkQQ6ABgNyn
 tU9EK9foadDFblpxvPd+U0sl3kSfdz7TT0XWmCCoRvSi2+91Z14MOCuei Q==;
X-CSE-ConnectionGUID: OBiQZavSQY2GBp1tVnCSAw==
X-CSE-MsgGUID: UNZ0tg6FSQiX2cgWo7cisQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937260"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:33 -0700
X-CSE-ConnectionGUID: Ssv+KvSIQqerxCs4iVkJ3w==
X-CSE-MsgGUID: VKBdIapiS7iOFpq+cRSNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216650"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:29 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 17/66] tests/xe_eudebug: Include exec queues in
 discovery testing
Date: Tue, 30 Jul 2024 13:44:34 +0200
Message-Id: <20240730114523.334156-18-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

Extend discovery-* subtests to create exec_queue resources.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 41 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 4051eac53..9497e73e9 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -341,6 +341,7 @@ static void test_basic_sessions(int fd, unsigned int flags, int count)
 #define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
+	struct drm_xe_engine_class_instance *hwe = NULL;
 	int fd[RESOURCE_COUNT], i;
 	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
 
@@ -349,6 +350,20 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 	for (i = 0; i < RESOURCE_COUNT; i++) {
 		fd[i] = xe_eudebug_client_open_driver(c);
 
+		if (!i) {
+			bool found = false;
+
+			xe_device_get(fd[0]);
+			xe_for_each_engine(fd[0], hwe) {
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ||
+				    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+					found = true;
+					break;
+				}
+			}
+			igt_assert(found);
+		}
+
 		/*
 		 * Give the debugger a break in event stream after every
 		 * other client, that allows to read discovery and dettach in quiet.
@@ -357,15 +372,25 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 			sleep(1);
 
 		for (int j = 0; j < RESOURCE_COUNT; j++) {
-			uint32_t vm = xe_eudebug_client_vm_create(c, fd[i], 0, 0);
+			struct drm_xe_exec_queue_create create = {
+				.width = 1,
+				.num_placements = 1,
+				.vm_id = xe_eudebug_client_vm_create(c, fd[i], 0, 0),
+				.instances = to_user_pointer(hwe)
+			};
 
-			if (c->flags & DISCOVERY_DESTROY_RESOURCES)
-				xe_eudebug_client_vm_destroy(c, fd[i], vm);
+			xe_eudebug_client_exec_queue_create(c, fd[i], &create);
+
+			if (c->flags & DISCOVERY_DESTROY_RESOURCES) {
+				xe_eudebug_client_exec_queue_destroy(c, fd[i], &create);
+				xe_eudebug_client_vm_destroy(c, fd[i], create.vm_id);
+			}
 		}
 
 		if (c->flags & DISCOVERY_CLOSE_CLIENT)
 			xe_eudebug_client_close_driver(c, fd[i]);
 	}
+	xe_device_put(fd[0]);
 }
 
 /**
@@ -383,9 +408,10 @@ static void *discovery_race_thread(void *data)
 	struct {
 		uint64_t client_handle;
 		int vm_count;
+		int exec_queue_count;
 	} clients[RESOURCE_COUNT];
 	struct xe_eudebug_session *s = data;
-	int expected = RESOURCE_COUNT * (1 + RESOURCE_COUNT);
+	int expected = RESOURCE_COUNT * (1 + 2 * RESOURCE_COUNT);
 	const int tries = 100;
 	bool done = false;
 	int ret = 0;
@@ -417,15 +443,22 @@ static void *discovery_race_thread(void *data)
 					if (i >= 0) {
 						igt_assert_eq(clients[i].vm_count,
 							      RESOURCE_COUNT);
+
+						igt_assert_eq(clients[i].exec_queue_count,
+							      RESOURCE_COUNT);
 					}
 
 					igt_assert(++i < RESOURCE_COUNT);
 					clients[i].client_handle = eo->client_handle;
 					clients[i].vm_count = 0;
+					clients[i].exec_queue_count = 0;
 				}
 
 				if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
 					clients[i].vm_count++;
+
+				if (e->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
+					clients[i].exec_queue_count++;
 			};
 
 			igt_assert_lte(0, i);
-- 
2.34.1


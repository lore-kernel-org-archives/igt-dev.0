Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4BC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD7810E43F;
	Mon, 29 Jul 2024 16:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TI+TQWrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135E210E43C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268999; x=1753804999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KjfNDdpmAziet+eCXC8YU0Cf+juqyh0BYVow2q7E7W0=;
 b=TI+TQWrRYfelw2j4XCmJXLCYs4Z4jD+QJiw6+6XnHveLvcQOZJ1TLxGH
 olRzF+V8njmn0GHc4jBeEayTdbsbjtuK3B2QK3I7l1ydfqQOlSH7yOECn
 qDHWQ1b6Bndn2cdLwF/CTFYLeoj5EFn/mB0FbJKURSsIKzx2iJzdyMBOH
 jQS52uFoNb7hWP4tpcO+dQh19UxprnonIEBY7dTaHEduQtpBrJS9hjOLi
 wyQ86vPwHyy82yk1L24Tcoxxq1B9gd6z7gqWP4F+2GFwaOV2TXtFfIUhA
 i0SDLPtMhlnZX/ROtQWSfHgyOWIKLyv2VsL1sKWPQxnDoD3pvnaJ9Q279 w==;
X-CSE-ConnectionGUID: yWGnmlp6SyO8w9bxULAbZQ==
X-CSE-MsgGUID: fQaXsBR/Q7e1rkQAsKuk7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426985"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:17 -0700
X-CSE-ConnectionGUID: Y0oIoBN3TSyxzGe5uFlIuQ==
X-CSE-MsgGUID: vyzc1CX7TxCwuaToW//htg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737683"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:14 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 17/66] tests/xe_eudebug: Include exec queues in discovery
 testing
Date: Mon, 29 Jul 2024 18:01:10 +0200
Message-Id: <20240729160159.37036-18-christoph.manszewski@intel.com>
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

Extend discovery-* subtests to create exec_queue resources.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 41 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 47523982d..d16bc9c19 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -340,6 +340,7 @@ static void test_basic_sessions(int fd, unsigned int flags, int count)
 #define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
+	struct drm_xe_engine_class_instance *hwe = NULL;
 	int fd[RESOURCE_COUNT], i;
 	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
 
@@ -348,6 +349,20 @@ static void run_discovery_client(struct xe_eudebug_client *c)
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
@@ -356,15 +371,25 @@ static void run_discovery_client(struct xe_eudebug_client *c)
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
@@ -382,9 +407,10 @@ static void *discovery_race_thread(void *data)
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
@@ -416,15 +442,22 @@ static void *discovery_race_thread(void *data)
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


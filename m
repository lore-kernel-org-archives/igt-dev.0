Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C22C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D5810E50A;
	Tue, 30 Jul 2024 11:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLmEk0GP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2210E514
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340092; x=1753876092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SITp0FU5RBAA3shyLHswqy9zwPQqZktFgQso/svdtQ0=;
 b=BLmEk0GP+1oEH0OINExrjJ4/Gc4PjBcGwptUgx45zDLVL4ZNk8W/BKs3
 zLftsxsvPWdsGyX97ppBLZEubuGheSLiVck82900FEtTqWoAkQHI5VpIT
 fSiIuw4U+B95oLryVDwSCkYPExqYrNmEfYy6GZuWT13hScrPxJ3CJOBFh
 5zdXjKfhPfbqzYmUm46a6n9+AgtB8/9mV+4RePI9waD54KQZWgzo+PTGM
 2+j1/PldnKFmMecHxJNGwbAk1xbTFtiPRmP/tfEHyE7e0hFiEwDmDK4/S
 Gw92u/C9M7+MtuCn994yH+S/LmOOF3lKB9FwtSth6d5RLhA0uPwN2GQ5F w==;
X-CSE-ConnectionGUID: wwSQfmYiRsaPoDDFoSA5kg==
X-CSE-MsgGUID: 6VE/lZiBQNa/YQRDmspG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937331"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:12 -0700
X-CSE-ConnectionGUID: 7AcL2mZoSFGHDz5/mQpUsg==
X-CSE-MsgGUID: TTeIOS8nTse34wfPNUxzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216959"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:08 -0700
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
Subject: [PATCH i-g-t v2 30/66] tests/xe_eudebug: Add discovery-race-vmbind
 subtest
Date: Tue, 30 Jul 2024 13:44:47 +0200
Message-Id: <20240730114523.334156-31-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Extend discovery-race test case with BO creation and vm_bind operation
to verify that all vm_bind_op events are properly registered and
replayed.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 8c21cffc7..c368e30e7 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -917,11 +917,13 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 #define PRIMARY_THREAD			(1 << 0)
 #define DISCOVERY_CLOSE_CLIENT		(1 << 1)
 #define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
+#define DISCOVERY_VM_BIND		(1 << 3)
 static void run_discovery_client(struct xe_eudebug_client *c)
 {
 	struct drm_xe_engine_class_instance *hwe = NULL;
 	int fd[RESOURCE_COUNT], i;
 	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
+	uint64_t addr = 0x1a0000;
 
 	srand(getpid());
 
@@ -950,18 +952,29 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 			sleep(1);
 
 		for (int j = 0; j < RESOURCE_COUNT; j++) {
+			uint32_t vm = xe_eudebug_client_vm_create(c, fd[i], 0, 0);
 			struct drm_xe_exec_queue_create create = {
 				.width = 1,
 				.num_placements = 1,
-				.vm_id = xe_eudebug_client_vm_create(c, fd[i], 0, 0),
+				.vm_id = vm,
 				.instances = to_user_pointer(hwe)
 			};
+			const unsigned int bo_size = max_t(bo_size,
+							   xe_get_default_alignment(fd[i]),
+							   MIN_BO_SIZE);
+			uint32_t bo = xe_bo_create(fd[i], 0, bo_size, system_memory(fd[i]), 0);
 
 			xe_eudebug_client_exec_queue_create(c, fd[i], &create);
 
+			if (c->flags & DISCOVERY_VM_BIND) {
+				xe_eudebug_client_vm_bind(c, fd[i], vm, bo, 0, addr, bo_size);
+				addr += 0x100000;
+			}
+
 			if (c->flags & DISCOVERY_DESTROY_RESOURCES) {
 				xe_eudebug_client_exec_queue_destroy(c, fd[i], &create);
 				xe_eudebug_client_vm_destroy(c, fd[i], create.vm_id);
+				gem_close(fd[i], bo);
 			}
 		}
 
@@ -978,6 +991,7 @@ static void run_discovery_client(struct xe_eudebug_client *c)
  * arg[1]:
  *
  * @race:		resources creation
+ * @race-vmbind:	vm-bind operations
  * @empty:		resources destruction
  * @empty-clients:	client closure
  */
@@ -987,6 +1001,7 @@ static void *discovery_race_thread(void *data)
 		uint64_t client_handle;
 		int vm_count;
 		int exec_queue_count;
+		int vm_bind_op_count;
 	} clients[RESOURCE_COUNT];
 	struct xe_eudebug_session *s = data;
 	int expected = RESOURCE_COUNT * (1 + 2 * RESOURCE_COUNT);
@@ -1024,12 +1039,17 @@ static void *discovery_race_thread(void *data)
 
 						igt_assert_eq(clients[i].exec_queue_count,
 							      RESOURCE_COUNT);
+
+						if (s->c->flags & DISCOVERY_VM_BIND)
+							igt_assert_eq(clients[i].vm_bind_op_count,
+								      RESOURCE_COUNT);
 					}
 
 					igt_assert(++i < RESOURCE_COUNT);
 					clients[i].client_handle = eo->client_handle;
 					clients[i].vm_count = 0;
 					clients[i].exec_queue_count = 0;
+					clients[i].vm_bind_op_count = 0;
 				}
 
 				if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
@@ -1037,6 +1057,9 @@ static void *discovery_race_thread(void *data)
 
 				if (e->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
 					clients[i].exec_queue_count++;
+
+				if (e->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+					clients[i].vm_bind_op_count++;
 			};
 
 			igt_assert_lte(0, i);
@@ -1116,7 +1139,8 @@ static void test_race_discovery(int fd, unsigned int flags, int clients)
 			igt_assert_eq(sessions[i].c->seqno-1, sessions[i].d->event_count);
 
 			xe_eudebug_event_log_compare(sessions[0].d->log,
-						     sessions[i].d->log, 0);
+						     sessions[i].d->log,
+						     XE_EUDEBUG_FILTER_EVENT_VM_BIND);
 
 			xe_eudebug_client_destroy(sessions[i].c);
 		}
@@ -1755,6 +1779,9 @@ igt_main
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
+	igt_subtest("discovery-race-vmbind")
+		test_race_discovery(fd, DISCOVERY_VM_BIND, 4);
+
 	igt_subtest("discovery-empty")
 		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
 
-- 
2.34.1


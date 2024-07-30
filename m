Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7DEC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B510E513;
	Tue, 30 Jul 2024 11:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIf7f17G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD10510E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340050; x=1753876050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ecyHmJx/Ya91wU9XPXqvbTsPcpDXOIytPnpVhRrGyRk=;
 b=DIf7f17G7DVIw+4JYgzdzPkljEtiB7wI6RB6f3RVO33As2jdIsS+WJtk
 niGgNEnxeoDaLYS+POBAMHcHZJ1ux/4aQpntXLhF+7v/M9wBPjRzTuMg+
 DqNwdEEFY8s/aAPZGP5UOBxAhTtJUfzuWX3XGXhBsBUCX2h5zDX/UxfXA
 oDy6ca43Lyrb4LH7z1XMo7lanQsepHeY6WjMhP43h1Y4DjvesYhC36AZ1
 62WxmYHGO8rbDZKOnsR2ozdvGKNfWy2ZW5lhaw3q073Z7tDQ7alw3lp6g
 2ewJes5des5mtraC++flxiZgFU2Z0klBuOLdWR3QkgMKmcbYZ5QyHgZ2P Q==;
X-CSE-ConnectionGUID: oVZSzJ/HTBCnTk5A1L2Qwg==
X-CSE-MsgGUID: cMc7WFIFTRO9MmxhIFnDyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937252"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937252"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:30 -0700
X-CSE-ConnectionGUID: jv6RNn6sR66kXvcYdsu/qw==
X-CSE-MsgGUID: u/cZqXElSa6l60Nyil8Odg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216642"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:26 -0700
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
Subject: [PATCH i-g-t v2 16/66] tests/xe_eudebug: Introduce basic exec_queue
 testing
Date: Tue, 30 Jul 2024 13:44:33 +0200
Message-Id: <20240730114523.334156-17-christoph.manszewski@intel.com>
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

Exercise events send by the debugger on exec_queue create/destroy.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 64 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d97e7914e..4051eac53 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -17,13 +17,16 @@
 
 #include "igt.h"
 #include "xe/xe_eudebug.h"
+#include "xe/xe_query.h"
 
 #define CREATE_VMS	(1 << 0)
+#define CREATE_EXEC_QUEUES	(1 << 1)
 static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int fd, i;
 
 	fd = xe_eudebug_client_open_driver(c);
+	xe_device_get(fd);
 
 	if (c->flags & CREATE_VMS) {
 		const uint32_t flags[] = {
@@ -39,6 +42,51 @@ static void run_basic_client(struct xe_eudebug_client *c)
 			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
 	}
 
+	if (c->flags & CREATE_EXEC_QUEUES) {
+		struct drm_xe_exec_queue_create *create;
+		struct drm_xe_engine_class_instance *hwe;
+		struct drm_xe_engine_class_instance bind_sync = {
+			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+			.engine_instance = 0,
+		};
+		struct drm_xe_engine_class_instance bind_async = {
+			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+			.engine_instance = 0,
+		};
+		uint32_t vm;
+
+		create = calloc((xe_number_engines(fd) + 2), sizeof(*create));
+
+		vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+
+		i = 0;
+		xe_for_each_engine(fd, hwe) {
+			create[i].instances = to_user_pointer(hwe);
+			create[i].vm_id = vm;
+			create[i].width = 1;
+			create[i].num_placements = 1;
+			xe_eudebug_client_exec_queue_create(c, fd, &create[i++]);
+		}
+
+		create[i].instances = to_user_pointer(&bind_sync),
+		create[i].vm_id = vm;
+		create[i].width = 1,
+		create[i].num_placements = 1,
+		xe_eudebug_client_exec_queue_create(c, fd, &create[i++]);
+
+		create[i].instances = to_user_pointer(&bind_async),
+		create[i].vm_id = vm;
+		create[i].width = 1,
+		create[i].num_placements = 1,
+		xe_eudebug_client_exec_queue_create(c, fd, &create[i]);
+
+		for (; i >= 0; i--)
+			xe_eudebug_client_exec_queue_destroy(c, fd, &create[i]);
+
+		xe_eudebug_client_vm_destroy(c, fd,  vm);
+	}
+
+	xe_device_put(fd);
 	xe_eudebug_client_close_driver(c, fd);
 }
 
@@ -253,11 +301,16 @@ static void test_read_event(int fd)
  * SUBTEST: multiple-sessions
  * Description:
  *	Simultaneously attach many debuggers to many processes.
- *	Each process opens and closes xe drm client.
+ *	Each process opens and closes xe drm client and creates few resources.
  *
- * SUBTEST: basic-vms
+ * SUBTEST: basic-%s
  * Description:
- *	Attach the debugger to process which creates and destroys a few vms.
+ *	Attach the debugger to process which creates and destroys a few %arg[1].
+ *
+ * arg[1]:
+ *
+ * @vms: vms
+ * @exec-queues: exec queues
  */
 
 static void test_basic_sessions(int fd, unsigned int flags, int count)
@@ -548,11 +601,14 @@ igt_main
 		test_basic_sessions(fd, 0, 1);
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, CREATE_VMS, 4);
+		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4);
 
 	igt_subtest("basic-vms")
 		test_basic_sessions(fd, CREATE_VMS, 1);
 
+	igt_subtest("basic-exec-queues")
+		test_basic_sessions(fd, CREATE_EXEC_QUEUES, 1);
+
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
-- 
2.34.1


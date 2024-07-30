Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF6C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392910E513;
	Tue, 30 Jul 2024 11:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScmHeLZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369210E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340086; x=1753876086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OzlzDVl708InOWPoXpQHm8uYfjJ4Q1sR7cGQp+APL5Y=;
 b=ScmHeLZD0iRSj/1LMuE8dMs7tmygD29tG6rDvTO7EUrzqIbMPNBwsbz3
 bzCIia/E+FtDme7AaM3KrgmK2VKdi/gDnhoI7otzbQ6GpZHLUuvo7E4Xh
 Kdf/CA2muVT4SHZmCJek6yyhptD7LvKOAPzzSTfjGAu0CEk7tmdgqD52k
 35VbLjtB/KjuNEAoeBwmApWClkbubIBUqc3aoHlMph2wHIG5ocbcTq79H
 aPAJKa3a3w8IqBNttbuvbLR/b2LsgnpxszVzoHgI5/IEbxv9RkZrmxukw
 1sf5NxkDP8c354mNBugTuRlR6hJ0iwYqV3eu9JqflhGADCjE29hMoD0hp Q==;
X-CSE-ConnectionGUID: NeqlaNp+SSK3KZC0Pe0vaw==
X-CSE-MsgGUID: 2r4EzCJPTiqHD3w7XYwdkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937325"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:06 -0700
X-CSE-ConnectionGUID: 25yrN55NStWeDjS/QQGZtw==
X-CSE-MsgGUID: 13c8irj8SOytLU00rcm3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216880"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:02 -0700
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
Subject: [PATCH i-g-t v2 28/66] tests/xe_eudebug: Add basic-client-th test
Date: Tue, 30 Jul 2024 13:44:45 +0200
Message-Id: <20240730114523.334156-29-christoph.manszewski@intel.com>
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

From: Pawel Sikora <pawel.sikora@intel.com>

Add basic-client-th test which is a multithreaded version of basic-client.

Create random number of VMs in random number of threads.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index ab856727e..022b39f1f 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -13,6 +13,7 @@
  */
 
 #include <poll.h>
+#include <pthread.h>
 #include <sys/ioctl.h>
 
 #include "igt.h"
@@ -640,6 +641,10 @@ static void test_read_event(int fd)
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client.
  *
+ * SUBTEST: basic-client-th
+ * Description:
+ *	Create client basic resources (vms) in multiple threads
+ *
  * SUBTEST: multiple-sessions
  * Description:
  *	Simultaneously attach many debuggers to many processes.
@@ -1057,6 +1062,75 @@ static void test_client_with_trigger(int fd, unsigned int flags, int count,
 		xe_eudebug_session_destroy(s[i]);
 }
 
+struct thread_fn_args {
+	struct xe_eudebug_client *client;
+	int fd;
+};
+
+static void *basic_client_th(void *data)
+{
+	struct thread_fn_args *f = data;
+	struct xe_eudebug_client *c = f->client;
+	uint32_t *vms;
+	int fd, i, num_vms;
+
+	fd = f->fd;
+	igt_assert(fd);
+
+	xe_device_get(fd);
+
+	num_vms = 2 + rand() % 16;
+	vms = calloc(num_vms, sizeof(*vms));
+	igt_assert(vms);
+	igt_debug("Create %d client vms\n", num_vms);
+
+	for (i = 0; i < num_vms; i++)
+		vms[i] = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+
+	for (i = 0; i < num_vms; i++)
+		xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+
+	xe_device_put(fd);
+	free(vms);
+
+	return NULL;
+}
+
+static void run_basic_client_th(struct xe_eudebug_client *c)
+{
+	struct thread_fn_args *args;
+	int i, num_threads, fd;
+	pthread_t *threads;
+
+	args = calloc(1, sizeof(*args));
+	igt_assert(args);
+
+	num_threads = 2 + random() % 16;
+	igt_debug("Run on %d threads\n", num_threads);
+	threads = calloc(num_threads, sizeof(*threads));
+	igt_assert(threads);
+
+	fd = xe_eudebug_client_open_driver(c);
+	args->client = c;
+	args->fd = fd;
+
+	for (i = 0; i < num_threads; i++)
+		pthread_create(&threads[i], NULL, basic_client_th, args);
+
+	for (i = 0; i < num_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	xe_eudebug_client_close_driver(c, fd);
+	free(args);
+	free(threads);
+}
+
+static void test_basic_sessions_th(int fd, unsigned int flags, int num_clients, bool match_opposite)
+{
+	test_client_with_trigger(fd, flags, num_clients, run_basic_client_th,
+					 0, NULL, NULL, match_opposite, 0);
+}
+
 static void vm_access_client(struct xe_eudebug_client *c)
 {
 	struct drm_xe_sync sync = {
@@ -1469,6 +1543,9 @@ igt_main
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1, true);
 
+	igt_subtest("basic-client-th")
+		test_basic_sessions_th(fd, 0, 1, true);
+
 	igt_subtest("basic-vm-access")
 		test_vm_access(fd, 0, 1);
 
-- 
2.34.1


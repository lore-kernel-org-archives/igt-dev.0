Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3F1C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A8710E425;
	Mon, 29 Jul 2024 16:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mg35bRGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1A10E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269031; x=1753805031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SS08jJlHfDBhScJtqwsvsnZhyrjOsi1//NkjQ/MQbcI=;
 b=Mg35bRGwmwbZW/swm2pVsokfEr9Evy13MXvFBqjlKtq2IgC2FDX6ruTm
 frLJy4AwflkqM5oQ98mQo07Obk7Ncnry7A8gxi+2iHsZWGzVGJPahFm03
 JfLefE1bfi4mYlNwvHEs4YNdDH474iX3MBFRATZtkpYRrIlzzn1jGDNnl
 QlX61E9uQT5HylMuXgOob7Wkd8f/5rRsdg5yiLQnA8Gyfw/rNVaH+zqqU
 Spg/umREA/R/VYMB3eh3qKmzcHpPOPnYpW4quYvGDqAYMF6Qu8Wt5Nqne
 gLCUfjnEy+rCjcpH2m4dlkF/w69R4U7MXEDp2W0ouDx3yoe+wPpgZQsTV w==;
X-CSE-ConnectionGUID: y8mx/VinR8SoVQojhLZ9fg==
X-CSE-MsgGUID: jkk+PTDoRbi+1r1YRMNjuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427146"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:51 -0700
X-CSE-ConnectionGUID: hIgrQkxASTKPHRrtQS1YRg==
X-CSE-MsgGUID: maEWav34TUekuDSMeypxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738119"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:48 -0700
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
Subject: [PATCH 28/66] tests/xe_eudebug: Add basic-client-th test
Date: Mon, 29 Jul 2024 18:01:21 +0200
Message-Id: <20240729160159.37036-29-christoph.manszewski@intel.com>
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

From: Pawel Sikora <pawel.sikora@intel.com>

Add basic-client-th test which is a multithreaded version of basic-client.

Create random number of VMs in random number of threads.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 78 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 37b4f4e27..022b39f1f 100644
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
@@ -669,6 +674,7 @@ static void test_read_event(int fd)
  * @vms: vms
  * @exec-queues: exec queues
  */
+
 static void test_basic_sessions(int fd, unsigned int flags, int count, bool match_opposite)
 {
 	struct xe_eudebug_session **s;
@@ -1056,6 +1062,75 @@ static void test_client_with_trigger(int fd, unsigned int flags, int count,
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
@@ -1468,6 +1543,9 @@ igt_main
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1, true);
 
+	igt_subtest("basic-client-th")
+		test_basic_sessions_th(fd, 0, 1, true);
+
 	igt_subtest("basic-vm-access")
 		test_vm_access(fd, 0, 1);
 
-- 
2.34.1


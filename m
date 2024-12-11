Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BDE77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3453310EB58;
	Wed, 11 Dec 2024 13:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ei2MiQWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A57F10EB56
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733925058; x=1765461058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKJpQhAuoIdi39JxOZG2fZc2VeJisLYsxGw168blFr4=;
 b=ei2MiQWdJTI1Vi5eA84AQrDHg8LGG7jd6/bEUCtqV8SshBEqPR6wUpRS
 Y6iQZUDjuu5a8rYfUQd+vqAyVUvj8DNWmCM4grXF12KxpFEeTyPUZAesg
 gYYe8/0NLuTeRhj93RxRtiAy6xhcW89Fv5Uy46FFdaRXtx4GUw95aX025
 aTfETsS0O/A2IMGHmKXH5KqxogG60ClWp/vU0GZXt1V/yRDJw6ianrJuL
 J5jP2cIl+WsosebPgDsDZOtLF/9tgDdE7e2HWjhL8kgSBuITBZ+yXnyfC
 M/LI6Ul9OTLP9K5mM3SDF2AShCcudwRasZytflD3fKjb6b4kcSm+UrvQL w==;
X-CSE-ConnectionGUID: 2aFKFSiSSYCv8aa41Qc83w==
X-CSE-MsgGUID: v+tq9bwLRxWEsZzok421Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44913427"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="44913427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:58 -0800
X-CSE-ConnectionGUID: N84Qrlr1Rtys+qIhnSkjJw==
X-CSE-MsgGUID: WUJS4kvEQcGL4S8qfN7A/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100870296"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:56 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
Date: Wed, 11 Dec 2024 14:50:39 +0100
Message-Id: <20241211135039.5853-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
References: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
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

Add a test that gives user fence in application, holds it, sends SIGINT
to client and checks if anything breaks.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
v2:
- Cleanup after the client in basic-vm-bind-ufence-sigint-client,
  merge the test into test_basic_ufence
---
 tests/intel/xe_eudebug.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 77ce905f0..c543eb064 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -65,6 +65,7 @@ static void test_sysfs_toggle(int fd)
 #define EXEC_QUEUES_PLACEMENTS		(1 << 8)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
 #define VM_BIND_UFENCE_RECONNECT	(1 << 10)
+#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 11)
 #define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
@@ -2135,6 +2136,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * Description:
  *	Give user fence in application, hold it, drop the debugger connection and check if anything
  *	breaks. Expect that held acks are released when connection is dropped.
+ *
+ * SUBTEST: basic-vm-bind-ufence-sigint-client
+ * Description:
+ *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
  */
 static void test_basic_ufence(int fd, unsigned int flags)
 {
@@ -2164,6 +2169,14 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	if (flags & VM_BIND_DELAY_UFENCE_ACK)
 		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
 
+	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
+		kill(c->pid, SIGINT);
+		c->pid = 0;
+		xe_eudebug_debugger_stop_worker(d, 1);
+		xe_eudebug_event_log_print(d->log, true);
+		goto end;
+	}
+
 	if (flags & VM_BIND_UFENCE_RECONNECT) {
 		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
 				XE_EUDEBUG_FILTER_EVENT_OPEN;
@@ -2181,6 +2194,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 
 	xe_eudebug_session_check(s, true, filter);
 
+end:
 	xe_eudebug_session_destroy(s);
 	ufence_priv_destroy(priv);
 }
@@ -2842,6 +2856,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-reconnect")
 		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
 
+	igt_subtest("basic-vm-bind-ufence-sigint-client")
+		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1


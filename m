Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE56CE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C25910EB51;
	Wed, 11 Dec 2024 13:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgCYSdZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB07710EB51
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733925056; x=1765461056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rG8yfuUWRLJ6JgmrIFoK5nJ4ybaMuY4cfyG5gCVWdco=;
 b=UgCYSdZpTCP2oSuorPKLpA66E3GIcZEei1O2n1xyekXTYmFKi4huesPg
 m6Ez7DZxlUHgNLxzlnSG+3WoXoPKwLqsDZXY5j1g9llG11O1MxYWZJyw9
 l065AjqFAp7CTAZKqYeeZ6n4iuneJL2LSYd6hRTHx1KwgIYYGeyryXpk+
 5IfBrKGVHNKq3kPwA3UwpkHZ3sEfuF7Nxa2Qped3ezjRh9P/Dnlm+CqH1
 7iLy5SZZsd2bcO1FLUdE7AVnBXwWub+eTXZG4TdS7Q/boMhjEJ061VztX
 UZF7+2DgdNecu74JUJvbmhz7+C4qAw4D1t421sje94eY6k2gz2iwmvC2Y A==;
X-CSE-ConnectionGUID: jP3fRrnOT8SsJfByr9mKqQ==
X-CSE-MsgGUID: rDyLOzygSXCaJR38B+GwMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44913426"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="44913426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:56 -0800
X-CSE-ConnectionGUID: ZxSr+/bRS+ybOamsboDxQA==
X-CSE-MsgGUID: KhFVPPnFR02h8sauxZmj2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100870280"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:54 -0800
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
Subject: [PATCH v2 i-g-t 2/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-reconnect test
Date: Wed, 11 Dec 2024 14:50:38 +0100
Message-Id: <20241211135039.5853-3-dominik.karol.piatkowski@intel.com>
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

Add a test that gives user fence in application, holds it, drops the
debugger connection and checks if anything breaks. It is expected that
held acks are released when connection is dropped.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
v2:
- Rename basic-vm-bind-drop-debugger-before-ufence-ack to
  basic-vm-bind-ufence-reconnect and merge it into test_basic_ufence
---
 tests/intel/xe_eudebug.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1853dee40..77ce905f0 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_OP_MAP_USERPTR		(1 << 7)
 #define EXEC_QUEUES_PLACEMENTS		(1 << 8)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
+#define VM_BIND_UFENCE_RECONNECT	(1 << 10)
 #define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
@@ -2129,6 +2130,11 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * SUBTEST: basic-vm-bind-ufence-delay-ack
  * Description:
  *	Give user fence in application and check if delayed ufence ack works
+ *
+ * SUBTEST: basic-vm-bind-ufence-reconnect
+ * Description:
+ *	Give user fence in application, hold it, drop the debugger connection and check if anything
+ *	breaks. Expect that held acks are released when connection is dropped.
  */
 static void test_basic_ufence(int fd, unsigned int flags)
 {
@@ -2136,6 +2142,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *c;
 	struct ufence_priv *priv;
+	uint32_t filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE;
 
 	priv = ufence_priv_create();
 	s = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
@@ -2157,7 +2164,14 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	if (flags & VM_BIND_DELAY_UFENCE_ACK)
 		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
 
-	ack_fences(d);
+	if (flags & VM_BIND_UFENCE_RECONNECT) {
+		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
+				XE_EUDEBUG_FILTER_EVENT_OPEN;
+		xe_eudebug_debugger_detach(d);
+		sleep(1);
+		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	} else
+		ack_fences(d);
 
 	xe_eudebug_client_wait_done(c);
 	xe_eudebug_debugger_stop_worker(d, 1);
@@ -2165,7 +2179,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_event_log_print(d->log, true);
 	xe_eudebug_event_log_print(c->log, true);
 
-	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+	xe_eudebug_session_check(s, true, filter);
 
 	xe_eudebug_session_destroy(s);
 	ufence_priv_destroy(priv);
@@ -2825,6 +2839,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-delay-ack")
 		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
 
+	igt_subtest("basic-vm-bind-ufence-reconnect")
+		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1


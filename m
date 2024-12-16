Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577AEE77183
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 13:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BF610E690;
	Mon, 16 Dec 2024 13:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN66kLOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E197E10E690
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734356999; x=1765892999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TSzwPqHxNswEF2Fnp9+/pTBek0JkjOh6D+YKOWAD5+Q=;
 b=eN66kLOiTmAr9DE0ghzy41JZ01PmzdZ9AsBe4vesHAND+LgsJ4nxa1Uo
 8jsdreIvt2UABIJ2cmZgHwP6yF9GYlJQWZmbszXVEkRIVOPc7K3PhUd9C
 +pYcgc4hRK7uqy1QSptFrwILItRe3vb26UNBvx00etAeH5qIcskJfsmio
 M1PhQhgNoT931kU3muDB/rwC5IZVqHvQxTiGA7ww1V/eEzQ08EWx5JnA3
 yRJg4AgWTbkUaL8Sk/i55w3WExAXC1ImotAhv1Onq+GzuCbhgrgICAr9M
 8V7Zs5n8wCAwCYFUhsW1bXW3U3uHzLOPSYXWXr7oXKmmvfPFPoPDsJTyB g==;
X-CSE-ConnectionGUID: R5OaixSRSZ+qLjMjMWdQeQ==
X-CSE-MsgGUID: sfEqQRjnRKexURbh5uNxNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34061392"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34061392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:49:59 -0800
X-CSE-ConnectionGUID: ECMCi6ihT9mML9nFv9OdoA==
X-CSE-MsgGUID: InJZwb3ZTLar3S2Cz0yECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128191908"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:49:57 -0800
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
Subject: [PATCH v3 i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
Date: Mon, 16 Dec 2024 14:49:37 +0100
Message-Id: <20241216134937.6136-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
References: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
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
v3:
- Get rid of goto
---
 tests/intel/xe_eudebug.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 8965e7f9d..cce5b847c 100644
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
@@ -2164,7 +2169,12 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	if (flags & VM_BIND_DELAY_UFENCE_ACK)
 		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
 
-	if (flags & VM_BIND_UFENCE_RECONNECT) {
+	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
+		filter = XE_EUDEBUG_FILTER_ALL;
+		kill(c->pid, SIGINT);
+		c->pid = 0;
+		c->done = 1;
+	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
 		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
 				XE_EUDEBUG_FILTER_EVENT_OPEN;
 		xe_eudebug_debugger_detach(d);
@@ -2843,6 +2853,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence-reconnect")
 		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
 
+	igt_subtest("basic-vm-bind-ufence-sigint-client")
+		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1


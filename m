Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEDFC9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4B610E3C8;
	Mon, 12 Jan 2026 13:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqbS5dEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10B10E3CC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222845; x=1799758845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fw7SsetxXtSzu0GRxB2IMlF2W4RfBM39EoYFdSAhd1A=;
 b=VqbS5dEEV1tngGh8/oFwPi0rXQDC4EkicrOnxPMiPQTUt5PqrzUXqPi2
 k+8YOlAJyLPjwzDKwQk2xnIXJxAJsTqvmrbGD7RDNS7SQe+nUY4BVazDk
 /qwcVHPxByzROILpgbzz9GDHIr6YcEvPd94mQ5xRPPS8LKZRrtNDE77MS
 R+72IxNu7a6K8M6kgGDOa1Hpmpokz3HHDFCfDnPW7bf5R7twrAqPvdQD4
 1kzNqt/cidYzzUIt9ibgTGYvgAeOLVC1SXOsOwgcckUUpZrIIK2/qD6VN
 w2DP+2oUhm3dfaMAfR9ysqZID21s9wBLURWC73owaC+7iED2G4bU954E0 g==;
X-CSE-ConnectionGUID: Zcz8YtMERUamVlM2Tbp8ag==
X-CSE-MsgGUID: Lo1hNSevTaG2pUWLmt9IWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545538"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:45 -0800
X-CSE-ConnectionGUID: rg+/Hp3DRv6SYxuy/pZQlQ==
X-CSE-MsgGUID: a5pI4JcHQNSjWBJf1H1Z5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094979"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 09/21] tests/intel/xe_eudebug: Mold ufence reconnect
 test to disconnect
Date: Mon, 12 Jan 2026 14:59:55 +0200
Message-ID: <20260112130008.1649357-10-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

If debugger disconnects, the driver will automatically ack all
ufences as we have 1:1 mapping between debuggers and drm clients.

In old way of connecting, reconnecting test made sense but it
does not anymore.

Convert the test to just disconnect the debugger.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1bb30a1cad..353828f673 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -63,7 +63,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_EXTENDED		(1 << 5)
 #define VM_BIND_OP_MAP_USERPTR		(1 << 6)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 7)
-#define VM_BIND_UFENCE_RECONNECT	(1 << 8)
+#define VM_BIND_UFENCE_DISCONNECT	(1 << 8)
 #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 9)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
@@ -1920,7 +1920,7 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * Description:
  *	Give user fence in application and check if delayed ufence ack works
  *
- * SUBTEST: basic-vm-bind-ufence-reconnect
+ * SUBTEST: basic-vm-bind-ufence-disconnect
  * Functionality: VM bind event
  * Description:
  *	Give user fence in application, hold it, drop the debugger connection and check if anything
@@ -1964,11 +1964,9 @@ static void test_basic_ufence(int fd, unsigned int flags)
 		kill(c->pid, SIGINT);
 		c->pid = 0;
 		c->done = 1;
-	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
-		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM;
-		xe_eudebug_debugger_detach(d);
-		xe_eudebug_client_wait_done(c);
-		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	} else if (flags & VM_BIND_UFENCE_DISCONNECT) {
+		filter = XE_EUDEBUG_FILTER_ALL;
+		close(s->debugger->fd);
 	} else {
 		ack_fences(d);
 	}
@@ -2648,8 +2646,8 @@ int igt_main()
 	igt_subtest("basic-vm-bind-ufence-delay-ack")
 		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
 
-	igt_subtest("basic-vm-bind-ufence-reconnect")
-		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
+	igt_subtest("basic-vm-bind-ufence-disconnect")
+		test_basic_ufence(fd, VM_BIND_UFENCE_DISCONNECT);
 
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
 		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
-- 
2.43.0


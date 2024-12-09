Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE99E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1765710E740;
	Mon,  9 Dec 2024 14:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIkLTEpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC80210E740
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753678; x=1765289678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhLoVxFalA0d1V1LdpEEXWuxo6DLa0LPDUkdeu3W8bc=;
 b=PIkLTEpnt2da+7u/cnEhwVg7uuoZwUhD0tPpEojjzcSHyrJJzXZYkiUf
 KPondcyJRFKDFdXZ3Ky6eEd3v/ZzbbRdgffbfqtGmy3actZYqLT1D/VXF
 uMdeFxxLVrXLK+gC2wRCeVQDIO84wi2f+ZA6w+bJWOaDoZ55GmqOghkKu
 choK9q3yqqEcZBoRxth0YsME4ErtXV8o4wY5JQ8WjJcF3Yn4oQgTqeSQg
 JdXK0Sb5/YNo7ERuJXuRra14gGX4l4/VaInq5EDMzu2tf3CP3dpbAHg3y
 OpUdVKN8T0LwCivTpzlNBdMUMQnsfxhnHHHYxX/PBj8OPcDbh28aD70I9 w==;
X-CSE-ConnectionGUID: 9P7T0dw7Q2SRH73nw3s08A==
X-CSE-MsgGUID: SrhV0/kATKSV16Vwhgxhnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34187313"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34187313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:37 -0800
X-CSE-ConnectionGUID: c6IG6B7ST3W2j2EvimAcxQ==
X-CSE-MsgGUID: J4NMpoZUQFqGUghxjvlUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95544033"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.170])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:14:36 -0800
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
Subject: [PATCH i-g-t 1/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-delay-ack test
Date: Mon,  9 Dec 2024 15:13:57 +0100
Message-Id: <20241209141359.5738-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
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

Add a test that gives user fence in application and checks if delayed
ufence ack works.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 39db16457..1853dee40 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -54,16 +54,17 @@ static void test_sysfs_toggle(int fd)
 #define STAGE_PRE_DEBUG_RESOURCES_DONE	1
 #define STAGE_DISCOVERY_DONE		2
 
-#define CREATE_VMS		(1 << 0)
-#define CREATE_EXEC_QUEUES	(1 << 1)
-#define VM_BIND			(1 << 2)
-#define VM_BIND_VM_DESTROY	(1 << 3)
-#define VM_BIND_EXTENDED	(1 << 4)
-#define VM_METADATA		(1 << 5)
-#define VM_BIND_METADATA	(1 << 6)
-#define VM_BIND_OP_MAP_USERPTR	(1 << 7)
-#define EXEC_QUEUES_PLACEMENTS	(1 << 8)
-#define TEST_DISCOVERY		(1 << 31)
+#define CREATE_VMS			(1 << 0)
+#define CREATE_EXEC_QUEUES		(1 << 1)
+#define VM_BIND				(1 << 2)
+#define VM_BIND_VM_DESTROY		(1 << 3)
+#define VM_BIND_EXTENDED		(1 << 4)
+#define VM_METADATA			(1 << 5)
+#define VM_BIND_METADATA		(1 << 6)
+#define VM_BIND_OP_MAP_USERPTR		(1 << 7)
+#define EXEC_QUEUES_PLACEMENTS		(1 << 8)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
+#define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
 #define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
@@ -2124,6 +2125,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * SUBTEST: basic-vm-bind-ufence
  * Description:
  *      Give user fence in application and check if ufence ack works
+ *
+ * SUBTEST: basic-vm-bind-ufence-delay-ack
+ * Description:
+ *	Give user fence in application and check if delayed ufence ack works
  */
 static void test_basic_ufence(int fd, unsigned int flags)
 {
@@ -2148,6 +2153,10 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
 	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
 			    "missing ufence events\n");
+
+	if (flags & VM_BIND_DELAY_UFENCE_ACK)
+		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+
 	ack_fences(d);
 
 	xe_eudebug_client_wait_done(c);
@@ -2813,6 +2822,9 @@ igt_main
 	igt_subtest("basic-vm-bind-ufence")
 		test_basic_ufence(fd, 0);
 
+	igt_subtest("basic-vm-bind-ufence-delay-ack")
+		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
+
 	igt_subtest("vma-ufence")
 		test_vma_ufence(fd, 0);
 
-- 
2.34.1


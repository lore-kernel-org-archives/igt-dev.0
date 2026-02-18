Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D2DE9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D710E5E2;
	Wed, 18 Feb 2026 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAGolDuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BAE10E5D8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428895; x=1802964895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dVc32aLd6bV1SQnLgT1hcgkS0DHsMBazPliiMmqcjL4=;
 b=iAGolDuyh4XAtJzfBiYFjwnfE0klxnvyN2VWYUFzMAusLd7Hmqpgteh6
 5pVa83rf3ILRKNo5BrpU0aukScZf8RdcAKf7i5KYOKFUPJ2CSGfO1QILK
 LpgXX2lc4caujUYctfbA7cqJibl2M6ygtcVr0gk/3oWqu/7xeSTI58uDJ
 TyGfBJxW+nhF1zsTKibMyrJkSl77BFw52vKQjAOJzrMv2mag7Kc5jyuVD
 WFA67CoJaIx3gCQ5QmBDnIjJqXuBaCqRU4RNjb4qILAFHZRfTZ4HXIian
 nDrymTQ2Qm7s1KS63tpJZUnUxSi2WYEvadSjJ8FDqKncvuKCH4ULrUffy A==;
X-CSE-ConnectionGUID: 9Zwck7r1SY2Na5q+HJICIw==
X-CSE-MsgGUID: 7pq7hzxnQU6uRSJgYx4HSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76342351"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="76342351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:34:55 -0800
X-CSE-ConnectionGUID: buikA6iHREu8bD67uP11wA==
X-CSE-MsgGUID: SafISbrwTYarsqFoeFWQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212309489"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:34:53 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH i-g-t] panthor: Enable compilation on big-endian arch
Date: Wed, 18 Feb 2026 16:34:44 +0100
Message-ID: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Compilation of Panthor was broken on big-endian due to a guard in
pathor lib against such arch. Fix this and create and use a macro
for skipping all panthor tests on such machines.

Also while at it, init fd so it could be safely used at last
fixture.

Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_panthor.c             | 17 +++++++++++++++++
 lib/igt_panthor.h             |  6 ++----
 tests/panthor/panthor_gem.c   |  3 ++-
 tests/panthor/panthor_group.c |  3 ++-
 tests/panthor/panthor_query.c |  3 ++-
 tests/panthor/panthor_vm.c    |  3 ++-
 6 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 49b427d4f..cf065352d 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -6,6 +6,23 @@
 #include "ioctl_wrappers.h"
 #include "panthor_drm.h"
 
+/**
+ * igt_panthor_skip_on_big_endian:
+ *
+ * Skip Panthor test on bing-endian machines.
+ */
+void igt_panthor_skip_on_big_endian(void)
+{
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+ #define IGT_PANTHOR_ON_BIG_ENDIAN 1
+#else
+ #define IGT_PANTHOR_ON_BIG_ENDIAN 0
+#endif
+
+	igt_skip_on_f(IGT_PANTHOR_ON_BIG_ENDIAN, "Panthor is unsupported on big-endian arch\n");
+#undef IGT_PANTHOR_ON_BIG_ENDIAN
+}
+
 /**
  * igt_panthor_group_create:
  * @fd: device file descriptor
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index 97a2b7497..be8490840 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -61,11 +61,9 @@ enum cs_flush_mode {
 };
 
 /* There's no plan to support big endian in the UMD, so keep
- * things simple and don't bother supporting it here either.
+ * things simple and don't bother supporting it.
  */
-#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-#error "big endian not supported"
-#endif
+void igt_panthor_skip_on_big_endian(void);
 
 struct cs_instr {
 	union {
diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
index 57ba4bc82..6388addb0 100644
--- a/tests/panthor/panthor_gem.c
+++ b/tests/panthor/panthor_gem.c
@@ -8,9 +8,10 @@
 #include "igt_panthor.h"
 
 int igt_main() {
-	int fd;
+	int fd = -1;
 
 	igt_fixture() {
+		igt_panthor_skip_on_big_endian();
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
index 13636e60c..c79f8d629 100644
--- a/tests/panthor/panthor_group.c
+++ b/tests/panthor/panthor_group.c
@@ -41,9 +41,10 @@ issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
 }
 
 int igt_main() {
-	int fd;
+	int fd = -1;
 
 	igt_fixture() {
+		igt_panthor_skip_on_big_endian();
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
index fa4f8ef26..afd58a5bd 100644
--- a/tests/panthor/panthor_query.c
+++ b/tests/panthor/panthor_query.c
@@ -8,9 +8,10 @@
 #include <stdint.h>
 
 int igt_main() {
-	int fd;
+	int fd = -1;
 
 	igt_fixture() {
+		igt_panthor_skip_on_big_endian();
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 76a669843..92b105b9e 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -7,9 +7,10 @@
 #include "panthor_drm.h"
 
 int igt_main() {
-	int fd;
+	int fd = -1;
 
 	igt_fixture() {
+		igt_panthor_skip_on_big_endian();
 		fd = drm_open_driver(DRIVER_PANTHOR);
 	}
 
-- 
2.53.0


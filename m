Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C342E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 15:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F6F10E52A;
	Thu, 19 Feb 2026 15:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLEEVLoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8EB10E52A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771513533; x=1803049533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9n8V5bOcMoH+Bh7chzvD1xKcQa/EiJSv47uZg4INDco=;
 b=GLEEVLoX8yo66lgQrpXN7yZmCMWHZG+V8pPPpOWWkLFjkGJk3zawmQpP
 vVMy+0M18rczw+1BHeXa6KmZupwcGmkm5p1iOqjLfU1uafO0rK+1lpVQD
 eF0QEEcFEcJaRXIpFpYczLAk/VmJKY1rFQWIvs4eX5kKLvBWvaG73u2Z8
 JjI2u4Fq5JMH8Rzycn3kK6jxDBB2Ar+tx/bui0Pw4CDsL/7BcNVE94hkP
 6snijKvIjj43+lGX5iZcLg9MIPfIM+Y5q6ge006Z0W1wc08JPAhL7wbqB
 O7WwyrRijPVGtzuAOPuPYTjFg/mffAhAEiqPLhN3p1506BvYoZI3lARyy w==;
X-CSE-ConnectionGUID: IO6HQ7jdT+GImL0Rn8jEVw==
X-CSE-MsgGUID: ZM24b/C4Tme56PjZaYf+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71801565"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71801565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:05:32 -0800
X-CSE-ConnectionGUID: RBhr9vohSrmIDN55JogkWg==
X-CSE-MsgGUID: u0WQbwHMR1yq4CpOAYSLIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213774495"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.153])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:05:31 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH i-g-t v2] panthor: Enable compilation on big-endian arch
Date: Thu, 19 Feb 2026 16:05:24 +0100
Message-ID: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
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
pathor lib against such arch. Fix this and create and use
function for skipping all panthor tests on such machines.

Also while at it, init fd so it could be safely used at last
fixture.

v2: simplify test for big-endian, fix typo (Boris)

Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_panthor.c             | 11 +++++++++++
 lib/igt_panthor.h             |  6 ++----
 tests/panthor/panthor_gem.c   |  3 ++-
 tests/panthor/panthor_group.c |  3 ++-
 tests/panthor/panthor_query.c |  3 ++-
 tests/panthor/panthor_vm.c    |  3 ++-
 6 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 49b427d4f..7ffb61eb3 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -6,6 +6,17 @@
 #include "ioctl_wrappers.h"
 #include "panthor_drm.h"
 
+/**
+ * igt_panthor_skip_on_big_endian:
+ *
+ * Skip Panthor test on big-endian machines.
+ */
+void igt_panthor_skip_on_big_endian(void)
+{
+	igt_skip_on_f(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__,
+		      "Panthor is unsupported on big-endian arch\n");
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


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B13CC982C9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 23:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFA510E2DD;
	Wed, 16 Sep 2026 23:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MVt3RCSm";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDBB10E2DD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 22:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJzLMmO/q8W0ctEPBpEoq/fcTpKn7cZNnji61gK95fSGfRq1ob7y7+QDBHC9NQASq70YP99AxI+Sv/cCRcG9d6TpPbBdea4uIHNBi3pdfPqcbr06HHNcBfsadjjn/RoHduz3uaiiVJKY7d/TsX0we1JZakMb4SezaZk1itYecpbRe3At2UF2H1H/4ic7/HVbnxskqh7y/n32DZKoZ4XKyYi0MgbSpxNy7NxazepTw6sZY6XF+QPTxagdSkDGfqVV4TTeZ2RfqujwHXgUccDOXLwZeS4ac8nefLbH3LIx/JUTrekcv2cmbFOo6Q9o8siHPwgfhMUiMVlxrHVbyj7rvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8Mkir0Nqf5gr+1mzK/NQBVaLfyyGq0e4nz0TfkGWwo=;
 b=vjtVOSY1naNF/fuGK6xH/KFVJhM7mVtB9ZnZXN7zypFjM+8n9Skbrn7gUxQuJXN6draTfa/79BNBNa3QjBhjbChc2+XbVwQ3aYsE96FjonTMkh8tB0b4yUwAfyL3vO9gSvB/FwPkEgJsEVzsBeCtOsXN6eV2ungJgSzfbU5wXoH8ePF+46DgvbKuLJ6WUUaYlN/4hQO86B0jku9ergIeYUGF1KrjazDOeRLUpak94GPZ2BXHGgBHl6dBguskWcqWPpGuXiqSf2M9q5z28C/g6KHGi7vC5K3erbnFVS5mCrE/QmJ2RM2ZoVGVuoYEYqQNgiHnJrxkuAUwPoPFeONYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8Mkir0Nqf5gr+1mzK/NQBVaLfyyGq0e4nz0TfkGWwo=;
 b=MVt3RCSmRIoEAihJ2p5luMZgyYr1SatLLkPGd6IVM9tMvUyXXd/mOFo/Sk9cci41PEabO8qjnG1Pju8886EFjUK5pvp/yRq9XJNUH3ZRAD39PG0mZs+fInpVbwgeffEVnkm0xUMx29UzECh0/iwQ10BCNObBVj2hPTu4eFY0tek=
Received: from BLAPR03CA0148.namprd03.prod.outlook.com (2603:10b6:208:32e::33)
 by DS7PR12MB5957.namprd12.prod.outlook.com (2603:10b6:8:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 22:59:10 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::ae) by BLAPR03CA0148.outlook.office365.com
 (2603:10b6:208:32e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 22:59:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=temperror
 (sender IP is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 16 Sep 2026 22:59:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 17:59:08 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 17:59:07 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v1 1/2] lib/amdgpu: Add shared lockdep violation helpers
Date: Wed, 16 Sep 2026 18:58:46 -0400
Message-ID: <0f9b4a5fc9241fa2d7386aa935393b7e50d7c73e.1789597588.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789597588.git.vitaly.prosyak@amd.com>
References: <cover.1789597588.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DS7PR12MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a46299-4d79-458f-f54c-08df14461dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: eTo2W7xl7weGdlyNDVEBPAiv8IZqPRUmGGDaQJEMOGZ91ZPQ5IvWxeQtIYL8G1HhZhYgZxvivHkJIzIW/ygQvRU42y41Pyen1/M/eP1B1nZQp0CZ1wCUwyTT0V6Id7UJppIrfXq/iFmy0dJqa2IHTPQYXz/jVU13k9lf/vA9DgPtbHL06mTGvka6QfH7IOPTN0gkk+ckwqBPR5o8AHOdn73DKuvll223ClDvwpRhcZfnuQJRnVKeRA4VjooxTRczB/2EyE75fm84lE64b4dxCQtW3YIDCRyi7UkPrLnebpCuQwUMojfeA02D9pDIaMAk8C7cDbmnvf0ClvyoMoTgNkQ2xTI7kjougv+QibkH8xCh/r1zpf66b/6PnNXGSK6xspH5SMTiM9qQZvCqfVtzBm00njljGdIOq1Ow3VN3gpzfJiKkgmUgLmqCtypa+c3bSYR73M7Yg4gkDqEmNEWl54vVGpz8reZYGcF/mFUWULqO/I1bFr0U4myWKzh1ofEQBCG3BDdrKKpookuIpPSqWGnFPofshFKU+whLSo78JRxByNC7n3xpkp3H+xicx0XwBNYKium5eQPWXlA8ZUBgf73ogEL1KVMuDAGXJqnzUUi9tNgusAnscEagLKnlHzLpxJ1hSvAI170TE3+JLcN7keMm80IAG+TkvioRCsWuWJl8zKBI/RBAe1cH3NmNbp4ZA+7MPbe0LvAnxjy3ba1ldA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MfSkoW3RSR9dTu3POkAdVsALGt5E0cjexN32NmtaLyGEsriZWDmjDJKkHp+UVZNuAIB/e788RHzkq8p81lnQzEEL+wnHGPDcW3hPKfkFn/yqQwPbO+rYXRH9/OjlGfWLV38SqPhecD6TZhdXj8JEPNqjtX9IuPISfC/kjjyZnXr6S9RchI+dq7QdlD6kOQlPLcedl2jvZum327QeJ7WZrocDt/wGM9WzWfzRnrf03H+X1FglugNQ7Ns+nG4CAPN7A9nI7JoqTu/2KHGVz5hLToi1VHJILJB0svBrflD4aDoMLk9hhtJKMG8aoe0UFPZaB+zs7NQMnU6RuS7WPrUJ1E0F6gQAfkZr5x8zq1kqveOJVnE+3wGw7pDga9LXKh4v0JHLON6mxrLsWr2MmN3p4J8CJIof9SpCSC0llppd11O7pE2M17wl0SSSc12vl8hR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 22:59:08.8587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a46299-4d79-458f-f54c-08df14461dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5957
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Move the lockdep checking logic that was private to amd_lockdep
into the common amdgpu utility library.

This is a refactor only and makes no functional change to amd_lockdep.
The test still requires CONFIG_LOCKDEP through /proc/lockdep_stats,
opens /dev/kmsg at the start of each lockdep-sensitive subtest,
records the starting kernel taint state, and fails if a lockdep
splat or new TAINT_WARN appears.

The shared helpers keep the existing implementation details in one
place: lockdep availability detection, /dev/kmsg positioning,
lockdep-pattern scanning, and taint comparison. They also provide
begin/end helpers so other amdgpu tests can opt into the same
check without duplicating the /dev/kmsg and taint plumbing.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I02a487cf266df108deb794a93bb2c35c42d839ef
---
 lib/amdgpu/amd_utils.c     | 100 +++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_utils.h     |  14 +++++
 tests/amdgpu/amd_lockdep.c | 110 ++++---------------------------------
 3 files changed, 126 insertions(+), 98 deletions(-)

diff --git a/lib/amdgpu/amd_utils.c b/lib/amdgpu/amd_utils.c
index 644cd62a6..62af7f366 100644
--- a/lib/amdgpu/amd_utils.c
+++ b/lib/amdgpu/amd_utils.c
@@ -2,10 +2,24 @@
  * Copyright 2026 Advanced Micro Devices, Inc.
  */
 
+#include <fcntl.h>
 #include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+
 #include "igt.h"
+#include "igt_taints.h"
 #include "amd_utils.h"
 
+static const char * const lockdep_violation_patterns[] = {
+	"circular locking dependency",
+	"possible recursive locking detected",
+	"inconsistent lock state",
+	"possible circular locking dependency",
+	"WARNING: lock held when returning to user space",
+	NULL
+};
+
 /**
  * log_total_time - record start time and print total runtime
  * @enter: true to start timing, false to print and stop
@@ -45,3 +59,89 @@ void log_total_time(bool enter, const char *binary)
 	igt_kmsg("=== TOTAL (all subtests in %s binary): %" PRIu64 " min %" PRIu64 " sec ===\n",
 			binary, mins, secs);
 }
+
+bool amd_is_lockdep_enabled(void)
+{
+	return access("/proc/lockdep_stats", F_OK) == 0;
+}
+
+int amd_lockdep_kmsg_open(void)
+{
+	int fd;
+
+	fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+	if (fd < 0)
+		return -1;
+
+	lseek(fd, 0, SEEK_END);
+	return fd;
+}
+
+bool amd_lockdep_kmsg_has_violation(int kmsg_fd)
+{
+	char buf[4096];
+	ssize_t len;
+	int i;
+
+	if (kmsg_fd < 0)
+		return false;
+
+	while ((len = read(kmsg_fd, buf, sizeof(buf) - 1)) > 0) {
+		buf[len] = '\0';
+		for (i = 0; lockdep_violation_patterns[i]; i++) {
+			if (strstr(buf, lockdep_violation_patterns[i])) {
+				igt_warn("LOCKDEP VIOLATION: %s\n",
+					 lockdep_violation_patterns[i]);
+				igt_warn("  kmsg: %.200s\n", buf);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+void amd_assert_no_lockdep_violations(int kmsg_fd,
+				      unsigned long taint_before)
+{
+	unsigned long taints = 0;
+	bool violation;
+
+	violation = amd_lockdep_kmsg_has_violation(kmsg_fd);
+
+	igt_kernel_tainted(&taints);
+
+	if ((taints & ~taint_before) & (1ul << TAINT_WARN)) {
+		igt_warn("TAINT_WARN set during test - possible lockdep splat\n");
+		violation = true;
+	}
+
+	igt_assert_f(!violation,
+		     "Lockdep violation detected! Check dmesg for details.\n");
+}
+
+void amd_lockdep_begin(struct amd_lockdep_state *lockdep)
+{
+	lockdep->enabled = amd_is_lockdep_enabled();
+	lockdep->taint_before = 0;
+	lockdep->kmsg_fd = -1;
+
+	if (!lockdep->enabled)
+		return;
+
+	igt_kernel_tainted(&lockdep->taint_before);
+	lockdep->kmsg_fd = amd_lockdep_kmsg_open();
+	igt_assert_f(lockdep->kmsg_fd >= 0,
+		     "Failed to open /dev/kmsg for lockdep checking\n");
+}
+
+void amd_lockdep_end(struct amd_lockdep_state *lockdep)
+{
+	if (!lockdep->enabled)
+		return;
+
+	amd_assert_no_lockdep_violations(lockdep->kmsg_fd,
+					 lockdep->taint_before);
+	close(lockdep->kmsg_fd);
+	lockdep->kmsg_fd = -1;
+}
diff --git a/lib/amdgpu/amd_utils.h b/lib/amdgpu/amd_utils.h
index cbac5a642..1e33b1003 100644
--- a/lib/amdgpu/amd_utils.h
+++ b/lib/amdgpu/amd_utils.h
@@ -6,6 +6,12 @@
 
 #include <stdbool.h>
 
+struct amd_lockdep_state {
+	bool enabled;
+	unsigned long taint_before;
+	int kmsg_fd;
+};
+
 /**
 * log_total_time - record start time and print total runtime
 * @enter: true to start timing, false to print and stop
@@ -20,4 +26,12 @@
 */
 void log_total_time(bool enter, const char *binary);
 
+bool amd_is_lockdep_enabled(void);
+int amd_lockdep_kmsg_open(void);
+bool amd_lockdep_kmsg_has_violation(int kmsg_fd);
+void amd_assert_no_lockdep_violations(int kmsg_fd,
+				      unsigned long taint_before);
+void amd_lockdep_begin(struct amd_lockdep_state *lockdep);
+void amd_lockdep_end(struct amd_lockdep_state *lockdep);
+
 #endif
diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
index 5885c9df5..c48c73238 100644
--- a/tests/amdgpu/amd_lockdep.c
+++ b/tests/amdgpu/amd_lockdep.c
@@ -37,6 +37,7 @@
 #include "igt_taints.h"
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_utils.h"
 
 #define BO_SIZE (4 * 1024 * 1024)  /* 4MB */
 #define NUM_BOS 16
@@ -47,16 +48,6 @@
 #define USERPTR_BUF_SIZE (64ull * 1024 * 1024) /* 64 MiB */
 #define PAGEOUT_ITERATIONS 8
 
-/* kmsg patterns that indicate lockdep violations */
-static const char * const lockdep_violation_patterns[] = {
-	"circular locking dependency",
-	"possible recursive locking detected",
-	"inconsistent lock state",
-	"possible circular locking dependency",
-	"WARNING: lock held when returning to user space",
-	NULL
-};
-
 struct thread_data {
 	amdgpu_device_handle device;
 	int fd;
@@ -64,83 +55,6 @@ struct thread_data {
 	int iterations;
 };
 
-/*
- * Check if CONFIG_LOCKDEP is enabled on the running kernel by testing
- * for the existence of /proc/lockdep_stats (only present with lockdep).
- */
-static bool is_lockdep_enabled(void)
-{
-	return access("/proc/lockdep_stats", F_OK) == 0;
-}
-
-/*
- * Open /dev/kmsg and seek to end so we only read new messages.
- * Returns fd or -1 on failure.
- */
-static int kmsg_open(void)
-{
-	int fd;
-
-	fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
-	if (fd < 0)
-		return -1;
-
-	/* Seek to end - only read messages generated after this point */
-	lseek(fd, 0, SEEK_END);
-	return fd;
-}
-
-/*
- * Scan /dev/kmsg for lockdep violation patterns since the fd was opened.
- * Returns true if a violation was found.
- */
-static bool kmsg_has_lockdep_violation(int kmsg_fd)
-{
-	char buf[4096];
-	ssize_t len;
-	int i;
-
-	if (kmsg_fd < 0)
-		return false;
-
-	while ((len = read(kmsg_fd, buf, sizeof(buf) - 1)) > 0) {
-		buf[len] = '\0';
-		for (i = 0; lockdep_violation_patterns[i]; i++) {
-			if (strstr(buf, lockdep_violation_patterns[i])) {
-				igt_warn("LOCKDEP VIOLATION: %s\n",
-					 lockdep_violation_patterns[i]);
-				igt_warn("  kmsg: %.200s\n", buf);
-				return true;
-			}
-		}
-	}
-
-	return false;
-}
-
-/*
- * Assert no lockdep violations occurred.
- * Checks both kmsg patterns and kernel taint flags.
- */
-static void assert_no_lockdep_violations(int kmsg_fd, unsigned long taint_before)
-{
-	unsigned long taints = 0;
-	bool violation;
-
-	violation = kmsg_has_lockdep_violation(kmsg_fd);
-
-	igt_kernel_tainted(&taints);
-
-	/* Check for new taint bits that appeared during the test */
-	if ((taints & ~taint_before) & (1ul << TAINT_WARN)) {
-		igt_warn("TAINT_WARN set during test - possible lockdep splat\n");
-		violation = true;
-	}
-
-	igt_assert_f(!violation,
-		     "Lockdep violation detected! Check dmesg for details.\n");
-}
-
 /*
  * Helper: allocate and map a BO to exercise VRAM management locks
  */
@@ -338,7 +252,7 @@ static void test_concurrent_reset_and_submit(int fd, amdgpu_device_handle device
 	int kmsg_fd;
 
 	igt_kernel_tainted(&taint_before);
-	kmsg_fd = kmsg_open();
+	kmsg_fd = amd_lockdep_kmsg_open();
 
 	igt_info("Running concurrent reset + VRAM allocation for %d seconds\n",
 		 THREAD_RUNTIME_SEC);
@@ -357,7 +271,7 @@ static void test_concurrent_reset_and_submit(int fd, amdgpu_device_handle device
 	igt_info("  VRAM allocs: %d, Resets: %d\n",
 		 vram_data.iterations, reset_data.iterations);
 
-	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	amd_assert_no_lockdep_violations(kmsg_fd, taint_before);
 	close(kmsg_fd);
 }
 
@@ -376,7 +290,7 @@ static void test_concurrent_mmap_and_evict(int fd, amdgpu_device_handle device)
 	int kmsg_fd;
 
 	igt_kernel_tainted(&taint_before);
-	kmsg_fd = kmsg_open();
+	kmsg_fd = amd_lockdep_kmsg_open();
 
 	igt_info("Running concurrent mmap + VRAM pressure for %d seconds\n",
 		 THREAD_RUNTIME_SEC);
@@ -395,7 +309,7 @@ static void test_concurrent_mmap_and_evict(int fd, amdgpu_device_handle device)
 	igt_info("  mmap ops: %d, VRAM allocs: %d\n",
 		 mmap_data.iterations, vram_data.iterations);
 
-	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	amd_assert_no_lockdep_violations(kmsg_fd, taint_before);
 	close(kmsg_fd);
 }
 
@@ -415,7 +329,7 @@ static void test_concurrent_userptr_and_reset(int fd,
 	int kmsg_fd;
 
 	igt_kernel_tainted(&taint_before);
-	kmsg_fd = kmsg_open();
+	kmsg_fd = amd_lockdep_kmsg_open();
 
 	igt_info("Running concurrent USERPTR + reset for %d seconds\n",
 		 THREAD_RUNTIME_SEC);
@@ -434,7 +348,7 @@ static void test_concurrent_userptr_and_reset(int fd,
 	igt_info("  USERPTR ops: %d, Resets: %d\n",
 		 userptr_data.iterations, reset_data.iterations);
 
-	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	amd_assert_no_lockdep_violations(kmsg_fd, taint_before);
 	close(kmsg_fd);
 }
 
@@ -454,7 +368,7 @@ static void test_stress_all_paths(int fd, amdgpu_device_handle device)
 	int kmsg_fd;
 
 	igt_kernel_tainted(&taint_before);
-	kmsg_fd = kmsg_open();
+	kmsg_fd = amd_lockdep_kmsg_open();
 
 	igt_info("Running all paths concurrently for %d seconds\n",
 		 THREAD_RUNTIME_SEC);
@@ -480,7 +394,7 @@ static void test_stress_all_paths(int fd, amdgpu_device_handle device)
 		 vram_data.iterations, mmap_data.iterations,
 		 userptr_data.iterations, reset_data.iterations);
 
-	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	amd_assert_no_lockdep_violations(kmsg_fd, taint_before);
 	close(kmsg_fd);
 }
 
@@ -520,7 +434,7 @@ static void test_notifier_reclaim_splat(int fd)
 	memset(buf, 0xa5, USERPTR_BUF_SIZE);
 
 	/* Open kmsg to monitor for lockdep violations */
-	kmsg_fd = kmsg_open();
+	kmsg_fd = amd_lockdep_kmsg_open();
 	igt_assert(kmsg_fd >= 0);
 
 	/* Register as userptr - this installs MMU notifier callback */
@@ -546,7 +460,7 @@ static void test_notifier_reclaim_splat(int fd)
 		usleep(50000);  /* 50ms - give kernel time to process */
 
 		/* Check for lockdep violations */
-		if (kmsg_has_lockdep_violation(kmsg_fd)) {
+		if (amd_lockdep_kmsg_has_violation(kmsg_fd)) {
 			violation_found = true;
 			igt_warn("LOCKDEP VIOLATION DETECTED during iteration %d\n", i + 1);
 			break;
@@ -616,7 +530,7 @@ int igt_main()
 		igt_require(r == 0);
 
 		/* Skip if lockdep is not enabled on the running kernel */
-		igt_require_f(is_lockdep_enabled(),
+		igt_require_f(amd_is_lockdep_enabled(),
 			      "CONFIG_LOCKDEP not enabled - "
 			      "rebuild kernel with CONFIG_PROVE_LOCKING=y\n");
 
-- 
2.55.0


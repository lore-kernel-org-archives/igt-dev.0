Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67194107BCD0
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 17:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012D610E080;
	Fri, 13 Mar 2026 17:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VlLp+v3p";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23A10E080
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 17:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773424774; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RFXaR2tnrI8JsxXuqXwTrMHv/XdzDi3iS3i1CfhexcEY2Zis/SIQrJG2zPCDM8RmwJk52+rApSx6VdKzuscOYP0SUXHa+TQLu3GjE/c6ZaiEvBqv8BH/YAwYR18/k4bECU/FTEJSndSXepkmWQE3HwOU7D6DbNyqvy+U38/w2VY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773424774;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=m0tFEd8AwowkDSR9TCjc99ZMrR0zOOHaGTcYCDExHO8=; 
 b=LrS+ZXDG05S5jq+A5ShJX5c0Bq4HY/ep0c6T1rtClQcqWEPHS/ibb5wsj4ko7VIlgNAO4OByXemSOTvLEDfdFTQyakI+mTxqj7Sd3hakfU1bu4nLGAeKX/BDKX+Bf0t0KLXgUhSKH6O5/am+Pdq2JuO3o9YJCSYt9pI2EZrq6Os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773424774; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=m0tFEd8AwowkDSR9TCjc99ZMrR0zOOHaGTcYCDExHO8=;
 b=VlLp+v3pQjzV8EZI5NOcgunviqrpGvcAInwUxInDX61hQb2ZkJbdz6kUazIYeLoI
 u+XBxLfX2LWZ7cPvKkTjZJugKGOieyMEpGNwz7XmvFPLUhnABp6xNO/0SfWF3vhVpak
 III5DoCEz7nO9idJayKhXtmJ5IffJiO0ylILd6z8=
Received: by mx.zohomail.com with SMTPS id 177342477280976.51734687614703;
 Fri, 13 Mar 2026 10:59:32 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>,
 Danilo Krummrich <dakr@kernel.org>, kernel@collabora.com
Subject: [PATCH v1 2/4] panthor: Move issue_store_multiple into library file
Date: Fri, 13 Mar 2026 17:58:29 +0000
Message-ID: <20260313175908.1752151-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
References: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
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

Goal of this move is making it available for other test groups.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_panthor.c             | 38 +++++++++++++++++++++++++++++++++++
 lib/igt_panthor.h             |  1 +
 tests/panthor/panthor_group.c | 34 +++----------------------------
 3 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 49b427d4f162..3c96a40b7c45 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -371,3 +371,41 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
 
 	gem_close(fd, bo->handle);
 }
+
+/**
+ * igt_panthor_issue_store_multiple:
+ * @cs: command stream kernel VA
+ * @device_va: device virtual address for the store instruction
+ * @constant: immediate operand value to embedded in store instruction
+ *
+ * Perform an immediate operand store in the VA of device_va
+ */
+size_t
+igt_panthor_issue_store_multiple(uint8_t *cs, uint64_t device_va, uint32_t constant)
+{
+	const uint8_t kernel_va_reg = 68;
+	const uint8_t constant_reg = 70;
+	uint64_t instrs[] = {
+		/* MOV48: Load the source register ([r68; r69]) with the kernel address */
+		cs_mov48(kernel_va_reg, device_va),
+		/* MOV32: Load a known constant into r70 */
+		cs_mov32(constant_reg, constant),
+		/* STORE_MULTIPLE: Store the first register to the address pointed
+		 * to by [r68; r69]
+		 */
+		cs_stm32(kernel_va_reg, constant_reg, 0),
+		/* FLUSH all Wait for all cores */
+		cs_wait(0xff, false),
+		/* MOV32: Clear r70 to 0 */
+		cs_mov32(constant_reg, 0),
+		/* FLUSH_CACHE: Clean and invalidate all caches */
+		cs_flush(CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
+			 CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
+			 CS_FLUSH_MODE_INVALIDATE,
+			 0, constant_reg, 1),
+		cs_wait(0xff, false),
+	};
+
+	memcpy(cs, instrs, sizeof(instrs));
+	return sizeof(instrs);
+}
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index 97a2b749707d..a4756e8e88ab 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -37,6 +37,7 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     uint32_t stream_size, uint32_t syncobj_handle,
 				     int err);
 uint64_t igt_panthor_get_first_core(uint64_t cores_present);
+size_t igt_panthor_issue_store_multiple(uint8_t *cs, uint64_t device_va, uint32_t constant);
 
 static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
 				       uint64_t va, uint64_t size, uint32_t flags, int err)
diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
index 13636e60c0e7..f2058c59786c 100644
--- a/tests/panthor/panthor_group.c
+++ b/tests/panthor/panthor_group.c
@@ -10,36 +10,6 @@
 #include "igt_syncobj.h"
 #include "panthor_drm.h"
 
-static size_t
-issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
-{
-	const uint8_t kernel_va_reg = 68;
-	const uint8_t constant_reg = 70;
-	uint64_t instrs[] = {
-		/* MOV48: Load the source register ([r68; r69]) with the kernel address */
-		cs_mov48(kernel_va_reg, kernel_va),
-		/* MOV32: Load a known constant into r70 */
-		cs_mov32(constant_reg, constant),
-		/* STORE_MULTIPLE: Store the first register to the address pointed
-		 * to by [r68; r69]
-		 */
-		cs_stm32(kernel_va_reg, constant_reg, 0),
-		/* FLUSH all Wait for all cores */
-		cs_wait(0xff, false),
-		/* MOV32: Clear r70 to 0 */
-		cs_mov32(constant_reg, 0),
-		/* FLUSH_CACHE: Clean and invalidate all caches */
-		cs_flush(CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
-			 CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
-			 CS_FLUSH_MODE_INVALIDATE,
-			 0, constant_reg, 1),
-		cs_wait(0xff, false),
-	};
-
-	memcpy(cs, instrs, sizeof(instrs));
-	return sizeof(instrs);
-}
-
 int igt_main() {
 	int fd;
 
@@ -94,7 +64,9 @@ int igt_main() {
 				    result_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
 		result_gpu_addr = INITIAL_VA + 4096;
 
-		command_stream_size = issue_store_multiple(cmd_buf_bo.map, result_gpu_addr, 0xdeadbeef);
+		command_stream_size = igt_panthor_issue_store_multiple(cmd_buf_bo.map,
+								       result_gpu_addr,
+								       0xdeadbeef);
 
 		group_handle = igt_panthor_group_create_simple(fd, vm_id, 0);
 		igt_assert_neq(group_handle, 0);
-- 
2.53.0


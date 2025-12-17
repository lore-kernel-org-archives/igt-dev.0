Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D37D66BBB
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 21:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B173C10E924;
	Wed, 17 Dec 2025 21:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="GQ4OLHpt";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3B410E924
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 21:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766008766; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kq+/+6U1BW37PGBXYzbRkAQfMwswXt8VDoCrDjWIz85Si2mSXpeVehQ65xsELb1c1z1Hvykix95qzzrUINRMgM+AeqihVSviVK1yRAtQExi9dSx/Enb7GPcz3oYKajLcTYnvOVVfqUGxIFjlzIIuGcm4SM4czvYDyn+3VCD/ScU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766008766;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dMiNJUaSCUaYxltvSmfmMZ44J0U4KTPR+viYcl5g+Yc=; 
 b=TDJ4Qtv61uSrV+ds0gbNfaIM2iBs1/GGYtZ+JYHbC5wvXeLr4o0Ra0+G230AQ5l2oY0nyymCt7dactc4noh2Nai+BLqNiVvbIxLkPbrxvHfGaDLrt8v9Mcj7190/XctcT/AQUGdKWRresyUZwiaDk4FZZOVzZzA7v2+KSymT9ow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766008766; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dMiNJUaSCUaYxltvSmfmMZ44J0U4KTPR+viYcl5g+Yc=;
 b=GQ4OLHptsDdHZYvpej9g0bp9RHYApF1nR+hV9yYRdonKjmm++jPTSN/IfiS+WQRG
 lB9AKjE7uSRd6XWBbv6uDz68sJ6m1dyH1Oy4WCfa1N8CEIn06V7h6loO7UncG1Q2Fh6
 nJXRyF8XB/eDWe1UE0G77UsZnBe4VvZrMlyKgb4A=
Received: by mx.zohomail.com with SMTPS id 1766008765615562.3623089387321;
 Wed, 17 Dec 2025 13:59:25 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH i-g-t v3 1/2] panthor: Allow specifying offset when mapping a
 BO against a VM
Date: Wed, 17 Dec 2025 21:58:56 +0000
Message-ID: <20251217215909.710730-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217215909.710730-1-adrian.larumbe@collabora.com>
References: <20251217215909.710730-1-adrian.larumbe@collabora.com>
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

A future commit that tests VM_BIND unmapping of regions backed by huge
pages will make use of it. Leave the old interface as an inlined
function that passes 0 as a default BO offset.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panthor.c |  5 +++--
 lib/igt_panthor.h | 10 ++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 73ada9c59bfc..49b427d4f162 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -234,12 +234,13 @@ void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err)
  *
  * Bind a buffer object to a virtual address in the specified VM.
  */
-void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
-			 uint64_t va, uint64_t size, uint32_t flags, int err)
+void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
+				uint64_t size, uint64_t offset, uint32_t flags, int err)
 {
 	struct drm_panthor_vm_bind_op bind_op = {
 		.flags = flags,
 		.bo_handle = bo_handle,
+		.bo_offset = offset,
 		.va = va,
 		.size = size,
 	};
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index dc90033c0ad4..76a79ce32fbd 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -19,8 +19,8 @@ struct panthor_bo {
 void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
 void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
 void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
-void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
-			 uint64_t size, uint32_t flags, int err);
+void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
+			 uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
 void igt_panthor_bo_create(int fd, struct panthor_bo *bo, uint64_t size, uint32_t flags, int err);
 uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err);
 void igt_panthor_free_bo(int fd, struct panthor_bo *bo);
@@ -38,6 +38,12 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     int err);
 uint64_t igt_panthor_get_first_core(uint64_t cores_present);
 
+static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
+				       uint64_t va, uint64_t size, uint32_t flags, int err)
+{
+	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
+}
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,
-- 
2.51.2


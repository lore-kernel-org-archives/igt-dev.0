Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3C3D116F2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 03:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E473410E01F;
	Thu, 27 Nov 2025 03:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="i4VRkpt5";
	dkim-atps=neutral
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714A10E01F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 03:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764212521; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ndKA9BVhuZR/d/Q0xb3n8NtuMLYZqk3gnUo31xg6po6Seia4btZnuQo1Nnd48YOGC21nT16KtJbr5lFu4S95gs8PjT2cBKCOBWEpwHkC6P/3KpotlOddzB1chfj3j+9S7spn75267BrPCLrsM2G/lQkxdNvAjMDoRPkPiFcJX+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764212521;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6te5dqJZxhlqe0jXGA/i1uTa9/xZhvIv20zx5GUlfqI=; 
 b=QdDMW5hske+WhD7SGQhYFkuoGQy3Gsh0Reti9uqmhXvEzw3yiPnl4r7rPbu20RGTjKCIZyOIy8G5MYK9/1OARUgwGNGUPuEOOzNpK9zzMBW0La6n3JfnnWrtHuMRvuYsZtedr0RakBRS1qu3DOLAOiiHY//X2rRnD1sg6Ubuh/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764212521; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6te5dqJZxhlqe0jXGA/i1uTa9/xZhvIv20zx5GUlfqI=;
 b=i4VRkpt5q9UhjwemBvr57G+dgOO8s+YW4fzZ5Xo/pIx5wm1SvFmW/ddfx3jQkNS1
 tCEe4PVuOiseSvxA3lklCDJDWcrs6IFYqGhFCmug28UwTzMwYET0DT5xrkNHhG68Y5K
 iN41MJEhNcfCitHBbDUcP6kBh9Iv7LcYoxEh06Pg=
Received: by mx.zohomail.com with SMTPS id 1764212518165294.53620461599735;
 Wed, 26 Nov 2025 19:01:58 -0800 (PST)
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
Subject: [PATCH 1/2] panthor: Allow specifying offset when mapping a BO
 against a VM
Date: Thu, 27 Nov 2025 03:01:43 +0000
Message-ID: <20251127030145.585641-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
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
---
 lib/igt_panthor.c | 5 +++--
 lib/igt_panthor.h | 9 +++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

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
index dc90033c0ad4..1fe0271d48c9 100644
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
@@ -38,6 +38,11 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
 				     int err);
 uint64_t igt_panthor_get_first_core(uint64_t cores_present);
 
+static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
+				       uint64_t va, uint64_t size, uint32_t flags, int err) {
+	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
+}
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,

base-commit: 7bc8d310594c1dc1a851451845d1ea3c15fbd53d
-- 
2.51.2


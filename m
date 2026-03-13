Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E7107BCD0
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 17:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB4810E436;
	Fri, 13 Mar 2026 17:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Jz8O7Vnu";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09010E080
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 17:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773424776; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XfB1m7PO0B8yncqMRq11RXqFNicD1w8k+bwEPUGUUactVxMLKVXww+8B5AqA8lwOtSghZNr3qTz/t1ic63P+GWbmUVsC0SeIXTnYkk55bkJZy7yytRk34DH/x4g7+Pf8Kpf1sAND4Vtg6s11+Vp9CNuErrcu0k3r+tIELDpsKFU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773424776;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qG5F7gWBJzd0j9HFQSlY8ADOYVvRrylIB6ECEoBbVsY=; 
 b=JYOibmGzEMFGrqzcQT+XzGNSHWgYlhBB9zmmdaZCOqIqx+Rus0NrrMHn0CzUE19SwP9z2dEiNJuuvjd4I1pzcT1yfD58xZN8baq+cz6HGLE54y9+USDNK8ldxlANV69lhYORtboM65T1wHnG0Sk2CZeAKB+k7oOuz20YK+2ZbIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773424776; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qG5F7gWBJzd0j9HFQSlY8ADOYVvRrylIB6ECEoBbVsY=;
 b=Jz8O7Vnum+VXwJzZ7mtVslu5TbqJsrlzsjRcBZiMoPJVAa+5MFjUx6PsRSqMS8sP
 ZuR8JfjXgu4J9asjxUlLbPH57YeVLiyReTIuA/z6oWq5C9YO9eAJfVzw5iegu58Rlha
 XKX3H63tjWXVz21AMq5CIMDFM/x84arZQwY2LpzE=
Received: by mx.zohomail.com with SMTPS id 1773424775840835.6988197458124;
 Fri, 13 Mar 2026 10:59:35 -0700 (PDT)
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
Subject: [PATCH v1 3/4] test/panthor: Add support for repeated mappings
Date: Fri, 13 Mar 2026 17:58:30 +0000
Message-ID: <20260313175908.1752151-4-adrian.larumbe@collabora.com>
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

Reflect this in the IGT function interface for VM_BIND.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_panthor.c          |  4 +++-
 lib/igt_panthor.h          | 12 ++++++++++--
 tests/panthor/panthor_vm.c |  3 ++-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 3c96a40b7c45..6e231c10ec73 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -235,7 +235,8 @@ void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err)
  * Bind a buffer object to a virtual address in the specified VM.
  */
 void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
-				uint64_t size, uint64_t offset, uint32_t flags, int err)
+				uint64_t size, uint64_t offset, uint32_t flags, int err,
+				uint64_t repeat)
 {
 	struct drm_panthor_vm_bind_op bind_op = {
 		.flags = flags,
@@ -243,6 +244,7 @@ void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint
 		.bo_offset = offset,
 		.va = va,
 		.size = size,
+		.bo_repeat_range = repeat,
 	};
 
 	struct drm_panthor_vm_bind vm_bind = {
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index a4756e8e88ab..02ff79083161 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -20,7 +20,8 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
 void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
 void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
 void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
-				uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
+				uint64_t size, uint64_t ofsfet, uint32_t flags, int err,
+				uint64_t repeat);
 void igt_panthor_bo_create(int fd, struct panthor_bo *bo, uint64_t size, uint32_t flags, int err);
 uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err);
 void igt_panthor_free_bo(int fd, struct panthor_bo *bo);
@@ -42,7 +43,14 @@ size_t igt_panthor_issue_store_multiple(uint8_t *cs, uint64_t device_va, uint32_
 static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
 				       uint64_t va, uint64_t size, uint32_t flags, int err)
 {
-	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
+	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err, 0);
+}
+
+static inline void igt_panthor_vm_bind_repeat(int fd, uint32_t vm_id, uint32_t bo_handle,
+					      uint64_t va, uint64_t size, uint32_t flags, int err,
+					      uint64_t repeat)
+{
+	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err, repeat);
 }
 
 enum cs_opcode {
diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 76a669843f5c..bbd5fe94d0e0 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -4,6 +4,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_panthor.h"
+#include "igt_syncobj.h"
 #include "panthor_drm.h"
 
 int igt_main() {
@@ -146,7 +147,7 @@ int igt_main() {
 
 		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
 		igt_panthor_vm_bind_offset(fd, vm_id, bo.handle, 0x200000,
-					   SZ_4M, SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+					   SZ_4M, SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0, 0);
 
 		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
 				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
-- 
2.53.0


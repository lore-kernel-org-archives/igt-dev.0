Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BA2D116F2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 03:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C1C10E14F;
	Thu, 27 Nov 2025 03:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cqSMXdps";
	dkim-atps=neutral
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3F110E14F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 03:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764212523; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TAA1el3uJs30fgDoUmUlNHd7+p1FEpuKikxFnKnJvtX6K7baM+RHNi/i2AQqm0hq7VhqgZ+XT7fMhb4ufEzn3fMu+Yq4eK3UFe88XaspOgPMhpyJxe/2+y/RLuW+CKCINMPj/Mpdx2V8YdnyLX2xxDQ9MokC6Nnovmm75CqVXIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764212523;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gRQRSlN7zslRdcEBw7du9HdT4i07xYVJ0etNyuO4H40=; 
 b=gqiRveICXcgJ5RrsHAJ1M84sY/7eWrRjkAqNwsFyxK1uNfktIRruMY1zL7HbumVGXxLh7JvQol6C3acb35HW8C9CA9kiFP28rOnAu475OXM8DIpk+WEp9+YNfwSNprmiAlpsZ3kZ37NHWwrTLhs/2uDmCtRBbQ++qN7CbQZtpRg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764212523; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=gRQRSlN7zslRdcEBw7du9HdT4i07xYVJ0etNyuO4H40=;
 b=cqSMXdpsqnhYCItwvvwlCer+l7W54gZsXdkvo6MXtZbJyHX3GbWIcTvLBYEtg2pC
 8Q4Eud9W5F97yDADpdIqyqfByYph56gqhgzKEKhFI6ZKN4tx2RYMP5zzCxy8eIcyN1t
 /O4T91zD8k2veSDHrq6pYs3H7m8U4nl1ElSXj5/g=
Received: by mx.zohomail.com with SMTPS id 1764212521441372.24607612974694;
 Wed, 26 Nov 2025 19:02:01 -0800 (PST)
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
Subject: [PATCH 2/2] tests/panthor: Add VM_BIND tests for partial huge page
 unmaps
Date: Thu, 27 Nov 2025 03:01:44 +0000
Message-ID: <20251127030145.585641-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127030145.585641-1-adrian.larumbe@collabora.com>
References: <20251127030145.585641-1-adrian.larumbe@collabora.com>
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

Kernel commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
behavior") made it illegal to perform partial unmaps of memory regions
backed by huge (> 2MiB) pages. A workaround was written specifically for
Panthor, but in order to test it, multiple scenarios and corner cases
had to be considered.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tests/panthor/meson.build              |   1 +
 tests/panthor/panthor_hugepage_unmap.c | 210 +++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 tests/panthor/panthor_hugepage_unmap.c

diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
index 42a46e9934a9..78341b720912 100644
--- a/tests/panthor/meson.build
+++ b/tests/panthor/meson.build
@@ -3,6 +3,7 @@ panthor_progs = [
 	'panthor_group',
 	'panthor_query',
 	'panthor_vm',
+        'panthor_hugepage_unmap',
 ]
 
 foreach prog : panthor_progs
diff --git a/tests/panthor/panthor_hugepage_unmap.c b/tests/panthor/panthor_hugepage_unmap.c
new file mode 100644
index 000000000000..1c712fb0d4f7
--- /dev/null
+++ b/tests/panthor/panthor_hugepage_unmap.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_panthor.h"
+#include "panthor_drm.h"
+
+igt_main {
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_PANTHOR);
+	}
+
+	igt_describe("Requested unmapping is identical to existing huge page mapping");
+	igt_subtest("vm_unbind_identical_hugepage_single") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_2M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is identical to existing huge page mapping, but only a subset of the object's pages are mapped in the VM");
+	igt_subtest("vm_unbind_identical_hugepage_single") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is identical to existing multiple huge page mapping");
+	igt_subtest("vm_unbind_identical_hugepage_multiple") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_1M * 6;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is identical to existing huge page mapping, but only part of the BO is mapped");
+	igt_subtest("vm_unbind_identical_hugepage_offset") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_1M * 6;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind_offset(fd, vm_id, bo.handle, 0x200000,
+					   SZ_4M, SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is left aligned subset of an existing huge page mapping");
+	igt_subtest("vm_unbind_hugepage_leftaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_4M;
+		uint64_t unmap_size = SZ_8K;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is right aligned subset of an existing huge page mapping");
+	igt_subtest("vm_unbind_hugepage_rightaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_4M;
+		uint64_t unmap_size = SZ_8K;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + bo_size - unmap_size, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is a superset of existing huge page mapping");
+	igt_subtest("vm_unbind_hugepage_superset") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_2M;
+		uint64_t unmap_size = SZ_1M * 5;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x100000, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Requested unmapping is a subset of an existing mapping");
+	igt_subtest("vm_unbind_hugepage_subset") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_4M;
+		uint64_t unmap_size = SZ_8K;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + SZ_1M, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + SZ_2M + SZ_4K, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Perform successive unmaps over the remnants of an original multi huge page mapping");
+	igt_subtest("vm_unbind_hugepage_successive") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_1M * 6;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x208000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x208000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, 0x4000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x401000, 0x4000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x4fb000, 0xA000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fb000, 0xA000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x4000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, 0x1000,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
-- 
2.51.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC9AD5B15E
	for <igt-dev@archiver.kernel.org>; Sat, 13 Dec 2025 18:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D538110E189;
	Sat, 13 Dec 2025 18:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DCmOb4YV";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B5B10E453
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Dec 2025 18:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765651924; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W8T6q7TL0wmbmn3a4B3wcG8/hveri5GR6ABBxPgtIN8nl18gXG15VPjsiiOzVs9DVGr5b9sllNAYIHAz0DXI7b6K9FSuKY0JiqRR1POAW9Ea4oVvl0qHg/d0qahuH5Fzs94cOxD+u+193OeIHo0ZEBuv4cUPeUNmLho/NILSLXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765651924;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MlbYfFn0PPKhPx7xr7JfJQpkJhc5vza/M8yjkNMbN0g=; 
 b=kXE+sZ1F2A0ewaldEpkVi5aN1NFsbXVXjpp5UKXDPz7FrvtF0a4FH+XUHOcpLgVeH0tJYgWh3XJB4/zA7yI3KHfyR0jiBRC9OI4v6kQtyOF/y/dt6CeqSmzRhRwDPx/MyPS8diUAf74p/uT1YedwOVyaSkqIDBndF7/v0v4aUcA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765651924; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MlbYfFn0PPKhPx7xr7JfJQpkJhc5vza/M8yjkNMbN0g=;
 b=DCmOb4YVAa+bz8paujkEkmTFh5bE/ci9Qj/Ww0AymP0chADMR5mh1/M8oTt4E/+S
 oPs9+vfJWw8BRC5yTh4gzbGB1bL713g0xU7CaXw9tegcwmvyD67WJZqwoFpiWDW/Voa
 Pkm3MUw/BliXbENm/jCG+JxAhm8/5QfBW9BMOti0=
Received: by mx.zohomail.com with SMTPS id 1765651923347675.6230963698166;
 Sat, 13 Dec 2025 10:52:03 -0800 (PST)
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
Subject: [PATCH v2 2/2] tests/panthor: Add VM_BIND tests for partial huge page
 unmaps
Date: Sat, 13 Dec 2025 18:51:22 +0000
Message-ID: <20251213185133.2428123-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251213185133.2428123-1-adrian.larumbe@collabora.com>
References: <20251213185133.2428123-1-adrian.larumbe@collabora.com>
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 tests/panthor/panthor_vm.c | 191 +++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 18a0622c7f8a..28959f21e997 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -78,6 +78,197 @@ igt_main {
 		igt_panthor_vm_destroy(fd, vm_id, 0);
 	}
 
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
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.51.2


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61727107BCD5
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 17:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8610E451;
	Fri, 13 Mar 2026 17:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="VPai2vhg";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30E510E435
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 17:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773424780; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KcZFKyIV4VCDWUWRCN/NhZ5/ZFcPa0s57X3VcQ8VoAr4l8lV5NU2LjKQt04jMF0kSY1NyQVJjE37f9Pow8ACEJJtNnSZMi2UToGgTKUXX/gsQ2c5qRKyU1IE6WGmqs83XjGa3v/vHB9MzgJJeqA8nZJRjwm7NOY15VMpdCkZ3fo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773424780;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6oJ9MJlfACkT8oSzH8PUbUP4tuJ5DYQBjg/GgTm53bk=; 
 b=mbBpiB0BUTqaIZgK+70RewBsFV5cm1pMEW04/h9qF4ILFEwXmzbmwyiAqnW4+fa5qKdDVnJ+VsKETYwOg1ThUWKu3GurHEeOApLUc70gRe1mBYlQLE5neqgJdxwur8h80DJ4aoVL0WagfpkHNxPGol8nG+GWYn6Se41IomW2IaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773424780; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6oJ9MJlfACkT8oSzH8PUbUP4tuJ5DYQBjg/GgTm53bk=;
 b=VPai2vhgW/8I4QumMHvfVj4iqGpP7pqCkglCig4tw9lETBSfKDeTfsm62j+YGlZe
 lPIGkgE2P1UgrpWaik4QHvZ1aLYv0DL2HtJH2rUBz0oO73/WKhGsfdFDe582rQeGgcB
 iqbakH/YVaHdPJvhp6OkSd2G/dESVQUcoUhj0Jtc=
Received: by mx.zohomail.com with SMTPS id 1773424779480881.9420265426288;
 Fri, 13 Mar 2026 10:59:39 -0700 (PDT)
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
Subject: [PATCH v1 4/4] tests/panthor: Add VM_BIND repeat tests
Date: Fri, 13 Mar 2026 17:58:31 +0000
Message-ID: <20260313175908.1752151-5-adrian.larumbe@collabora.com>
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

In a separate file for the time being, but should eventually be
incorporated into panthor_vm.c.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tests/panthor/meson.build         |   1 +
 tests/panthor/panthor_vm_repeat.c | 555 ++++++++++++++++++++++++++++++
 2 files changed, 556 insertions(+)
 create mode 100644 tests/panthor/panthor_vm_repeat.c

diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
index 42a46e9934a9..fe5220b88430 100644
--- a/tests/panthor/meson.build
+++ b/tests/panthor/meson.build
@@ -3,6 +3,7 @@ panthor_progs = [
 	'panthor_group',
 	'panthor_query',
 	'panthor_vm',
+        'panthor_vm_repeat',
 ]
 
 foreach prog : panthor_progs
diff --git a/tests/panthor/panthor_vm_repeat.c b/tests/panthor/panthor_vm_repeat.c
new file mode 100644
index 000000000000..13a0e4f4b356
--- /dev/null
+++ b/tests/panthor/panthor_vm_repeat.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_panthor.h"
+#include "igt_syncobj.h"
+#include "panthor_drm.h"
+
+int
+igt_main()
+{
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_PANTHOR);
+	}
+
+	igt_describe("Create and destroy a VM");
+	igt_subtest("vm_create_destroy") {
+		uint32_t vm_id;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert_neq(vm_id, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_4K;
+		uint64_t map_size = SZ_4K * 4;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, SZ_2M,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   bo_size);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_write") {
+		uint32_t vm_id;
+		uint32_t group_handle;
+		struct panthor_bo cmd_buf_bo = { };
+		struct panthor_bo result_bo = { };
+		uint64_t command_stream_gpu_addr;
+		uint32_t command_stream_size;
+		uint64_t result_gpu_addr;
+		uint32_t syncobj_handle;
+		const int INITIAL_VA_CS = 0x1000000;
+		const int INITIAL_VA = 0x2000000;
+		const uint64_t map_size = SZ_4K * 4;
+		const uint64_t repeat_bo_size = SZ_4K;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+
+		igt_panthor_bo_create_mapped(fd, &cmd_buf_bo, 4096, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, cmd_buf_bo.handle, INITIAL_VA_CS,
+				    cmd_buf_bo.size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+		command_stream_gpu_addr = INITIAL_VA_CS;
+
+		/* Create the BO to receive the result of the store. */
+		igt_panthor_bo_create_mapped(fd, &result_bo, repeat_bo_size, 0,
+					     0);
+		/* Also bind the result BO. */
+		igt_panthor_vm_bind_repeat(fd, vm_id, result_bo.handle,
+					   INITIAL_VA, map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		result_gpu_addr = INITIAL_VA;
+
+		command_stream_size =
+		    igt_panthor_issue_store_multiple(cmd_buf_bo.map,
+						     result_gpu_addr,
+						     0xdeadbeef);
+
+		group_handle = igt_panthor_group_create_simple(fd, vm_id, 0);
+		igt_assert_neq(group_handle, 0);
+		syncobj_handle = syncobj_create(fd, 0);
+
+		igt_panthor_group_submit_simple(fd, group_handle, 0,
+						command_stream_gpu_addr,
+						command_stream_size,
+						syncobj_handle, 0);
+
+		igt_assert(syncobj_wait
+			   (fd, &syncobj_handle, 1, INT64_MAX, 0, NULL));
+
+		igt_assert_eq(*(uint32_t *)result_bo.map, 0xdeadbeef);
+
+		syncobj_destroy(fd, syncobj_handle);
+
+		result_gpu_addr = INITIAL_VA + 2 * SZ_4K;
+		command_stream_size =
+		    igt_panthor_issue_store_multiple(cmd_buf_bo.map,
+						     result_gpu_addr,
+						     0xdeadbaaf);
+		syncobj_handle = syncobj_create(fd, 0);
+		igt_panthor_group_submit_simple(fd, group_handle, 0,
+						command_stream_gpu_addr,
+						command_stream_size,
+						syncobj_handle, 0);
+		igt_assert(syncobj_wait
+			   (fd, &syncobj_handle, 1, INT64_MAX, 0, NULL));
+		igt_assert_eq(*(uint32_t *)result_bo.map, 0xdeadbaaf);
+		syncobj_destroy(fd, syncobj_handle);
+
+		igt_panthor_group_destroy(fd, group_handle, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+
+		igt_panthor_free_bo(fd, &cmd_buf_bo);
+		igt_panthor_free_bo(fd, &result_bo);
+	}
+
+	igt_subtest("vm_bind_repeat_partial_unmap_start_size_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, SZ_4K * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, EINVAL);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_partial_unmap_start_size_aligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, repeat_bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest
+	    ("vm_bind_repeat_partial_unmap_start_size_unaligned_no_gpupage_multiple") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, 4 * SZ_64K,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, EINVAL);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_partial_unmap_below_start") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA - repeat_bo_size,
+				    repeat_bo_size * 3,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_partial_unmap_above_start") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA + repeat_bo_size,
+				    repeat_bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + repeat_bo_size,
+				    repeat_bo_size * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_start_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + map_size - SZ_1M, SZ_4M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_start_size_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + map_size - SZ_1M, SZ_1M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_start_size_aligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + map_size - SZ_2M, SZ_4M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_aligned_split_original_va") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + repeat_bo_size, repeat_bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_start_aligned_size_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + repeat_bo_size, SZ_1M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_aligned_intersect_left") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA - repeat_bo_size,
+				    repeat_bo_size * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_size_unaligned_intersect_left") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA - repeat_bo_size,
+				    repeat_bo_size * SZ_1M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_start_aligned_intersect_right") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA + map_size - repeat_bo_size,
+				    repeat_bo_size + SZ_4K * 6,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_remap_wrap_around_va") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_2M;
+		uint64_t map_size = repeat_bo_size * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, SZ_8M, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA - repeat_bo_size, SZ_8M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_repeat_high_vas") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		struct panthor_bo bo2;
+		const uint64_t repeat_bo_size = SZ_4K;
+		uint64_t map_size = 16 * repeat_bo_size;
+		const uint64_t INITIAL_VA = 0x7fffffff0000;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, repeat_bo_size, 0, 0);
+		igt_panthor_vm_bind_repeat(fd, vm_id, bo.handle, INITIAL_VA,
+					   map_size,
+					   DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+					   DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT, 0,
+					   repeat_bo_size);
+
+		igt_panthor_bo_create(fd, &bo2, map_size, 0, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+
+		igt_panthor_vm_bind(fd, vm_id, bo2.handle,
+				    INITIAL_VA, repeat_bo_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
-- 
2.53.0


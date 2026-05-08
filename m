Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D0ECD342F
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 17:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0110F571;
	Fri,  8 May 2026 17:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="UfYkh2Ij";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61A710F569
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 17:26:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1778261156; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aT04IcHyThGyK5VUWY7NAYD1IdDPNofIhmtIdDHXDftJcQZuIepSEfqM/8C3BYD+3nvRmubkj+MeSN08/au8HobmQcxfmXZ0qEqoCz9VVjOy87++GbzSjtu+8u6qTb+E+v3XXIvgg78d99uifq338m1YkRTH39/XyLx46C8FC/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1778261156;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=kMb29tIWCI3HwIVihjlwlPJJYKodfxgoGXENCesdpes=; 
 b=Y6k6ZoplUiAZVFdeLdtzrGP+WtIp6blLZjH136AD2PGpwESBnXXIqknB9NJhZAzM2qrOynlUkGHSs3tNrnrOyNbK6I6JTzf3qyiyPXt9PEgXU1iGrw7ealKVaHGfjc5PXl3/JjQFdHn4DMz0R4lUqyukSukHE++RX/Zv5Xt+Y1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778261156; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=kMb29tIWCI3HwIVihjlwlPJJYKodfxgoGXENCesdpes=;
 b=UfYkh2IjW4DrYQ0PrDdyMVJqyGePgwtk0HsSjnw8gmGoUS5vLrMqAMbKxG+37SPl
 3B8zSrwGhSmgquGwGLzLQ3EeNECjbTUmjBpjXI/BcRLm/9Zd2unS/Ptv5snplK36+sG
 tDrKTY0Gs6bs3yGOnermk5bgJcOBhOJXoCC+Nhqk=
Received: by mx.zohomail.com with SMTPS id 1778261154477712.826199258731;
 Fri, 8 May 2026 10:25:54 -0700 (PDT)
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
Subject: [PATCH v2 3/3] tests/panthor: Add Panthor sparse VM_BIND tests
Date: Fri,  8 May 2026 18:25:35 +0100
Message-ID: <20260508172537.3456595-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
References: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
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
 tests/panthor/panthor_vm_sparse.c | 316 ++++++++++++++++++++++++++++++
 2 files changed, 317 insertions(+)
 create mode 100644 tests/panthor/panthor_vm_sparse.c

diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
index 42a46e9934a9..f9509ecd8816 100644
--- a/tests/panthor/meson.build
+++ b/tests/panthor/meson.build
@@ -3,6 +3,7 @@ panthor_progs = [
 	'panthor_group',
 	'panthor_query',
 	'panthor_vm',
+        'panthor_vm_sparse',
 ]
 
 foreach prog : panthor_progs
diff --git a/tests/panthor/panthor_vm_sparse.c b/tests/panthor/panthor_vm_sparse.c
new file mode 100644
index 000000000000..fe7d25542f41
--- /dev/null
+++ b/tests/panthor/panthor_vm_sparse.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_panthor.h"
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
+	igt_subtest("vm_bind_sparse") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_4K * 4;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, SZ_2M, map_size, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_partial_unmap_start_size_unaligned") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, SZ_4K * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_partial_unmap_start_size_aligned") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, SZ_2M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest
+	    ("vm_bind_sparse_partial_unmap_start_size_unaligned_no_gpupage_multiple") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, 4 * SZ_64K,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_partial_unmap_below_start") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA - SZ_2M, SZ_2M * 3,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_partial_unmap_above_start") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA + SZ_2M, SZ_2M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M, SZ_2M * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_start_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + map_size - SZ_1M,
+				    SZ_4M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_start_size_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + map_size - SZ_1M,
+				    SZ_1M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_start_size_aligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle,
+				    INITIAL_VA + map_size - SZ_2M, SZ_4M,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_aligned_split_original_va") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M,
+				    SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_start_aligned_size_unaligned") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M,
+				    SZ_1M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_aligned_intersect_left") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle,
+				    INITIAL_VA - SZ_2M, SZ_2M * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_size_unaligned_intersect_left") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle,
+				    INITIAL_VA - SZ_2M, SZ_1M * 2,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_start_aligned_intersect_right") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle,
+				    INITIAL_VA + map_size - SZ_2M, SZ_2M + SZ_4K * 6,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_remap_wrap_around_va") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = SZ_2M * 3;
+		const int INITIAL_VA = SZ_4M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA - SZ_2M,
+				    SZ_8M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_subtest("vm_bind_sparse_high_vas") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t map_size = 16 * SZ_4K;
+		const uint64_t INITIAL_VA = 0x7fffffff0000;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+
+		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
+		igt_panthor_bo_create(fd, &bo, map_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA, SZ_4K,
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


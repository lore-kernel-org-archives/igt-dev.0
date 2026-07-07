Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F5BC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 21:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098BA10EF00;
	Tue,  7 Jul 2026 21:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Q5H7Fnoq";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABD910E30F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 21:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783460283; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ju/w6P8/U0JO3bMTpbE9Y5xV+D6prTra/Qo/wuBuNJTlYX3pUBDiMm23q9NIl9FSWKSH2IdOlI0Cyz7uV/FRewMMDsSrS94UD6DBGRBLYY3mGypKBRt22j5I+7esv8Wa+9xeOPeDtsk7CqahW3rYHpRikSf6Os+b7eD2AtGbggc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783460283;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y9Jrhu8yU/DBillZcUivnmpOniEalK+sh7YMJMtspVI=; 
 b=UyZ3ruMTWEow7mlNa8gNMBfCfjiHAYZcDGmDR+dfLSSENIrfK7xdQUc5l4BDZsgGar/tqzBT7/Pj/y6KBy43Uk9amMPc/vOJKeVETSzTUC/wmtS6HROMbRsBpmEKIVgJLkFO4zKm81abgfPmJNBUHSORmAvk6PA48NgDSg0Nlw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783460283; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=y9Jrhu8yU/DBillZcUivnmpOniEalK+sh7YMJMtspVI=;
 b=Q5H7FnoqgYluMlzHHLEXAu5b7yt3vm5ogMeVZMecT3/wT8c2vKISr0aVi8TN4ScL
 OD8Ry7A7IoH3uHGc4VvoRIiUFBw9ESChUjzQOMp+7DZdCfLUKwJGT7rPNWd+AO27Esz
 uNPsxo0q7V28Ilt2vUqVbE1BWvZlNkUSCQib+5kw=
Received: by mx.zohomail.com with SMTPS id 1783460282738755.5095664711147;
 Tue, 7 Jul 2026 14:38:02 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 07 Jul 2026 22:36:28 +0100
Subject: [PATCH v4 3/3] tests/panthor: Add Panthor sparse VM_BIND tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-panthor-sparse-mappings-v4-3-fac6061f5adf@collabora.com>
References: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
In-Reply-To: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Steven Price <steven.price@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12287;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=sReeFRzrLHkarQ/z+z+c8GHwkidTbrEph5Br4b9NxNI=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqTXGwYx5ItIV1dTFyEtaiiUyRYaaV8+uKPNOtz
 xYnZtzOFQmJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCak1xsAAKCRAOJn5M7lND
 PXvHC/9vUNyio05YUSdT93X5MnVm+Fi9EOtM5caZerbwMDegxMJj1w8jUBtdby6b7nLnby6rJGA
 UTL0kmAk+n6bFLzmAUIwp+0sZ57C05tsyAD3c8TpIWawiUIf9VvZ+3CM5kzxXRbrVM+e7xwVAhx
 WwjhMXs5Ut5DPImiHG4TkLDqw5mbGNmFg+Q2ltHjV8/9bPCGbs5mZ8QuGmQKiPxGdekrPe7BLAl
 cTQ+bjSFps/WQYEVPb2tehYv2+lOUYgt2SLCIr7LKkOq0x4MhMeGSk/AR7dk3eOpmshJJ966L89
 QEXHNUbdpKWXxQQZ3Yz4otU9KDwpvC8hdkcHAp3ZjTVnAb/8sLWzENFmM2+nckEPT9CxToOqeE6
 wVd2GLUW/lVWik3BiUywrXN/Y1lDebgcv+OSpQbHaKoUKmP/lp7hDnggBUtPswtK0yFq5HSkfrq
 qcQQxB0o6qXq4X0N2a6nhT+uqocgRNepknXrGGQgAYDNh2LciH6YbptsGlNGJOO0gaSV8=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

New batch of vm_bind tests that validate KMD's sparse binding
functionality, available since driver revision 1.9.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tests/panthor/panthor_vm.c | 321 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 321 insertions(+)

diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 9548dbcbaa45..9011df25ef0c 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -4,6 +4,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_panthor.h"
+#include "igt_sizes.h"
 #include "panthor_drm.h"
 
 int igt_main() {
@@ -287,6 +288,326 @@ int igt_main() {
 		igt_panthor_vm_destroy(fd, vm_id, 0);
 	}
 
+	igt_describe("Perform a simple sparse vm_bind operation");
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
+	igt_describe("Perform a partial hugepage-unaligned unmap of a sparsely bound region");
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
+	igt_describe("Do a partial hugeapge-aligned unmap from start of sparsely-bound region");
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
+	igt_describe("Do a partial hugeapge-unaligned unmap from start of sparsely-bound region");
+	igt_subtest("vm_bind_sparse_partial_unmap_start_aligned_no_hugepage_multiple") {
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
+	igt_describe("Do partial hugeapge-aligned unmap that left-intersects with sparse region");
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
+	igt_describe("Do partial hugepage-aligned unmap that is proper subset of sparse region");
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
+	igt_describe("Do normal hugepage-aligned bind that intersects with sparsely-mapped region");
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
+	igt_describe("Do normal hugepage-unaligned bind that intersects with sparsely-mapped region");
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
+	igt_describe("Do normal hugepage-unaligned bind that intersects with sparsely-mapped region");
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
+	igt_describe("Do normal hugepage-aligned bind that intersects with sparsely-mapped region");
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
+	igt_describe("Do normal hugepage-aligned bind that splits original region in two");
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
+	igt_describe("Do normal 2MiB aligned hugepage-size-unaligned bind over sparse region");
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
+	igt_describe("Do normal hugepage-aligned bind over left end of sparse region");
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
+	igt_describe("Do normal hugepage-unaligned bind over left end of sparse region");
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
+				    INITIAL_VA - SZ_2M, SZ_1M * 3,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Do normal hugepage-unaligned bind over right end of sparse region");
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
+	igt_describe("Do normal hugepage-aligned bind that envelopes whole sparse region");
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
+	igt_describe("Perform sparse binding operation whose range causes an overflow");
+	igt_subtest("vm_bind_sparse_overflow") {
+		uint32_t vm_id;
+		uint64_t map_size = ALIGN_DOWN(UINT64_MAX, SZ_2M) - (SZ_2M * 3);
+		const int INITIAL_VA = SZ_512M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, EINVAL);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
+	igt_describe("Perform sparse unbind operation whose range causes an overflow");
+	igt_subtest("vm_unbind_sparse_overflow") {
+		uint32_t vm_id;
+		uint64_t map_size = SZ_2M * 3;
+		uint64_t unmap_size = ALIGN_DOWN(UINT64_MAX, SZ_2M) - map_size;
+		const int INITIAL_VA = SZ_512M;
+
+		igt_panthor_vm_create(fd, &vm_id, 0);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
+		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, unmap_size,
+				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, EINVAL);
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}

-- 
2.55.0


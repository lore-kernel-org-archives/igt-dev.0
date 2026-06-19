Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C97CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 13:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75D510E0BD;
	Fri, 19 Jun 2026 13:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="U3zloyjB";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660A710E084
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 13:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781877287; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H0dP8eWaOHHjs8ilIlvgSrj+qp29UfmAhPO64KCoCqXzdesJH/056CrgUZ+T6SnnKIS1lDbyiSHsPwOY7AOdJ04aCrMEqVhtYFJvGycf1h1jRPOvqze2feX/Usq6cBac49zT7UOBu80zIaVzG0Eg59a154jJRpOIRIVTeWCjRYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781877287;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vUUKbt9W6InLjRL4JsCrE8AgCDe1lAkFx2fDBX1Rm5E=; 
 b=eTOnDxq6vjWw5hns6GXTThJ16lSUzCamtHXDqkPhj7RpLRFq25sNxu/7MHJ4OEIxOPfCq+Z8Ta8UEN8KRfPpLOWHP7tFpdW1PwPYLL1wkvbu+5yUtGhha7oAqVw+JI84XVs5a+ERZdN8uB3XDAHgg50oX5yfKA9uPEAQBf7duoM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781877286; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=vUUKbt9W6InLjRL4JsCrE8AgCDe1lAkFx2fDBX1Rm5E=;
 b=U3zloyjBSxbVYfgWw/Kl0aTn6jVWEcyQZ0H10jU4nr094FPxFymGAQDG4W6/iq/w
 O1yJ7KOJ58Z+pK5UbIedzm0D0sOMlRlZ2vruSY8mnikAGIvoRuaFBpmrIZ+MiGv+vzS
 mHx8HKA1mrRl0Q/aHJchScxe7p689wKVhe9ypRBU=
Received: by mx.zohomail.com with SMTPS id 1781877284487231.07152977696808;
 Fri, 19 Jun 2026 06:54:44 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 19 Jun 2026 14:54:30 +0100
Subject: [PATCH v3 3/3] tests/panthor: Add Panthor sparse VM_BIND tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-panthor-sparse-mappings-v3-3-cb6c230b6bc0@collabora.com>
References: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
In-Reply-To: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11076;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=RQOUbLLMYsbhIKBWbs5aM/FyK3upBw+OGqHU4PQykcA=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNUoawSRFLzTF65aLR7ec2lOCsQ31Pj61ox8iQ
 WQ4s8xKsheJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajVKGgAKCRAOJn5M7lND
 PXuwC/9brGYnHsg5Zcy3Bfjng6b6o/WMdeUAStvrbV2jfRCz2T+v9O64L5fXUU8PlcPwKGNpeiO
 cKj482Jip5LnmDpaxm6yVXFTNNdPHGaKHIh7BULM9cu6Cpm9dCsjD1NCpAfpXAl8Dxk4KzooITB
 12x0fukIPt5n9GIjZkZmSn52NWwwAv99SQHZx7xWlQ2fWojQAGfd6PubYU6RpZbu8fyiBhxYyUI
 sovMLg7FD4fOvCf7ZnrGEHFP2gE4G2i1vsYJ2MV8wObuFGFpNExVHKkSNMo99ZMzzcU0rxNeqn/
 wFiOdXVNRUDGfFEwBu09zcr/vpoQJsBf/+Mc8r9SAzyGEKWr8U/NRW5ojcBJA8+Vob9W6SZcxgO
 I8zvpalTEjKfOXww+s5K8VOq8N0IaAhVxmlF0IiQ8csAdgpJlIzaYTTSgYyIdhfwOnThw+o82SO
 DQadH87OdSAhj19X4uyrcuwDDiUQN647jCTqawqze0j16f7fyxBlhncob90qoYJSgGohQ=
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
 tests/panthor/panthor_vm.c | 291 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 92b105b9e83a..9c2d7f7f9f89 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -270,6 +270,297 @@ int igt_main() {
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
 	igt_fixture() {
 		drm_close_driver(fd);
 	}

-- 
2.54.0


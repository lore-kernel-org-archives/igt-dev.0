Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DC5CD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 13:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ECB10EE9F;
	Wed, 13 May 2026 13:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuMJtTiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9655910E5DA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778680489; x=1810216489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n1Apdk6KnqdXOx9Iuyl7S7N0+2N8sWJekcEVV8adlUU=;
 b=cuMJtTiqjwyiC9eFXvoudtoAIIr4romIqjWeBVexaZkgWDuuLJUhZUK5
 nguquoWyhSp0wKIaLGQm2TH7qcRWV9BoAxbZFbiiRgod/lmcHoZQXa1bc
 iu0cBCTB/QrD/y/mRCGmdm854WNdDBD8Kkn+vgAALrvd439Sb7I+NrXUo
 N0EBPG7Bau5eXTbMGeb3zm5n1BUPvvq+sP3lGZV6yTc0FVOc1SdHnkV6Q
 CLfSFgM0s2HVPVQmH+KYeWU1WXYn0kNk6LzcQ1uahNtcjmgSJA64ttG82
 fRoWf4PbpEtnnkZz1RFsEMForr1Y4GjX7wDdWUm3x9QiY7shuQynfQbbG A==;
X-CSE-ConnectionGUID: H/M2s1kgT/KtkVd8blnxhQ==
X-CSE-MsgGUID: mK5U2YJhQ2+6RLfRByVlQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="91070731"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="91070731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:54:48 -0700
X-CSE-ConnectionGUID: qKUJXG09TXyaoyY9NnoZfQ==
X-CSE-MsgGUID: iVACWC7DTxmA3lft4Jl7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242441319"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:54:45 -0700
Date: Wed, 13 May 2026 15:54:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] tests/panthor: Add Panthor sparse VM_BIND tests
Message-ID: <20260513135429.yxvllparnpjouikg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
References: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
 <20260508172537.3456595-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508172537.3456595-4-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2026-05-08 at 18:25:35 +0100, Adrián Larumbe wrote:
> In a separate file for the time being, but should eventually be
> incorporated into panthor_vm.c.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/panthor/meson.build         |   1 +
>  tests/panthor/panthor_vm_sparse.c | 316 ++++++++++++++++++++++++++++++
>  2 files changed, 317 insertions(+)
>  create mode 100644 tests/panthor/panthor_vm_sparse.c
> 
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index 42a46e9934a9..f9509ecd8816 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -3,6 +3,7 @@ panthor_progs = [
>  	'panthor_group',
>  	'panthor_query',
>  	'panthor_vm',
> +        'panthor_vm_sparse',
---^
Use tab here, no spaces.

>  ]
>  
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_vm_sparse.c b/tests/panthor/panthor_vm_sparse.c
> new file mode 100644
> index 000000000000..fe7d25542f41
> --- /dev/null
> +++ b/tests/panthor/panthor_vm_sparse.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.

Year 2026 unless you sent this to igt-dev ML last year?

Rest looks good, LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +int
> +igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_subtest("vm_bind_sparse") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_4K * 4;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, SZ_2M, map_size, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_partial_unmap_start_size_unaligned") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, SZ_4K * 2,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_partial_unmap_start_size_aligned") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, SZ_2M,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest
> +	    ("vm_bind_sparse_partial_unmap_start_size_unaligned_no_gpupage_multiple") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA, 4 * SZ_64K,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_partial_unmap_below_start") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA - SZ_2M, SZ_2M * 3,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_partial_unmap_above_start") {
> +		uint32_t vm_id;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, INITIAL_VA + SZ_2M, SZ_2M,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M, SZ_2M * 2,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_start_unaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + map_size - SZ_1M,
> +				    SZ_4M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_start_size_unaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + map_size - SZ_1M,
> +				    SZ_1M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_start_size_aligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    INITIAL_VA + map_size - SZ_2M, SZ_4M,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_aligned_split_original_va") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M,
> +				    SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_start_aligned_size_unaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA + SZ_2M,
> +				    SZ_1M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_aligned_intersect_left") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    INITIAL_VA - SZ_2M, SZ_2M * 2,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_size_unaligned_intersect_left") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    INITIAL_VA - SZ_2M, SZ_1M * 2,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_start_aligned_intersect_right") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    INITIAL_VA + map_size - SZ_2M, SZ_2M + SZ_4K * 6,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_remap_wrap_around_va") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = SZ_2M * 3;
> +		const int INITIAL_VA = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, SZ_8M, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA - SZ_2M,
> +				    SZ_8M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_bind_sparse_high_vas") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t map_size = 16 * SZ_4K;
> +		const uint64_t INITIAL_VA = 0x7fffffff0000;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_vm_bind_sparse(fd, vm_id, INITIAL_VA, map_size, 0);
> +
> +		/* Now attempt normal VM_BIND's that intersect with the previous chunk */
> +		igt_panthor_bo_create(fd, &bo, map_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, INITIAL_VA, SZ_4K,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_fixture() {
> +		drm_close_driver(fd);
> +	}
> +}
> -- 
> 2.53.0
> 

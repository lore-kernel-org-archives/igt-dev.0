Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9458D5E13D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DABC10E86A;
	Tue, 16 Dec 2025 18:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpSgjgRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9A410E86A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765908329; x=1797444329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FO7Bwja7ScvwEoVIVhR0/eEct+MNWsqPxnpRPNatL0o=;
 b=BpSgjgRD6dqQN5vjLr3jxkPQ5YM3iV6uT2q/5WFZR7YE1G2o6LUhoWwO
 UlULLIDueryJwNv1nw3eihJoJwmuKrEiB4c4R0Ys2NaiCeux90y4EPoqK
 XtLPdmfUQmMjFc9tiDGctfIXraND0MF8Oo3c1/LhNiySgLD+zsJJP+jlN
 g79Z2ER7p0KfgsyS6ySgrlXCVkdoOH9vR1HKmKVFmshuw9SngNxTYBEEu
 zyCKODBQ1XcCA7I+T8bUh8MvnKn22cnTH0gZPhwki5g92Xy1dmZVOPJFz
 cQGlVP1zR7WnOWFC+M8kAK8uEpvypn6ibC+Rfy8nHowrIwnbkSxD2tPml w==;
X-CSE-ConnectionGUID: ZUpzyibfR5y8grZgMBV8iw==
X-CSE-MsgGUID: BUANsfr7QzyCorJaUdE3qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71692958"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="71692958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:05:28 -0800
X-CSE-ConnectionGUID: gjfOUDTCQzKE0ckTgWJcXg==
X-CSE-MsgGUID: jBDCRgRRR+6GQoPZqMq81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198139007"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:05:21 -0800
Date: Tue, 16 Dec 2025 19:05:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH RESEND i-g-t v2 2/2] tests/panthor: Add VM_BIND tests for
 partial huge page unmaps
Message-ID: <20251216180518.yagbcwrjebvh5iik@kamilkon-DESK.igk.intel.com>
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
References: <20251213190205.2435793-1-adrian.larumbe@collabora.com>
 <20251213190205.2435793-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251213190205.2435793-3-adrian.larumbe@collabora.com>
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
On 2025-12-13 at 19:01:38 +0000, Adrián Larumbe wrote:
> Kernel commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> behavior") made it illegal to perform partial unmaps of memory regions
> backed by huge (> 2MiB) pages. A workaround was written specifically for
> Panthor, but in order to test it, multiple scenarios and corner cases
> had to be considered.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

This patch do not apply:
Patch failed at 0002 tests/panthor: Add VM_BIND tests for partial huge page unmaps

Please rebase on current top and resend.

Regards,
Kamil

> ---
>  tests/panthor/panthor_vm.c | 191 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 191 insertions(+)
> 
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 18a0622c7f8a..28959f21e997 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -78,6 +78,197 @@ igt_main {
>  		igt_panthor_vm_destroy(fd, vm_id, 0);
>  	}
>  
> +	igt_describe("Requested unmapping is identical to existing huge page mapping");
> +	igt_subtest("vm_unbind_identical_hugepage_single") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_2M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is identical to existing huge page mapping, but only a subset of the object's pages are mapped in the VM");
> +	igt_subtest("vm_unbind_identical_hugepage_single") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is identical to existing multiple huge page mapping");
> +	igt_subtest("vm_unbind_identical_hugepage_multiple") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is identical to existing huge page mapping, but only part of the BO is mapped");
> +	igt_subtest("vm_unbind_identical_hugepage_offset") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind_offset(fd, vm_id, bo.handle, 0x200000,
> +					   SZ_4M, SZ_2M, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is left aligned subset of an existing huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_leftaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_4M;
> +		uint64_t unmap_size = SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, unmap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is right aligned subset of an existing huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_rightaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_4M;
> +		uint64_t unmap_size = SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + bo_size - unmap_size, unmap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is a superset of existing huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_superset") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_2M;
> +		uint64_t unmap_size = SZ_1M * 5;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x100000, unmap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is a subset of an existing mapping");
> +	igt_subtest("vm_unbind_hugepage_subset") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_4M;
> +		uint64_t unmap_size = SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + SZ_1M, unmap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + SZ_2M + SZ_4K, unmap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Perform successive unmaps over the remnants of an original multi huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_successive") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x208000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x208000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, 0x4000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x401000, 0x4000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x4fb000, 0xA000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fb000, 0xA000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x3fc000, 0x4000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000, 0x1000,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.51.2
> 

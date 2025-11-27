Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5941CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 08:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4010E7B3;
	Thu, 27 Nov 2025 08:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hX3q6hhF";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C8A10E7B9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764233601;
 bh=SGB5+mSvTOaOFFw9e6q2Nlft+z5DzB2lgdAKCqSnw0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hX3q6hhFxMknXNhTB5e4+EBGulZ8bUBhRK5RMcljnktskO3C7npp6bETyX5Q7BQ+j
 XiSOhaHBH0paDe7/E3hX2o40iJwenX2YPQB9IYCfAqhhcHGNInP2Dz4SlWpWC1a89O
 /FrekjkYu3vl7U9fJF/lqfS5jHd+RZu9BdlZ82otg42uPRj3O1d+mW2ZbjxvzE2QEe
 /a0XpcXQ80CSLVXRlYCGFlID3IaU9mSeB5iUPkqWFZ/YG4gR/fRWE3LF9VOgbuJei4
 gi1BmsenmClsKMb+wh9qXBWB8P+i8RMyEE5RnzUNTxwe25+dE9czKDoypXdWVKd0Ln
 bSqozv40JLgfA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AF7D117E1144;
 Thu, 27 Nov 2025 09:53:20 +0100 (CET)
Date: Thu, 27 Nov 2025 09:53:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor: Add VM_BIND tests for partial huge
 page unmaps
Message-ID: <20251127095316.2ce78f74@fedora>
In-Reply-To: <20251127030145.585641-2-adrian.larumbe@collabora.com>
References: <20251127030145.585641-1-adrian.larumbe@collabora.com>
 <20251127030145.585641-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Nov 2025 03:01:44 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Kernel commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> behavior") made it illegal to perform partial unmaps of memory regions
> backed by huge (> 2MiB) pages. A workaround was written specifically for
> Panthor, but in order to test it, multiple scenarios and corner cases
> had to be considered.

Maybe add a link to the kernel fix addressing the problem in your v2.

>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/panthor/meson.build              |   1 +
>  tests/panthor/panthor_hugepage_unmap.c | 210 +++++++++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 tests/panthor/panthor_hugepage_unmap.c
>=20
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index 42a46e9934a9..78341b720912 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -3,6 +3,7 @@ panthor_progs =3D [
>  	'panthor_group',
>  	'panthor_query',
>  	'panthor_vm',
> +        'panthor_hugepage_unmap',

I believe those belong in panthor_vm.c (they are about testing some
VM_BIND corner cases). With this addressed, the patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  ]
> =20
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_hugepage_unmap.c b/tests/panthor/panth=
or_hugepage_unmap.c
> new file mode 100644
> index 000000000000..1c712fb0d4f7
> --- /dev/null
> +++ b/tests/panthor/panthor_hugepage_unmap.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Requested unmapping is identical to existing huge page ma=
pping");
> +	igt_subtest("vm_unbind_identical_hugepage_single") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_2M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Requested unmapping is identical to existing huge page ma=
pping, but only a subset of the object's pages are mapped in the VM");
> +	igt_subtest("vm_unbind_identical_hugepage_single") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_4M;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Requested unmapping is identical to existing multiple hug=
e page mapping");
> +	igt_subtest("vm_unbind_identical_hugepage_multiple") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Requested unmapping is identical to existing huge page ma=
pping, but only part of the BO is mapped");
> +	igt_subtest("vm_unbind_identical_hugepage_offset") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Requested unmapping is left aligned subset of an existing=
 huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_leftaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_4M;
> +		uint64_t unmap_size =3D SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Requested unmapping is right aligned subset of an existin=
g huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_rightaligned") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_4M;
> +		uint64_t unmap_size =3D SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x200000, bo_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_bind(fd, vm_id, 0, 0x200000 + bo_size - unmap_size, unm=
ap_size,
> +				    DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Requested unmapping is a superset of existing huge page m=
apping");
> +	igt_subtest("vm_unbind_hugepage_superset") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_2M;
> +		uint64_t unmap_size =3D SZ_1M * 5;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +		uint64_t bo_size =3D SZ_4M;
> +		uint64_t unmap_size =3D SZ_8K;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_describe("Perform successive unmaps over the remnants of an origina=
l multi huge page mapping");
> +	igt_subtest("vm_unbind_hugepage_successive") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_1M * 6;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert(vm_id !=3D 0);
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
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}


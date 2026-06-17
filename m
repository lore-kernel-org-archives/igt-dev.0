Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF6CCD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 15:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189110E71C;
	Wed, 17 Jun 2026 15:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kwziYHpd";
	dkim-atps=neutral
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8B5A10E0C1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 15:54:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23A76302F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:54:06 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 8E7813F915
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1781711650; bh=V0y+xiYfmlFRFQpMnzmte4gDDDwVyKOKPIe31Dvm3+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kwziYHpdJd/FPFYldWQHdwhxdBqyxVjIUGCKVi7ClznKTOeUzQyMZuCw4VDOcFuKw
 LosIVTh9Whb8sI7zbN4OZYu5zPnb+hxKS+RpAllQGY4aCo/eIi7Txor/Md1tY7P6q7
 ob9xi6QvEQVNV5BtWLX6ct4gFGbjEw4E+ER6b3C8=
Date: Wed, 17 Jun 2026 16:54:00 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
Message-ID: <ajLDGNEWqmDJWpDl@e142607>
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
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

On Tue, Jun 16, 2026 at 04:43:23PM +0100, Adrián Larumbe wrote:
> Users of vm_bind ioctl() should never specify a VA region that intersects
> with that reserved for internal kernel BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  tests/panthor/panthor_vm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 92b105b9e83a..9548dbcbaa45 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -270,6 +270,23 @@ int igt_main() {
>  		igt_panthor_vm_destroy(fd, vm_id, 0);
>  	}
>  
> +	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
> +	igt_subtest("vm_bind_intersect_kbo_range") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_2M;
> +		uint64_t uva_range;
> +
> +		igt_panthor_vm_create_userva_range(fd, &vm_id, 0, &uva_range);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, ALIGN(uva_range, bo_size),
> +				    bo_size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> 
> -- 
> 2.54.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

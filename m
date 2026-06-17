Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6517CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 14:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961EF10EFDF;
	Wed, 17 Jun 2026 14:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VoITLHPQ";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A510EFE5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1781706847;
 bh=kSXhe+LTEd5mX4NfA1+VFV1XW3Zu8z7/zId+UVeokls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VoITLHPQ+cXFXX+WrUntvutGR5DUZq3Jw0AiNFAFjkOqxAljm+koEvUYP5mRm8Ihr
 A9EWQgf/zBy3WggWFxhQomwO3xxb2ZfiiHeCPw7iRIiQFfOmwwcaL7k+NiTrjlm9EQ
 zuI5GgdzSa7mCiwuKD4aJnbuF8xdPJMjfI8O62LgyLqUzLHlbyxdNmTSO1zLDVgU5C
 RlqVLlqPt4I2RdoKXdh0erB3HqGLpz1SEbngsLjNuuBiz79+Ff/Y8ezmRYbr4Su02V
 PoCRFxJNt1DesdI6JfcoFA2nsRtRnBYML1+TpVd2Z4FLtaQidCBTCD9njkYEHvja29
 ny4yxoz3pIIEw==
Received: from fedora-2.home (unknown [100.64.0.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 058DB17E05DE;
 Wed, 17 Jun 2026 16:34:06 +0200 (CEST)
Date: Wed, 17 Jun 2026 16:34:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
Message-ID: <20260617163403.195e4893@fedora-2.home>
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Tue, 16 Jun 2026 16:43:23 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Users of vm_bind ioctl() should never specify a VA region that intersects
> with that reserved for internal kernel BOs.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  tests/panthor/panthor_vm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 92b105b9e83a..9548dbcbaa45 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -270,6 +270,23 @@ int igt_main() {
>  		igt_panthor_vm_destroy(fd, vm_id, 0);
>  	}
> =20
> +	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
> +	igt_subtest("vm_bind_intersect_kbo_range") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size =3D SZ_2M;
> +		uint64_t uva_range;
> +
> +		igt_panthor_vm_create_userva_range(fd, &vm_id, 0, &uva_range);
> +		igt_assert(vm_id !=3D 0);
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
>=20


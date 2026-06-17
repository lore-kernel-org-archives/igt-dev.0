Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC63FCD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 14:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675D710EFDF;
	Wed, 17 Jun 2026 14:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GMsyDYqp";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E4610EFE5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1781706834;
 bh=zrp6+ZXoctBJGwuPqv7mIcZvb6mx5uA8+xlAl1zmQmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GMsyDYqpPb97nRaCAS4AcAJ/SMoemzc5ArlQSVBCh8YefTE5zN0pFD7sGO29IB1DT
 1R3Kr352NDdwKVMSloJ1jRA6lQP+s72+duJGcxFJWR6h0P/rYEkaoka/jCIQ6fWiN+
 E5PE4nUwOSYlvemEPOD62dLbybmagsRvJU6Yki/czNDY6FcyyXxLPgWP/Erdc2Ka9E
 ZKok7AO+E3JP3cTl426OeExmePEJCHux340y+aOLLdfoGCjRGH2GetnNfcdMQUtShL
 uZPwHQnmZKV01N3FG76GAgPgffNWwu/9UKCQJXdy8n9jR1eGwCnJ7xM6yyjsVKgn5d
 6LGd44r2HmKww==
Received: from fedora-2.home (unknown [100.64.0.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A1D0F17E0128;
 Wed, 17 Jun 2026 16:33:53 +0200 (CEST)
Date: Wed, 17 Jun 2026 16:33:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] panthor: Provide a way to access user VA range when
 creating a VM
Message-ID: <20260617163350.79367032@fedora-2.home>
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-1-f35b1b067f7c@collabora.com>
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-1-f35b1b067f7c@collabora.com>
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

On Tue, 16 Jun 2026 16:43:22 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This will be used in a future test that will check VM_BIND map range
> does not intersect with the range reserved for internal BO's.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  lib/igt_panthor.c | 5 ++++-
>  lib/igt_panthor.h | 7 ++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 7ffb61eb38e9..11d8ec342f0b 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -201,7 +201,7 @@ void igt_panthor_query(int fd, int32_t type, void *da=
ta, size_t size, int err)
>   *
>   * Creates a VM.
>   */
> -void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
> +void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err=
, uint64_t *uva_range)
>  {
>  	struct drm_panthor_vm_create vm_create =3D {};
> =20
> @@ -210,6 +210,9 @@ void igt_panthor_vm_create(int fd, uint32_t *vm_id, i=
nt err)
>  	} else {
>  		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
>  		*vm_id =3D vm_create.id;
> +
> +		if (uva_range)
> +			*uva_range =3D vm_create.user_va_range;
>  	}
>  }
> =20
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index be8490840f3a..64b0e687eef1 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -17,7 +17,7 @@ struct panthor_bo {
>  };
> =20
>  void igt_panthor_query(int fd, int32_t type, void *data, size_t size, in=
t err);
> -void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
> +void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err=
, uint64_t *uva_range);
>  void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
>  void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_hand=
le, uint64_t va,
>  				uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
> @@ -44,6 +44,11 @@ static inline void igt_panthor_vm_bind(int fd, uint32_=
t vm_id, uint32_t bo_handl
>  	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, er=
r);
>  }
> =20
> +static inline void igt_panthor_vm_create(int fd, uint32_t *vm_id, int er=
r)
> +{
> +	igt_panthor_vm_create_userva_range(fd, vm_id, err, 0);
> +}
> +
>  enum cs_opcode {
>  	CS_OPCODE_NOP =3D 0,
>  	CS_OPCODE_MOVE48 =3D 1,
>=20


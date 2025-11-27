Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C04D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 08:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B691810E780;
	Thu, 27 Nov 2025 08:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K5D4omrQ";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6DC10E780
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764233330;
 bh=hF5Wgl9M5YpLMewAuFcgKTpKI4yp/ikiR9dW6JLGw9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K5D4omrQlwcCkFcxPplKmplahFeDko8hPLMIyPWj8veO6v/USj0oup88jyiwJOEsJ
 AnTvgF600rHlqoyjCMuORHB9fY7LAQ2F3hSEfS+G5BgohvstNXqkC8/m8GswlGQulD
 j8/GUCQpHTM6ki8e7e/OQBsx2hrd+D7s3+nIHKrU2KrFJqaCcaZNTUNWCmCEECRZ+B
 G4CYbKbTllcj6jaqwTRU1o7jcGnQzz/3rRbRuHIsXoQuaxVk5xIwb3WttPjzXnk68e
 h84rZHMm2eku5cYWJiDGT3Ca2yRvxp/UkugoCZ5TA0zM82HFksk3m84yrA/nxzU9Qc
 0Uc+0/CUUzrsQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A4ADB17E1122;
 Thu, 27 Nov 2025 09:48:49 +0100 (CET)
Date: Thu, 27 Nov 2025 09:48:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] panthor: Allow specifying offset when mapping a BO
 against a VM
Message-ID: <20251127094846.7eea71f1@fedora>
In-Reply-To: <20251127030145.585641-1-adrian.larumbe@collabora.com>
References: <20251127030145.585641-1-adrian.larumbe@collabora.com>
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

Hello Adrian,

Quick note for v2, make sure you use "PATCH i-g-t vX" as a
--subject-prefix, so it's clear those are IGT patches.

On Thu, 27 Nov 2025 03:01:43 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> A future commit that tests VM_BIND unmapping of regions backed by huge
> pages will make use of it. Leave the old interface as an inlined
> function that passes 0 as a default BO offset.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

with a minor formatting improvement suggested below.

> ---
>  lib/igt_panthor.c | 5 +++--
>  lib/igt_panthor.h | 9 +++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 73ada9c59bfc..49b427d4f162 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -234,12 +234,13 @@ void igt_panthor_vm_destroy(int fd, uint32_t vm_id,=
 int err)
>   *
>   * Bind a buffer object to a virtual address in the specified VM.
>   */
> -void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
> -			 uint64_t va, uint64_t size, uint32_t flags, int err)
> +void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_hand=
le, uint64_t va,
> +				uint64_t size, uint64_t offset, uint32_t flags, int err)
>  {
>  	struct drm_panthor_vm_bind_op bind_op =3D {
>  		.flags =3D flags,
>  		.bo_handle =3D bo_handle,
> +		.bo_offset =3D offset,
>  		.va =3D va,
>  		.size =3D size,
>  	};
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index dc90033c0ad4..1fe0271d48c9 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -19,8 +19,8 @@ struct panthor_bo {
>  void igt_panthor_query(int fd, int32_t type, void *data, size_t size, in=
t err);
>  void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
>  void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
> -void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uin=
t64_t va,
> -			 uint64_t size, uint32_t flags, int err);
> +void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_hand=
le, uint64_t va,
> +			 uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
>  void igt_panthor_bo_create(int fd, struct panthor_bo *bo, uint64_t size,=
 uint32_t flags, int err);
>  uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err);
>  void igt_panthor_free_bo(int fd, struct panthor_bo *bo);
> @@ -38,6 +38,11 @@ void igt_panthor_group_submit_simple(int fd, uint32_t =
group_handle,
>  				     int err);
>  uint64_t igt_panthor_get_first_core(uint64_t cores_present);
> =20
> +static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t =
bo_handle,
> +				       uint64_t va, uint64_t size, uint32_t flags, int err) {
> +	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, er=
r);
> +}

formatting nit:

static inline void
igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
		    uint64_t size, uint32_t flags, int err)
{
	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
}

> +
>  enum cs_opcode {
>  	CS_OPCODE_NOP =3D 0,
>  	CS_OPCODE_MOVE48 =3D 1,
>=20
> base-commit: 7bc8d310594c1dc1a851451845d1ea3c15fbd53d


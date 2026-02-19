Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262F2E9A052
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 17:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56F910E05E;
	Thu, 19 Feb 2026 17:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BWMGd29/";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342C10E05E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 17:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771520442; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mPFxI7OQOib3gun3SN8b/RNOzy3AAkBriYPV2/RYVk1tAlg3ysvVIwVbTQOnIQsD8NbzDeofML2i8/i7O7cOSrttOfu0r06ZaqVnV0HXu32N/7ihNF3n/jTiqNAurGXY6VdZYo7KdZttr5zWe5+ovxra5GY7UuY2VjE1XDfES6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771520442;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hp7Oh3qNHhxowhdIQwlViOtNDzt/XjYGMoEVdv4IAeM=; 
 b=O59B4hWuCwxDde9Q5qhqcNHsnctOlgy8zSvZTA78+RbniZda6Y8WBuT9tZVTgk24hQiCuGuMsFR2OoCb/BzL7/NMTcCVOqwXk8azcMpKcYqGCdW7X7xCAF/G7ncTH0RJM4bEZyNYUWlGtSIvYYw/eForyELxhU4cCoYxpZM9qaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771520442; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=hp7Oh3qNHhxowhdIQwlViOtNDzt/XjYGMoEVdv4IAeM=;
 b=BWMGd29/UKLWqAPcCK3Xemr9hDuHSSDMPsxyiOtuUnDTErDFWr3a7+8O8dhyL9sF
 kO2+O/p/B4Ejb1tijB/Pfh4dG2W2Gdmu8TD7foCh9iyKC0UYiVZLdBgO8u5+xu9/PnR
 V28uCSiNEYX8tq8s0nadVdWYppFu99JukMO59upk=
Received: by mx.zohomail.com with SMTPS id 1771520440820910.0348307762313;
 Thu, 19 Feb 2026 09:00:40 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v2] panthor: Enable compilation on big-endian arch
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
Date: Thu, 19 Feb 2026 14:00:26 -0300
Cc: igt-dev@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A6A63653-D3C5-4688-832C-8F975B5F0DFD@collabora.com>
References: <20260219150524.92665-1-kamil.konieczny@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 19 Feb 2026, at 12:05, Kamil Konieczny =
<kamil.konieczny@linux.intel.com> wrote:
>=20
> Compilation of Panthor was broken on big-endian due to a guard in
> pathor lib against such arch. Fix this and create and use
> function for skipping all panthor tests on such machines.
>=20
> Also while at it, init fd so it could be safely used at last
> fixture.
>=20
> v2: simplify test for big-endian, fix typo (Boris)
>=20
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> lib/igt_panthor.c             | 11 +++++++++++
> lib/igt_panthor.h             |  6 ++----
> tests/panthor/panthor_gem.c   |  3 ++-
> tests/panthor/panthor_group.c |  3 ++-
> tests/panthor/panthor_query.c |  3 ++-
> tests/panthor/panthor_vm.c    |  3 ++-
> 6 files changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 49b427d4f..7ffb61eb3 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -6,6 +6,17 @@
> #include "ioctl_wrappers.h"
> #include "panthor_drm.h"
>=20
> +/**
> + * igt_panthor_skip_on_big_endian:
> + *
> + * Skip Panthor test on big-endian machines.
> + */
> +void igt_panthor_skip_on_big_endian(void)
> +{
> + igt_skip_on_f(__BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__,
> +      "Panthor is unsupported on big-endian arch\n");
> +}
> +
> /**
>  * igt_panthor_group_create:
>  * @fd: device file descriptor
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 97a2b7497..be8490840 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -61,11 +61,9 @@ enum cs_flush_mode {
> };
>=20
> /* There's no plan to support big endian in the UMD, so keep
> - * things simple and don't bother supporting it here either.
> + * things simple and don't bother supporting it.
>  */
> -#if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> -#error "big endian not supported"
> -#endif
> +void igt_panthor_skip_on_big_endian(void);
>=20
> struct cs_instr {
> union {
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> index 57ba4bc82..6388addb0 100644
> --- a/tests/panthor/panthor_gem.c
> +++ b/tests/panthor/panthor_gem.c
> @@ -8,9 +8,10 @@
> #include "igt_panthor.h"
>=20
> int igt_main() {
> - int fd;
> + int fd =3D -1;
>=20
> igt_fixture() {
> + igt_panthor_skip_on_big_endian();
> fd =3D drm_open_driver(DRIVER_PANTHOR);
> }
>=20
> diff --git a/tests/panthor/panthor_group.c =
b/tests/panthor/panthor_group.c
> index 13636e60c..c79f8d629 100644
> --- a/tests/panthor/panthor_group.c
> +++ b/tests/panthor/panthor_group.c
> @@ -41,9 +41,10 @@ issue_store_multiple(uint8_t *cs, uint64_t =
kernel_va, uint32_t constant)
> }
>=20
> int igt_main() {
> - int fd;
> + int fd =3D -1;
>=20
> igt_fixture() {
> + igt_panthor_skip_on_big_endian();
> fd =3D drm_open_driver(DRIVER_PANTHOR);
> }
>=20
> diff --git a/tests/panthor/panthor_query.c =
b/tests/panthor/panthor_query.c
> index fa4f8ef26..afd58a5bd 100644
> --- a/tests/panthor/panthor_query.c
> +++ b/tests/panthor/panthor_query.c
> @@ -8,9 +8,10 @@
> #include <stdint.h>
>=20
> int igt_main() {
> - int fd;
> + int fd =3D -1;
>=20
> igt_fixture() {
> + igt_panthor_skip_on_big_endian();
> fd =3D drm_open_driver(DRIVER_PANTHOR);
> }
>=20
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 76a669843..92b105b9e 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -7,9 +7,10 @@
> #include "panthor_drm.h"
>=20
> int igt_main() {
> - int fd;
> + int fd =3D -1;
>=20
> igt_fixture() {
> + igt_panthor_skip_on_big_endian();
> fd =3D drm_open_driver(DRIVER_PANTHOR);
> }
>=20
> --=20
> 2.53.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


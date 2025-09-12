Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549CCAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 20:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4410ECE1;
	Fri, 12 Sep 2025 20:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="Fcp+hYmi";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D4310ECD9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 20:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757707782; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lVH/hEQQDs+Qdj9I7L326WeHAwz6uyusngsSe/W/fGlSG0827tNCQbUHX3Iodh7VFEOnn9/pn9CRXUvOm5LumcaVpxAbr0NWCqbUjhbi6GyhGYSK2qftqd8HnXt3YA3bpd7rJHAoixt+CzCmNJejfOH57k5oU3NvkKB7CJikMmo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757707782;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PGNIaUxxTB/S/vF0cE87rLfpcRfxGVwOo3Kmx3BO9Jk=; 
 b=Nk/fYPn/Bsbkqsl8FKocRepfYAAeh9q8vp2uBCxu8ldEB6j2wGHtDCd+/nv79vkhHJhGZGIMHe4LlfyVt+Gcxvc6wx/u89df795tLHszEtuDWGv1EuczAsCbs/Dg3x6/xQ8dX7AOzh0wm3emtxFW4N4v+fa3uFTNnAqjwryO2TQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757707782; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=PGNIaUxxTB/S/vF0cE87rLfpcRfxGVwOo3Kmx3BO9Jk=;
 b=Fcp+hYmizWr9dGyEIpUbEyP4RNTe61bnXHGbppHwt/ksrw/CKq2SU4OO1cv1Ex2R
 ukt293HTISb/Z4T357MvJXMiWCJCzCf3ICGq457kIb8aSkK1y2W4uCHOciknfqXltKk
 pPokiAEvFMPdzLeloogu4EJdsag+qc/nmkSqhpxA=
Received: by mx.zohomail.com with SMTPS id 1757707779994523.8129609557723;
 Fri, 12 Sep 2025 13:09:39 -0700 (PDT)
Message-ID: <2c59491cf48b386d9d2e7787bd44f02b6201bcc3.camel@collabora.com>
Subject: Re: [PATCH V10 03/30] drm-uapi: Add COLOROP object
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
Date: Fri, 12 Sep 2025 16:09:36 -0400
In-Reply-To: <20250815040659.3321102-4-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-4-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
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

On Thu, 2025-08-14 at 22:06 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> DRM is introducing a new DRM core obejct, a drm_colorop. This
> object will represent one color operation in a color pipeline.
>=20
> Introduce the object type in the drm-uapi, including the
> following types:
> - DRM_COLOROP_1D_CURVE,
> - DRM_COLOROP_1D_LUT,
> - DRM_COLOROP_CTM_3X4,
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> =C2=A0include/drm-uapi/amdgpu_drm.h |=C2=A0=C2=A0 9 --
> =C2=A0include/drm-uapi/drm_mode.h=C2=A0=C2=A0 |=C2=A0 23 +++
> =C2=A0lib/igt_kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 272
> +++++++++++++++++++++++++++++++++-
> =C2=A0lib/igt_kms.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 89 +++++++++++
> =C2=A0tests/kms_properties.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +
> =C2=A05 files changed, 381 insertions(+), 15 deletions(-)
[..]
> @@ -4519,6 +4774,11 @@ static int igt_atomic_commit(igt_display_t
> *display, uint32_t flags, void *user_
> =C2=A0
> =C2=A0			if (plane->changed)
> =C2=A0				igt_atomic_prepare_plane_commit(plan
> e, pipe_obj, req);
> +
> +			/* TODO iterate over assigned color pipeline
> and prepare colorop commit */
> +			if (plane->assigned_color_pipeline)
> +				igt_atomic_prepare_colorop_commit(pl
> ane->assigned_color_pipeline,
> +								=C2=A0
> pipe_obj, req);
> =C2=A0		}
> =C2=A0
> =C2=A0	}

This seems to be a stale TODO as you're doing exactly that here
already.

--=20
Thanks,

N=C3=ADcolas

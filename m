Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93ACCF6C11
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 08:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775A010E094;
	Wed,  7 Jan 2026 08:55:45 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613A910E052
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 07:26:28 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7c75178c05fso688862a34.0
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Jan 2026 23:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767770787; x=1768375587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Twe1C1BbPg2woexDagJv2HCcDGXNh4FadpJITTB224w=;
 b=U9A/OCbgpKpPJ/AlvQC63Bfdi2Xf3G3HmzsYZm4rz4nEOH2QgvjEqg9jdPQedB6CA6
 tp4GvZCxPg/mQKSHEsCXKsxCN2849C5EJIwMc9LO83s3CvzDRenmKsz1aux/+a6KCW7E
 TaE2RYKEPl1+Fa6YkMcInVoQkkvbQJdtDAmukwkD//E1uI5UN9r/PeZQkc0RK17/tNT9
 3y1BGgbR++F0R58OIghKaHMT7PpK7fdBEuT1nm5lh07EqrN0K1Uldc07BrgJ6vCRS9hR
 Ii5W6/JC5E6ThRUcqm0gnnnjdfRIXNF45GeSISp9XEacuwltHQy9dPj+Rb0AZW0GBPPl
 MnBA==
X-Gm-Message-State: AOJu0YzIyvL9H2XYTA80a/sUtDr0jd28DjCGMhXIHedrT7mfvDvF7VbN
 M/EvYRB3WQDWKH0i4GM82saORrBK4V6OomGFN0vq0vOWjlXkakMp5wDlNE0ksA==
X-Gm-Gg: AY/fxX6ByErZx5OEEm0uQM6uL1RdDftW06PDJT55Rw+7yGBs65hilAYRHDRWzDdVVzR
 WfCDQvo5CW/6XVeVDo6Svi3oMdiAEomlqzmulZpzRrWl+v2mpwREFXh3sixgMJB5gsuygA9rral
 xWvr9Nh1hTu5vtNKKpXS8ugWM5+LKZU9Vipqma6GoyDAff79eMefiNBdeGamMxZ+esoCl6QjsB5
 t6Vsp8Ra2SLJOb2eFLVvNoaxAfkj2pp3IQYjwB0qp8XGOgZtBPTaeIPupT/+pkfT9Ca3dgICMPT
 0cT4twm+S0G2F6AoXjXj6MEsB2LbjRcpmP7/l7tUPuHW1dDMik4Cq9kNhhgErYkyGwAD9Kybb34
 iQ+DH0SCJ4FJbYAaLnhh5OSbwFs8GiLIjS31nbEPVVYT+Ck9q4c6d5SlcyQB7RSmaOe1ZNawUSS
 SH4rDtA/oHgPeCrKffTg8IjWUmwpJm+PETd4pqq5OmUUP+NB4JYE48qCaVtv1mvV8DMbVx6JCHy
 IhDXTA5xnU=
X-Google-Smtp-Source: AGHT+IFZO89dNRbrwwq3e3v9ZQFiA3Glb3p8Owrg599M5yucuZR74Vvj1io0sjyAZY/jG731Si+aMg==
X-Received: by 2002:a05:6830:4491:b0:7c7:1c87:4f95 with SMTP id
 46e09a7af769-7ce50a90e5bmr854259a34.4.1767770786991; 
 Tue, 06 Jan 2026 23:26:26 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce4781c43asm2875654a34.7.2026.01.06.23.26.26
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 23:26:26 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7c750b10e14so765807a34.2
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Jan 2026 23:26:26 -0800 (PST)
X-Received: by 2002:a05:6830:4426:b0:7ce:2b15:de88 with SMTP id
 46e09a7af769-7ce50bf0a1bmr888031a34.26.1767770786197; Tue, 06 Jan 2026
 23:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Jan 2026 02:25:50 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
X-Gm-Features: AQt7F2oqU_xLCPULW_gdHypgzwTMbTeHLd2wn-sF13-JYl990OjGigdncta4T_M
Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Jan 2026 08:55:44 +0000
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

On Mon, Jan 5, 2026 at 4:04=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> I will start with upstreaming the asahi DRM render driver. The UAPI was
> merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> driver implementing this fully.
> The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> user space drivers using this UAPI are available in mesa since 25.2.
>
> This initial submission contains test infrastructure and tests for the
> ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> These two tests are the only ones the initial version of the initial
> upstream submission of the driver will pass.
>
> I have additional tests which the downstream driver passes as well. I
> was planning to submit them together with upstream driver patches which
> implement the necessary functionality for the tests.
>
> If preferred I could submit all tests and gate them based on the driver
> version to avoid expected igt-gpu-tools test failures against
> incomplete (as in not implementing the full UAPI) upstream driver
> versions.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       drm-uapi/asahi: Initial import of asahi_drm.h
>       asahi: Add test infrastruture for asahi DRM render driver
>       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
>
>  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++=
++++++
>  lib/drmtest.c                  |    1 +
>  lib/drmtest.h                  |    1 +
>  lib/igt_asahi.c                |   58 ++
>  lib/igt_asahi.h                |   15 +
>  lib/meson.build                |    1 +
>  meson.build                    |    8 +
>  tests/asahi/asahi_get_params.c |   55 ++
>  tests/asahi/asahi_get_time.c   |   63 +++
>  tests/asahi/meson.build        |   14 +
>  tests/meson.build              |    2 +
>  11 files changed, 1412 insertions(+)
> ---
> base-commit: cef45b995557367ba082bc460fbab2190af943fd
> change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
>

This series looks great to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

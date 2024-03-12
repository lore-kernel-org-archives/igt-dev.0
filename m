Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C1C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 15:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F9112E81;
	Tue, 12 Mar 2024 15:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VC69hkpy";
	dkim-atps=neutral
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C68112D31
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 15:24:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d228a132acso71981551fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710257093; x=1710861893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtRGKgbYefgMCzKeXNjzIByR8PhFD4RcMgeVttjiWv0=;
 b=VC69hkpywssdFDeINt4V4ZbBFkRfncVvYyTM+Ii6bhq6nX3iipCtV9vfKgn+M4/DRC
 7txLKPcMpWNfohV0W4RR4GLlANnfVTIm3dWu6KIce3oCGRlYXRq/u6u6biM3IMu77Awr
 DgNppJY4Ox0d0HKqYVq//rAKlrL+dS8aej6AEbLbbJyR0RI0iCMBtpHh0cMSfsseZLO9
 JPi1je1j3f7FfGD9Fp1bekRqcwX/vaiw9Lmlwp+toQQv7vtVVduSlpoB2pDHFcjq4kLO
 zRIP5Tv7DQtcpRIeWQaI/PxS0VpSzCUTbwrXnGGua3/Bj6/JRMFhW1EX9l3+sdSfsYCy
 lU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710257093; x=1710861893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtRGKgbYefgMCzKeXNjzIByR8PhFD4RcMgeVttjiWv0=;
 b=js5vOlGPraaC84OExxMQWdPPER0RhDyL6x/3w77FMY1IZCdIV8+pGxNfwvLd7lJPSl
 ZgR7HK22RUAF5FnP789/P0e6ziVvZE+RSy6SvmwVIJay045dDFDrTtJAJdepx1WZPCxo
 5yVgxCrD3hr2PrCqQTb/TyVgYEsXvB2clznvXO0PCpl5kP0J1csKm3UxMSumO7SSgG+g
 IMsQIpsthQBYoqW2EWOwyzldELq+XcvbeZeErdJkhV5+g+x5WPmB3ykycgxMiUkfn3yh
 rnZ3aE2OZ6XwftbiMiaWDziKb/FCNMSXvs3leYy32qpSm/5WU0STJOGS4txlcwmK0VXA
 SBsQ==
X-Gm-Message-State: AOJu0Yw82Q1KMv67mugVHC6BOxknAFmXhCJqbpoGusyYZa1G8XDhPYRT
 mjlEq0vNMO8BaEMcfnBo3GTV9Q5qFL+sZO4m5KnQbh3Jb4HyCQRk/zwW5ZxaXMtHXugg4Mta676
 dJgSSEPPXxSHHmxvj/f5rjtFrKJKeoNFy
X-Google-Smtp-Source: AGHT+IGz9EiSfTYA9uI0GLiWP3HzjbobU00B625f6P6rqRtWir5K5VDyM4rT1RveevIEIg/7RriLjSYmPc9ViWVGZp0=
X-Received: by 2002:a2e:3607:0:b0:2d2:df0d:9e92 with SMTP id
 d7-20020a2e3607000000b002d2df0d9e92mr5782206lja.49.1710257092665; Tue, 12 Mar
 2024 08:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240304221800.1161896-1-mattst88@gmail.com>
In-Reply-To: <20240304221800.1161896-1-mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 12 Mar 2024 11:24:39 -0400
Message-ID: <CAEdQ38H1gVuLS=rDzfyLsdURLhoMQ3CrAJr5k5pW3xtGrcJfwg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

ping

On Mon, Mar 4, 2024 at 5:18=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
>
> > When LD_BIND_NOW=3D1 or -Wl,z,now is in effect symbols must be
> > immediately resolved at startup. In cases where an external function
> > call depends needs to be made that may fail if such a call has not
> > been initialized yet (PLT-based relocation which is processed later).
> > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > may lead to a segfault because the PLT is not yet resolved.
>
> We cannot rely on function calls through the PLT in ifunc resolvers as
> the PLT may not have been initialized yet.
>
> In practice, this causes crashes when igt is linked with -Wl,-z,now or
> when linked with the mold linker.
>
> To avoid this problem, we do two things:
>     1. move igt_x86_features() to igt_x86.h so its definition is
>        available to compilation units that call the function.
>     2. mark the ifunc resolvers with __attribute__((flatten)) to ensure
>        igt_x86_features() is inlined.
>
> Bug: https://bugs.gentoo.org/788625
> Bug: https://bugs.gentoo.org/925348
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  lib/igt_halffloat.c |   2 +
>  lib/igt_x86.c       | 116 +------------------------------------------
>  lib/igt_x86.h       | 117 +++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 119 insertions(+), 116 deletions(-)
>
> diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> index 5dbe08e01..67d26c225 100644
> --- a/lib/igt_halffloat.c
> +++ b/lib/igt_halffloat.c
> @@ -194,6 +194,7 @@ static void half_to_float(const uint16_t *h, float *f=
, unsigned int num)
>                 f[i] =3D _half_to_float(h[i]);
>  }
>
> +__attribute__((flatten))
>  static void (*resolve_float_to_half(void))(const float *f, uint16_t *h, =
unsigned int num)
>  {
>         if (igt_x86_features() & F16C)
> @@ -205,6 +206,7 @@ static void (*resolve_float_to_half(void))(const floa=
t *f, uint16_t *h, unsigned
>  void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
>         __attribute__((ifunc("resolve_float_to_half")));
>
> +__attribute__((flatten))
>  static void (*resolve_half_to_float(void))(const uint16_t *h, float *f, =
unsigned int num)
>  {
>         if (igt_x86_features() & F16C)
> diff --git a/lib/igt_x86.c b/lib/igt_x86.c
> index 8c102fd13..f103b9820 100644
> --- a/lib/igt_x86.c
> +++ b/lib/igt_x86.c
> @@ -27,14 +27,6 @@
>
>  #include "config.h"
>
> -#ifdef HAVE_CPUID_H
> -#include <cpuid.h>
> -#else
> -#define __get_cpuid_max(x, y) 0
> -#define __cpuid(level, a, b, c, d) a =3D b =3D c =3D d =3D 0
> -#define __cpuid_count(level, count, a, b, c, d) a =3D b =3D c =3D d =3D =
0
> -#endif
> -
>  #include "igt_x86.h"
>  #include "igt_aux.h"
>
> @@ -49,114 +41,7 @@
>   * @include: igt_x86.h
>   */
>
> -#define BASIC_CPUID 0x0
> -#define EXTENDED_CPUID 0x80000000
> -
> -#ifndef bit_MMX
> -#define bit_MMX                (1 << 23)
> -#endif
> -
> -#ifndef bit_SSE
> -#define bit_SSE                (1 << 25)
> -#endif
> -
> -#ifndef bit_SSE2
> -#define bit_SSE2       (1 << 26)
> -#endif
> -
> -#ifndef bit_SSE3
> -#define bit_SSE3       (1 << 0)
> -#endif
> -
> -#ifndef bit_SSSE3
> -#define bit_SSSE3      (1 << 9)
> -#endif
> -
> -#ifndef bit_SSE4_1
> -#define bit_SSE4_1     (1 << 19)
> -#endif
> -
> -#ifndef bit_SSE4_2
> -#define bit_SSE4_2     (1 << 20)
> -#endif
> -
> -#ifndef bit_OSXSAVE
> -#define bit_OSXSAVE    (1 << 27)
> -#endif
> -
> -#ifndef bit_AVX
> -#define bit_AVX                (1 << 28)
> -#endif
> -
> -#ifndef bit_F16C
> -#define bit_F16C       (1 << 29)
> -#endif
> -
> -#ifndef bit_AVX2
> -#define bit_AVX2       (1<<5)
> -#endif
> -
> -#define xgetbv(index,eax,edx) \
> -       __asm__ ("xgetbv" : "=3Da"(eax), "=3Dd"(edx) : "c" (index))
> -
> -#define has_YMM 0x1
> -
>  #if defined(__x86_64__) || defined(__i386__)
> -unsigned igt_x86_features(void)
> -{
> -       unsigned max =3D __get_cpuid_max(BASIC_CPUID, 0);
> -       unsigned eax, ebx, ecx, edx;
> -       unsigned features =3D 0;
> -       unsigned extra =3D 0;
> -
> -       if (max >=3D 1) {
> -               __cpuid(1, eax, ebx, ecx, edx);
> -
> -               if (ecx & bit_SSE3)
> -                       features |=3D SSE3;
> -
> -               if (ecx & bit_SSSE3)
> -                       features |=3D SSSE3;
> -
> -               if (ecx & bit_SSE4_1)
> -                       features |=3D SSE4_1;
> -
> -               if (ecx & bit_SSE4_2)
> -                       features |=3D SSE4_2;
> -
> -               if (ecx & bit_OSXSAVE) {
> -                       unsigned int bv_eax, bv_ecx;
> -                       xgetbv(0, bv_eax, bv_ecx);
> -                       if ((bv_eax & 6) =3D=3D 6)
> -                               extra |=3D has_YMM;
> -               }
> -
> -               if ((extra & has_YMM) && (ecx & bit_AVX))
> -                       features |=3D AVX;
> -
> -               if (edx & bit_MMX)
> -                       features |=3D MMX;
> -
> -               if (edx & bit_SSE)
> -                       features |=3D SSE;
> -
> -               if (edx & bit_SSE2)
> -                       features |=3D SSE2;
> -
> -               if (ecx & bit_F16C)
> -                       features |=3D F16C;
> -       }
> -
> -       if (max >=3D 7) {
> -               __cpuid_count(7, 0, eax, ebx, ecx, edx);
> -
> -               if ((extra & has_YMM) && (ebx & bit_AVX2))
> -                       features |=3D AVX2;
> -       }
> -
> -       return features;
> -}
> -
>  char *igt_x86_features_to_string(unsigned features, char *line)
>  {
>         char *ret =3D line;
> @@ -284,6 +169,7 @@ static void memcpy_from_wc(void *dst, const void *src=
, unsigned long len)
>         memcpy(dst, src, len);
>  }
>
> +__attribute__((flatten))
>  static void (*resolve_memcpy_from_wc(void))(void *, const void *, unsign=
ed long)
>  {
>         if (igt_x86_features() & SSE4_1)
> diff --git a/lib/igt_x86.h b/lib/igt_x86.h
> index c7b84dec2..1e0195c4b 100644
> --- a/lib/igt_x86.h
> +++ b/lib/igt_x86.h
> @@ -30,6 +30,14 @@
>  #ifndef IGT_X86_H
>  #define IGT_X86_H
>
> +#ifdef HAVE_CPUID_H
> +#include <cpuid.h>
> +#else
> +#define __get_cpuid_max(x, y) 0
> +#define __cpuid(level, a, b, c, d) a =3D b =3D c =3D d =3D 0
> +#define __cpuid_count(level, count, a, b, c, d) a =3D b =3D c =3D d =3D =
0
> +#endif
> +
>  #define MMX    0x1
>  #define SSE    0x2
>  #define SSE2   0x4
> @@ -42,7 +50,114 @@
>  #define F16C   0x200
>
>  #if defined(__x86_64__) || defined(__i386__)
> -unsigned igt_x86_features(void);
> +
> +#define BASIC_CPUID 0x0
> +#define EXTENDED_CPUID 0x80000000
> +
> +#ifndef bit_MMX
> +#define bit_MMX                (1 << 23)
> +#endif
> +
> +#ifndef bit_SSE
> +#define bit_SSE                (1 << 25)
> +#endif
> +
> +#ifndef bit_SSE2
> +#define bit_SSE2       (1 << 26)
> +#endif
> +
> +#ifndef bit_SSE3
> +#define bit_SSE3       (1 << 0)
> +#endif
> +
> +#ifndef bit_SSSE3
> +#define bit_SSSE3      (1 << 9)
> +#endif
> +
> +#ifndef bit_SSE4_1
> +#define bit_SSE4_1     (1 << 19)
> +#endif
> +
> +#ifndef bit_SSE4_2
> +#define bit_SSE4_2     (1 << 20)
> +#endif
> +
> +#ifndef bit_OSXSAVE
> +#define bit_OSXSAVE    (1 << 27)
> +#endif
> +
> +#ifndef bit_AVX
> +#define bit_AVX                (1 << 28)
> +#endif
> +
> +#ifndef bit_F16C
> +#define bit_F16C       (1 << 29)
> +#endif
> +
> +#ifndef bit_AVX2
> +#define bit_AVX2       (1<<5)
> +#endif
> +
> +#define xgetbv(index,eax,edx) \
> +       __asm__ ("xgetbv" : "=3Da"(eax), "=3Dd"(edx) : "c" (index))
> +
> +#define has_YMM 0x1
> +
> +static inline unsigned igt_x86_features(void)
> +{
> +       unsigned max =3D __get_cpuid_max(BASIC_CPUID, 0);
> +       unsigned eax, ebx, ecx, edx;
> +       unsigned features =3D 0;
> +       unsigned extra =3D 0;
> +
> +       if (max >=3D 1) {
> +               __cpuid(1, eax, ebx, ecx, edx);
> +
> +               if (ecx & bit_SSE3)
> +                       features |=3D SSE3;
> +
> +               if (ecx & bit_SSSE3)
> +                       features |=3D SSSE3;
> +
> +               if (ecx & bit_SSE4_1)
> +                       features |=3D SSE4_1;
> +
> +               if (ecx & bit_SSE4_2)
> +                       features |=3D SSE4_2;
> +
> +               if (ecx & bit_OSXSAVE) {
> +                       unsigned int bv_eax, bv_ecx;
> +                       xgetbv(0, bv_eax, bv_ecx);
> +                       if ((bv_eax & 6) =3D=3D 6)
> +                               extra |=3D has_YMM;
> +               }
> +
> +               if ((extra & has_YMM) && (ecx & bit_AVX))
> +                       features |=3D AVX;
> +
> +               if (edx & bit_MMX)
> +                       features |=3D MMX;
> +
> +               if (edx & bit_SSE)
> +                       features |=3D SSE;
> +
> +               if (edx & bit_SSE2)
> +                       features |=3D SSE2;
> +
> +               if (ecx & bit_F16C)
> +                       features |=3D F16C;
> +       }
> +
> +       if (max >=3D 7) {
> +               __cpuid_count(7, 0, eax, ebx, ecx, edx);
> +
> +               if ((extra & has_YMM) && (ebx & bit_AVX2))
> +                       features |=3D AVX2;
> +       }
> +
> +       return features;
> +}
> +
>  char *igt_x86_features_to_string(unsigned features, char *line);
>  #else
>  static inline unsigned igt_x86_features(void)
> --
> 2.43.0
>

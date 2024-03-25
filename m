Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AA6C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 17:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C510E115;
	Mon, 25 Mar 2024 17:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XM72V0pt";
	dkim-atps=neutral
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15510E115
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 17:15:32 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d687da75c4so54201201fa.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711386930; x=1711991730; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fYDQYOLaxNss1Xfq8TLaITxko7dUN/CVvzkaMWKMx18=;
 b=XM72V0pt9rhubFktaPSOIDetcHXscAOvzQpfgmLBnaQqlmSRIFtS3ETYD2css6hdwi
 MW4ntvr6RFEUGnrw4qT7W2bHHqNnsLmnEAOX2xoZ9HO5rnt/o6+NwuX4gwpkXD2tzuxv
 nVmObOD9QTOlaxSV/aaBlYdY2u3ID8dLQc2vAV2wvj9QTcssCRtoqFGeepVj9x3ucl7Z
 +U0KLYwXoH0mp3my9w7Ww1Xzzo0stgKqW3LISKty4SUpos11Ny230HEU95BcYFl49Qem
 2VZ3CVX5roNyhv7lwx3dKum6pILLdum3dT1we0LtLrYOFsfvenlYA3GadF28aMj22nox
 dhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711386930; x=1711991730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYDQYOLaxNss1Xfq8TLaITxko7dUN/CVvzkaMWKMx18=;
 b=OG3JPLm0EiAaScr7WskutxqA4m2OQKqWEkk6P9TGTfiQewpHulxTVb7jWyD4ltpUsw
 OeijScxHJWFEhL8hmldNGUIpZDzJ3S5xJ+pdy5aYFC6MZ7mxg85ZAw7HtsljIRML+h64
 kcHpz91eSOudZvkDdfwhRMmHALPFGmVh+5mCY2h7ovWHAYioyZA4yO8bvAYJl0JSwmQw
 JGzc8jNZ9viOlsdsq6+tNU/p4wESLcYK4WUPvujfwfA8kezskSKgcvWQ/Xwb8S6RNpu7
 TXWairusON9L8QhOOWrQdN+NoAsp0GHcU6GO+YN4atHFipcihVPgiBT4cx7hrj7JNV+c
 E9nw==
X-Gm-Message-State: AOJu0YxCL5M5QBpprp7qwmmAq07N95VDoMod83m7f5sQsxhz/MIODvXT
 gyQG12ydB7991cySYg0RFvkaa6XRSEPnvKkIVM4Rgw6h6wUGoLC91MTW164EjzUdPDflXZqhfW0
 U1QJB0Ueso0InrTs7W1OLEQx/SZ2x4jOQ
X-Google-Smtp-Source: AGHT+IEyp6wwPmtKDh3GLT2NLldd3RHTfCadHBNuTICNVDqDK0osf/GH6Sz+OwnLQcIaFl03nZjVOfn/XpZyjXmrUv4=
X-Received: by 2002:a2e:890a:0:b0:2d3:e954:221d with SMTP id
 d10-20020a2e890a000000b002d3e954221dmr4944227lji.34.1711386929213; Mon, 25
 Mar 2024 10:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240321184150.26552-1-mattst88@gmail.com>
In-Reply-To: <20240321184150.26552-1-mattst88@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 25 Mar 2024 13:15:17 -0400
Message-ID: <CAEdQ38FsEocEZydj1TBbthKuQ1ePjc0N3YuH6bg44rJqSzM71w@mail.gmail.com>
Subject: Re: [PATCH v2] lib: Inline igt_x86_features() into ifunc resolvers
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000fd3c7506147f510e"
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

--000000000000fd3c7506147f510e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please commit me :)

On Thu, Mar 21, 2024, 2:42=E2=80=AFPM Matt Turner <mattst88@gmail.com> wrot=
e:

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
>        igt_x86_features() is inlined. Since this function is only called
>        from a few places it does not significantly increase binary size
>        to inline it.
>
> Linux distros (at least Fedora since v23, Gentoo/Hardened, soon standard
> Gentoo) use `-Wl,-z now` to improve security. By binding upfront, the
> loader can mark the GOT as read-only for a security enhancement. See
> https://wiki.gentoo.org/wiki/Hardened/Toolchain for more details.
>
> Bug: https://bugs.gentoo.org/788625
> Bug: https://bugs.gentoo.org/925348
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  lib/igt_halffloat.c |   8 +++
>  lib/igt_x86.c       | 119 ++------------------------------------------
>  lib/igt_x86.h       | 117 ++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 128 insertions(+), 116 deletions(-)
>
> diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> index 5dbe08e01..560952d20 100644
> --- a/lib/igt_halffloat.c
> +++ b/lib/igt_halffloat.c
> @@ -194,6 +194,10 @@ static void half_to_float(const uint16_t *h, float
> *f, unsigned int num)
>                 f[i] =3D _half_to_float(h[i]);
>  }
>
> +/* The PLT is not initialized when ifunc resolvers run, so all external
> + * functions must be inlined with __attribute__((flatten)).
> + */
> +__attribute__((flatten))
>  static void (*resolve_float_to_half(void))(const float *f, uint16_t *h,
> unsigned int num)
>  {
>         if (igt_x86_features() & F16C)
> @@ -205,6 +209,10 @@ static void (*resolve_float_to_half(void))(const
> float *f, uint16_t *h, unsigned
>  void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
>         __attribute__((ifunc("resolve_float_to_half")));
>
> +/* The PLT is not initialized when ifunc resolvers run, so all external
> + * functions must be inlined with __attribute__((flatten)).
> + */
> +__attribute__((flatten))
>  static void (*resolve_half_to_float(void))(const uint16_t *h, float *f,
> unsigned int num)
>  {
>         if (igt_x86_features() & F16C)
> diff --git a/lib/igt_x86.c b/lib/igt_x86.c
> index 8c102fd13..f60568be5 100644
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
> @@ -284,6 +169,10 @@ static void memcpy_from_wc(void *dst, const void
> *src, unsigned long len)
>         memcpy(dst, src, len);
>  }
>
> +/* The PLT is not initialized when ifunc resolvers run, so all external
> + * functions must be inlined with __attribute__((flatten)).
> + */
> +__attribute__((flatten))
>  static void (*resolve_memcpy_from_wc(void))(void *, const void *,
> unsigned long)
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
> 2.43.2
>
>

--000000000000fd3c7506147f510e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please commit me :)</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 21, 2024, 2:42=E2=80=AFPM =
Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com">mattst88@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Quoting <a href=3D"htt=
ps://sourceware.org/glibc/wiki/GNU_IFUNC" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://sourceware.org/glibc/wiki/GNU_IFUNC</a><br>
<br>
&gt; When LD_BIND_NOW=3D1 or -Wl,z,now is in effect symbols must be<br>
&gt; immediately resolved at startup. In cases where an external function<b=
r>
&gt; call depends needs to be made that may fail if such a call has not<br>
&gt; been initialized yet (PLT-based relocation which is processed later).<=
br>
&gt; For example calling strlen in an IFUNC resolver built with -Wl,z,now<b=
r>
&gt; may lead to a segfault because the PLT is not yet resolved.<br>
<br>
We cannot rely on function calls through the PLT in ifunc resolvers as<br>
the PLT may not have been initialized yet.<br>
<br>
In practice, this causes crashes when igt is linked with -Wl,-z,now or<br>
when linked with the mold linker.<br>
<br>
To avoid this problem, we do two things:<br>
=C2=A0 =C2=A0 1. move igt_x86_features() to igt_x86.h so its definition is<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0available to compilation units that call the fun=
ction.<br>
=C2=A0 =C2=A0 2. mark the ifunc resolvers with __attribute__((flatten)) to =
ensure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_x86_features() is inlined. Since this functi=
on is only called<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0from a few places it does not significantly incr=
ease binary size<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0to inline it.<br>
<br>
Linux distros (at least Fedora since v23, Gentoo/Hardened, soon standard<br=
>
Gentoo) use `-Wl,-z now` to improve security. By binding upfront, the<br>
loader can mark the GOT as read-only for a security enhancement. See<br>
<a href=3D"https://wiki.gentoo.org/wiki/Hardened/Toolchain" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://wiki.gentoo.org/wiki/Hardened/Tool=
chain</a> for more details.<br>
<br>
Bug: <a href=3D"https://bugs.gentoo.org/788625" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://bugs.gentoo.org/788625</a><br>
Bug: <a href=3D"https://bugs.gentoo.org/925348" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://bugs.gentoo.org/925348</a><br>
Reviewed-by: Zbigniew Kempczy=C5=84ski &lt;<a href=3D"mailto:zbigniew.kempc=
zynski@intel.com" target=3D"_blank" rel=3D"noreferrer">zbigniew.kempczynski=
@intel.com</a>&gt;<br>
Signed-off-by: Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">mattst88@gmail.com</a>&gt;<br>
---<br>
=C2=A0lib/igt_halffloat.c |=C2=A0 =C2=A08 +++<br>
=C2=A0lib/igt_x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 119 ++---------------------=
---------------------<br>
=C2=A0lib/igt_x86.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 117 +++++++++++++++++++++++=
+++++++++++++++++++-<br>
=C2=A03 files changed, 128 insertions(+), 116 deletions(-)<br>
<br>
diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c<br>
index 5dbe08e01..560952d20 100644<br>
--- a/lib/igt_halffloat.c<br>
+++ b/lib/igt_halffloat.c<br>
@@ -194,6 +194,10 @@ static void half_to_float(const uint16_t *h, float *f,=
 unsigned int num)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f[i] =3D _half_to_f=
loat(h[i]);<br>
=C2=A0}<br>
<br>
+/* The PLT is not initialized when ifunc resolvers run, so all external<br=
>
+ * functions must be inlined with __attribute__((flatten)).<br>
+ */<br>
+__attribute__((flatten))<br>
=C2=A0static void (*resolve_float_to_half(void))(const float *f, uint16_t *=
h, unsigned int num)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (igt_x86_features() &amp; F16C)<br>
@@ -205,6 +209,10 @@ static void (*resolve_float_to_half(void))(const float=
 *f, uint16_t *h, unsigned<br>
=C2=A0void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __attribute__((ifunc(&quot;resolve_float_to_hal=
f&quot;)));<br>
<br>
+/* The PLT is not initialized when ifunc resolvers run, so all external<br=
>
+ * functions must be inlined with __attribute__((flatten)).<br>
+ */<br>
+__attribute__((flatten))<br>
=C2=A0static void (*resolve_half_to_float(void))(const uint16_t *h, float *=
f, unsigned int num)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (igt_x86_features() &amp; F16C)<br>
diff --git a/lib/igt_x86.c b/lib/igt_x86.c<br>
index 8c102fd13..f60568be5 100644<br>
--- a/lib/igt_x86.c<br>
+++ b/lib/igt_x86.c<br>
@@ -27,14 +27,6 @@<br>
<br>
=C2=A0#include &quot;config.h&quot;<br>
<br>
-#ifdef HAVE_CPUID_H<br>
-#include &lt;cpuid.h&gt;<br>
-#else<br>
-#define __get_cpuid_max(x, y) 0<br>
-#define __cpuid(level, a, b, c, d) a =3D b =3D c =3D d =3D 0<br>
-#define __cpuid_count(level, count, a, b, c, d) a =3D b =3D c =3D d =3D 0<=
br>
-#endif<br>
-<br>
=C2=A0#include &quot;igt_x86.h&quot;<br>
=C2=A0#include &quot;igt_aux.h&quot;<br>
<br>
@@ -49,114 +41,7 @@<br>
=C2=A0 * @include: igt_x86.h<br>
=C2=A0 */<br>
<br>
-#define BASIC_CPUID 0x0<br>
-#define EXTENDED_CPUID 0x80000000<br>
-<br>
-#ifndef bit_MMX<br>
-#define bit_MMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 23)<br>
-#endif<br>
-<br>
-#ifndef bit_SSE<br>
-#define bit_SSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 25)<br>
-#endif<br>
-<br>
-#ifndef bit_SSE2<br>
-#define bit_SSE2=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 26)<br>
-#endif<br>
-<br>
-#ifndef bit_SSE3<br>
-#define bit_SSE3=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
-#endif<br>
-<br>
-#ifndef bit_SSSE3<br>
-#define bit_SSSE3=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 9)<br>
-#endif<br>
-<br>
-#ifndef bit_SSE4_1<br>
-#define bit_SSE4_1=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 19)<br>
-#endif<br>
-<br>
-#ifndef bit_SSE4_2<br>
-#define bit_SSE4_2=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 20)<br>
-#endif<br>
-<br>
-#ifndef bit_OSXSAVE<br>
-#define bit_OSXSAVE=C2=A0 =C2=A0 (1 &lt;&lt; 27)<br>
-#endif<br>
-<br>
-#ifndef bit_AVX<br>
-#define bit_AVX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 28)<br>
-#endif<br>
-<br>
-#ifndef bit_F16C<br>
-#define bit_F16C=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 29)<br>
-#endif<br>
-<br>
-#ifndef bit_AVX2<br>
-#define bit_AVX2=C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;5)<br>
-#endif<br>
-<br>
-#define xgetbv(index,eax,edx) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__asm__ (&quot;xgetbv&quot; : &quot;=3Da&quot;(=
eax), &quot;=3Dd&quot;(edx) : &quot;c&quot; (index))<br>
-<br>
-#define has_YMM 0x1<br>
-<br>
=C2=A0#if defined(__x86_64__) || defined(__i386__)<br>
-unsigned igt_x86_features(void)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned max =3D __get_cpuid_max(BASIC_CPUID, 0=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned eax, ebx, ecx, edx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned features =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned extra =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max &gt;=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__cpuid(1, eax, ebx=
, ecx, edx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE3)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE3;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SSE3)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSSE3;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE4_1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE4_1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE4_2)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE4_2;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_O=
SXSAVE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int bv_eax, bv_ecx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0xgetbv(0, bv_eax, bv_ecx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((bv_eax &amp; 6) =3D=3D 6)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra |=3D has_YMM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((extra &amp; ha=
s_YMM) &amp;&amp; (ecx &amp; bit_AVX))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D AVX;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_M=
MX)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D MMX;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_S=
SE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_S=
SE2)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE2;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_F=
16C)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D F16C;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max &gt;=3D 7) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__cpuid_count(7, 0,=
 eax, ebx, ecx, edx);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((extra &amp; ha=
s_YMM) &amp;&amp; (ebx &amp; bit_AVX2))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D AVX2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return features;<br>
-}<br>
-<br>
=C2=A0char *igt_x86_features_to_string(unsigned features, char *line)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *ret =3D line;<br>
@@ -284,6 +169,10 @@ static void memcpy_from_wc(void *dst, const void *src,=
 unsigned long len)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(dst, src, len);<br>
=C2=A0}<br>
<br>
+/* The PLT is not initialized when ifunc resolvers run, so all external<br=
>
+ * functions must be inlined with __attribute__((flatten)). <br>
+ */<br>
+__attribute__((flatten))<br>
=C2=A0static void (*resolve_memcpy_from_wc(void))(void *, const void *, uns=
igned long)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (igt_x86_features() &amp; SSE4_1)<br>
diff --git a/lib/igt_x86.h b/lib/igt_x86.h<br>
index c7b84dec2..1e0195c4b 100644<br>
--- a/lib/igt_x86.h<br>
+++ b/lib/igt_x86.h<br>
@@ -30,6 +30,14 @@<br>
=C2=A0#ifndef IGT_X86_H<br>
=C2=A0#define IGT_X86_H<br>
<br>
+#ifdef HAVE_CPUID_H<br>
+#include &lt;cpuid.h&gt;<br>
+#else<br>
+#define __get_cpuid_max(x, y) 0<br>
+#define __cpuid(level, a, b, c, d) a =3D b =3D c =3D d =3D 0<br>
+#define __cpuid_count(level, count, a, b, c, d) a =3D b =3D c =3D d =3D 0<=
br>
+#endif<br>
+<br>
=C2=A0#define MMX=C2=A0 =C2=A0 0x1<br>
=C2=A0#define SSE=C2=A0 =C2=A0 0x2<br>
=C2=A0#define SSE2=C2=A0 =C2=A00x4<br>
@@ -42,7 +50,114 @@<br>
=C2=A0#define F16C=C2=A0 =C2=A00x200<br>
<br>
=C2=A0#if defined(__x86_64__) || defined(__i386__)<br>
-unsigned igt_x86_features(void);<br>
+<br>
+#define BASIC_CPUID 0x0<br>
+#define EXTENDED_CPUID 0x80000000<br>
+<br>
+#ifndef bit_MMX<br>
+#define bit_MMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 23)<br>
+#endif<br>
+<br>
+#ifndef bit_SSE<br>
+#define bit_SSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 25)<br>
+#endif<br>
+<br>
+#ifndef bit_SSE2<br>
+#define bit_SSE2=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 26)<br>
+#endif<br>
+<br>
+#ifndef bit_SSE3<br>
+#define bit_SSE3=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
+#endif<br>
+<br>
+#ifndef bit_SSSE3<br>
+#define bit_SSSE3=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 9)<br>
+#endif<br>
+<br>
+#ifndef bit_SSE4_1<br>
+#define bit_SSE4_1=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 19)<br>
+#endif<br>
+<br>
+#ifndef bit_SSE4_2<br>
+#define bit_SSE4_2=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 20)<br>
+#endif<br>
+<br>
+#ifndef bit_OSXSAVE<br>
+#define bit_OSXSAVE=C2=A0 =C2=A0 (1 &lt;&lt; 27)<br>
+#endif<br>
+<br>
+#ifndef bit_AVX<br>
+#define bit_AVX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 =
&lt;&lt; 28)<br>
+#endif<br>
+<br>
+#ifndef bit_F16C<br>
+#define bit_F16C=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 29)<br>
+#endif<br>
+<br>
+#ifndef bit_AVX2<br>
+#define bit_AVX2=C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;5)<br>
+#endif<br>
+<br>
+#define xgetbv(index,eax,edx) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__asm__ (&quot;xgetbv&quot; : &quot;=3Da&quot;(=
eax), &quot;=3Dd&quot;(edx) : &quot;c&quot; (index))<br>
+<br>
+#define has_YMM 0x1<br>
+<br>
+static inline unsigned igt_x86_features(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned max =3D __get_cpuid_max(BASIC_CPUID, 0=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned eax, ebx, ecx, edx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned features =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned extra =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max &gt;=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__cpuid(1, eax, ebx=
, ecx, edx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE3;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SSE3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSSE3;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE4_1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE4_1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_S=
SE4_2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE4_2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_O=
SXSAVE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int bv_eax, bv_ecx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0xgetbv(0, bv_eax, bv_ecx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((bv_eax &amp; 6) =3D=3D 6)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra |=3D has_YMM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((extra &amp; ha=
s_YMM) &amp;&amp; (ecx &amp; bit_AVX))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D AVX;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_M=
MX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D MMX;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_S=
SE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (edx &amp; bit_S=
SE2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D SSE2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ecx &amp; bit_F=
16C)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D F16C;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max &gt;=3D 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__cpuid_count(7, 0,=
 eax, ebx, ecx, edx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((extra &amp; ha=
s_YMM) &amp;&amp; (ebx &amp; bit_AVX2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0features |=3D AVX2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return features;<br>
+}<br>
+<br>
=C2=A0char *igt_x86_features_to_string(unsigned features, char *line);<br>
=C2=A0#else<br>
=C2=A0static inline unsigned igt_x86_features(void)<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--000000000000fd3c7506147f510e--

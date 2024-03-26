Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65803C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 17:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95110F182;
	Tue, 26 Mar 2024 17:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuvezyIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E2D10F182
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711474600; x=1743010600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=He23X1LDRWKzUTXjo0JOM1E56KTjZraH5QWiBGcstPM=;
 b=PuvezyIaosg8fwaaUH2t1uDmEMNy7MIsXYBKuYE8yat3u92UyLBEwU4R
 69dVkUCYPUuqr2hdu4VHLjS9rxG4pfRRwavDmtQ0BQmzHDqeivMEZcHoX
 5qDStt5APm9m9k9iqmt66MEQQ8rjrcaHPKyW7af0f5mml5KqJwIEBJfpZ
 5WqZZquKJ6ZR+m4HkoVt9nvkCeW/obuJWPo9uOWvWIZWGp1zljTMZmV/t
 tWWn+wEZrv7t3xmyHdiP/xM80o5USwKmDfOfod41tjPYyZFeaBNNvdd+H
 KFSfPes7X03ho+urDsow6QeYKEgnwk7XRKOx8qUNPXLzC0cQ19nOHl4Br A==;
X-CSE-ConnectionGUID: Kea1Qn2MS5CzK100WxZKXQ==
X-CSE-MsgGUID: kqSE+7tTRHy+RSavhGOKLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6372080"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6372080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20574424"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 10:36:38 -0700
Date: Tue, 26 Mar 2024 18:36:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Matt Turner <mattst88@gmail.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2] lib: Inline igt_x86_features() into ifunc resolvers
Message-ID: <20240326173621.oxeyte6bfidbtfab@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Matt Turner <mattst88@gmail.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240321184150.26552-1-mattst88@gmail.com>
 <CAEdQ38FsEocEZydj1TBbthKuQ1ePjc0N3YuH6bg44rJqSzM71w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEdQ38FsEocEZydj1TBbthKuQ1ePjc0N3YuH6bg44rJqSzM71w@mail.gmail.com>
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

Hi Matt,
On 2024-03-25 at 13:15:17 -0400, Matt Turner wrote:
> Please commit me :)
> 

I merged your commit with some whitespaces corrected.
Thank you for your contribution!

Regards,
Kamil

> On Thu, Mar 21, 2024, 2:42 PM Matt Turner <mattst88@gmail.com> wrote:
> 
> > Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> >
> > > When LD_BIND_NOW=1 or -Wl,z,now is in effect symbols must be
> > > immediately resolved at startup. In cases where an external function
> > > call depends needs to be made that may fail if such a call has not
> > > been initialized yet (PLT-based relocation which is processed later).
> > > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > > may lead to a segfault because the PLT is not yet resolved.
> >
> > We cannot rely on function calls through the PLT in ifunc resolvers as
> > the PLT may not have been initialized yet.
> >
> > In practice, this causes crashes when igt is linked with -Wl,-z,now or
> > when linked with the mold linker.
> >
> > To avoid this problem, we do two things:
> >     1. move igt_x86_features() to igt_x86.h so its definition is
> >        available to compilation units that call the function.
> >     2. mark the ifunc resolvers with __attribute__((flatten)) to ensure
> >        igt_x86_features() is inlined. Since this function is only called
> >        from a few places it does not significantly increase binary size
> >        to inline it.
> >
> > Linux distros (at least Fedora since v23, Gentoo/Hardened, soon standard
> > Gentoo) use `-Wl,-z now` to improve security. By binding upfront, the
> > loader can mark the GOT as read-only for a security enhancement. See
> > https://wiki.gentoo.org/wiki/Hardened/Toolchain for more details.
> >
> > Bug: https://bugs.gentoo.org/788625
> > Bug: https://bugs.gentoo.org/925348
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> >  lib/igt_halffloat.c |   8 +++
> >  lib/igt_x86.c       | 119 ++------------------------------------------
> >  lib/igt_x86.h       | 117 ++++++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 128 insertions(+), 116 deletions(-)
> >
> > diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> > index 5dbe08e01..560952d20 100644
> > --- a/lib/igt_halffloat.c
> > +++ b/lib/igt_halffloat.c
> > @@ -194,6 +194,10 @@ static void half_to_float(const uint16_t *h, float
> > *f, unsigned int num)
> >                 f[i] = _half_to_float(h[i]);
> >  }
> >
> > +/* The PLT is not initialized when ifunc resolvers run, so all external
> > + * functions must be inlined with __attribute__((flatten)).
> > + */
> > +__attribute__((flatten))
> >  static void (*resolve_float_to_half(void))(const float *f, uint16_t *h,
> > unsigned int num)
> >  {
> >         if (igt_x86_features() & F16C)
> > @@ -205,6 +209,10 @@ static void (*resolve_float_to_half(void))(const
> > float *f, uint16_t *h, unsigned
> >  void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
> >         __attribute__((ifunc("resolve_float_to_half")));
> >
> > +/* The PLT is not initialized when ifunc resolvers run, so all external
> > + * functions must be inlined with __attribute__((flatten)).
> > + */
> > +__attribute__((flatten))
> >  static void (*resolve_half_to_float(void))(const uint16_t *h, float *f,
> > unsigned int num)
> >  {
> >         if (igt_x86_features() & F16C)
> > diff --git a/lib/igt_x86.c b/lib/igt_x86.c
> > index 8c102fd13..f60568be5 100644
> > --- a/lib/igt_x86.c
> > +++ b/lib/igt_x86.c
> > @@ -27,14 +27,6 @@
> >
> >  #include "config.h"
> >
> > -#ifdef HAVE_CPUID_H
> > -#include <cpuid.h>
> > -#else
> > -#define __get_cpuid_max(x, y) 0
> > -#define __cpuid(level, a, b, c, d) a = b = c = d = 0
> > -#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
> > -#endif
> > -
> >  #include "igt_x86.h"
> >  #include "igt_aux.h"
> >
> > @@ -49,114 +41,7 @@
> >   * @include: igt_x86.h
> >   */
> >
> > -#define BASIC_CPUID 0x0
> > -#define EXTENDED_CPUID 0x80000000
> > -
> > -#ifndef bit_MMX
> > -#define bit_MMX                (1 << 23)
> > -#endif
> > -
> > -#ifndef bit_SSE
> > -#define bit_SSE                (1 << 25)
> > -#endif
> > -
> > -#ifndef bit_SSE2
> > -#define bit_SSE2       (1 << 26)
> > -#endif
> > -
> > -#ifndef bit_SSE3
> > -#define bit_SSE3       (1 << 0)
> > -#endif
> > -
> > -#ifndef bit_SSSE3
> > -#define bit_SSSE3      (1 << 9)
> > -#endif
> > -
> > -#ifndef bit_SSE4_1
> > -#define bit_SSE4_1     (1 << 19)
> > -#endif
> > -
> > -#ifndef bit_SSE4_2
> > -#define bit_SSE4_2     (1 << 20)
> > -#endif
> > -
> > -#ifndef bit_OSXSAVE
> > -#define bit_OSXSAVE    (1 << 27)
> > -#endif
> > -
> > -#ifndef bit_AVX
> > -#define bit_AVX                (1 << 28)
> > -#endif
> > -
> > -#ifndef bit_F16C
> > -#define bit_F16C       (1 << 29)
> > -#endif
> > -
> > -#ifndef bit_AVX2
> > -#define bit_AVX2       (1<<5)
> > -#endif
> > -
> > -#define xgetbv(index,eax,edx) \
> > -       __asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
> > -
> > -#define has_YMM 0x1
> > -
> >  #if defined(__x86_64__) || defined(__i386__)
> > -unsigned igt_x86_features(void)
> > -{
> > -       unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
> > -       unsigned eax, ebx, ecx, edx;
> > -       unsigned features = 0;
> > -       unsigned extra = 0;
> > -
> > -       if (max >= 1) {
> > -               __cpuid(1, eax, ebx, ecx, edx);
> > -
> > -               if (ecx & bit_SSE3)
> > -                       features |= SSE3;
> > -
> > -               if (ecx & bit_SSSE3)
> > -                       features |= SSSE3;
> > -
> > -               if (ecx & bit_SSE4_1)
> > -                       features |= SSE4_1;
> > -
> > -               if (ecx & bit_SSE4_2)
> > -                       features |= SSE4_2;
> > -
> > -               if (ecx & bit_OSXSAVE) {
> > -                       unsigned int bv_eax, bv_ecx;
> > -                       xgetbv(0, bv_eax, bv_ecx);
> > -                       if ((bv_eax & 6) == 6)
> > -                               extra |= has_YMM;
> > -               }
> > -
> > -               if ((extra & has_YMM) && (ecx & bit_AVX))
> > -                       features |= AVX;
> > -
> > -               if (edx & bit_MMX)
> > -                       features |= MMX;
> > -
> > -               if (edx & bit_SSE)
> > -                       features |= SSE;
> > -
> > -               if (edx & bit_SSE2)
> > -                       features |= SSE2;
> > -
> > -               if (ecx & bit_F16C)
> > -                       features |= F16C;
> > -       }
> > -
> > -       if (max >= 7) {
> > -               __cpuid_count(7, 0, eax, ebx, ecx, edx);
> > -
> > -               if ((extra & has_YMM) && (ebx & bit_AVX2))
> > -                       features |= AVX2;
> > -       }
> > -
> > -       return features;
> > -}
> > -
> >  char *igt_x86_features_to_string(unsigned features, char *line)
> >  {
> >         char *ret = line;
> > @@ -284,6 +169,10 @@ static void memcpy_from_wc(void *dst, const void
> > *src, unsigned long len)
> >         memcpy(dst, src, len);
> >  }
> >
> > +/* The PLT is not initialized when ifunc resolvers run, so all external
> > + * functions must be inlined with __attribute__((flatten)).
> > + */
> > +__attribute__((flatten))
> >  static void (*resolve_memcpy_from_wc(void))(void *, const void *,
> > unsigned long)
> >  {
> >         if (igt_x86_features() & SSE4_1)
> > diff --git a/lib/igt_x86.h b/lib/igt_x86.h
> > index c7b84dec2..1e0195c4b 100644
> > --- a/lib/igt_x86.h
> > +++ b/lib/igt_x86.h
> > @@ -30,6 +30,14 @@
> >  #ifndef IGT_X86_H
> >  #define IGT_X86_H
> >
> > +#ifdef HAVE_CPUID_H
> > +#include <cpuid.h>
> > +#else
> > +#define __get_cpuid_max(x, y) 0
> > +#define __cpuid(level, a, b, c, d) a = b = c = d = 0
> > +#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
> > +#endif
> > +
> >  #define MMX    0x1
> >  #define SSE    0x2
> >  #define SSE2   0x4
> > @@ -42,7 +50,114 @@
> >  #define F16C   0x200
> >
> >  #if defined(__x86_64__) || defined(__i386__)
> > -unsigned igt_x86_features(void);
> > +
> > +#define BASIC_CPUID 0x0
> > +#define EXTENDED_CPUID 0x80000000
> > +
> > +#ifndef bit_MMX
> > +#define bit_MMX                (1 << 23)
> > +#endif
> > +
> > +#ifndef bit_SSE
> > +#define bit_SSE                (1 << 25)
> > +#endif
> > +
> > +#ifndef bit_SSE2
> > +#define bit_SSE2       (1 << 26)
> > +#endif
> > +
> > +#ifndef bit_SSE3
> > +#define bit_SSE3       (1 << 0)
> > +#endif
> > +
> > +#ifndef bit_SSSE3
> > +#define bit_SSSE3      (1 << 9)
> > +#endif
> > +
> > +#ifndef bit_SSE4_1
> > +#define bit_SSE4_1     (1 << 19)
> > +#endif
> > +
> > +#ifndef bit_SSE4_2
> > +#define bit_SSE4_2     (1 << 20)
> > +#endif
> > +
> > +#ifndef bit_OSXSAVE
> > +#define bit_OSXSAVE    (1 << 27)
> > +#endif
> > +
> > +#ifndef bit_AVX
> > +#define bit_AVX                (1 << 28)
> > +#endif
> > +
> > +#ifndef bit_F16C
> > +#define bit_F16C       (1 << 29)
> > +#endif
> > +
> > +#ifndef bit_AVX2
> > +#define bit_AVX2       (1<<5)
> > +#endif
> > +
> > +#define xgetbv(index,eax,edx) \
> > +       __asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
> > +
> > +#define has_YMM 0x1
> > +
> > +static inline unsigned igt_x86_features(void)
> > +{
> > +       unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
> > +       unsigned eax, ebx, ecx, edx;
> > +       unsigned features = 0;
> > +       unsigned extra = 0;
> > +
> > +       if (max >= 1) {
> > +               __cpuid(1, eax, ebx, ecx, edx);
> > +
> > +               if (ecx & bit_SSE3)
> > +                       features |= SSE3;
> > +
> > +               if (ecx & bit_SSSE3)
> > +                       features |= SSSE3;
> > +
> > +               if (ecx & bit_SSE4_1)
> > +                       features |= SSE4_1;
> > +
> > +               if (ecx & bit_SSE4_2)
> > +                       features |= SSE4_2;
> > +
> > +               if (ecx & bit_OSXSAVE) {
> > +                       unsigned int bv_eax, bv_ecx;
> > +                       xgetbv(0, bv_eax, bv_ecx);
> > +                       if ((bv_eax & 6) == 6)
> > +                               extra |= has_YMM;
> > +               }
> > +
> > +               if ((extra & has_YMM) && (ecx & bit_AVX))
> > +                       features |= AVX;
> > +
> > +               if (edx & bit_MMX)
> > +                       features |= MMX;
> > +
> > +               if (edx & bit_SSE)
> > +                       features |= SSE;
> > +
> > +               if (edx & bit_SSE2)
> > +                       features |= SSE2;
> > +
> > +               if (ecx & bit_F16C)
> > +                       features |= F16C;
> > +       }
> > +
> > +       if (max >= 7) {
> > +               __cpuid_count(7, 0, eax, ebx, ecx, edx);
> > +
> > +               if ((extra & has_YMM) && (ebx & bit_AVX2))
> > +                       features |= AVX2;
> > +       }
> > +
> > +       return features;
> > +}
> > +
> >  char *igt_x86_features_to_string(unsigned features, char *line);
> >  #else
> >  static inline unsigned igt_x86_features(void)
> > --
> > 2.43.2
> >
> >

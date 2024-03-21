Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E8C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F83810F82E;
	Thu, 21 Mar 2024 18:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3hk6VVQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FFD10F821
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711045080; x=1742581080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+WohcsnS5vX9sF/HSlqtUXx2esEPPeYjBSMrHb+c25U=;
 b=X3hk6VVQXPMDLospLs8KVDYn9SiBSAwKwIAkZnggOvmSbfYjl0jz8N8D
 olQPHRH1I3L7BgyT5wSfznwbIXI8aCc/9aYiNucDJc5aB6mm8rXQOWaFR
 ufCdpjGZ9mpymy6MhwwAT2i0N8rW/3oEQrk2E1gwNCVmTDePR/12mVHN3
 3UJH0WPdwg1fPFTAI/9HRmITk37LECIyXBJUnXYqiv5wNNu2BxH+FOwF8
 thNHfV6rWlwscbXOY97WHbeBECuEVoqn0ITw/9gS/61TySGxWvRINR7fu
 y+/EIzey8hIPthOzMW5/tA7egZnw7hOEtCrqESrsQdLVRk8z9CwqKa+cs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16696692"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16696692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45607314"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 11:17:58 -0700
Date: Thu, 21 Mar 2024 19:17:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Turner <mattst88@gmail.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
Message-ID: <20240321181755.iaqgm6mvt6iokxmi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240304221800.1161896-1-mattst88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240304221800.1161896-1-mattst88@gmail.com>
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
On 2024-03-04 at 17:16:40 -0500, Matt Turner wrote:
> Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> 
> > When LD_BIND_NOW=1 or -Wl,z,now is in effect symbols must be
> > immediately resolved at startup. In cases where an external function
> > call depends needs to be made that may fail if such a call has not
> > been initialized yet (PLT-based relocation which is processed later).
> > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > may lead to a segfault because the PLT is not yet resolved.
> 

Add here (or at begin of patch?) that this is needed for Gentoo/Hardened
security improving.

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

You could also mension that this is called from only a few places
so it should not cause big code grow.

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
> @@ -194,6 +194,7 @@ static void half_to_float(const uint16_t *h, float *f, unsigned int num)
>  		f[i] = _half_to_float(h[i]);
>  }
>  
> +__attribute__((flatten))
>  static void (*resolve_float_to_half(void))(const float *f, uint16_t *h, unsigned int num)
>  {
>  	if (igt_x86_features() & F16C)
> @@ -205,6 +206,7 @@ static void (*resolve_float_to_half(void))(const float *f, uint16_t *h, unsigned
>  void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
>  	__attribute__((ifunc("resolve_float_to_half")));
>  

Add comment here why this is needed.
With this I see no blockers as you already got r-b from Zbigniew.

Regards,
Kamil

> +__attribute__((flatten))
>  static void (*resolve_half_to_float(void))(const uint16_t *h, float *f, unsigned int num)
>  {
>  	if (igt_x86_features() & F16C)
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
> -#define __cpuid(level, a, b, c, d) a = b = c = d = 0
> -#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
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
> -#define bit_MMX		(1 << 23)
> -#endif
> -
> -#ifndef bit_SSE
> -#define bit_SSE		(1 << 25)
> -#endif
> -
> -#ifndef bit_SSE2
> -#define bit_SSE2	(1 << 26)
> -#endif
> -
> -#ifndef bit_SSE3
> -#define bit_SSE3	(1 << 0)
> -#endif
> -
> -#ifndef bit_SSSE3
> -#define bit_SSSE3	(1 << 9)
> -#endif
> -
> -#ifndef bit_SSE4_1
> -#define bit_SSE4_1	(1 << 19)
> -#endif
> -
> -#ifndef bit_SSE4_2
> -#define bit_SSE4_2	(1 << 20)
> -#endif
> -
> -#ifndef bit_OSXSAVE
> -#define bit_OSXSAVE	(1 << 27)
> -#endif
> -
> -#ifndef bit_AVX
> -#define bit_AVX		(1 << 28)
> -#endif
> -
> -#ifndef bit_F16C
> -#define bit_F16C	(1 << 29)
> -#endif
> -
> -#ifndef bit_AVX2
> -#define bit_AVX2	(1<<5)
> -#endif
> -
> -#define xgetbv(index,eax,edx) \
> -	__asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
> -
> -#define has_YMM 0x1
> -
>  #if defined(__x86_64__) || defined(__i386__)
> -unsigned igt_x86_features(void)
> -{
> -	unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
> -	unsigned eax, ebx, ecx, edx;
> -	unsigned features = 0;
> -	unsigned extra = 0;
> -
> -	if (max >= 1) {
> -		__cpuid(1, eax, ebx, ecx, edx);
> -
> -		if (ecx & bit_SSE3)
> -			features |= SSE3;
> -
> -		if (ecx & bit_SSSE3)
> -			features |= SSSE3;
> -
> -		if (ecx & bit_SSE4_1)
> -			features |= SSE4_1;
> -
> -		if (ecx & bit_SSE4_2)
> -			features |= SSE4_2;
> -
> -		if (ecx & bit_OSXSAVE) {
> -			unsigned int bv_eax, bv_ecx;
> -			xgetbv(0, bv_eax, bv_ecx);
> -			if ((bv_eax & 6) == 6)
> -				extra |= has_YMM;
> -		}
> -
> -		if ((extra & has_YMM) && (ecx & bit_AVX))
> -			features |= AVX;
> -
> -		if (edx & bit_MMX)
> -			features |= MMX;
> -
> -		if (edx & bit_SSE)
> -			features |= SSE;
> -
> -		if (edx & bit_SSE2)
> -			features |= SSE2;
> -
> -		if (ecx & bit_F16C)
> -			features |= F16C;
> -	}
> -
> -	if (max >= 7) {
> -		__cpuid_count(7, 0, eax, ebx, ecx, edx);
> -
> -		if ((extra & has_YMM) && (ebx & bit_AVX2))
> -			features |= AVX2;
> -	}
> -
> -	return features;
> -}
> -
>  char *igt_x86_features_to_string(unsigned features, char *line)
>  {
>  	char *ret = line;
> @@ -284,6 +169,7 @@ static void memcpy_from_wc(void *dst, const void *src, unsigned long len)
>  	memcpy(dst, src, len);
>  }
>  
> +__attribute__((flatten))
>  static void (*resolve_memcpy_from_wc(void))(void *, const void *, unsigned long)
>  {
>  	if (igt_x86_features() & SSE4_1)
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
> +#define __cpuid(level, a, b, c, d) a = b = c = d = 0
> +#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
> +#endif
> +
>  #define MMX	0x1
>  #define SSE	0x2
>  #define SSE2	0x4
> @@ -42,7 +50,114 @@
>  #define F16C	0x200
>  
>  #if defined(__x86_64__) || defined(__i386__)
> -unsigned igt_x86_features(void);
> +
> +#define BASIC_CPUID 0x0
> +#define EXTENDED_CPUID 0x80000000
> +
> +#ifndef bit_MMX
> +#define bit_MMX		(1 << 23)
> +#endif
> +
> +#ifndef bit_SSE
> +#define bit_SSE		(1 << 25)
> +#endif
> +
> +#ifndef bit_SSE2
> +#define bit_SSE2	(1 << 26)
> +#endif
> +
> +#ifndef bit_SSE3
> +#define bit_SSE3	(1 << 0)
> +#endif
> +
> +#ifndef bit_SSSE3
> +#define bit_SSSE3	(1 << 9)
> +#endif
> +
> +#ifndef bit_SSE4_1
> +#define bit_SSE4_1	(1 << 19)
> +#endif
> +
> +#ifndef bit_SSE4_2
> +#define bit_SSE4_2	(1 << 20)
> +#endif
> +
> +#ifndef bit_OSXSAVE
> +#define bit_OSXSAVE	(1 << 27)
> +#endif
> +
> +#ifndef bit_AVX
> +#define bit_AVX		(1 << 28)
> +#endif
> +
> +#ifndef bit_F16C
> +#define bit_F16C	(1 << 29)
> +#endif
> +
> +#ifndef bit_AVX2
> +#define bit_AVX2	(1<<5)
> +#endif
> +
> +#define xgetbv(index,eax,edx) \
> +	__asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
> +
> +#define has_YMM 0x1
> +
> +static inline unsigned igt_x86_features(void)
> +{
> +	unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
> +	unsigned eax, ebx, ecx, edx;
> +	unsigned features = 0;
> +	unsigned extra = 0;
> +
> +	if (max >= 1) {
> +		__cpuid(1, eax, ebx, ecx, edx);
> +
> +		if (ecx & bit_SSE3)
> +			features |= SSE3;
> +
> +		if (ecx & bit_SSSE3)
> +			features |= SSSE3;
> +
> +		if (ecx & bit_SSE4_1)
> +			features |= SSE4_1;
> +
> +		if (ecx & bit_SSE4_2)
> +			features |= SSE4_2;
> +
> +		if (ecx & bit_OSXSAVE) {
> +			unsigned int bv_eax, bv_ecx;
> +			xgetbv(0, bv_eax, bv_ecx);
> +			if ((bv_eax & 6) == 6)
> +				extra |= has_YMM;
> +		}
> +
> +		if ((extra & has_YMM) && (ecx & bit_AVX))
> +			features |= AVX;
> +
> +		if (edx & bit_MMX)
> +			features |= MMX;
> +
> +		if (edx & bit_SSE)
> +			features |= SSE;
> +
> +		if (edx & bit_SSE2)
> +			features |= SSE2;
> +
> +		if (ecx & bit_F16C)
> +			features |= F16C;
> +	}
> +
> +	if (max >= 7) {
> +		__cpuid_count(7, 0, eax, ebx, ecx, edx);
> +
> +		if ((extra & has_YMM) && (ebx & bit_AVX2))
> +			features |= AVX2;
> +	}
> +
> +	return features;
> +}
> +
>  char *igt_x86_features_to_string(unsigned features, char *line);
>  #else
>  static inline unsigned igt_x86_features(void)
> -- 
> 2.43.0
> 

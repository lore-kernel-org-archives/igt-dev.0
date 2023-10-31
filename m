Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEA910E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 18:45:52 +0000 (UTC)
Date: Tue, 31 Oct 2023 19:45:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231031184547.pcf345ct6ljlczlz@kamilkon-desk.igk.intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-4-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH v3 4/7] lib/igt_halffloat.c: Fix musl/uclibc
 build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,
On 2023-10-30 at 20:58:06 +0100, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Fixes build error:
> ../lib/igt_halffloat.c:205:6: error: ‘ifunc’ is not supported on this target
>   205 | void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
> 
> ../lib/igt_halffloat.c:216:6: error: ‘ifunc’ is not supported on this target
>   216 | void igt_half_to_float(const uint16_t *h, float *f, unsigned int num)

Hmm, now I am reading this a second time and have question:
for what architecture are you compiling this?
It would be better to check in build.meson for GCC support
and add checks in meson for:

GCC_HAVE_IFUNC_ATTRIBUTE

then it would be:

#if defined(__x86_64__) && !defined(__clang__) && defined(__GCC_HAVE_IFUNC_ATTRIBUTE)

or is it both gcc and glibc? Do you have other archs for which this
is supported?

> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v3: no changes
> 
>  lib/igt_halffloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> index 08ab05fce..5dbe08e01 100644
> --- a/lib/igt_halffloat.c
> +++ b/lib/igt_halffloat.c
> @@ -162,7 +162,7 @@ static inline float _half_to_float(uint16_t val)
>  	return fi.f;
>  }
>  
> -#if defined(__x86_64__) && !defined(__clang__)
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
---------------------------------------------------- ^^^^^^^^^^^^^^^^^^
What about dropping this? (also in other ifunc patch)

Regards,
Kamil

>  #pragma GCC push_options
>  #pragma GCC target("f16c")
>  
> -- 
> 2.39.2
> 

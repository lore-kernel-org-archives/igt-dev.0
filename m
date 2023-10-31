Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48210E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 18:02:45 +0000 (UTC)
Date: Tue, 31 Oct 2023 19:02:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231031180237.nw6vyl4s6fu6c622@kamilkon-desk.igk.intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-3-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH v3 3/7] lib/igt_x86.c: Fix musl/uclibc build
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
On 2023-10-30 at 20:58:05 +0100, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Fixes build error:
> ../lib/igt_x86.c:295:6: error: ‘ifunc’ is not supported on this target
>   295 | void igt_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v3: no changes
> 
>  lib/igt_x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_x86.c b/lib/igt_x86.c
> index 6ac700df0..8c102fd13 100644
> --- a/lib/igt_x86.c
> +++ b/lib/igt_x86.c
> @@ -190,7 +190,7 @@ char *igt_x86_features_to_string(unsigned features, char *line)
>  }
>  #endif
>  
> -#if defined(__x86_64__) && !defined(__clang__)
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
>  #pragma GCC push_options
>  #pragma GCC target("sse4.1")
>  #pragma GCC diagnostic ignored "-Wpointer-arith"
> -- 
> 2.39.2
> 

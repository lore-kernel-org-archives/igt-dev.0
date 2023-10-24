Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C23D10E404
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 16:09:38 +0000 (UTC)
Date: Tue, 24 Oct 2023 18:09:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231024160933.firzitz7dxfel4pd@kamilkon-desk.igk.intel.com>
References: <20231022155226.3484622-1-bernd@kuhls.net>
 <20231022155226.3484622-7-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022155226.3484622-7-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH 6/7] benchmarks/gem_exec_tracer.c: Fix musl
 build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: mhmdanas <triallax@tutanota.com>, Bernd Kuhls <bernd@kuhls.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,
On 2023-10-22 at 17:52:25 +0200, Bernd Kuhls wrote:
> From: mhmdanas <triallax@tutanota.com>
------- ^^^^^^^^
Please no nicks in author or s-o-b, write here full name.

+cc Petri

Btw did you check against new igt sources, v1.28?

> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/111918317d06598fe1459dbe139923404f3f4b9d
> 
> Bug report with request to split the original patch into some
> functional changes:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Please move gitlab link below.

> 
> Fixes build error:
> ../benchmarks/gem_exec_tracer.c:274:1: error: conflicting types for ‘ioctl’; have ‘int(int,  long unsigned int, ...)’
>   274 | ioctl(int fd, unsigned long request, ...)

Write "Link: ..." here:

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Regards,
Kamil

> ---
>  benchmarks/gem_exec_tracer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
> index 7e86473e4..3156dfc23 100644
> --- a/benchmarks/gem_exec_tracer.c
> +++ b/benchmarks/gem_exec_tracer.c
> @@ -271,7 +271,11 @@ static int is_i915(int fd)
>  }
>  
>  int
> +#ifdef __GLIBC__
>  ioctl(int fd, unsigned long request, ...)
> +#else
> +ioctl(int fd, int request, ...)
> +#endif
>  {
>  	struct trace *t, **p;
>  	va_list args;
> -- 
> 2.39.2
> 

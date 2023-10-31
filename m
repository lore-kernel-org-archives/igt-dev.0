Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4710E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 18:16:00 +0000 (UTC)
Date: Tue, 31 Oct 2023 19:15:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231031181551.h6hamsef54eesjy5@kamilkon-desk.igk.intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-5-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH v3 5/7] benchmarks/gem_exec_tracer.c: Fix musl
 build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mohammed Anas <triallax@tutanota.com>, Bernd Kuhls <bernd@kuhls.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,
On 2023-10-30 at 20:58:07 +0100, Bernd Kuhls wrote:
> From: Mohammed Anas <triallax@tutanota.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/111918317d06598fe1459dbe139923404f3f4b9d
> 
> Fixes build error:
> ../benchmarks/gem_exec_tracer.c:274:1: error: conflicting types for ‘ioctl’; have ‘int(int,  long unsigned int, ...)’
>   274 | ioctl(int fd, unsigned long request, ...)
> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Mohammed Anas <triallax@tutanota.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v3: no changes
> 
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

While it works it looks ugly, what about introduce type request_t?
We can then use:

int ioctl(int fd, ioctl_request_t request, ...)

Btw did you look at lib, there is also:
ioctl_wrappers.h: * igt_ioctl:

Did you test linking? Or only compiling? Is a basic test working,
like core_getversion?

+cc Petri

Regards,
Kamil

>  {
>  	struct trace *t, **p;
>  	va_list args;
> -- 
> 2.39.2
> 

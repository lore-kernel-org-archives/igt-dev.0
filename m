Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373A10E5A6
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 18:01:20 +0000 (UTC)
Date: Tue, 31 Oct 2023 19:00:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231031180050.jt57ldtkkalq4lmk@kamilkon-desk.igk.intel.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH v3 1/7] build: check that outb is present in
 io.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,
On 2023-10-30 at 20:58:03 +0100, Bernd Kuhls wrote:
> With glibc if io.h exists, inb/outb are always defined.
> However on musl, io.h always exists but it may not define inb/outb.
> 
> Thus, igt-gpu-tools builds with musl on non-x86 platforms will fail to
> link. Fix this by checking for both io.h and that outb() is defined.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v3: no changes
> 
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index b35a00faa..cee8a7446 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -220,7 +220,7 @@ endif
>  if cc.has_header('libgen.h')
>  	config.set('HAVE_LIBGEN_H', 1)
>  endif
> -if cc.has_header('sys/io.h')
> +if cc.has_header('sys/io.h') and cc.has_function('outb', prefix: '#include <sys/io.h>')
>  	config.set('HAVE_SYS_IO_H', 1)
>  endif
>  if cc.links('''
> -- 
> 2.39.2
> 

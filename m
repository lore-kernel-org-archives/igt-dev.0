Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2D610ECD0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 08:00:35 +0000 (UTC)
Date: Mon, 17 Oct 2022 10:00:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y00Ln6XbwnADY1B9@kamilkon-desk1>
References: <20221016172725.1556355-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221016172725.1556355-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] meson.build: Add FreeBSD OS detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jake,

On 2022-10-16 at 12:27:25 -0500, Jake Freeland wrote:
> Use meson's host_machine.system() to detect the target operating
> system. If the target is FreeBSD, add /usr/local/include to the
> include dirs.

Put here also note about change from linux-uapi to freebsd-uapi.

> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  meson.build | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 3e937f5a..896efbf8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -86,7 +86,12 @@ with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
>  
> +system = host_machine.system()
> +if system == 'linux'
>  inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> +elif system == 'freebsd'
> +inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.', '/usr/local/include')
--------------------------------------------------------- ^
freebsd-uapi

Regards,
Kamil

> +endif
>  
>  inc_for_gtkdoc = include_directories('lib')
>  
> -- 
> 2.37.3
> 

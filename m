Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9855C10E294
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 14:00:01 +0000 (UTC)
Date: Thu, 14 Sep 2023 15:29:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230914132953.kpfolcf5ffykpbyi@kamilkon-desk.igk.intel.com>
References: <20230913132407.191913-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913132407.191913-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/meson.build: fix build on
 cross-compiled environments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-09-13 at 15:24:07 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When using a cross-compilation build, test_list_target
> won't be updated. So, it needs to be initialized as a blank
------------------- ^^^^^^
s/So, it/It/

> list, otherwise meson will abort with this error message:
> 
> 	docs/reference/igt-gpu-tools/meson.build:58:1: ERROR: Unknown variable "test_list_target".
 ^^^
Remove spaces from begin.

> 
> Tested using a cross-file named meson-core2.txt with:
- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I was unable to reproduce this error so imho please remove this
upto "meson -Dxe..." line.

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> 	[properties]
> 	c_args = '-march=core2'
> 
> 	[binaries]
> 	c = 'gcc'
> 	ar = 'ar'
> 	strip = 'strip'
> 	pkgconfig = 'pkg-config'
> 
> 	[host_machine]
> 	system = 'linux'
> 	cpu_family = 'aarch64'
> 	cpu = 'aarch64'
> 	endian = 'little'
> 
> And running meson with:
> 
> 	meson -Dxe_driver=enabled --cross-file meson-core2.txt core2
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 94b1e2e123ca..a754c7b7612b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -464,6 +464,8 @@ if not meson.is_cross_build()
>  		    command : [ gen_testlist, '@OUTPUT@', test_list ],
>  		    install : true,
>  		    install_dir : libexecdir)
> +else
> +	test_list_target = []
>  endif
>  
>  test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
> -- 
> 2.41.0
> 


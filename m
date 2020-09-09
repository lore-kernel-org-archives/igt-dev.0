Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2AA89CB3
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 20:15:57 +0000 (UTC)
Date: Wed, 9 Sep 2020 22:52:37 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20200909195237.b5o3lnjhdwb2up54@hatecraft.localdomain>
References: <20200824083505.24925-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824083505.24925-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Add option to not build the
 assembler
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kalyan Kondapally <kalyan.kondapally@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 11:35:05AM +0300, Petri Latvala wrote:
> New option -Dassembler=disabled will omit assembler/ from the build.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Kalyan Kondapally <kalyan.kondapally@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
> ---
>  meson.build       | 4 +++-
>  meson_options.txt | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index f4ee14f1..e8c8aaab 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -82,6 +82,7 @@ endforeach
>  build_chamelium = get_option('chamelium')
>  build_docs = get_option('docs')
>  build_tests = not get_option('tests').disabled()
> +build_assembler = get_option('assembler')
>  with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
> @@ -306,9 +307,10 @@ build_info += 'Build tests: @0@'.format(build_tests)
>  subdir('benchmarks')
>  subdir('tools')
>  subdir('runner')
> -if libdrm_intel.found()
> +if libdrm_intel.found() and build_assembler.enabled()
>  	subdir('assembler')
>  endif
> +build_info += 'Build shader assembler: @0@'.format(build_assembler.enabled())

Are you sure this is going to do what you think it's going to do?

My understanding is that .enabled() on feature option object[0]
evaluates to true only if you explicityly set the option to 'enabled'.

Features default to auto unless changed with 'auto_features',
and we don't do that.

  $ meson build
  ...
  Message: Build shader assembler: false

vs

  $ meson -Dassembler=enabled build
  Message: Build shader assembler: true

This means we won't build assembler unless -Dassember=enabled, which
doesn't match with the commit message.

Also, drop a note in the NEWS - it may make some package maintainers a
bit happier :-)

[0]: https://mesonbuild.com/Reference-manual.html#feature-option-object

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

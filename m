Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5787318A00A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 05:12:11 +0000 (UTC)
Date: Thu, 11 Aug 2022 08:10:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Message-ID: <YvSPYe0uoMIGyvG1@platvala-desk.ger.corp.intel.com>
References: <20220809002044.264300-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220809002044.264300-1-khaled.almahallawy@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/chamelium: Move Chamelium tests
 to their own folder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, charlton.lin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 05:20:44PM -0700, Khaled Almahallawy wrote:
> With the introduction of Chamelium V3 and the anticipation of adding more
> tests for the new features supported by V3 HW and refactoring old ones
> (e.g. have separate files for separate tests), let’s move Chamelium to
> its own folder.
> 
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/{ => chamelium}/kms_chamelium.c       |  0
>  tests/{ => chamelium}/kms_color_chamelium.c |  0
>  tests/meson.build                           | 26 ++++++++++++++-------
>  3 files changed, 18 insertions(+), 8 deletions(-)
>  rename tests/{ => chamelium}/kms_chamelium.c (100%)
>  rename tests/{ => chamelium}/kms_color_chamelium.c (100%)
> 
> diff --git a/tests/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> similarity index 100%
> rename from tests/kms_chamelium.c
> rename to tests/chamelium/kms_chamelium.c
> diff --git a/tests/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> similarity index 100%
> rename from tests/kms_color_chamelium.c
> rename to tests/chamelium/kms_color_chamelium.c
> diff --git a/tests/meson.build b/tests/meson.build
> index b548dc3b4444..3d21717ab4b0 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -257,6 +257,10 @@ msm_progs = [
>  	'msm_submit'
>  ]
>  
> +chamelium_progs = [
> +	'kms_chamelium',
> +]
> +
>  test_deps = [ igt_deps ]
>  
>  if libdrm_nouveau.found()
> @@ -269,13 +273,6 @@ if libdrm_nouveau.found()
>  	test_deps += libdrm_nouveau
>  endif
>  
> -if chamelium.found()
> -	test_progs += [
> -		'kms_chamelium',
> -	]
> -	test_deps += chamelium
> -endif
> -
>  test_executables = []
>  test_list = []
>  
> @@ -307,6 +304,19 @@ foreach prog : msm_progs
>  	test_list += prog
>  endforeach
>  
> +if chamelium.found()
> +	foreach prog : chamelium_progs
> +		test_executables += executable(prog,
> +				 join_paths('chamelium', prog + '.c'),
> +				 dependencies : test_deps,
> +				 install_dir : libexecdir,
> +				 install_rpath : libexecdir_rpathdir,
> +				 install : true)
> +		test_list += prog
> +	endforeach
> +	test_deps += chamelium
> +endif
> +
>  test_executables += executable('drm_fdinfo',
>  	   join_paths('i915', 'drm_fdinfo.c'),
>  	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
> @@ -417,7 +427,7 @@ test_list += 'kms_color'
>  
>  if chamelium.found()
>         test_executables += executable('kms_color_chamelium',
> -                             [ 'kms_color_chamelium.c', 'kms_color_helper.c' ],
> +                             [ 'chamelium/kms_color_chamelium.c', 'kms_color_helper.c' ],
>                               dependencies : test_deps + [ chamelium ],
>                               install_dir : libexecdir,
>                               install_rpath : libexecdir_rpathdir,
> -- 
> 2.25.1
> 

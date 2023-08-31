Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8008010E6A0
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:57:53 +0000 (UTC)
Date: Thu, 31 Aug 2023 17:57:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230831175747.6c7a6e66@maurocar-mobl2>
In-Reply-To: <20230831145622.1158622-5-bhanuprakash.modem@intel.com>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
 <20230831145622.1158622-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V5 4/7] tests/meson.build: Simplify builds for
 Chamelium targets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 20:26:19 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Move Chamelium based extra dependencies & source files to
> corresponding generic dictionaries.
> 
> If we want to change extra source files for any Chamelium
> target, we can simply update in the dictionary, no need to
> re-wrire the rules.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/meson.build | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index c683e468d..e25793b5a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -311,6 +311,7 @@ msm_progs = [
>  
>  chamelium_progs = [
>  	'kms_chamelium_audio',
> +	'kms_chamelium_color',
>  	'kms_chamelium_edid',
>  	'kms_chamelium_frames',
>  	'kms_chamelium_hpd',
> @@ -334,6 +335,11 @@ extra_sources = {
>  	'dumb_buffer': ['dumb_buffer.c' ],
>  	'testdisplay': [ 'testdisplay_hotplug.c' ],
>  	'kms_color':  [ 'kms_color_helper.c' ],
> +	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
> +	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('i915', 'kms_dsc_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('i915', 'kms_dsc_helper.c') ],
>  }
> @@ -426,9 +432,8 @@ endforeach
>  if chamelium.found()
>  	foreach prog : chamelium_progs
>  		testexe = executable(prog,
> -				 [join_paths('chamelium', prog + '.c'),
> -					join_paths('chamelium', 'kms_chamelium_helper.c')],
> -				 dependencies : test_deps,
> +				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
> +				 dependencies : test_deps + extra_dependencies.get(prog, []),
>  				 install_dir : libexecdir,
>  				 install_rpath : libexecdir_rpathdir,
>  				 install : true)
> @@ -442,21 +447,6 @@ if chamelium.found()
>  			     output : name + '.testlist')
>  	endforeach
>  	test_deps += chamelium
> -
> -	name = 'kms_chamelium_color'
> -	testexe = executable('kms_chamelium_color',
> -				[ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
> -				dependencies : test_deps + [ chamelium ],
> -				install_dir : libexecdir,
> -				install_rpath : libexecdir_rpathdir,
> -				install : true)
> -	test_list += name
> -	test_executables += testexe
> -	testlist_files += custom_target(name + '.testlist',
> -		     build_by_default : true,
> -		     command : [testexe, '--show-testlist'],
> -		     capture : true,
> -		     output : name + '.testlist')
>  endif
>  
>  subdir('amdgpu')

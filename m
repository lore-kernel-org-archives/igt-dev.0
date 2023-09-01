Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473D810E781
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 10:09:21 +0000 (UTC)
Date: Fri, 1 Sep 2023 12:08:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230901100856.fzmnt42ridi2y67b@kamilkon-desk.igk.intel.com>
References: <20230901074224.524217-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230901074224.524217-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/meson.build: only generate
 testlists on native builds
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
Cc: Ilja Friedel <ihf@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-09-01 at 09:42:24 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> cross-compiling will produce binaries that don't run at the
> build machine. On such cases, we cannot produce testlist files.
> 
> Detect it, to avoid IGT builds to fail on cross builds.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/meson.build | 72 +++++++++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index aa27fd9aff7c..aa8e3434ce0e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -382,11 +382,13 @@ foreach prog : test_progs
>  	test_executables += testexe
>  	test_list += prog
>  	name = prog.split('/').get(-1)
> -	testlist_files += custom_target(name + '.testlist',
> -		     build_by_default : true,
> -		     command : [testexe, '--show-testlist'],
> -		     capture : true,
> -		     output : name + '.testlist')
> +	if not meson.is_cross_build()
> +		testlist_files += custom_target(name + '.testlist',
> +			    build_by_default : true,
> +			    command : [testexe, '--show-testlist'],
> +			    capture : true,
> +			    output : name + '.testlist')
> +	endif
>  endforeach
>  
>  intel_progs = intel_i915_xe_progs
> @@ -406,11 +408,13 @@ foreach prog : intel_progs
>  	test_executables += testexe
>  	test_list += prog
>  	name = prog.split('/').get(-1)
> -	testlist_files += custom_target(name + '.testlist',
> -		     build_by_default : true,
> -		     command : [testexe, '--show-testlist'],
> -		     capture : true,
> -		     output : name + '.testlist')
> +	if not meson.is_cross_build()
> +		testlist_files += custom_target(name + '.testlist',
> +			    build_by_default : true,
> +			    command : [testexe, '--show-testlist'],
> +			    capture : true,
> +			    output : name + '.testlist')
> +	endif
>  endforeach
>  
>  foreach prog : msm_progs
> @@ -433,11 +437,13 @@ if chamelium.found()
>  		test_list += prog
>  		test_executables += testexe
>  		name = prog.split('/').get(-1)
> -		testlist_files += custom_target(name + '.testlist',
> -			     build_by_default : true,
> -			     command : [testexe, '--show-testlist'],
> -			     capture : true,
> -			     output : name + '.testlist')
> +		if not meson.is_cross_build()
> +			testlist_files += custom_target(name + '.testlist',
> +				    build_by_default : true,
> +				    command : [testexe, '--show-testlist'],
> +				    capture : true,
> +				    output : name + '.testlist')
> +		endif
>  	endforeach
>  	test_deps += chamelium
>  endif
> @@ -451,11 +457,13 @@ subdir('vc4')
>  subdir('vmwgfx')
>  
>  gen_testlist = find_program('generate_testlist.sh')
> -test_list_target = custom_target('testlist',
> -	      output : 'test-list.txt',
> -	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> -	      install : true,
> -	      install_dir : libexecdir)
> +if not meson.is_cross_build()
> +	test_list_target = custom_target('testlist',
> +		    output : 'test-list.txt',
> +		    command : [ gen_testlist, '@OUTPUT@', test_list ],
> +		    install : true,
> +		    install_dir : libexecdir)
> +endif
>  
>  test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
>  	   dependencies : test_deps + [ libatomic ],
> @@ -464,11 +472,13 @@ test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c
>  	   install : true)
>  test_list += 'gem_concurrent_all'
>  
> -test_list_full_target = custom_target('testlist-full',
> -	      output : 'test-list-full.txt',
> -	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> -	      install : true,
> -	      install_dir : libexecdir)
> +if not meson.is_cross_build()
> +	test_list_full_target = custom_target('testlist-full',
> +		    output : 'test-list-full.txt',
> +		    command : [ gen_testlist, '@OUTPUT@', test_list ],
> +		    install : true,
> +		    install_dir : libexecdir)
> +endif
>  
>  test_script = find_program('igt_command_line.sh')
>  foreach prog : test_list
> @@ -480,11 +490,13 @@ testexe = executable('gem_stress', 'intel/gem_stress.c',
>  	   install_dir : libexecdir,
>  	   install_rpath : libexecdir_rpathdir,
>  	   dependencies : igt_deps)
> -testlist_files += custom_target('gem_stress.testlist',
> -                build_by_default : true,
> -                command : [testexe, '--show-testlist'],
> -                capture : true,
> -                output : 'gem_stress.testlist')
> +if not meson.is_cross_build()
> +	testlist_files += custom_target('gem_stress.testlist',
> +			build_by_default : true,
> +			command : [testexe, '--show-testlist'],
> +			capture : true,
> +			output : 'gem_stress.testlist')
> +endif
>  
>  image_files = [
>    '1080p-left.png',
> -- 
> 2.41.0
> 


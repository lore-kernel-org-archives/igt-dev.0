Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9B10E169
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 15:13:51 +0000 (UTC)
Date: Tue, 9 May 2023 11:13:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFpjJGt+u78n4T8l@intel.com>
References: <20230509073426.1154390-1-mauro.chehab@linux.intel.com>
 <20230509073426.1154390-2-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230509073426.1154390-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] meson: add an option to control Xe
 test builds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 09, 2023 at 09:34:25AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The Xe driver is currently under heavy development and has not
> merged upstream yet. While merging doesn't happen, the API may
> still change, as upstream may request changes on it and/or
> driver developers may need to tweak some API bits.
> 
> While this is happening, incompatible API changes may still
> happen. As IGT is distributed on some distros, placing Xe
> tests on binaries is not a good idea, as such tests may fail
> when the final version gets released.
> 
> So, add a build option to allow disabling Xe driver builds.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/testplan/meson.build |  9 ++++++++-
>  meson_options.txt         |  9 +++++++++
>  tests/meson.build         | 23 ++++++++++++++---------
>  3 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index b65ee964ddd2..2014f91b5be1 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -23,11 +23,18 @@ else
>  	doc_dependencies = []
>  endif
>  
> +xe_test_dict = {
> +		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +	       }
> +
>  test_dict = {
> -	      'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
>  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>  	    }
>  
> +if build_xe
> +	test_dict += xe_test_dict
> +endif
> +
>  foreach testplan, fields: test_dict
>  	rst = custom_target(testplan + '.rst',
>  			    build_by_default : true,
> diff --git a/meson_options.txt b/meson_options.txt
> index 2cb44f20169b..7b5a818cb72f 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -37,6 +37,15 @@ option('tests',
>         type : 'feature',
>         description : 'Build tests')
>  
> +# Currently, Xe uAPI is not stable: it may still change while the driver is
> +# not merged upstream.

The commit message and this comment here made me to remember to send
this patch:

https://lore.kernel.org/all/20230509151008.1434683-1-rodrigo.vivi@intel.com/

Even when we are merged upstream we might still for a while have
uapi changes. The right turning point is when we remove the STAGING
build dependency.

> +# So, add an option to enable it, as distros shall not be shipping
> +# binaries with Xe tests on it, as they will most certainly fail once
> +# drivers get upstreamed.
> +option('xe_driver',
> +       type : 'feature',
> +       description : 'Build tests for Xe driver (experimental)')
> +
>  option('libdrm_drivers',
>         type : 'array',
>         value : ['auto'],
> diff --git a/tests/meson.build b/tests/meson.build
> index c15eb3a08cb2..ff7c37304b4d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -317,15 +317,20 @@ foreach prog : i915_progs
>  	test_list += prog
>  endforeach
>  
> -foreach prog : xe_progs
> -	test_executables += executable(prog,
> -		   join_paths('xe', prog + '.c'),
> -		   dependencies : test_deps,
> -		   install_dir : libexecdir,
> -		   install_rpath : libexecdir_rpathdir,
> -		   install : true)
> -	test_list += prog
> -endforeach
> +build_xe = not get_option('xe_driver').disabled()
> +
> +if build_xe
> +	foreach prog : xe_progs
> +		test_executables += executable(prog,
> +			   join_paths('xe', prog + '.c'),
> +			   dependencies : test_deps,
> +			   install_dir : libexecdir,
> +			   install_rpath : libexecdir_rpathdir,
> +			   install : true)
> +		test_list += prog
> +	endforeach
> +	build_info += 'Xe **experimental** tests enabled.'
> +endif
>  
>  foreach prog : msm_progs
>  	test_executables += executable(prog, join_paths('msm', prog + '.c'),
> -- 
> 2.40.1
> 


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7610E0FE
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 10:31:33 +0000 (UTC)
Date: Fri, 12 Jan 2024 11:31:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] build: Remove xe_driver options
Message-ID: <20240112103126.cmycjpnia74to5ss@kamilkon-desk.igk.intel.com>
References: <20240111213358.1656641-1-lucas.demarchi@intel.com>
 <20240111213358.1656641-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240111213358.1656641-2-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lucas,
On 2024-01-11 at 13:33:58 -0800, Lucas De Marchi wrote:
> Always build with xe tests.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

+cc Mauro

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 17 +++++------------
>  meson.build               |  1 -
>  meson_options.txt         |  5 -----
>  tests/meson.build         |  5 +----
>  4 files changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 9e0c3aee0..e027e41ed 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -31,18 +31,11 @@ else
>  	doc_dependencies = []
>  endif
>  
> -if build_xe
> -	test_dict = {
> -		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> -		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> -	    }
> -else
> -	test_dict = {
> -	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
> -	    }
> -endif
> +test_dict = {
> +	'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> +	'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> +	'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +}
>  
>  foreach testplan, fields: test_dict
>  	rst = custom_target(testplan + '.rst',
> diff --git a/meson.build b/meson.build
> index b35a00faa..a16fdbc46 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -85,7 +85,6 @@ endforeach
>  build_chamelium = get_option('chamelium')
>  build_docs = get_option('docs')
>  build_tests = not get_option('tests').disabled()
> -build_xe = not get_option('xe_driver').disabled()
>  with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
> diff --git a/meson_options.txt b/meson_options.txt
> index 6a9493ea6..2cb44f201 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -37,11 +37,6 @@ option('tests',
>         type : 'feature',
>         description : 'Build tests')
>  
> -option('xe_driver',
> -       type : 'feature',
> -       value : 'enabled',
> -       description : 'Build tests for Xe driver')
> -
>  option('libdrm_drivers',
>         type : 'array',
>         value : ['auto'],
> diff --git a/tests/meson.build b/tests/meson.build
> index a6a8498e2..f783903f5 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -401,10 +401,7 @@ endforeach
>  
>  intel_progs = intel_i915_xe_progs
>  intel_progs += intel_i915_progs + intel_kms_progs
> -if build_xe
> -	build_info += 'Xe **experimental** tests enabled.'
> -	intel_progs += intel_xe_progs
> -endif
> +intel_progs += intel_xe_progs
>  
>  foreach prog : intel_progs
>  	testexe = executable(prog,
> -- 
> 2.40.1
> 


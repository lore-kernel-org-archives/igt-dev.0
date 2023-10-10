Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700410E079
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 15:00:00 +0000 (UTC)
Date: Tue, 10 Oct 2023 16:59:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231010145934.vdjflo3qnyja33ox@kamilkon-desk.igk.intel.com>
References: <20231010131743.535504-1-mauro.chehab@linux.intel.com>
 <20231010131743.535504-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231010131743.535504-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] testplan/meson.build: disable kms
 check testlist if not chamelium
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

thank you for a fix.

On 2023-10-10 at 15:17:19 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The KMS JSON file contains some tests that can optionally be disabled.
> When those are disabled, the code can't check for missing documents,
> as the JSON file specifies both enabled and disabled tests.
> 
> Detect that to avoid build problems.
> 
> While here, remove a left-over dictionary (xe_test_dict).
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 16dd578266cd..9e0c3aee06af 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -11,12 +11,19 @@ kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.jso
>  i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
>  
>  check_testlist = []
> +kms_check_testlist = []
>  if build_tests
>  	doc_dependencies = testlist_files
>  	# Check if documentation matches the actual tests and tests can run
>  	if not meson.is_cross_build()
>  		build_info += 'Will Check if documentation is in sync with testlist'
>  		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +
> +		if not chamelium.found()
> +			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium is disabled')
> +		else
> +			kms_check_testlist = check_testlist
> +		endif
>  	else
>  		warning('WARNING: Will not check if documentation is in sync with testlist')
>  	endif
> @@ -24,20 +31,16 @@ else
>  	doc_dependencies = []
>  endif
>  
> -xe_test_dict = {
> -		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> -	       }
> -
>  if build_xe
>  	test_dict = {
>  		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
>  		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	    }
>  else
>  	test_dict = {
>  	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
>  	    }
>  endif
>  
> -- 
> 2.41.0
> 


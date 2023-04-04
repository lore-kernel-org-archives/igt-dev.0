Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBFE10E21B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 12:22:00 +0000 (UTC)
Date: Tue, 4 Apr 2023 14:21:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230404122157.rz44pnhxgvyuqerx@kamilkon-desk1>
References: <20230404111942.214516-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230404111942.214516-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] testplan/meson.build: only run
 igt_runner if it is compiled
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

On 2023-04-04 at 13:19:43 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> While the runner is built by default, if jsonc is not found, it
> won't be build. This will cause the documentation validation test
> to cause the build to fail.
> 
> Prevent that by adding an extra check if jsonc is found, as this
> is the same condition that it is used to build igt_runner.
> 
> While here, also ensure that igt_doc.py will depend on having the
> igt_runner already compiled, when the --check option is used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> ---
> 
> v3:
>   - don't bail out if tests aren't built
> v2:
>   - add a dependency for the runner binary when --check option is
>     used.
> ---
>  docs/testplan/meson.build | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 4c67ec42fc69..ea9f6eeb7038 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -10,10 +10,14 @@ xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>  
>  check_testlist = []
>  if build_tests
> -	# Check if documentation matches the actual tests
> -	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +	doc_dependencies = test_executables
> +	if jsonc.found()
> +		# Check if documentation matches the actual tests
> +		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +		doc_dependencies += runner
> +	endif
>  else
> -	test_executables = []
> +	doc_dependencies = []
>  endif
>  
>  test_dict = { 'xe_tests':
> @@ -24,7 +28,7 @@ foreach testplan, fields: test_dict
>  	rst = custom_target(testplan + '.rst',
>  			    build_by_default : true,
>  			    command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
> -			    depends : test_executables,
> +			    depends : doc_dependencies,
>  			    input : fields['input'],
>  			    output : testplan + '.rst'
>  			   )
> -- 
> 2.39.2
> 


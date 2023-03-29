Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3D10EBE5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:56:53 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:55:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175532.pomcrm3mbv7mvjiq@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-10-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/11] testplan/meson.build: Validate
 documentation at build time
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

On 2023-03-27 at 15:31:53 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If the tests are build too, check if the documentation match
> the name of the tests.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 8 ++++++--
>  meson.build               | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index fee568868167..d1ad6ea0461b 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -8,12 +8,16 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
>  xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>  
> -if not build_tests
> +check_testlist = ''
> +if build_tests
> +	# Check if documentation matches the actual tests
> +	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +else
>  	test_executables = []
>  endif
>  
>  test_dict = { 'xe_tests':
> -		{ 'input': xe_test_config, 'extra_args': [] }
> +		{ 'input': xe_test_config, 'extra_args': check_testlist }
>  	    }
>  
>  foreach testplan, fields: test_dict
> diff --git a/meson.build b/meson.build
> index 7360634fe199..bef590f465dc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -15,6 +15,7 @@ endif
>  
>  # meson.source_root is marked as a future-deprecated feature
>  source_root = meson.current_source_dir()
> +build_root = meson.current_build_dir()
>  
>  cc = meson.get_compiler('c')
>  
> -- 
> 2.39.2
> 


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50E910E099
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 13:42:07 +0000 (UTC)
Date: Fri, 31 Mar 2023 15:42:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230331134204.k6wh4ql7pgtcgau5@kamilkon-desk1>
References: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
 <20230330130518.2731441-13-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330130518.2731441-13-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 12/12] runner/meson.build: fix
 minimal build
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

On 2023-03-30 at 15:05:18 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Minimal pipeline s now failing:
> 	https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38824636
> 
> This doesn't seem to be related to the patches at the series from
> where the issue was reported, but addressing it is simple enough:
> just remove the error and change the logic to properly validate
> the possible options.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/meson.build | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/runner/meson.build b/runner/meson.build
> index dadfc75f0ca7..c62303ce35c5 100644
> --- a/runner/meson.build
> +++ b/runner/meson.build
> @@ -24,11 +24,7 @@ if liboping.found()
>  	runner_c_args += '-DHAVE_OPING=1'
>  endif
>  
> -if not build_tests and jsonc.found()
> -	error('Building test runner requires building tests')
> -endif
> -
> -if jsonc.found()
> +if jsonc.found() and build_tests
>  	subdir('testdata')
>  
>  	runnerlib = static_library('igt_runner', runnerlib_sources,
> -- 
> 2.39.2
> 


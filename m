Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0B10F16B
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 09:13:24 +0000 (UTC)
Date: Fri, 31 Mar 2023 11:13:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230331091319.wl3hbua5uekrmg6c@kamilkon-desk1>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
 <20230330054221.2640814-13-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330054221.2640814-13-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 12/12] runner/meson.build: fix
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

Hi Mauro,

On 2023-03-30 at 07:42:21 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Minimal pipeline s now failing:
------------------ ^
s/s/is/

> 	https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38824636
> 
> This doesn't seem to be related to the patches at the series from
> where the issue was reported, but addressing it is simple enough:
> just remove the error and change the logic to properly validate
> the possible options.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
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

imho:
if jsonc.found() and not build_tests 

is more clear what we need here.
Btw this is error from that build link:

docs/testplan/meson.build:24:1: ERROR:  Invalid use of addition: can only concatenate list (not "str") to list

I do not see how runner/meson.build is related to docs/testplan/meson.build ?

+cc Petri

Regards,
Kamil

> -
> -if jsonc.found()
> +if jsonc.found() and build_tests
>  	subdir('testdata')
>  
>  	runnerlib = static_library('igt_runner', runnerlib_sources,
> -- 
> 2.39.2
> 


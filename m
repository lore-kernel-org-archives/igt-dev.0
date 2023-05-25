Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE0E10E768
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 21:11:47 +0000 (UTC)
Date: Thu, 25 May 2023 23:11:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525211144.snixsj3tbhkypi4a@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-12-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-12-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/11] testplan/meson.build: make it
 check for missing i915 documentation
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

On 2023-05-25 at 11:05:35 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Now that i915 is fully documented, check it at build time.

This is not working now, see GitLab log:

Warning: Missing documentation for igt@perf_pmu@rc6-all-gts
ninja: build stopped: subcommand failed.

Can we not turn it on until we fill in all gaps ?

Regards,
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/testplan/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 6cd44be5ccd3..bf73dd32a15f 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -30,13 +30,13 @@ xe_test_dict = {
>  
>  if build_xe
>  	test_dict = {
> -		'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
> +		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>  		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
>  		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	    }
>  else
>  	test_dict = {
> -	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
> +	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>  	    }
>  endif
> -- 
> 2.40.1
> 


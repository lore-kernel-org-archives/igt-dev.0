Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739210E1C6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 12:26:15 +0000 (UTC)
Date: Fri, 26 May 2023 14:26:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526122611.msiceuse6s7hs25d@kamilkon-desk1>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
 <20230526064624.2886063-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526064624.2886063-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] testplan/meson.build: make it check
 for missing i915 documentation
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

On 2023-05-26 at 08:46:24 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Now that i915 is fully documented, check it at build time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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


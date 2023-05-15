Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6B110E0CC
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 17:32:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f14ec8d72aso13016320e87.1
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 10:32:03 -0700 (PDT)
Date: Mon, 15 May 2023 20:32:00 +0300
From: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <ZGJskEaPVEnc0mkJ@adrinael.net>
References: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: fix testplan building for old
 meson
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 15, 2023 at 06:39:08PM +0200, Kamil Konieczny wrote:
> Old meson 0.47.2 do not support dictionary adding so fix
> testplan building.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Petri Latvala <adrinael@adrinael.net>

> ---
>  docs/testplan/meson.build | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 2014f91b5..6454f2933 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -27,12 +27,15 @@ xe_test_dict = {
>  		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	       }
>  
> -test_dict = {
> +if build_xe
> +	test_dict = {
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +	    }
> +else
> +	test_dict = {
>  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>  	    }
> -
> -if build_xe
> -	test_dict += xe_test_dict
>  endif
>  
>  foreach testplan, fields: test_dict
> -- 
> 2.39.2
> 

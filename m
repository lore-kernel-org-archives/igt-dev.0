Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34C510E5A7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 08:47:47 +0000 (UTC)
Date: Wed, 24 May 2023 10:47:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230524084743.4vuci2hjbofiqfrl@kamilkon-desk1>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-19-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230516165058.4047595-19-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 18/20] tests/xe/xe_debugfs: Use xe_config()
 helper to get the config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-05-16 at 22:20:56 +0530, Bhanuprakash Modem wrote:
> Use xe_config() helper to get the config.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/xe/xe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index 4006981c6..10dd05740 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -252,7 +252,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_subtest("base") {
> -		test_base(fd, xe_dev->config);
> +		test_base(fd, xe_config(fd));

Is this needed ? Old code looks good, I see no point in change.
Maybe you should merge this with one removing xe_dev var ?

Regards,
Kamil

>  	}
>  
>  
> -- 
> 2.40.0
> 

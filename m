Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B558010E241
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:15:49 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:15:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230626161515.6pthjwouu7r6mlro@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-23-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-23-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 22/24] tests/xe/xe_debugfs: Use xe_config()
 helper to get the config
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

Hi Bhanuprakash,

could you move it up in series just after 3/24?
[i-g-t 03/24] lib/xe/xe_query: Add xe_config() interface

with that:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

On 2023-06-26 at 10:40:29 +0530, Bhanuprakash Modem wrote:
> Use xe_config() helper to get the config.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/xe/xe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index c404da258..bbd821f8c 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -253,7 +253,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_subtest("base") {
> -		test_base(fd, xe_dev->config);
> +		test_base(fd, xe_config(fd));
>  	}
>  
>  
> -- 
> 2.40.0
> 

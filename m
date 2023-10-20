Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54710E0D7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 11:28:18 +0000 (UTC)
Date: Fri, 20 Oct 2023 13:27:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231020112758.xlsazuplit2deeu3@kamilkon-desk.igk.intel.com>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
 <20231020102146.121478-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020102146.121478-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] igt_runner: don't require root for
 dry_run
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
On 2023-10-20 at 12:20:32 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When --dry-run option is used, there's no need to require root,
> as no tests will actually be executed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/settings.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 23aa82963344..788957948b4f 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -687,6 +687,7 @@ bool parse_options(int argc, char **argv,
>  			break;
>  		case OPT_DRY_RUN:
>  			settings->dry_run = true;
> +			settings->allow_non_root = true;
>  			break;
>  		case OPT_ALLOW_NON_ROOT:
>  			settings->allow_non_root = true;
> -- 
> 2.41.0
> 


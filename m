Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04CD10E612
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 12:37:19 +0000 (UTC)
Date: Fri, 16 Jun 2023 14:37:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230616123714.gkdn76y7tosedkmk@kamilkon-desk1>
References: <20230615123654.1672601-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615123654.1672601-1-nemesa.garg@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Reducing the
 IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nemesa Garg <nemesa.garg@intel.com>, Garg@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Garg,

tests/kms_cursor_legacy: Reducing the IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout.
----------------------------------------------------------------------------------------------- ^

Please do not write a dot at the end of Subject, so:

s/timeout./timeout/

Regards,
Kamil

On 2023-06-15 at 18:06:54 +0530, Garg, Nemesa wrote:
> Due to excessive IOCTL calls in a stress test we are getting
> disk limit issue. Hence by reducing the timeout from 20 to 5
> the IOCTL call will get reduced.
> 
> Checked with different values and found 5 as optimal value.
> 
> Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index f1e55906..13918345 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1562,12 +1562,12 @@ igt_main
>  					errno = 0;
>  
>  					igt_dynamic_f("pipe-%s", kmstest_pipe_name(n))
> -						stress(&display, n, tests[i].ncpus, tests[i].flags, 20);
> +						stress(&display, n, tests[i].ncpus, tests[i].flags, 5);
>  				}
>  
>  				errno = 0;
>  				igt_dynamic("all-pipes")
> -					stress(&display, -1, tests[i].ncpus, tests[i].flags, 20);
> +					stress(&display, -1, tests[i].ncpus, tests[i].flags, 5);
>  			}
>  		}
>  	}
> -- 
> 2.25.1
> 

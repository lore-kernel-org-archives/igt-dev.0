Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D06510E599
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 14:05:41 +0000 (UTC)
Date: Thu, 27 Jul 2023 16:05:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230727140535.l63njdprunt2cdk5@kamilkon-desk1>
References: <20230727125535.2832-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230727125535.2832-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict multi-display
 hang tests execution
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

Hi Jeevan,

On 2023-07-27 at 18:25:35 +0530, Jeevan B wrote:
> Restrict the hang tests execution to the first and last pipe
> combinations to avoid timeouts on CI.
> 
> v2: Update the subject and combine the if condition.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_flip.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ef2234f74..739939ce3 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1729,9 +1729,13 @@ static void run_pair(int duration, int flags)
>  					crtc_idxs[0] = n;
>  					crtc_idxs[1] = m;
>  
> -					/* Limit the execution to PIPE_A combination for hang tests */
> -					if ((flags & TEST_HANG) && !all_pipes &&
> -					    (n != 0 && n != resources->count_crtcs))
> +					/*
> +					 * Limit the execution to 2 CRTCs
> +					 * (first and last combination) for hang tests
> +					 */
> +					if (((flags & TEST_HANG) && !all_pipes) &&
------------------------------------------- ^ ------------------------------- ^
These braces are not needed. With that fixed

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +					    ((n != 0 && n != resources->count_crtcs) ||
> +					    m != resources->count_crtcs - 1))
>  						continue;
>  
>  					run_test_on_crtc_set(&o, crtc_idxs,
> -- 
> 2.41.0
> 

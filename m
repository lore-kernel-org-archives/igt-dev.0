Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192910E487
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 15:04:57 +0000 (UTC)
Date: Wed, 26 Jul 2023 17:02:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726150250.4dc6uqgqeshen6kp@kamilkon-desk1>
References: <20230718110006.28283-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230718110006.28283-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict the hang tests
 execution to first and last pipe combinations
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

We already have patch with: "Restrict the hang tests execution to first and last pipe combinations"
so maybe change your message to: Restrict even further hang tests

On 2023-07-18 at 16:30:06 +0530, Jeevan B wrote:
> restrict the hang tests execution to single pipe combinations still
- ^
Start from uppercase, s/restrict/Restrict/

> causing timed-out so limiting the combination to first and last pipe.

Please write which tests where so long and give some log example why
it helped, how much less it took?

> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_flip.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ef2234f74..ee4e8a43d 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1729,10 +1729,14 @@ static void run_pair(int duration, int flags)
>  					crtc_idxs[0] = n;
>  					crtc_idxs[1] = m;
>  
> -					/* Limit the execution to PIPE_A combination for hang tests */
> +					/* Limit the execution to 2 CRTCs
> +					 * (first and last combination) for hang tests */

Write multiline comment starting with empty /* like:
					/*
					 * Limit the execution to 2 CRTCs
					 * (first and last combination) for hang tests
					 */

>  					if ((flags & TEST_HANG) && !all_pipes &&
>  					    (n != 0 && n != resources->count_crtcs))
>  						continue;
> +					if ((flags & TEST_HANG) && !all_pipes &&
> +					    m != resources->count_crtcs - 1)
> +						continue;
>  

Why not putting it all together?
  					if ((flags & TEST_HANG) && !all_pipes &&
  					    n != 0 && n != resources->count_crtcs &&
					    m != resources->count_crtcs - 1)
  						continue;

I made some simple test with single monitor connected and did
not see any difference. In what configuration did you test it?

Regards,
Kamil

>  					run_test_on_crtc_set(&o, crtc_idxs,
>  							     RUN_PAIR,
> -- 
> 2.41.0
> 

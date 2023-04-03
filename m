Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2210E17E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 12:05:08 +0000 (UTC)
Date: Mon, 3 Apr 2023 14:05:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230403120503.gpdgt57hnmw5koog@kamilkon-desk1>
References: <20230104132927.346112-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104132927.346112-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/vc4_purgeable_bo: Fix conditional
 assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-04 at 10:29:27 -0300, Maíra Canal wrote:
> Currently, the assertion is outside of the conditional block, causing a
> failure in two sub-tests as the return of setjmp() can be 0 or SIGBUS.
> Therefore, create an else hook for the igt_assert(ret == SIGBUS) in
> order to avoid a failure of the tests.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/vc4/vc4_purgeable_bo.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
> index 676bc1f3..7f24590c 100644
> --- a/tests/vc4/vc4_purgeable_bo.c
> +++ b/tests/vc4/vc4_purgeable_bo.c
> @@ -187,7 +187,8 @@ igt_main
>  		ret = setjmp(jmp);
>  		if (!ret)
>  			*map = 0;
> -		igt_assert(ret == SIGBUS);
> +		else
> +			igt_assert(ret == SIGBUS);
>  		signal(SIGBUS, SIG_DFL);
>  		signal(SIGSEGV, SIG_DFL);
>  		igt_vc4_purgeable_bo(fd, bo->handle, false);
> @@ -230,7 +231,8 @@ igt_main
>  		ret = setjmp(jmp);
>  		if (!ret)
>  			*map = 0;
> -		igt_assert(ret == SIGBUS);
> +		else
> +			igt_assert(ret == SIGBUS);
>  		signal(SIGBUS, SIG_DFL);
>  		signal(SIGSEGV, SIG_DFL);
>  	}
> -- 
> 2.39.0
> 

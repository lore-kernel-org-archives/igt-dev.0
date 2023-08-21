Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5797E10E226
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 10:26:14 +0000 (UTC)
Date: Mon, 21 Aug 2023 12:26:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Erik Kurzinger <ekurzinger@nvidia.com>
Message-ID: <20230821102610.w64qpwqiiymt2znw@zkempczy-mobl2>
References: <7a8c0a3f-df18-ba3f-9c92-d341f2cb5a7d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a8c0a3f-df18-ba3f-9c92-d341f2cb5a7d@nvidia.com>
Subject: Re: [igt-dev] [PATCH] syncobj_timeline: don't expect EINVAL for
 WAIT_UNSUBMITTED | WAIT_AVAILABLE
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

On Wed, Aug 16, 2023 at 09:17:56AM -0700, Erik Kurzinger wrote:
> The syncobj_timeline test expects waiting for an unsubmitted fence with
> the WAIT_AVAILABLE flag set to fail with EINVAL. While this matches the
> behavior of current kernels, that behavior is incorrect and will be
> fixed by
> https://lists.freedesktop.org/archives/dri-devel/2023-August/418710.html
> 
> With that fix, the WAIT_AVAILABLE flag will have the intended semantics
> of waiting for an unsubmitted fence to be submitted instead of failing.
> 
> Note that this will cause the test to fail with kernels that lack the
> fix, but such failures will reflect a genuine defect.
> 
> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> ---
>  tests/syncobj_timeline.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index b4e1d093a..0422bca51 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -1782,7 +1782,7 @@ igt_main
>  						WAIT_SIGNALED)) != 1)
>  			continue;
>  
> -		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
> +		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
>  			err = -EINVAL;
>  		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
>  			err = -ETIME;
> @@ -1851,7 +1851,7 @@ igt_main
>  			continue;
>  
>  		err = 0;
> -		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
> +		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
>  			err = -EINVAL;
>  		} else if (flags & WAIT_ALL) {
>  			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
> -- 
> 2.41.0
> 
>

Right, reading your example sent to dri-devel WAIT_AVAILABLE definitely
should wait until reaching requested point of time instead returning
EINVAL immediately if there's no fence submitted before.

Merging this before kernel change will land is ok for me, at least
bug will be filled. But please resend this series one more time as
buildbot didn't pass build step. You may add my rb:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F54A89F24
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2020 13:48:12 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200609134033.29883-1-petri.latvala@intel.com>
References: <20200609134033.29883-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159171048867.24308.15349634911730609257@build.alporthouse.com>
Date: Tue, 09 Jun 2020 14:48:08 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] kms_atomic_transition: Avoid duplicate
 dynamic subtest names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-06-09 14:40:33)
> In commit b943d64f95bc ("kms_atomic_transition: Make the available
> pipe discovery dynamic") the subtests of kms_atomic_transition were
> split into dynamic subtests. What avoided scrutiny however was that
> the looping uses for_each_pipe_with_valid_output, which gives you
> every valid pipe/output combo, so just using the pipe name as the
> dynamic subtest name causes duplicates, resulting in weird CI results.

Ah, I just thought it was an output for that pipe, not every output.

> As the nature of the original test was a stress test for watermarks,
> keep the full combo rather than switching to
> for_each_pipe_with_single_output, but use the output name as well in
> the dynamic subtest name.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_atomic_transition.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index d28a8cdf..754a4969 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -926,42 +926,42 @@ igt_main
>  
>         igt_subtest_with_dynamic("plane-all-transition") {
>                 for_each_pipe_with_valid_output(&display, pipe, output) {
> -                       igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +                       igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>                                 run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);

Makes sense given the revelation.

All 10 dynamic subtests accounted for.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

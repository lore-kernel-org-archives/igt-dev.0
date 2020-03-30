Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BCA6E391
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 14:03:52 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200330124845.43086-1-lionel.g.landwerlin@intel.com>
References: <20200330124845.43086-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158557702835.3228.16555762647868561951@build.alporthouse.com>
Date: Mon, 30 Mar 2020 15:03:48 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] test/perf: respect gen11 restriction in
 disable subslices
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-03-30 13:48:45)
> In particular don't try to enable more than half the subslices.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1543
> Fixes: 779d43cda49c ("tests/perf: add global sseu parameter tests")
> ---
>  tests/perf.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/perf.c b/tests/perf.c
> index 086fdac4..0f65f247 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -5040,7 +5040,19 @@ test_global_sseu_config(void)
>                 igt_drop_root();
>  
>                 sseu_param = default_sseu;
> -               sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
> +
> +               if (intel_gen(devid) == 11) {
> +                       /*
> +                        * On Gen11 there are restrictions on what
> +                        * subslices can be disabled, notably we're
> +                        * not able to enable more than half the
> +                        * subslice. So disable half subslices only.
> +                        */
> +                       for (int i = 0; __builtin_popcount(default_sseu.subslice_mask) / 2; i++)
> +                               sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);

Oh. This reduces the mask each time, by removing the lowest bit set. So
the for loop removes the first half the set bits.

And icl being special rings a bell, so
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757476E045
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 16:50:19 +0000 (UTC)
Date: Tue, 11 Feb 2020 18:50:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200211165015.GX13686@intel.com>
References: <20200211161508.1052436-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211161508.1052436-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Drop b/c pipes from kms_busy
 fast feedback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 04:15:08PM +0000, Chris Wilson wrote:
> The principle test for kms_busy is checking the synchronisation between
> on-going rendering to a framebuffer and its flip, that is independent of
> the pipe. As such for our fast feedback on driver health, we can look at
> the first pipe and assume any errors on the rest will be picked up later
> in the shards/idle runs.
> =

> Each pass of kms_busy is about 25s.
> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/intel-ci/fast-feedback.testlist | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-=
feedback.testlist
> index 467e11267..c0a2cce52 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -89,8 +89,6 @@ igt@kms_addfb_basic@unused-modifier
>  igt@kms_addfb_basic@unused-offsets
>  igt@kms_addfb_basic@unused-pitches
>  igt@kms_busy@basic-flip-pipe-a
> -igt@kms_busy@basic-flip-pipe-b
> -igt@kms_busy@basic-flip-pipe-c

We will lose a bit of coverage on fi-bsw-n3050 since it has HDMI
plugged into port D which can only be driven by pipe C. The other
similar restrictions we have only affect gen2/3 lvds and vlv/chv
dsi, so meh on those.

I guess slightly better solutions migh be:
a) change the test to not be per-pipe but instead have it
   stop as soon as it has found any working pipe+output
b) support some form of logical OR with short cicuit in the testlist
   (ie. igt@kms_busy@basic-flip-pipe-a || igt@kms_busy@basic-flip-pipe-b ||=
 ...)

But not sure how worried we should be about the loss of coverage on
that single bsw. I guess we will hit it via the idle runs anyway,
assuming anyone looks at those. And I can't recall kms_busy being a
problem in the past for us, so it's probably fine.

Acked-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  igt@kms_chamelium@dp-hpd-fast
>  igt@kms_chamelium@dp-edid-read
>  igt@kms_chamelium@dp-crc-fast
> -- =

> 2.25.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

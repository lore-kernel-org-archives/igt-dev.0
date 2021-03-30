Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A116E89DBD
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 04:07:46 +0000 (UTC)
Date: Tue, 30 Mar 2021 07:08:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YGKkQG7LvPLHq2qB@platvala-desk.ger.corp.intel.com>
References: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
 <20210329190016.13394-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329190016.13394-2-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Remove
 pixel-format-pipe-A* from the pre-merge blacklist
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 10:00:16PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> We've had several watermark bugs slip through the net with all
> the pixel format test being blacklisted. Let's run these on
> one pipe so that we might catch at least some of the bugs.
> This will cost us only ~15 seconds on icl these days.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/intel-ci/blacklist-pre-merge.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blac=
klist-pre-merge.txt
> index cddb77c1f303..6363a7ac86dc 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -170,7 +170,7 @@ igt@gem_tiled_wc
>  #
>  # Data acquired on 2020-02-20 by Martin Peres
>  ########################################################################=
#######
> -igt@kms_plane@pixel-format-pipe-[a-d]-planes(-source-clamping)?
> +igt@kms_plane@pixel-format-pipe-[b-d]-planes(-source-clamping)?
>  =

>  =

>  ########################################################################=
#######
> -- =

> 2.26.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

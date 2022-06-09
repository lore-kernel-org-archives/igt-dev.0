Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2714910F39A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 08:49:53 +0000 (UTC)
Message-ID: <dd334dda4779fbad3598af9baf29bb07ebfac2f8.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 09 Jun 2022 11:49:47 +0300
In-Reply-To: <YqGiH9LNcDIJDFW/@platvala-desk.ger.corp.intel.com>
References: <20220607074240.1202404-1-luca@coelho.fi>
 <20220607074240.1202404-3-luca@coelho.fi>
 <YqGiH9LNcDIJDFW/@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_sysfs_edid_timing: fail
 if probing a single connector takes too long
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

On Thu, 2022-06-09 at 10:32 +0300, Petri Latvala wrote:
> On Tue, Jun 07, 2022 at 10:42:38AM +0300, Luca Coelho wrote:
> > From: Luca Coelho <luciano.coelho@intel.com>
> >=20
> > There's no point in just warning if probing a single connector takes
> > too long.  If a test finds any issues, it should just fail.
> >=20
> > Convert the warning into an assertion.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  tests/kms_sysfs_edid_timing.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timin=
g.c
> > index 028a5323c0b2..ea0e169e6ed9 100644
> > --- a/tests/kms_sysfs_edid_timing.c
> > +++ b/tests/kms_sysfs_edid_timing.c
> > @@ -81,11 +81,11 @@ igt_simple_main
> >  			  mean.max, mean.max / 1e3, mean.max / 1e6,
> >  			  mean.mean, mean.mean / 1e3, mean.mean / 1e6);
> > =20
> > -		if (mean.max > (THRESHOLD_PER_CONNECTOR * 1e6)) {
> > -			igt_warn("%s: probe time exceed %dms, max=3D%.2fms, avg=3D%.2fms\n"=
,
> > -				 de->d_name, THRESHOLD_PER_CONNECTOR,
> > -				 mean.max / 1e6, mean.mean / 1e6);
> > -		}
> > +		igt_assert_f(mean.max < THRESHOLD_PER_CONNECTOR * 1e6,
> > +			     "%s: probe time exceed %dms, max=3D%.2fms, avg=3D%.2fms\n",
> > +			     de->d_name, THRESHOLD_PER_CONNECTOR,
> > +			     mean.max / 1e6, mean.mean / 1e6);
> > +
>=20
>=20
> 120ms on KBL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7242/shard-kbl4/igt@kms_sy=
sfs_edid_timing.html
>=20
>=20
> 80-ish ms on APL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7242/shard-apl4/igt@kms_sy=
sfs_edid_timing.html

Thanks for checking these values IRL.


> As for whether that makes this IGT patch an acceptable change, depends
> on whether those times are considered anomalies that someone plans to
> fix somehow...

I don't really know what is considered a reasonable time for this.  We
used to have 10 ms which was not enough for almost any platform,
AFAICT.  So the tests were already failing (with warnings).

I think it doesn't make sense to differentiate between warning and
assertion failures if both cause the tests to fail.  It is just
confusing.  Is a warning a failure or not? Can it be ignored? IMHO a
test results should be black and white: fails or doesn't fail.

In any case, I agree that we should find reasonable values that will
work with all platforms.  120 ms sounds really high to me, though.  But
I don't really know if this can be fixed.

--
Cheers,
Luca.

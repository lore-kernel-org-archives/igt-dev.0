Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507FB10E237
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:47:45 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Mon, 14 Feb 2022 15:47:36 +0000
Message-ID: <443d413349a148eeb4add9e189278e32@intel.com>
References: <20220211161314.16602-1-anshuman.gupta@intel.com>
 <878rug27z8.wl-ashutosh.dixit@intel.com>
In-Reply-To: <878rug27z8.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests: i915_pm_rpm : Dump
 i915_runtime_pm_status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Saturday, February 12, 2022 6:54 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t] tests: i915_pm_rpm : Dump i915_runtime_pm_stat=
us
>=20
> On Fri, 11 Feb 2022 08:13:14 -0800, Anshuman Gupta wrote:
> >
> > Dump i915_runtime_pm_status conditionally whenever runtime pm status
> > got active and it was expected to be suspended.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_rpm.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> > 648b0cffb..d1ba69af4 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -201,10 +201,17 @@ static bool wait_for_pc8_status(enum pc8_status
> > status)
> >
> >  static bool wait_for_suspended(void)
> >  {
> > -	if (has_pc8 && !has_runtime_pm)
> > +	bool suspended =3D false;
>=20
> Nit but maybe let's move this into the else, I'll move and merge it:
>=20
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Thanks Ashutosh for merging , do I need to backport it to IGT.
I see this patch is also part of internal IGT tree.
Thanks,
Anshuman Gupta.
>=20
> > +
> > +	if (has_pc8 && !has_runtime_pm) {
> >		return wait_for_pc8_status(PC8_ENABLED);
> > -	else
> > -		return
> igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> > +	} else {
> > +		suspended =3D
> igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> > +		if (!suspended)
> > +			igt_debugfs_dump(drm_fd,
> "i915_runtime_pm_status");
> > +
> > +		return suspended;
> > +	}
> >  }
> >
> >  static bool wait_for_active(void)
> > --
> > 2.26.2
> >

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BA410E7A2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 16:14:23 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 23 Feb 2022 16:08:38 +0000
Message-ID: <49cdc125fb044f48ba65be1c36b07af3@intel.com>
References: <20220223095951.12430-1-anshuman.gupta@intel.com>
 <87tucp60ea.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87tucp60ea.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915_pm_rpm: Use __igt_debugfs_dump for
 i915_runtime_pm_status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Wednesday, February 23, 2022 9:28 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Ewins, Jon <jon.ewins@intel.com>; Latv=
ala,
> Petri <petri.latvala@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
> Subject: Re: [PATCH i-g-t] i915_pm_rpm: Use __igt_debugfs_dump for
> i915_runtime_pm_status
>=20
> On Wed, 23 Feb 2022 01:59:51 -0800, Anshuman Gupta wrote:
> >
> > Use __igt_debugfs_dump() in wait_for_suspended() in order to specify
> > explicit igt log level.
> > We need to dump the i915_runtime_pm_status even in case of igt test's
> > skips as well, that requires log level to be IGT_LOG_INFO.
>=20
> Ok, by skip I believe you are referring to this:
>=20
> 	igt_require(setup_environment(false));
Yes, skips while setting up the environment.=20
Thanks for RB, is it conditional to make commit log more verbose about
IGT skips during setup_envirnment() ?   =20
Thanks,
Anshuman.
>=20
> Therefore:
>=20
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>=20
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_rpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> > 6c8ffbd5d..eb4c4f4e3 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -207,7 +207,7 @@ static bool wait_for_suspended(void)
> >		bool suspended =3D
> >igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> >
> >		if (!suspended)
> > -			igt_debugfs_dump(drm_fd,
> "i915_runtime_pm_status");
> > +			__igt_debugfs_dump(drm_fd,
> "i915_runtime_pm_status",
> > +IGT_LOG_INFO);
> >
> >		return suspended;
> >	}
> > --
> > 2.26.2
> >

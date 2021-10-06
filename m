Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74966E3F7
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 11:47:45 +0000 (UTC)
Date: Wed, 6 Oct 2021 14:51:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YV2Nst/u5QbRDf4v@platvala-desk.ger.corp.intel.com>
References: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
 <20211005151022.2161424-2-alan.previn.teres.alexis@intel.com>
 <YVykFyOAiKq20zsg@intel.com>
 <BYAPR11MB37848640B55FA385D406A0E48AAF9@BYAPR11MB3784.namprd11.prod.outlook.com>
 <4e9faac935d4d5bf9c61045a05ccfe69618fe865.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4e9faac935d4d5bf9c61045a05ccfe69618fe865.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP default
 session
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 07:34:59PM +0000, Vivi, Rodrigo wrote:
> On Tue, 2021-10-05 at 19:31 +0000, Teres Alexis, Alan Previn wrote:
> > Hey Rodrigo, apologies for this upstream-newbie mistake and I truly
> > appreciate you taking the time and explaining my mistake especially
> > the pull-in of the other non-PXP delta's too. I will respin this
> > ASAP.
>=20
> not your fault.
>=20
> 1. We should have that documented somewhere.

README.md, at the bottom.


--=20
Petri Latvala


> 2. Why do we have UAPIs in i915 without any IGT test for that?! o.O
> (I mean, those other ones that your patch is not bringing in together)
>=20
> >=20
> > ...alan
> >=20
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Tuesday, October 5, 2021 12:15 PM
> > To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP
> > default session
> >=20
> > On Tue, Oct 05, 2021 at 08:10:07AM -0700, Alan Previn wrote:
> > > Sync UAPI for to get I915_PROTECTED_CONTENT_DEFAULT_SESSION define
> > > value.
> > >=20
> > > Taken from kernel commit:
> > > commit cbbd3764b2399ad882cda98435b25144e9ea2124
> > > =A0=A0=A0=A0=A0=A0 ("drm/i915/pxp: Create the arbitrary session after=
 boot.")
> >=20
> > This is not accurate. The i915_drm.h in this commit has more changes
> > other than I915_PROTECTED_CONTENT_DEFAULT_SESSION.
> >=20
> > We should combine the patches 1 and 2 of this series and make a
> > simply i915_drm.h sync and add some reasoning in the commit message
> > saying that it is because of the PXP. But the new include/drm-
> > uapi/i915_drm.h should include all the new api additions from
> > i915_drm.h uapi.
> >=20
> >=20
> > >=20
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > > =A0include/drm-uapi/i915_drm.h | 3 +++
> > > =A01 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-
> > > uapi/i915_drm.h
> > > index b9632bb2..f4691fcc 100644
> > > --- a/include/drm-uapi/i915_drm.h
> > > +++ b/include/drm-uapi/i915_drm.h
> > > @@ -2990,6 +2990,9 @@ struct drm_i915_gem_create_ext_memory_regions
> > > {
> > > =A0=A0=A0=A0=A0 __u64 regions;
> > > =A0};
> > >=20
> > > +/* ID of the protected content session managed by i915 when PXP is
> > > +active */ #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> > > +
> > > =A0#if defined(__cplusplus)
> > > =A0}
> > > =A0#endif
> > > --
> > > 2.25.1
> > >=20
>=20

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131C10E2E2
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 05:41:34 +0000 (UTC)
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Tue, 7 Feb 2023 05:41:27 +0000
Message-ID: <DM6PR11MB3177256E3FEAB0E1B1D283A1BADB9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-7-ville.syrjala@linux.intel.com>
 <DM6PR11MB3177FB4C74D129995D9FB495BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
 <Y9z+MXbsXHihUbfQ@intel.com>
In-Reply-To: <Y9z+MXbsXHihUbfQ@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/kms_async_flips: Test all
 modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Friday, February 3, 2023 6:00 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 6/6] tests/kms_async_flips: Test all modifiers
>=20
> On Thu, Feb 02, 2023 at 11:23:09AM +0000, Murthy, Arun R wrote:
> > > -----Original Message-----
> > > From: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > Sent: Tuesday, January 31, 2023 5:37 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Subject: [PATCH i-g-t 6/6] tests/kms_async_flips: Test all modifiers
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > Run the basic async flip test for all modifiers reported by the
> > > plane (for the
> > > XRGB8888 format). The driver may not support async flip with all
> > > modifiers so we allow this to fail.
> >
> > Support for adding X-tile and linear for all platforms is being added
> > as sub-test in https://patchwork.freedesktop.org/series/103137/
>=20
> I presume you mean:
> https://patchwork.freedesktop.org/patch/515577/?series=3D107871&rev=3D11
>=20
> That does nothing to get rid of the i915isms, nor does do anything to tes=
t all
> the other modifiers (both now and in the future).
>=20
Yes it doesn't test on all other modifiers but adds support for x-tiled and=
 linear.
Testing all supported modifiers is a good one and have no comments on that.

Thanks and Regards,
Arun R Murthy
-------------------
> --
> Ville Syrj=E4l=E4
> Intel

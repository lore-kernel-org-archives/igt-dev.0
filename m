Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA7D6EA43
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 16:15:35 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
Date: Mon, 4 Oct 2021 15:58:58 +0000
Message-ID: <DM8PR11MB5655F2C1B12766FB5122081CE0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20210903123027.1433-1-contact@emersion.fr>
 <YVrKRXeGi2V37xCP@platvala-desk.ger.corp.intel.com>
 <hLg9fLkq8x4hy7DqsQM-GFlKgXYsJJ97Jug9rX1JwxIsVUoRFiZM4CeAG8rpwpMxrXjgaqzXl8G2H3z3id9dMw4XGLExOW19G7OitDw2_J4=@emersion.fr>
 <YVriy3hQjucowhGk@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YVriy3hQjucowhGk@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Petri =
Latvala
> Sent: maanantai 4. lokakuuta 2021 14.18
> To: Simon Ser <contact@emersion.fr>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
>=20
> On Mon, Oct 04, 2021 at 09:34:18AM +0000, Simon Ser wrote:
> > On Monday, October 4th, 2021 at 11:29, Petri Latvala <petri.latvala@int=
el.com>
> wrote:
> >
> > > When is the kernel change going to hit drm-tip? We're going to need
> > > a bug report and cibuglog filter for this failing without it if this
> > > is merged before kernel. (Which is ok, with the bug filing done)
> >
> > Thanks for the review!
> >
> > Sorry, I got a bit eager and forgot about IGT. I've already merged
> > that patch to drm-misc-next, so it should be in drm-tip already.
>=20
> Great!
>=20
> I fired a retest on this patch to verify.
This now bug here right? https://gitlab.freedesktop.org/drm/intel/-/issues/=
4262
This now assume started failing due to https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_10676/git-log-oneline.txt  ?=20
>=20
>=20
> --
> Petri Latvala

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5110E144
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 17:12:50 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Thu, 9 Dec 2021 17:06:28 +0000
Message-ID: <a35c908511fe40119f843e36de1e0680@intel.com>
References: <20211207164331.306201-1-Rodrigo.Siqueira@amd.com>
 <20211207164331.306201-2-Rodrigo.Siqueira@amd.com>
 <9ebea7cb-714b-e61d-10db-f356c5e5df49@amd.com>
 <YbHlgCdBLqSkeWk/@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YbHlgCdBLqSkeWk/@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC
 property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>, Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Re-reported.=20

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com>=20
Sent: Thursday, December 9, 2021 3:16 AM
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>; igt-dev@lists=
.freedesktop.org
Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC=
 property

On Wed, Dec 08, 2021 at 08:48:17PM -0500, Rodrigo Siqueira Jordao wrote:
>=20
>=20
> On 2021-12-07 11:43 a.m., Rodrigo Siqueira wrote:
> > This preparation work introduces a new CRTC property named=20
> > DSC_SLICE_HEIGHT, which will be required for amdgpu DSC tests.
> >=20
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >   lib/igt_kms.c | 1 +
> >   lib/igt_kms.h | 1 +
> >   2 files changed, 2 insertions(+)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 34a2aa00..fdadb6d6=20
> > 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -593,6 +593,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC=
_PROPS] =3D {
> >   	[IGT_CRTC_ACTIVE] =3D "ACTIVE",
> >   	[IGT_CRTC_OUT_FENCE_PTR] =3D "OUT_FENCE_PTR",
> >   	[IGT_CRTC_VRR_ENABLED] =3D "VRR_ENABLED",
> > +	[IGT_CRTC_DSC_SLICE_HEIGHT] =3D "DSC_SLICE_HEIGHT",
> >   };
> >   const char * const=20
> > igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] =3D { diff --git=20
> > a/lib/igt_kms.h b/lib/igt_kms.h index e9ecd21e..5c7d7481 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
> >          IGT_CRTC_ACTIVE,
> >          IGT_CRTC_OUT_FENCE_PTR,
> >          IGT_CRTC_VRR_ENABLED,
> > +       IGT_CRTC_DSC_SLICE_HEIGHT,
> >          IGT_NUM_CRTC_PROPS
> >   };
> >=20
>=20
> Hi Petri,
>=20
> I followed your advice to search for IGT_NUM_CRTC_PROPS, and only=20
> igt_kms.{h,c} and kms_atomic uses it.
>=20
> In the lib/igt_kms.c, the occurrences of IGT_NUM_CRTC_PROPS appears in=20
> the function igt_fill_pipe_props() as a parameter, in its turn, it=20
> call drmModeObjectGetProperties and drmModeGetProperty. Finally, it=20
> only populates the prop array based on the returned value from the=20
> driver. I suppose we are safe here; I don't see how this patch could=20
> regress something in this function. The other places where this=20
> function appears are in the loop condition, but all of them look correct =
to me.

Yeah that looks correct, thanks.

>=20
> Finally, the other place we can see it is in the kms_atomic, but again=20
> the for loop looks correct.
>=20
> However, IGT CI failed:
>=20
> https://patchwork.freedesktop.org/series/97470/#rev2
>=20
> The potential new issue pointed by the CI is:
>=20
>  Possible new issues
>  Here are the unknown changes that may have been introduced in
> IGTPW_6475_full:
>=20
>  IGT changes
>  Possible regressions
>  igt@sysfs_heartbeat_interval@precise@vecs0:
>  shard-apl: PASS -> FAIL
>=20
> And the log says:
>=20
> Stack trace:
>   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
>   #1 ../tests/i915/sysfs_heartbeat_interval.c:156 __test_timeout()
>   #2 [<unknown>+0xd0]
> Dynamic subtest vecs0: FAIL (1.713s)
>=20
> After I resubmitted this patch, I also noticed that I got a different=20
> CI error from the one from the V1. The reported error looks a little=20
> bit inconsistent.
>=20
> Petri, do you think this can be a false-positive, or am I missing somethi=
ng?
> Maybe re-trigger IGT.CI can help?

Looks like false positives to me and I believe Lakshmi already addressed th=
ose for you.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>

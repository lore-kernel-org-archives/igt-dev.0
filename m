Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707D46E52D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 17:40:36 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Wed, 6 Oct 2021 17:40:29 +0000
Message-ID: <BYAPR11MB37841CF26E465B49DA8FEA9D8AB09@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
 <20211006161444.904476-2-rodrigo.vivi@intel.com>
 <877deqvzre.wl-ashutosh.dixit@intel.com>	<YV3cBQId0QvCLUs5@intel.com>
 <875yuavz3f.wl-ashutosh.dixit@intel.com>
In-Reply-To: <875yuavz3f.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] tests/i915/gem_pxp: Add LOCAL_ UAPI
 defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Apologies for the IRQ, newbie-question:=20

WRT "... Early uapi declarations should be added here exactly as they are=20
expected to appear in the kernel uapi headers ", during the initial series =
reviews=20
(pending merge + propagation), I added those definitions / structures into
I915_drm_local.h with additional comments explaining where they belong
in the main header (example: this definition is a new flag param for struct=
ure 'foo'),
which is unnecessary once u merge the kernel UAPI in where the context is a=
pparent.

I assume such additional-context would be okay? If so, the exclusion during=
 merge would
Be expected to be manual right? (comparing the delta matched)?

...alan

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Wednesday, October 6, 2021 10:32 AM
To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.t=
eres.alexis@intel.com>; Latvala, Petri <petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] tests/i915/gem_pxp: Add LOCAL_ UAP=
I defines

On Wed, 06 Oct 2021 10:25:25 -0700, Rodrigo Vivi wrote:
>
> On Wed, Oct 06, 2021 at 10:17:41AM -0700, Dixit, Ashutosh wrote:
> > On Wed, 06 Oct 2021 09:14:37 -0700, Rodrigo Vivi wrote:
> > >
> > > While the UAPI changes don't propagate to drm-next we should have=20
> > > that as LOCAL_ ones.
> >
> > Please add these in lib/i915/i915_drm_local.h as follows:
>
> Could we move this file to the include directory and document it in=20
> the README.md along with the uapi sync mention?

I think that should be fine. Petri: what do you think, since the directory =
is supposed to contain "imported" kernel headers?

Anyway, let's add the LOCAL's to this file for now as it says below. Thanks=
.

>
> >
> > /*
> >  * It is necessary on occasion to add uapi declarations to IGT=20
> > before they
> >  * appear in imported kernel uapi headers. This header is provided=20
> > for this
> >  * purpose.
> >
> >  * Early uapi declarations should be added here exactly as they are
> >  * expected to appear in the kernel uapi headers, i.e. without the=20
> > LOCAL_
> >  * or local_ prefix and without any #ifndef's. Attempt should be=20
> > made to
> >  * clean these up when kernel uapi headers are sync'd.
> >  */
> >
> > >
> > > That was my mistake during review and merge since I had ignored=20
> > > the rules documented at README.md and considered drm-intel=20
> > > branches would be enough. I'm sorry.
> > >
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

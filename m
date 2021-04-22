Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E512B89F5B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 18:00:26 +0000 (UTC)
Date: Thu, 22 Apr 2021 21:00:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YIG5t62aoLMIagJj@intel.com>
References: <20210420221720.14656-1-ville.syrjala@linux.intel.com>
 <161897657623.19928.11652686076116912215@emeril.freedesktop.org>
 <YIBcroO7VtZB7rfL@intel.com> <YIFJhoTaYfbRVafu@phenom.ffwll.local>
 <YIF5ZT/bM+n+OqJf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIF5ZT/bM+n+OqJf@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/3=5D_lib/kms=3A_Commit_primary?=
 =?utf-8?q?_plane_props_with_COMMIT=5FLEGACY?=
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 04:25:57PM +0300, Ville Syrj=E4l=E4 wrote:
> On Thu, Apr 22, 2021 at 12:01:42PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 21, 2021 at 08:11:10PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Apr 21, 2021 at 03:42:56AM -0000, Patchwork wrote:
> > > > =3D=3D Series Details =3D=3D
> > > > =

> > > > Series: series starting with [i-g-t,v3,1/3] lib/kms: Commit primary=
 plane props with COMMIT_LEGACY
> > > > URL   : https://patchwork.freedesktop.org/series/89278/
> > > > State : success
> > > =

> > > So apparently avoiding those two redundant color encoding/range
> > > setprop ioctls when chaging the fb does avoid the test failure
> > > on glk. How on earth two setprop ioctl can do this is a mystery
> > > The setprops should essentially be nops, and should just result
> > > in reprogramming the plane registers a few times using an
> > > identical state.
> > =

> > Might we need a full modeset for the hw to pick them up perhaps? Or at
> > least plane enable/disable cycle. Doesn't make sense, but hey hw, maybe=
 it
> > only picks these up on initial enable.
> =

> I was pondering about a resurgence of the old "some DSPCNTR bits
> can't be changed while in CxSR" issue. But that sort of thing
> should likely make the pixel format tests fail since they do
> switch these around dynamically. Another issue is that these bits
> aren't supposed to affect RGB scanout at all, and those extra
> setprop ioctls aren't actually changing the state at all.
> =

> > Only other thing I can think of is to maybe double check the state
> > readout to make sure we really program this correctly in both cases.
> =

> Yeah, some kind of mishap in programming is what I was thinking
> initially. So far didn't see any obvious issues in the code. I guess
> I cound stick a bit of readout somewhere to confirm some of the
> bits at least make sense.
> =

> But it might actually be some crc enable/disable race. At least I was
> seeing some oddball crcs yesterday when I started to run the inner
> bits of these tests in a loop. The code even still has that super
> sketchy "let's throw out an extra crc on gen8 because it sometimes
> looks bad" hack. I guess no one ever root caused that. I'll dig
> into it a bit more.

Bah. Seems to be yet another way to trigger the "FBC corrupts
top of the screen" thing, which was supposed to be handled by
a strategic extra vblank wait.

I now whittled it down to this sequence:
        while (1) {
                wait_dsl(1086);
                update_plane(); // skipping the plane update fixes it
                wait_frames(1); // <2 frame wait broken

                wait_dsl(1086);
                fbc_nuke(); // removing this fixes it
                //wait_frames(1); // waiting here fixes it
                fbc_disable(); // removing this fixes it
                wait_frames(1); // >=3D1 frame wait broken

                wait_dsl(1086);
                fbc_enable(); // removing this fixes it
                wait_frames(2); // >=3D2 frame wait broken
        }

So we might need yet another vblank wait somewhere. But
doing that without hurting interactivity might be a bit
painful.

I think I'll start by removing all the redundant manual
nukes from the page flip paths, so at least we shouldn't
hit this unless you're mixing in front buffer rendering
and plane updates.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

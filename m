Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A589DB2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2020 16:49:26 +0000 (UTC)
Date: Tue, 9 Jun 2020 19:49:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200609164922.GT6112@intel.com>
References: <20200605143720.710220-1-michel@daenzer.net>
 <20200609145000.GN6112@intel.com>
 <4d5f6d18-0f17-3dcb-aabe-1f0dc585c894@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d5f6d18-0f17-3dcb-aabe-1f0dc585c894@daenzer.net>
Subject: Re: [igt-dev] [PATCH] kms_cursor_legacy: Keep primary plane enabled
 for XRGB overlay fallback
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
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 06:40:57PM +0200, Michel D=E4nzer wrote:
> On 2020-06-09 4:50 p.m., Ville Syrj=E4l=E4 wrote:
> > On Fri, Jun 05, 2020 at 04:37:20PM +0200, Michel D=E4nzer wrote:
> >> From: Michel D=E4nzer <mdaenzer@redhat.com>
> >>
> >> This allows the test to work on setups where the primary plane cannot
> >> be disabled while the CRTC is enabled.
> >>
> >> It should make no difference for the output.
> >>
> >> Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>
> >> ---
> >>  tests/kms_cursor_legacy.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> >> index 9306e54b..344442e8 100644
> >> --- a/tests/kms_cursor_legacy.c
> >> +++ b/tests/kms_cursor_legacy.c
> >> @@ -326,6 +326,7 @@ static void transition_nonblocking(igt_display_t *=
display, enum pipe pipe_id,
> >>  =

> >>  		igt_assert(ret =3D=3D -EINVAL);
> >>  =

> >> +		igt_plane_set_fb(primary, prim_fb);
> >>  		igt_plane_set_fb(sprite, prim_fb);
> >>  	}
> >>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_NONBLOCK | DRM_MO=
DE_PAGE_FLIP_EVENT, display);
> > =

> > Mixes up the argb vs. xrgb with the primary vs. no primary thing a bit.
> > No idea why the test even wants an argb fb for the sprite tbh. Also not
> > sure there's an actual reason for toggling the primary on/off.
> > =

> > But meh. Patch seems OK to me.
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Thanks!
> =

> Are you going to apply the patch?

Pushed. Thanks for the patch.

> =

> =

> > PS.
> > I am wondering a bit how a driver that can't turn off the primary
> > will fare with some of the ther tests. IIRC quite a few might assume
> > you don't need an fb for the primary when using the atomic uapi...
> =

> Maybe I'm not yet running some tests I should be, but the only kms_*
> tests that seem to fail specifically because of this (with amdgpu DC)
> are the plane-use-after-nonblocking-unbind(-fencing) sub-tests of
> kms_atomic_transition.
> =

> =

> -- =

> Earthling Michel D=E4nzer               |               https://redhat.com
> Libre software enthusiast             |             Mesa and X developer

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

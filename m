Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840D6EAA2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 14:24:50 +0000 (UTC)
Date: Thu, 22 Apr 2021 17:24:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YIGHLlwvjmxsryra@intel.com>
References: <20210416172724.3203107-1-markyacoub@chromium.org>
 <YIET+VN+JnRrbuja@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIET+VN+JnRrbuja@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_atomic_transition: Enable
 Primary Plane on Enabling CRTC.
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 09:13:13AM +0300, Petri Latvala wrote:
> On Fri, Apr 16, 2021 at 01:27:24PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> > =

> > Setup all plane params before committing anything.
> > Do not disable Primary Plane whenever a CRTC is getting enabled.
> > =

> > AMD Driver requires the primary plane to be enabled whenever the CRTC i=
s, otherwise
> > drm_mode_cursor_universal may end up trying to enable the cursor plane =
while all other
> > planes are disabled, which is not supported by the hardware.
> > =

> > =3D=3D=3D Changes from v1 =3D=3D=3D
> > Remove product names from commit message
> > =

> > Cc: Nicholas.Kazlauskas@amd.com
> > ---
> >  tests/kms_atomic_transition.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> =

> =

> I've asked Intel display folks to chime in whether i915 needs any of
> this flow needs to be unchanged with is_i915_device(), no response
> yet.

Dunno if anyone but Maarten knows what the test does exactly.

In general I'd prefer there was some generic way to handle the
"primary plane can't be disabled" thing so that we wouldn't need
special logic/always forcing the primary plane on in all tests.
But I'm not sure if we could easily add some kind TEST_ONLY probe
into igt_display_require()+make igt_kms just automagically enable
the plane when needed for this...

I'm slightly tempted to even suggest that maybe the kernel driver
should just handle this by always keeping the plane on but force
it to scan out black when it's logically disabled...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

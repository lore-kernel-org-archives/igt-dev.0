Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1556E825
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Nov 2021 10:09:32 +0000 (UTC)
Date: Thu, 25 Nov 2021 12:09:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YZ9g1Zvk++/p9hnv@intel.com>
References: <20211124151245.29369-1-ville.syrjala@linux.intel.com>
 <YZ5ZUsvgAEh3U7sf@platvala-desk.ger.corp.intel.com>
 <YZ9cTqJi/trhRal7@intel.com>
 <YZ9egohEQkiod7dW@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YZ9egohEQkiod7dW@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Accept
 missing FBC debugfs files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 11:59:30AM +0200, Petri Latvala wrote:
> On Thu, Nov 25, 2021 at 11:50:06AM +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Nov 24, 2021 at 05:25:06PM +0200, Petri Latvala wrote:
> > > On Wed, Nov 24, 2021 at 05:12:45PM +0200, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > >=20
> > > > With multiple FBC instances becoming a thing at some point
> > > > the current plan is to go with separate debugfs files for
> > > > each FBC instance. Which also means that if there is no
> > > > FBC there will be no debugfs files either. Adapt the test
> > > > to tolerate such conditions.
> > > >=20
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  tests/i915/kms_frontbuffer_tracking.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms=
_frontbuffer_tracking.c
> > > > index d6a884926c48..532bfbb9b481 100644
> > > > --- a/tests/i915/kms_frontbuffer_tracking.c
> > > > +++ b/tests/i915/kms_frontbuffer_tracking.c
> > > > @@ -724,7 +724,7 @@ static void __debugfs_read(const char *param, c=
har *buf, int len)
> > > >  {
> > > >  	len =3D igt_debugfs_simple_read(drm.debugfs, param, buf, len);
> > > >  	if (len < 0)
> > > > -		igt_assert_eq(len, -ENODEV);
> > > > +		igt_assert(len =3D=3D -ENOENT || len =3D=3D -ENODEV);
> > >=20
> > > If this fires, we now lose the information on what the error
> > > was. Although we automatically print errno in that case, is the error
> > > in there?
> >=20
> > Not quite sure what you're asking here. But at least igt_assert() will
> > still print the errno here, if that's what you're asking.
>=20
> igt_assert_eq prints the value of "len" if it's not -ENODEV,
> igt_assert doesn't. What I'm asking is whether igt_debugfs_simple_read
> leaves the error it returns in errno. I could check but ECOFFEE.

Yes, errno seems to be preserved.

Quick check of the code agrees. Well, except for the case of close()
failing after read() failed, which would clobber the errno from read().
But close() failing would be pretty nuts.

--=20
Ville Syrj=E4l=E4
Intel

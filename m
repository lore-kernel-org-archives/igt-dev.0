Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765B710E12A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 09:19:53 +0000 (UTC)
Date: Thu, 13 Apr 2023 11:19:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20230413111948.5d1ce91a@maurocar-mobl2>
In-Reply-To: <ZDa9uJMUqlS+sBFa@intel.com>
References: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
 <20230412092629.7364fadf@maurocar-mobl2>
 <ZDZe03xeOHW1VdcA@intel.com>
 <20230412145426.0c78ae49@maurocar-mobl2>
 <ZDa9uJMUqlS+sBFa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Disable testplan build by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 12 Apr 2023 17:18:32 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Apr 12, 2023 at 02:54:26PM +0200, Mauro Carvalho Chehab wrote:
> > On Wed, 12 Apr 2023 10:33:39 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Wed, Apr 12, 2023 at 09:26:29AM +0200, Mauro Carvalho Chehab wrote=
: =20
> > > > On Tue, 11 Apr 2023 14:02:05 +0300
> > > > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > > >  =20
> > > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> =20
> > > >  =20
> > > > > No real idea what this "testplan" is and why it lives
> > > > > in igt. Seems to be build some xe documentation, and based
> > > > > on the name is maybe some manager level stuff? Surely
> > > > > this is nothing that matters for normal people (esp. those
> > > > > outside Intel). =20
> > > >=20
> > > > No. Basically, testplan contains documentation for the tests.
> > > > Currently, it contains 100% of the documentation from Xe tests.
> > > > We may end implementing it for i915 as well.
> > > >=20
> > > > There is even a plan to generate testlists like xe-fast-feedback.te=
stlist
> > > > directly from documentation. So, it is important to have the tests =
properly
> > > > documented, as otherwise they won't be executed by CI in the future.
> > > >  =20
> > > > >=20
> > > > > The main problem here being that it is hideously slow to
> > > > > build, making life miserable for everyone. Flip the
> > > > > default to disabled and let those that need this enable
> > > > > it themselves. =20
> > > >=20
> > > > Generating documents takes ~150ms. What makes it slow is not the doc
> > > > generation itself, but a validation logic that checks if the test=20
> > > > documentation was updated as tests got added/renamed/removed.=20
> > > > It currently uses igt_runner, pointing to the documented tests.=20
> > > > As right now just Xe tests uses it, it will call the runner with:
> > > >=20
> > > > 	$ igt_runner -L -t igt@xe ${builddir}/tests =20
> > >=20
> > > That is not the slow thing. The slow thing is some python stuff. =20
> >=20
> > This was part of the slow logic. The other part is to run regular
> > expressions to check test names. This also needed some optimization.=20
> >=20
> > Just sent a patch series using re.compile() to speed regexes, with
> > a replacement patch for igt_runner.
> >=20
> > It could be possible to optimize it even further with multithreading
> > but as it is now taking 500ms to run (against 12 seconds before that on
> > a i7 notebook using python 3.11), it seems good enough to me after the
> > changes.
> >=20
> > Patch series sent: https://patchwork.freedesktop.org/series/116379/ =20
>=20
> That is definitely much improved. Thanks.
>=20
> Still feels a bit too slow to keep enabled
> during normal developement work though.
>=20
> $ time git rebase -x 'ninja -Cbuild' HEAD~10
>=20
> -Dtestplan=3Ddisabled
> real    0m9,699s
> user    0m26,422s
> sys     0m2,518s
>=20
> -Dtestplan=3Dauto
> real    0m46,020s
> user    1m5,102s
> sys     0m4,191s
>=20
> At least for me that that would still exceed
> my attention span.
>=20
> But seems fast enough for a one off test build=20
> before sending out patches/pushing.

I guess we can set sphinx to disable by default. Still, the time to build
from scratch is ~1.30 mins here:

	$ rm -rf build && meson setup build
	$ time ninja -C build
	ninja: Entering directory `build'
	[1330/1330] Generating docs/testplan/xe_tests.html with a custom command
=09
	real	1m33.598s
	user	9m5.730s
	sys	1m10.462s

Re-running it with Sphinx disabled after a single file change is fast:

	$ touch tests/xe/xe_compute.c=20
	$ time ninja -C build
	ninja: Entering directory `build'
	[5/5] Generating docs/testplan/xe_tests.html with a custom command
=09
	real	0m1.746s
	user	0m1.574s
	sys	0m0.171s

Re-running it with Sphinx enabled (and with rst2pdf installed) after a sing=
le
file change takes 9 extra seconds here:

	$ touch tests/xe/xe_compute.c=20
	$ time ninja -C build
	...
	[9/9] Generating docs/testplan/xe_tests.pdf with a custom command


	real	0m10.545s
	user	0m13.778s
	sys	0m0.724s

So, I'll add this patch at the end of the series:

diff --git a/meson_options.txt b/meson_options.txt
index d4e373d6cfc4..2cb44f20169b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -26,6 +26,7 @@ option('testplan',
=20
 option('sphinx',
        type : 'feature',
+       value : 'disabled',
        description : 'Build testplan documentation using Sphinx')
=20
 option('docs',

Please reply with your R-B and/or A-B for me to apply it at the
revision 3 (I'm about to send it).

Regards,
Mauro

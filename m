Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F074610E301
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 11:51:36 +0000 (UTC)
Date: Tue, 29 Aug 2023 13:51:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20230829135132.6355bf8f@maurocar-mobl2>
In-Reply-To: <d8019c58-6de5-77af-967e-bb5494e9e9cb@intel.com>
References: <20230817093504.75749-1-mauro.chehab@linux.intel.com>
 <d8019c58-6de5-77af-967e-bb5494e9e9cb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] docs/reference: add links to
 testplan-based documentation
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

On Thu, 17 Aug 2023 23:08:24 +0530
"Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:

> Hi Mauro,
>=20
> On Thu-17-08-2023 03:05 pm, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >=20
> > Instead of relying on runtime-based docs, use the documentation
> > parsed via testplan for i915, Xe and KMS tests.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >   .../igt-gpu-tools/igt_test_programs.xml       | 63 ++++++++-----------
> >   docs/reference/igt-gpu-tools/meson.build      |  4 --
> >   2 files changed, 27 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/docs/reference/igt-gpu-tools/igt_test_programs.xml b/docs/=
reference/igt-gpu-tools/igt_test_programs.xml
> > index 92bc33ba83f6..51f8cac05f98 100644
> > --- a/docs/reference/igt-gpu-tools/igt_test_programs.xml
> > +++ b/docs/reference/igt-gpu-tools/igt_test_programs.xml
> > @@ -147,42 +147,6 @@
> >       <xi:include href=3D"igt_test_programs_gem_description.xml"/>
> >     </refentry>
> >  =20
> > -  <refentry id=3D"igt-gen3-tests">
> > -    <refnamediv>
> > -      <refname>Gen 3 Tests</refname>
> > -      <refpurpose>Tests specific to gen 3</refpurpose>
> > -    </refnamediv>
> > -    <xi:include href=3D"igt_test_programs_gen3_programs.xml"/>
> > -    <xi:include href=3D"igt_test_programs_gen3_description.xml"/>
> > -  </refentry>
> > -
> > -  <refentry id=3D"igt-gen7-tests">
> > -    <refnamediv>
> > -      <refname>Gen 7 Tests</refname>
> > -      <refpurpose>Tests specific to gen 7</refpurpose>
> > -    </refnamediv>
> > -    <xi:include href=3D"igt_test_programs_gen7_programs.xml"/>
> > -    <xi:include href=3D"igt_test_programs_gen7_description.xml"/>
> > -  </refentry>
> > -
> > -  <refentry id=3D"igt-i915-tests">
> > -    <refnamediv>
> > -      <refname>i915 Tests</refname>
> > -      <refpurpose>Tests for overall i915 driver behaviour</refpurpose>
> > -    </refnamediv>
> > -    <xi:include href=3D"igt_test_programs_i915_programs.xml"/>
> > -    <xi:include href=3D"igt_test_programs_i915_description.xml"/>
> > -  </refentry>
> > -
> > -  <refentry id=3D"igt-kms-tests">
> > -    <refnamediv>
> > -      <refname>KMS Tests</refname>
> > -      <refpurpose>Tests for kernel mode setting</refpurpose>
> > -    </refnamediv>
> > -    <xi:include href=3D"igt_test_programs_kms_programs.xml"/>
> > -    <xi:include href=3D"igt_test_programs_kms_description.xml"/>
> > -  </refentry>
> > -
> >     <refentry id=3D"igt-meta-tests">
> >       <refnamediv>
> >         <refname>Meta Tests</refname>
> > @@ -255,6 +219,33 @@
> >       <xi:include href=3D"igt_test_programs_vgem_description.xml"/>
> >     </refentry>
> >  =20
> > +  <refentry id=3D"igt-xe-tests">
> > +    <refnamediv>
> > +      <refname>
> > +          <ulink url=3D"../testplan/xe_tests.html" type=3D"http">Xe Te=
sts</ulink> =20
>=20
> As the testplan is not inside the reference dir, the URL must be:=20
> "../../../testplan/xe_tests.html"

The reference URL assumes the location where the docs will be installed.
So, if we have them installed under a "install_dir":


  $ meson --prefix `pwd`/install_dir build -Dxe_driver=3Denabled --reconfig=
ure

We have:

	$ tree -d install_dir/share/gtk-doc/
	install_dir/share/gtk-doc/
	=E2=94=94=E2=94=80=E2=94=80 html
	    =E2=94=9C=E2=94=80=E2=94=80 igt-gpu-tools
	    =E2=94=94=E2=94=80=E2=94=80 testplan

So, "../testplan" is the path to go from "html/igt-gpu-tools" to the
location where xe_tests.html is located.

> Also, is there anyway to put these urls in index.html, instead of=20
> opening igt-xe-tests.html and from there open the actual xe_tests.html?

With the current way this is generated, I'm not sure. I found it
hard to find a proper documentation about gtk-doc fields. Currently,
IGT relies on it to generate the index.html file.

Also meson integration (or gtk-doc) removes all files from the target
directory when building docs (html/igt-gpu-tools).=20

One possible alternative would be to have a master index.html file
under install_dir/share/gtk-doc/html (or under some other place). I
avoided doing that (or some other doc reorg) as this could break any
scripts copying the documentation to some place.

> > +      </refname>
> > +      <refpurpose>Tests for the Intel Xe driver</refpurpose>
> > +    </refnamediv>
> > +  </refentry>
> > +
> > +  <refentry id=3D"igt-i915-tests">
> > +    <refnamediv>
> > +      <refname>
> > +        <ulink url=3D"../testplan/i915_tests.html" type=3D"http">i915 =
Tests</ulink>
> > +      </refname>
> > +      <refpurpose>Tests for the Intel i915 driver</refpurpose>
> > +    </refnamediv>
> > +  </refentry>
> > +
> > +  <refentry id=3D"igt-kms-tests">
> > +    <refnamediv>
> > +      <refname>
> > +        <ulink url=3D"../testplan/kms_tests.html" type=3D"http">KMS Te=
sts</ulink>
> > +      </refname>
> > +      <refpurpose>Tests for kernel mode setting</refpurpose>
> > +    </refnamediv>
> > +  </refentry>
> > +
> >     <glossary>
> >       <title>Glossary</title>
> >  =20
> > diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/=
igt-gpu-tools/meson.build
> > index 6b832ad279cf..9bb5ca7e0798 100644
> > --- a/docs/reference/igt-gpu-tools/meson.build
> > +++ b/docs/reference/igt-gpu-tools/meson.build
> > @@ -29,10 +29,6 @@ test_groups =3D [
> >   	'debugfs',
> >   	'drm',
> >   	'gem',
> > -	'gen3',
> > -	'gen7',
> > -	'i915',
> > -	'kms', =20
>=20
> Also, we must drop testdisplay, since it is already covered by kms tests.

OK, I'll remove it too.

Btw, there are other places generating broken links, so I suspect
that several of those "test_groups" aren't needed anymore.=20

>=20
> - Bhanu
>=20
> >   	'meta',
> >   	'perf',
> >   	'pm', =20

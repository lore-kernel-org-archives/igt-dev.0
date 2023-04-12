Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A52510E823
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 14:18:36 +0000 (UTC)
Date: Wed, 12 Apr 2023 17:18:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <ZDa9uJMUqlS+sBFa@intel.com>
References: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
 <20230412092629.7364fadf@maurocar-mobl2>
 <ZDZe03xeOHW1VdcA@intel.com>
 <20230412145426.0c78ae49@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230412145426.0c78ae49@maurocar-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Disable testplan build by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 02:54:26PM +0200, Mauro Carvalho Chehab wrote:
> On Wed, 12 Apr 2023 10:33:39 +0300
> Ville Syrj=EF=BF=BDl=EF=BF=BD <ville.syrjala@linux.intel.com> wrote:
>=20
> > On Wed, Apr 12, 2023 at 09:26:29AM +0200, Mauro Carvalho Chehab wrote:
> > > On Tue, 11 Apr 2023 14:02:05 +0300
> > > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > >=20
> > > > From: Ville Syrj=EF=BF=BDl=EF=BF=BD <ville.syrjala@linux.intel.com>
> > >=20
> > > > No real idea what this "testplan" is and why it lives
> > > > in igt. Seems to be build some xe documentation, and based
> > > > on the name is maybe some manager level stuff? Surely
> > > > this is nothing that matters for normal people (esp. those
> > > > outside Intel).
> > >=20
> > > No. Basically, testplan contains documentation for the tests.
> > > Currently, it contains 100% of the documentation from Xe tests.
> > > We may end implementing it for i915 as well.
> > >=20
> > > There is even a plan to generate testlists like xe-fast-feedback.test=
list
> > > directly from documentation. So, it is important to have the tests pr=
operly
> > > documented, as otherwise they won't be executed by CI in the future.
> > >=20
> > > >=20
> > > > The main problem here being that it is hideously slow to
> > > > build, making life miserable for everyone. Flip the
> > > > default to disabled and let those that need this enable
> > > > it themselves.
> > >=20
> > > Generating documents takes ~150ms. What makes it slow is not the doc
> > > generation itself, but a validation logic that checks if the test=20
> > > documentation was updated as tests got added/renamed/removed.=20
> > > It currently uses igt_runner, pointing to the documented tests.=20
> > > As right now just Xe tests uses it, it will call the runner with:
> > >=20
> > > 	$ igt_runner -L -t igt@xe ${builddir}/tests
> >=20
> > That is not the slow thing. The slow thing is some python stuff.
>=20
> This was part of the slow logic. The other part is to run regular
> expressions to check test names. This also needed some optimization.=20
>=20
> Just sent a patch series using re.compile() to speed regexes, with
> a replacement patch for igt_runner.
>=20
> It could be possible to optimize it even further with multithreading
> but as it is now taking 500ms to run (against 12 seconds before that on
> a i7 notebook using python 3.11), it seems good enough to me after the
> changes.
>=20
> Patch series sent: https://patchwork.freedesktop.org/series/116379/

That is definitely much improved. Thanks.

Still feels a bit too slow to keep enabled
during normal developement work though.

$ time git rebase -x 'ninja -Cbuild' HEAD~10

-Dtestplan=3Ddisabled
real    0m9,699s
user    0m26,422s
sys     0m2,518s

-Dtestplan=3Dauto
real    0m46,020s
user    1m5,102s
sys     0m4,191s

At least for me that that would still exceed
my attention span.

But seems fast enough for a one off test build=20
before sending out patches/pushing.

--=20
Ville Syrj=EF=BF=BDl=EF=BF=BD
Intel


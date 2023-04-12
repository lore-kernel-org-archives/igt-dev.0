Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A110E090
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:54:30 +0000 (UTC)
Date: Wed, 12 Apr 2023 14:54:26 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20230412145426.0c78ae49@maurocar-mobl2>
In-Reply-To: <ZDZe03xeOHW1VdcA@intel.com>
References: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
 <20230412092629.7364fadf@maurocar-mobl2>
 <ZDZe03xeOHW1VdcA@intel.com>
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

On Wed, 12 Apr 2023 10:33:39 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Apr 12, 2023 at 09:26:29AM +0200, Mauro Carvalho Chehab wrote:
> > On Tue, 11 Apr 2023 14:02:05 +0300
> > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >=20
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >=20
> > > No real idea what this "testplan" is and why it lives
> > > in igt. Seems to be build some xe documentation, and based
> > > on the name is maybe some manager level stuff? Surely
> > > this is nothing that matters for normal people (esp. those
> > > outside Intel).
> >=20
> > No. Basically, testplan contains documentation for the tests.
> > Currently, it contains 100% of the documentation from Xe tests.
> > We may end implementing it for i915 as well.
> >=20
> > There is even a plan to generate testlists like xe-fast-feedback.testli=
st
> > directly from documentation. So, it is important to have the tests prop=
erly
> > documented, as otherwise they won't be executed by CI in the future.
> >=20
> > >=20
> > > The main problem here being that it is hideously slow to
> > > build, making life miserable for everyone. Flip the
> > > default to disabled and let those that need this enable
> > > it themselves.
> >=20
> > Generating documents takes ~150ms. What makes it slow is not the doc
> > generation itself, but a validation logic that checks if the test=20
> > documentation was updated as tests got added/renamed/removed.=20
> > It currently uses igt_runner, pointing to the documented tests.=20
> > As right now just Xe tests uses it, it will call the runner with:
> >=20
> > 	$ igt_runner -L -t igt@xe ${builddir}/tests
>=20
> That is not the slow thing. The slow thing is some python stuff.

This was part of the slow logic. The other part is to run regular
expressions to check test names. This also needed some optimization.=20

Just sent a patch series using re.compile() to speed regexes, with
a replacement patch for igt_runner.

It could be possible to optimize it even further with multithreading
but as it is now taking 500ms to run (against 12 seconds before that on
a i7 notebook using python 3.11), it seems good enough to me after the
changes.

Patch series sent: https://patchwork.freedesktop.org/series/116379/

Regards,
Mauro

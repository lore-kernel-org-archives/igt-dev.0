Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6C6E920
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 09:05:05 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:05:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200415090502.GQ9497@platvala-desk.ger.corp.intel.com>
References: <20200414101109.28762-1-karthik.b.s@intel.com>
 <355261bf8e37b81c6fb3d60f7c2cda19a81eb9f6.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <355261bf8e37b81c6fb3d60f7c2cda19a81eb9f6.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_async: Add test to
 validate asynchronous flips
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
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 03:35:37PM -0700, Paulo Zanoni wrote:
> Em ter, 2020-04-14 =E0s 15:41 +0530, Karthik B S escreveu:
> > Asynchronous flips are issued using the page flip IOCTL.
> > The test consists of two subtests. The first subtest waits for
> > the page flip event to be received before giving the next flip,
> > and the second subtest doesn't wait for page flip events.
> > =

> > The test passes if the IOCTL is successful.
> > =

> > v2: Add authors in the test file. (Paulo)
> >     Reduce the run time and timeouts to suit IGT needs. (Paulo)
> >     Replace igt_debug's with igt_assert's to catch slow flips. (Paulo)
> >     Follow IGT coding style regarding spaces. (Paulo)
> >     Make set up code part of igt_fixture. (Paulo)
> >     Skip the test if async flips are not supported. (Paulo)
> >     Replace suggested-by. (Paulo)
> >     Added description for test and subtests.
> > =

> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > ---
> >  tests/Makefile.sources |   1 +
> >  tests/kms_async.c      | 243 +++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build      |   1 +
> >  3 files changed, 245 insertions(+)
> >  create mode 100644 tests/kms_async.c
> > =

> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index 4e44c98c..eedf4fcb 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -29,6 +29,7 @@ TESTS_progs =3D \
> >  	fbdev \
> >  	kms_3d \
> >  	kms_addfb_basic \
> > +	kms_async \
> >  	kms_atomic \
> >  	kms_atomic_interruptible \
> >  	kms_atomic_transition \
> > diff --git a/tests/kms_async.c b/tests/kms_async.c
> > new file mode 100644
> > index 00000000..6031ff4e
> > --- /dev/null
> > +++ b/tests/kms_async.c
> =

> Async what? :)
> =

> kms_async_flips.c is probably better IMHO since it's clearer on what
> the test tests.
> =

> Also, do we have to add this to some IGT test list file if we want this
> in CI? Can the IGT/CI people comment here please?

No. The full round executes everything except the tests matching
tests/intel-ci/blacklist.txt.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

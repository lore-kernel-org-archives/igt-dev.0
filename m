Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2010E307
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 08:21:50 +0000 (UTC)
Date: Tue, 6 Jun 2023 10:21:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230606102144.1b392ba5@maurocar-mobl2>
In-Reply-To: <2633155.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-7-dominik.karol.piatkowski@intel.com>
 <2633155.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] lib/igt_kmod: place KUnit tests on
 a subtest
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

On Tue, 06 Jun 2023 09:44:00 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Hi Mauro, Dominik,
>=20
> On Monday, 5 June 2023 12:47:14 CEST Dominik Karol Piatkowski wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >=20
> > There's a hidden bug at KUnit implementation: as it doesn't
> > place tests inside a subtest, trying to use it with igt_main
> > causes a crash:
> >=20
> > 	$ ./build/tests/drm_mm --list
> > 	skipping is allowed only in fixtures, subtests or igt_simple_main
> > 	please refer to lib/igt_core documentation
> > 	drm_mm: ../lib/igt_core.c:437: internal_assert: Assertion `0' failed.
> > 	Received signal SIGABRT.
> > 	Stack trace:
> > 	 #0 [fatal_sig_handler+0x17b]
> > 	 #1 [__sigaction+0x50]
> > 	 #2 [__pthread_kill_implementation+0x114]
> > 	 #3 [gsignal+0x1e]
> > 	 #4 [abort+0xdf]
> > 	 #5 [__assert_fail_base.cold+0xe]
> > 	 #6 [__assert_fail+0x47]
> > 	 #7 [internal_assert+0xe5]
> > 	 #8 [igt_skip+0x169]
> > 	 #9 [__igt_skip_check+0x1bb]
> > 	 #10 [igt_ktest_begin+0xa6]
> > 	 #11 [igt_kunit+0x70]
> > 	 #12 [main+0x2a]
> > 	 #13 [__libc_start_call_main+0x7a]
> > 	 #14 [__libc_start_main+0x8b]
> > 	 #15 [_start+0x25]
> >=20
> > Fix it by using igt_subtests() before actually implememnting
> > KUnit logic.
> >=20
> > After the patch, it should now report subtests:
> >=20
> > 	$ ./build/tests/drm_mm --list
> > 	all-tests
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@=
intel.com>
> > ---
> >  lib/igt_kmod.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 8cb9cb2e..1309ab21 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -754,7 +754,7 @@ void igt_kselftest_get_tests(struct kmod_module *km=
od,
> >   *
> >   * Returns: IGT default codes
> >   */
> > -int igt_kunit(const char *module_name, const char *opts)
> > +static int __igt_kunit(const char *module_name, const char *opts)
> >  {
> >  	struct igt_ktest tst;
> >  	struct kmod_module *kunit_kmod;
> > @@ -852,6 +852,20 @@ unload:
> >  	return ret;
> >  }
> > =20
> > +int igt_kunit(const char *module_name, const char *opts)
> > +{
> > +	/*
> > +	 * We need to use igt_subtest here, as otherwise it may crash with:
> > +	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> > +	 * if used on igt_main. This is also needed in order to provide
> > +	 * proper namespace for dynamic subtests, with is required for CI
> > +	 * and for documentation.
> > +	 */
> > +	igt_subtest_with_dynamic("all-tests") =20
>=20
> Why can't we use module_name as subtest name?

We can, but this preserves the old behavior. So, the existing documentation
won't break.

Patch 7/8 allows adjusting the name, as it makes sense that each kUnit
group to be on a different igt dynamic subtest.

Regards,
Mauro

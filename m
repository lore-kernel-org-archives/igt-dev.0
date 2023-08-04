Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Rae Moar <rmoar@google.com>
Date: Fri, 04 Aug 2023 11:33:25 +0200
Message-ID: <1827168.QCnGb9OGeP@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <CA+GJov5G_JWJM3Rw14O-CTioEoB_aTf4SyM-G+tCKEP_txc8yw@mail.gmail.com>
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
 <CA+GJov5G_JWJM3Rw14O-CTioEoB_aTf4SyM-G+tCKEP_txc8yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH v3 1/3] kunit: Report the count of test suites
 in a module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
 igt-dev@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rae,

On Thursday, 3 August 2023 22:57:43 CEST Rae Moar wrote:
> On Mon, Jul 31, 2023 at 10:12=E2=80=AFAM Janusz Krzysztofik
> <janusz.krzysztofik@linux.intel.com> wrote:
> >
> > According to KTAP specification[1], results should always start from a
> > header that provides a TAP protocol version, followed by a test plan wi=
th
> > a count of items to be executed.  That pattern should be followed at ea=
ch
> > nesting level.  In the current implementation of the top-most, i.e., te=
st
> > suite level, those rules apply only for test suites built into the kern=
el,
> > executed and reported on boot.  Results submitted to dmesg from kunit t=
est
> > modules loaded later are missing those top-level headers.
> >
> > As a consequence, if a kunit test module provides more than one test su=
ite
> > then, without the top level test plan, external tools that are parsing
> > dmesg for kunit test output are not able to tell how many test suites
> > should be expected and whether to continue parsing after complete output
> > from the first test suite is collected.
> >
> > Submit the top-level headers also from the kunit test module notifier
> > initialization callback.
> >
> > [1] https://docs.kernel.org/dev-tools/ktap.html#
> >
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
>=20
> Hi!
>=20
> I think this is a really great idea to improve the KTAP compatibility
> for module output. I do agree with Mauro and I wonder if this could be
> replaced with using kunit_exec_run_tests. However, if the output of
> 1..0 for a module with no KUnit tests run is not wanted,=20

I do believe we really don't want that.  As soon as kunit framework registe=
rs=20
its notifier callbacks, those callbacks are executed by generic module=20
handling code on load / unload of every module, not only those providing ku=
nit=20
tests.  If our module initialization callback called unmodified=20
kunit_exec_run_tests() that deliberately prints these two lines=20
unconditionally:

	KTAP version 1
	1..n

then there would be a lot of unnecessary noise.

To avoid that noise, I decided to teach the callback itself to display the=
=20
header with the number of test suits provided by the module before processi=
ng=20
them if there is at least one, and be silent otherwise.  But since both you=
=20
and Mauro think that kunit_exec_run_tests() should be reused, I can do that=
 by=20
moving that logic to kunit_exec_run_tests() and passing an additional flag=
=20
that controls that logic from kunit_module_init() to kunit_exec_run_tests()=
=2E =20
Would that approach be more acceptable?

> I am ok with
> this change as is.
>=20
> LGTM.
>=20
> Tested-by: Rae Moar <rmoar@google.com>

Thank you for testing.

Janusz

>=20
> -Rae
>=20
> >  lib/kunit/test.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 84e4666555c94..a29ca1acc4d81 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
> >  #ifdef CONFIG_MODULES
> >  static void kunit_module_init(struct module *mod)
> >  {
> > +       if (mod->num_kunit_suites > 0) {
> > +               pr_info("KTAP version 1\n");
> > +               pr_info("1..%d\n", mod->num_kunit_suites);
> > +       }
> > +
> >         __kunit_test_suites_init(mod->kunit_suites, mod-
>num_kunit_suites);
> >  }
> >
> > --
> > 2.41.0
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps=20
"KUnit Development" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an=20
email to kunit-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/
msgid/kunit-dev/20230731141021.2854827-6-janusz.krzysztofik%40linux.intel.c=
om.
>=20




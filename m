Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEF710E3BA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 13:43:16 +0000 (UTC)
Date: Tue, 11 Oct 2022 15:43:10 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221011154310.3866a686@maurocar-mobl2>
In-Reply-To: <Y0VI4FbcwCCWgHtE@platvala-desk.ger.corp.intel.com>
References: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
 <Y0Umf+g+oHJ0nXCk@platvala-desk.ger.corp.intel.com>
 <20221011113111.6eb2e396@maurocar-mobl2>
 <Y0VI4FbcwCCWgHtE@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [RFC i-g-t v2 0/3] Add multi-process subtests for
 multi-GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Anna Karas <anna.karas@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 11 Oct 2022 13:46:32 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> On Tue, Oct 11, 2022 at 11:31:11AM +0200, Mauro Carvalho Chehab wrote:
> > On Tue, 11 Oct 2022 11:17:03 +0300
> > Petri Latvala <petri.latvala@intel.com> wrote:
> >=20
> > > On Fri, Oct 07, 2022 at 08:48:58PM +0200, Kamil Konieczny wrote:
> > > > Add one simple macro igt_fork_dyn() and two new helpers in
> > > > igt_core to enable running dynamic tests on two or more GPUs in
> > > > parallel.
> > > > To test this idea I modified two subtests gem_basic@create-close
> > > > and gem_exec_gttfill@basic.
> > > > It is open-coded for ease of debug but can be converted
> > > > into macro if this idea will get acceptance.
> > > >=20
> > > > Todo: add some log extension to igt_core from Mauro:
> > > >   https://patchwork.freedesktop.org/series/109171/
> > > >   "add sysfs node at subtest results when available"
> > > >=20
> > > > See some logs below.
> > > >=20
> > > > Cc: Anna Karas <anna.karas@intel.com>
> > > > Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > >=20
> > > > This is log from gem_exec_gttfill run on one GPU machine:
> > > >=20
> > > > IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 6.0.0-rc5-CI_DRM_12145-g2=
dc9ea03abff x86_64)
> > > > Starting subtest: basic
> > > > Starting dynamic subtest: basic-gpu-0
> > > > Starting dynamic subtest: basic-gpu-1
> > > > Test requirement not met in function start_helpers, file ../tests/i=
915/gem_exec_gttfill.c:229:
> > > > Test requirement: i915 > 0
> > > > Last errno: 2, No such file or directory
> > > > Dynamic subtest basic-gpu-1: SKIP (0.025s)
> > > > Setup 1025 batches in 1051.24ms
> > > > engine[2]: 2 cycles
> > > > engine[1]: 1 cycles
> > > > engine[0]: 3 cycles
> > > > engine[3]: 2 cycles
> > > > engine[4]: 2 cycles
> > > > Total: 10 cycles
> > > > Dynamic subtest basic-gpu-0: SUCCESS (2.960s)
> > > > Subtest basic: SUCCESS (2.967s)
> > > >=20
> > > > Result from machine with two discrete GPUs:
> > > >=20
> > > > Starting subtest: basic
> > > > Starting dynamic subtest: basic-gpu-0
> > > > Starting dynamic subtest: basic-gpu-1
> > > > Setup 1025 batches in 3518.56ms
> > > > Setup 1025 batches in 3494.03ms
> > > > ...
> > > > Dynamic subtest basic-gpu-0: SUCCESS (35.349s)
> > > > Dynamic subtest basic-gpu-1: SUCCESS (35.374s)
> > > > Subtest basic: SUCCESS (35.401s) =20
> > >=20
> > > Having child processes report results breaks a surprising amount of
> > > things. Only the main process should enter/exit subtests or dynamic
> > > subtests.
> >=20
> > Ok, but still it makes sense to have per-subtest results somehow.
> > Perhaps we'll need a new igt macro to report multiGPU child test=20
> > results.
> >=20
> > > There isn't much value here having the separate gpus in separate
> > > dynamic subtests. Conceptually dynamic subtests are entry points that
> > > are not enumerable at compile-time, and this change conceptually
> > > always wants to run all of them really.
> >=20
> > The usage of one or multiple GPUs is a runtime decision, based on IGT_D=
EVICE=20
> > handling logic. That should not decided at compile-time.
>=20
>=20
> The point was them being entry points. There's never a need to do
> --dynamic-subtest basic-gpu-0, when you execute these, you want all of
> them.

Yes.

> > > Instead this should just have everything in the subtest and manually
> > > print which gpu is doing what.
> >=20
> > This exercise actually rises an interesting point: on a multi-GPU run,
> > what should be the "global" test result when the same test has different
> > results depending on the GPU?
>=20
> Depends on the test.

For some tests, yes, but I guess for most of the stuff what we want is to
ensure that multiple GPUs will be exercised at the same time, in order
to identify potential contentions and lack of serialization when using
multiple GPUs. For those, if an specific subtest is skipped from a
subtest list, it should be OK to return success if the non-skipped
GPUs return success.

> The thumb rule is:
>=20
> FAIL - Kernel has a bug.
> SKIP - Cannot test, the HW configuration is not what we need.
>=20
> For example,
>=20
> 1) There's only one GPU.
>=20
> SKIP.
>=20
> 2) The test wants multiple identical GPUs. There's multiple GPUs but they=
're different.
>=20
> SKIP.
>=20
> 3) The test wants different GPUs. There's multiple GPUs but they're ident=
ical.
>=20
> SKIP.
>=20
> Such conditions should be of course done before launching stuff.

Yeah, things like the above are clear and should be done before the
actual test.

Yet, there are some cases where some subtests are conditionally
skipped, like the ones which use igt_skip_on*(), depending if the
GPU supports or not some specific subtest.

On such cases, we'll have some subtests returning SKIP on some GPUs
of the GPU set, and (hopefully) returning SUCCESS for the others.

IMO, it makes sense to have a "default" propagation rule for such
cases (while allowing the default to be redefined if needed).

> For failures, any failures on one gpu should make the "global" result
> a fail too.

Yes, agreed.

Regards,
Mauro

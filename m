Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ABF10E4E9
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 09:31:17 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:31:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221011113111.6eb2e396@maurocar-mobl2>
In-Reply-To: <Y0Umf+g+oHJ0nXCk@platvala-desk.ger.corp.intel.com>
References: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
 <Y0Umf+g+oHJ0nXCk@platvala-desk.ger.corp.intel.com>
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

On Tue, 11 Oct 2022 11:17:03 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> On Fri, Oct 07, 2022 at 08:48:58PM +0200, Kamil Konieczny wrote:
> > Add one simple macro igt_fork_dyn() and two new helpers in
> > igt_core to enable running dynamic tests on two or more GPUs in
> > parallel.
> > To test this idea I modified two subtests gem_basic@create-close
> > and gem_exec_gttfill@basic.
> > It is open-coded for ease of debug but can be converted
> > into macro if this idea will get acceptance.
> >=20
> > Todo: add some log extension to igt_core from Mauro:
> >   https://patchwork.freedesktop.org/series/109171/
> >   "add sysfs node at subtest results when available"
> >=20
> > See some logs below.
> >=20
> > Cc: Anna Karas <anna.karas@intel.com>
> > Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> >=20
> > This is log from gem_exec_gttfill run on one GPU machine:
> >=20
> > IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 6.0.0-rc5-CI_DRM_12145-g2dc9e=
a03abff x86_64)
> > Starting subtest: basic
> > Starting dynamic subtest: basic-gpu-0
> > Starting dynamic subtest: basic-gpu-1
> > Test requirement not met in function start_helpers, file ../tests/i915/=
gem_exec_gttfill.c:229:
> > Test requirement: i915 > 0
> > Last errno: 2, No such file or directory
> > Dynamic subtest basic-gpu-1: SKIP (0.025s)
> > Setup 1025 batches in 1051.24ms
> > engine[2]: 2 cycles
> > engine[1]: 1 cycles
> > engine[0]: 3 cycles
> > engine[3]: 2 cycles
> > engine[4]: 2 cycles
> > Total: 10 cycles
> > Dynamic subtest basic-gpu-0: SUCCESS (2.960s)
> > Subtest basic: SUCCESS (2.967s)
> >=20
> > Result from machine with two discrete GPUs:
> >=20
> > Starting subtest: basic
> > Starting dynamic subtest: basic-gpu-0
> > Starting dynamic subtest: basic-gpu-1
> > Setup 1025 batches in 3518.56ms
> > Setup 1025 batches in 3494.03ms
> > ...
> > Dynamic subtest basic-gpu-0: SUCCESS (35.349s)
> > Dynamic subtest basic-gpu-1: SUCCESS (35.374s)
> > Subtest basic: SUCCESS (35.401s) =20
>=20
> Having child processes report results breaks a surprising amount of
> things. Only the main process should enter/exit subtests or dynamic
> subtests.

Ok, but still it makes sense to have per-subtest results somehow.
Perhaps we'll need a new igt macro to report multiGPU child test=20
results.

> There isn't much value here having the separate gpus in separate
> dynamic subtests. Conceptually dynamic subtests are entry points that
> are not enumerable at compile-time, and this change conceptually
> always wants to run all of them really.

The usage of one or multiple GPUs is a runtime decision, based on IGT_DEVIC=
E=20
handling logic. That should not decided at compile-time.

> Instead this should just have everything in the subtest and manually
> print which gpu is doing what.

This exercise actually rises an interesting point: on a multi-GPU run,
what should be the "global" test result when the same test has different
results depending on the GPU?

I mean, if they all have identical results, there's no problem, but
what happens if:

- just a subset of the GPUs returns FAIL?
- one GPU have the test skipped while the others have the same result?
- the same test fails on a subset, pass on another subset, and eventually
  it is skipped on others?

IMO, the per-GPU test result should be propagated to the final test result,
with a logic similar to this pseudo-code:

    int run_on_multi_gpus(...)
    {
	int n_gpus;
	int test_exit[n_gpus];
	int i;
	int global =3D IGT_EXIT_SKIP;

	do_run_tests(&test_exit, ...);

	for (i =3D 0; i < n_gpus; i++) {
		switch (test_exit[i]) {
		case IGT_EXIT_SKIP:
			break;
		case IGT_EXIT_ABORT:
			return IGT_EXIT_ABORT;
		case IGT_EXIT_SUCCESS:
			if (global =3D=3D IGT_EXIT_SKIP)
				global =3D test_exit[i];
			break;
		default: // Handle invalid and failure
			if (global !=3D IGT_EXIT_FAILURE)
				global =3D test_exit[i];
			break;
		}
	}
	return global;
    }
=09

E. g.:

- if an abort is returned, return IGT_EXIT_ABORT;
- if all GPUs have the test skipped, return IGT_EXIT_SKIP;
- if all non-skipped tests had success, return IGT_EXIT_SUCCESS;
- if one or more GPUs test fail, return IGT_EXIT_FAILURE;
- otherwise, return IGT_EXIT_INVALID.

(by "return", I'm actually meaning doing the logic inside igt_skip,
 igt_success, igt_abort, igt_fail)

Regards,
Mauro

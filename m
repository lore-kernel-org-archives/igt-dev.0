Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2A110E363
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 07:45:12 +0000 (UTC)
Date: Tue, 11 Oct 2022 09:45:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221011094505.516b20cd@maurocar-mobl2>
In-Reply-To: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
References: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
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
Cc: igt-dev@lists.freedesktop.org, Anna Karas <anna.karas@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  7 Oct 2022 20:48:58 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Add one simple macro igt_fork_dyn() and two new helpers in
> igt_core to enable running dynamic tests on two or more GPUs in
> parallel.
> To test this idea I modified two subtests gem_basic@create-close
> and gem_exec_gttfill@basic.
> It is open-coded for ease of debug but can be converted
> into macro if this idea will get acceptance.
>=20
> Todo: add some log extension to igt_core from Mauro:
>   https://patchwork.freedesktop.org/series/109171/
>   "add sysfs node at subtest results when available"
>=20
> See some logs below.
>=20
> Cc: Anna Karas <anna.karas@intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
>=20
> This is log from gem_exec_gttfill run on one GPU machine:
>=20
> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 6.0.0-rc5-CI_DRM_12145-g2dc9ea0=
3abff x86_64)
> Starting subtest: basic
> Starting dynamic subtest: basic-gpu-0
> Starting dynamic subtest: basic-gpu-1
> Test requirement not met in function start_helpers, file ../tests/i915/ge=
m_exec_gttfill.c:229:
> Test requirement: i915 > 0
> Last errno: 2, No such file or directory
> Dynamic subtest basic-gpu-1: SKIP (0.025s)
> Setup 1025 batches in 1051.24ms
> engine[2]: 2 cycles
> engine[1]: 1 cycles
> engine[0]: 3 cycles
> engine[3]: 2 cycles
> engine[4]: 2 cycles
> Total: 10 cycles
> Dynamic subtest basic-gpu-0: SUCCESS (2.960s)
> Subtest basic: SUCCESS (2.967s)
>=20
> Result from machine with two discrete GPUs:
>=20
> Starting subtest: basic
> Starting dynamic subtest: basic-gpu-0
> Starting dynamic subtest: basic-gpu-1
> Setup 1025 batches in 3518.56ms
> Setup 1025 batches in 3494.03ms
> ...
> Dynamic subtest basic-gpu-0: SUCCESS (35.349s)
> Dynamic subtest basic-gpu-1: SUCCESS (35.374s)
> Subtest basic: SUCCESS (35.401s)

Yeah, it sounded a good idea to use dynamic subtests here.

The all-success case is the less complex one. I'd love to see
if skip and fail will be properly handled.

IMO, you could add an unit test, similar to lib/tests/igt_fork.c, that=20
would pretend that there would be (at least) 3 GPUs, in order to test
if the error would work whith a mix of different subtest results
(fail, skip, success).

Also, instead of using:

	igt_dynamic_f("%s-gpu-%d", myname, child)

it probably makes sense to name them after the PCI ID and
PCI BUS - e. g. something captured from the sysfs node, as I proposed
on my RFC patch https://patchwork.freedesktop.org/series/109171/.

Regards,
Mauro

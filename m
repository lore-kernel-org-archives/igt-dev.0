Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D00810E7D7
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 08:17:24 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:17:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y0Umf+g+oHJ0nXCk@platvala-desk.ger.corp.intel.com>
References: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007184902.54695-1-kamil.konieczny@linux.intel.com>
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

On Fri, Oct 07, 2022 at 08:48:58PM +0200, Kamil Konieczny wrote:
> Add one simple macro igt_fork_dyn() and two new helpers in
> igt_core to enable running dynamic tests on two or more GPUs in
> parallel.
> To test this idea I modified two subtests gem_basic@create-close
> and gem_exec_gttfill@basic.
> It is open-coded for ease of debug but can be converted
> into macro if this idea will get acceptance.
> 
> Todo: add some log extension to igt_core from Mauro:
>   https://patchwork.freedesktop.org/series/109171/
>   "add sysfs node at subtest results when available"
> 
> See some logs below.
> 
> Cc: Anna Karas <anna.karas@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> 
> This is log from gem_exec_gttfill run on one GPU machine:
> 
> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 6.0.0-rc5-CI_DRM_12145-g2dc9ea03abff x86_64)
> Starting subtest: basic
> Starting dynamic subtest: basic-gpu-0
> Starting dynamic subtest: basic-gpu-1
> Test requirement not met in function start_helpers, file ../tests/i915/gem_exec_gttfill.c:229:
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
> 
> Result from machine with two discrete GPUs:
> 
> Starting subtest: basic
> Starting dynamic subtest: basic-gpu-0
> Starting dynamic subtest: basic-gpu-1
> Setup 1025 batches in 3518.56ms
> Setup 1025 batches in 3494.03ms
> ...
> Dynamic subtest basic-gpu-0: SUCCESS (35.349s)
> Dynamic subtest basic-gpu-1: SUCCESS (35.374s)
> Subtest basic: SUCCESS (35.401s)

Having child processes report results breaks a surprising amount of
things. Only the main process should enter/exit subtests or dynamic
subtests.

There isn't much value here having the separate gpus in separate
dynamic subtests. Conceptually dynamic subtests are entry points that
are not enumerable at compile-time, and this change conceptually
always wants to run all of them really.

Instead this should just have everything in the subtest and manually
print which gpu is doing what.

In addition, some kind of synchronization is needed so the work is
submitted as close to "same time" as possible.

-- 
Petri Latvala



> 
> Log from similar machine with old version of gem_exec_gttfill:
> 
> Opened device: /dev/dri/card0
> Starting subtest: basic
> Setup 1025 batches in 2845.22ms
> Subtest basic: SUCCESS (32.341s)
> 
> Kamil Konieczny (4):
>   lib/igt_core: add fork for dynamic tests
>   tests/i915/gem_basic: add multi-gpu tests
>   tests/i915/gem_exec_gttfill: extend basic subtest for multigpu
>   HAX test only gem_basic subtests
> 
>  lib/igt_core.c                        | 141 +++++++++++++++++++++
>  lib/igt_core.h                        |  22 ++++
>  tests/i915/gem_basic.c                |  28 ++++-
>  tests/i915/gem_exec_gttfill.c         |  48 +++++++-
>  tests/intel-ci/fast-feedback.testlist | 171 +-------------------------
>  5 files changed, 234 insertions(+), 176 deletions(-)
> 
> -- 
> 2.34.1
> 

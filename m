Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 May 2020 11:43:14 -0000
Message-ID: <158954299468.26212.9830708151878262246@emeril.freedesktop.org>
References: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_l?=
 =?utf-8?q?ib/gem=5Ftest=5Fengine=3A_Add_no_device_reopen_variant?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/gem_test_engine: Add no device reopen variant
URL   : https://patchwork.freedesktop.org/series/77193/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gem_exec_fence@concurrent
gem_exec_fence@submit
gem_exec_fence@submit3
gem_exec_fence@submit67
gem_exec_reloc@basic-many-active
gem_exec_reloc@basic-wide-active
gem_exec_schedule@lateslice
gem_exec_schedule@manyslice
gem_exec_schedule@thriceslice
gem_exec_schedule@timeslicing
gem_mmap_gtt@ptrace
gem_mmap_offset@ptrace
gem_ringfill@basic-all
gem_ringfill@engines-S3
gem_ringfill@engines-S4
gem_ringfill@engines-basic
gem_ringfill@engines-bomb
gem_ringfill@engines-child
gem_ringfill@engines-fd
gem_ringfill@engines-forked
gem_ringfill@engines-hang
gem_ringfill@engines-interruptible
gem_ringfill@legacy-S3
gem_ringfill@legacy-S4
gem_ringfill@legacy-basic
gem_ringfill@legacy-bomb
gem_ringfill@legacy-child
gem_ringfill@legacy-fd
gem_ringfill@legacy-forked
gem_ringfill@legacy-hang
gem_ringfill@legacy-interruptible
perf_pmu@module-unload

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/145420 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/145420
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

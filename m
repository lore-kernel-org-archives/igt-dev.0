Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 14:31:14 -0000
Message-ID: <158169067417.9932.16329900069429553144@emeril.freedesktop.org>
References: <20200214135658.2711-1-satyavathi.k@intel.com>
In-Reply-To: <20200214135658.2711-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_t?=
 =?utf-8?q?ests/i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5F?=
 =?utf-8?q?engine_to_utilize_all_available_engines=2E_=28rev2=29?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/73463/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gem_ringfill@Test--S3
gem_ringfill@Test--S4
gem_ringfill@Test--bomb
gem_ringfill@Test--child
gem_ringfill@Test-basic
gem_ringfill@Test-basic-fd
gem_ringfill@Test-basic-forked
gem_ringfill@Test-basic-hang
gem_ringfill@Test-basic-interruptible

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/108727 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/108727
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

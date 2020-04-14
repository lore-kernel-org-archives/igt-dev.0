Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Apr 2020 17:58:03 -0000
Message-ID: <158688708365.30378.3993980468950523673@emeril.freedesktop.org>
References: <20200414164016.13205-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200414164016.13205-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_t?=
 =?utf-8?q?ests/i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_=28rev7=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev7)
URL   : https://patchwork.freedesktop.org/series/75536/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gem_sync@active
gem_sync@active-wakeup
gem_sync@double-wakeup
gem_sync@forked
gem_sync@forked-store
gem_sync@forked-switch
gem_sync@idle
gem_sync@legacy-engines-active
gem_sync@legacy-engines-active-wakeup
gem_sync@legacy-engines-default
gem_sync@legacy-engines-double-wakeup
gem_sync@legacy-engines-forked
gem_sync@legacy-engines-forked-store
gem_sync@legacy-engines-forked-switch
gem_sync@legacy-engines-idle
gem_sync@legacy-engines-many
gem_sync@legacy-engines-store
gem_sync@legacy-engines-switch
gem_sync@legacy-engines-wakeup
gem_sync@many
gem_sync@preempt
gem_sync@store
gem_sync@switch
gem_sync@wakeup

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/132104 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/132104
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

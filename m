Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 21:26:25 -0000
Message-ID: <158041958566.21035.3362233169222591214@emeril.freedesktop.org>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_t?=
 =?utf-8?q?ests/i915/gem=5Fctx=5Fpersistence=3A_Convert_engine_subtests_to?=
 =?utf-8?q?_dynamic_=28rev3=29?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/72793/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gem_ctx_persistence@engines-cleanup
gem_ctx_persistence@engines-hang
gem_ctx_persistence@engines-hostile
gem_ctx_persistence@engines-hostile-preempt
gem_ctx_persistence@engines-mixed
gem_ctx_persistence@engines-mixed-process
gem_ctx_persistence@engines-persistence
gem_ctx_persistence@engines-queued
gem_ctx_persistence@legacy-engines-cleanup
gem_ctx_persistence@legacy-engines-hang
gem_ctx_persistence@legacy-engines-hostile
gem_ctx_persistence@legacy-engines-hostile-preempt
gem_ctx_persistence@legacy-engines-mixed
gem_ctx_persistence@legacy-engines-mixed-process
gem_ctx_persistence@legacy-engines-persistence
gem_ctx_persistence@legacy-engines-queued

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/103458 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/103458
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

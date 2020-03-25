Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 23:45:00 -0000
Message-ID: <158517990041.29636.14797174312066879658@emeril.freedesktop.org>
References: <20200325231938.527211-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325231938.527211-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fctx=5Fshared?=
 =?utf-8?q?=3A_Use_dynamic_subtests?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_ctx_shared: Use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/75094/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gem_ctx_isolation@clean
gem_ctx_isolation@dirty-create
gem_ctx_isolation@dirty-switch
gem_ctx_isolation@nonpriv
gem_ctx_isolation@nonpriv-switch
gem_ctx_isolation@preservation
gem_ctx_isolation@preservation-S3
gem_ctx_isolation@preservation-S4
gem_ctx_isolation@preservation-reset
gem_ctx_shared@Q-in-order
gem_ctx_shared@Q-independent
gem_ctx_shared@Q-out-order
gem_ctx_shared@Q-promotion
gem_ctx_shared@Q-smoketest
gem_ctx_shared@exec-shared-gtt
gem_ctx_shared@exec-single-timeline

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124436 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124436
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

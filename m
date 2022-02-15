Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Feb 2022 18:58:40 -0000
Message-ID: <164495152074.15372.13944863668981183633@emeril.freedesktop.org>
References: <20220215130300.2282453-1-apoorva1.singh@intel.com>
In-Reply-To: <20220215130300.2282453-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fcreate=3A_Added_test_description_for_test_case_?=
 =?utf-8?b?KHJldjMp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_create: Added test description for test case (rev3)
URL   : https://patchwork.freedesktop.org/series/82544/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/510047 for the overview.

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18848828):
  Running with gitlab-runner 14.7.0 (98daeee0)
    on fdo-packet-m1xl-1 ZBMZ6-qr
  section_start:1644951044:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-104f05ad3bc96fba74f34683ff89672c38e0adba ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-104f05ad3bc96fba74f34683ff89672c38e0adba ...
  WARNING: Failed to pull image with policy "always": Cannot overwrite digest sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 (manager.go:203:26s)
  section_end:1644951078:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-104f05ad3bc96fba74f34683ff89672c38e0adba" with specified policies [always]: Cannot overwrite digest sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 (manager.go:203:26s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/510047

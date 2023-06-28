Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Wed, 28 Jun 2023 15:37:53 -0000
Message-ID: <168796667328.32036.10948700444005208470@emeril.freedesktop.org>
References: <20230628145557.11801-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230628145557.11801-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2Cv3=2C1/2=5D_tests/i915/kms=5Fbig?=
 =?utf-8?q?=5Ffb=3A_Add_Cairo_fallback_path_for_test_image_creation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/i915/kms_big_fb: Add Cairo fallback path for test image creation
URL   : https://patchwork.freedesktop.org/series/119979/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921238 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44593827):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1687966378:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a: reading manifest commit-4a6c64a14e4c073ec91b986cd5ade412d426720a in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a not found (manager.go:237:4s)
  section_end:1687966384:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a: reading manifest commit-4a6c64a14e4c073ec91b986cd5ade412d426720a in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a not found (manager.go:237:4s)
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44593824):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1687966348:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a: reading manifest commit-4a6c64a14e4c073ec91b986cd5ade412d426720a in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a not found (manager.go:237:4s)
  section_end:1687966354:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a: reading manifest commit-4a6c64a14e4c073ec91b986cd5ade412d426720a in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-4a6c64a14e4c073ec91b986cd5ade412d426720a not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921238

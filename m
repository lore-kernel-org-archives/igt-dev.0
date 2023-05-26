Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Fri, 26 May 2023 14:43:18 -0000
Message-ID: <168511219884.32385.18346801553388370180@emeril.freedesktop.org>
References: <20230526142004.310852-1-andrzej.hajda@intel.com>
In-Reply-To: <20230526142004.310852-1-andrzej.hajda@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fpersistence=3A_skip_heartbeat_tests_with_GuC_?=
 =?utf-8?b?KHJldjIp?=
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

Series: i915/gem_ctx_persistence: skip heartbeat tests with GuC (rev2)
URL   : https://patchwork.freedesktop.org/series/118423/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891574 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42519010):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1685111762:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  section_end:1685111768:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42519009):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1685111756:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  section_end:1685111762:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42519012):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1685111764:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  section_end:1685111769:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42519007):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1685111747:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)
  section_end:1685111754:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d: reading manifest commit-723201114393f6b6e3766f4e8c6bf14aaa80371d in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-723201114393f6b6e3766f4e8c6bf14aaa80371d not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891574

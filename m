Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 23 Aug 2023 12:05:40 -0000
Message-ID: <169279234094.16624.2701611298578023210@emeril.freedesktop.org>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_S?=
 =?utf-8?q?eparate_display_PM_tests_from_Core?=
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

Series: Separate display PM tests from Core
URL   : https://patchwork.freedesktop.org/series/122790/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968565 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903462):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1692792149:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792155:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903465):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1692792150:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792156:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903464):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692792150:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903466):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-24 wL1RuQ-s, system ID: r_MoZu10MFma0h
  section_start:1692792150:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792155:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903463):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692792150:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903457):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-24 wL1RuQ-s, system ID: r_MoZu10MFma0h
  section_start:1692792148:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792153:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903461):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-24 wL1RuQ-s, system ID: r_MoZu10MFma0h
  section_start:1692792149:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903460):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-24 wL1RuQ-s, system ID: r_MoZu10MFma0h
  section_start:1692792149:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903458):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692792149:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47903459):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1692792149:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)
  section_end:1692792154:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb: reading manifest commit-076d202da336162fab8394fe7970b8ee2902dbbb in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-076d202da336162fab8394fe7970b8ee2902dbbb not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968565

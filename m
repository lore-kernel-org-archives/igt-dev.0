Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 17 Aug 2023 07:10:17 -0000
Message-ID: <169225621708.12432.9776847733693304862@emeril.freedesktop.org>
References: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?eson=5Foptions=3A_Disable_testplan_by_default?=
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

Series: meson_options: Disable testplan by default
URL   : https://patchwork.freedesktop.org/series/122553/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/963586 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579221):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692256037:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579224):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256038:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:3s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:3s)
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579223):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256038:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:3s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:3s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579225):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1692256039:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256045:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579222):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256037:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579216):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256036:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579220):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256037:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256041:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579219):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692256037:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579217):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692256036:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256042:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47579218):
  Running with gitlab-runner 16.2.1 (674e0e29)
    on fdo-equinix-m3l-23 M5DzQX4r, system ID: r_uRhul1c53zbG
  section_start:1692256036:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)
  section_end:1692256041:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394: reading manifest commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-6d4905a67d64adcc3a07d203d0f5c2d7909ef394 not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/963586

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 18 Jul 2023 14:10:15 -0000
Message-ID: <168968941514.22203.5519765471156266423@emeril.freedesktop.org>
References: <20230718121136.2992608-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230718121136.2992608-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2Cv2=2C1/1=5D_tests/xe/xe=5Fuevent?=
 =?utf-8?q?=3A_add_new_test_for_uevent_gt_reset_failure?=
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

Series: series starting with [i-g-t,v2,1/1] tests/xe/xe_uevent: add new test for uevent gt reset failure
URL   : https://patchwork.freedesktop.org/series/120913/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/938430 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710659):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1689689137:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689142:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710662):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689138:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689143:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710661):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1689689137:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689143:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-armhf: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-armhf:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710663):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1689689138:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689143:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710660):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689137:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689143:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-minimal: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-minimal:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710654):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689135:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689140:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710658):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689137:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689142:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710657):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1689689136:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689141:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710655):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689136:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689142:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45710656):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689689136:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)
  section_end:1689689141:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67: reading manifest commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-eb84d0800aa3a80086ba69a5afad539fe349ea67 not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/938430

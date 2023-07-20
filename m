Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Thu, 20 Jul 2023 12:52:49 -0000
Message-ID: <168985756975.20753.15759107702277879146@emeril.freedesktop.org>
References: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_U?=
 =?utf-8?q?pdate_code_to_use_xe=5Fsysfs=5Fgt=5Fopen?=
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

Series: Update code to use xe_sysfs_gt_open
URL   : https://patchwork.freedesktop.org/series/121046/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/940493 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45857544):
  Running with gitlab-runner 16.1.0 (b72e108d)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1689857117:prepare_executor
  Preparing the "docker" executor
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  section_end:1689857486:prepare_executor
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45857541):
  Running with gitlab-runner 16.1.0 (b72e108d)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1689857097:prepare_executor
  Preparing the "docker" executor
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  section_end:1689857466:prepare_executor
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45857540):
  Running with gitlab-runner 16.1.0 (b72e108d)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1689857084:prepare_executor
  Preparing the "docker" executor
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  ERROR: Failed to remove network for build
  ERROR: Preparation failed: Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)
  Will be retried in 3s ...
  section_end:1689857453:prepare_executor
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///run/podman/podman.sock. Is the docker daemon running? (docker.go:803:120s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/940493

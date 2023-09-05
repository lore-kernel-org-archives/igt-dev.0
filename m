Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 05 Sep 2023 12:16:02 -0000
Message-ID: <169391616238.19168.4701326898197699595@emeril.freedesktop.org>
References: <20230905072601.1602968-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905072601.1602968-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_E?=
 =?utf-8?q?nable_hang_tests_for_XE?=
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

Series: Enable hang tests for XE
URL   : https://patchwork.freedesktop.org/series/123266/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/978186 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48540196):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1693915866:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using helper image:  registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662 ...
  WARNING: Failed to pull image with policy "if-not-present": open /var/lib/docker/tmp/GetImageBlob1861947907: no such file or directory (manager.go:237:0s)
  section_end:1693915866:prepare_executor
  ERROR: Job failed: failed to pull image "registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662" with specified policies [if-not-present]: open /var/lib/docker/tmp/GetImageBlob1861947907: no such file or directory (manager.go:237:0s)
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48540197):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1693915866:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using helper image:  registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662 ...
  WARNING: Failed to pull image with policy "if-not-present": open /var/lib/docker/tmp/GetImageBlob1867710776: no such file or directory (manager.go:237:0s)
  section_end:1693915867:prepare_executor
  ERROR: Job failed: failed to pull image "registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662" with specified policies [if-not-present]: open /var/lib/docker/tmp/GetImageBlob1867710776: no such file or directory (manager.go:237:0s)
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48540199):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1693915867:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using helper image:  registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662 ...
  WARNING: Failed to pull image with policy "if-not-present": open /var/lib/docker/tmp/GetImageBlob1772548791: no such file or directory (manager.go:237:0s)
  section_end:1693915867:prepare_executor
  ERROR: Job failed: failed to pull image "registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662" with specified policies [if-not-present]: open /var/lib/docker/tmp/GetImageBlob1772548791: no such file or directory (manager.go:237:0s)
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48540200):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1693915867:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Using helper image:  registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662
  Pulling docker image registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662 ...
  WARNING: Failed to pull image with policy "if-not-present": open /var/lib/docker/tmp/GetImageBlob2396081253: no such file or directory (manager.go:237:0s)
  section_end:1693915868:prepare_executor
  ERROR: Job failed: failed to pull image "registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper:x86_64-8ec04662" with specified policies [if-not-present]: open /var/lib/docker/tmp/GetImageBlob2396081253: no such file or directory (manager.go:237:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/978186

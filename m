Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 24 Mar 2022 11:09:54 -0000
Message-ID: <164812019486.18594.15191011873554287271@emeril.freedesktop.org>
References: <20220324101852.73089-1-riana.tauro@intel.com>
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_B?=
 =?utf-8?q?asic_Suspend/Resume_with_i915_unload?=
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

Series: Basic Suspend/Resume with i915 unload
URL   : https://patchwork.freedesktop.org/series/101730/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/540172 for the overview.

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20164946):
  Running with gitlab-runner 14.7.0 (98daeee0)
    on fdo-packet-m1xl-3 LB3m2Qse
  section_start:1648119679:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1648119853:prepare_executor
  section_start:1648119853:prepare_script
  Preparing environment
  section_end:1648119973:prepare_script
  ERROR: Job failed (system failure): prepare environment: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:651:120s). Check https://docs.gitlab.com/runner/shells/index.html#shell-profile-loading for more information

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20164944):
  Running with gitlab-runner 14.7.0 (98daeee0)
    on fdo-packet-m1xl-3 LB3m2Qse
  section_start:1648119679:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1648119853:prepare_executor
  section_start:1648119853:prepare_script
  Preparing environment
  section_end:1648119973:prepare_script
  ERROR: Job failed (system failure): prepare environment: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:651:120s). Check https://docs.gitlab.com/runner/shells/index.html#shell-profile-loading for more information

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20164945):
  Running with gitlab-runner 14.7.0 (98daeee0)
    on fdo-packet-m1xl-3 LB3m2Qse
  section_start:1648119679:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-a2edee9374e4b55f529348636099a2d5a447f812 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1648119853:prepare_executor
  section_start:1648119853:prepare_script
  Preparing environment
  section_end:1648119973:prepare_script
  ERROR: Job failed (system failure): prepare environment: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:651:120s). Check https://docs.gitlab.com/runner/shells/index.html#shell-profile-loading for more information

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/540172

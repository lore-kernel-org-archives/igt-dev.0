Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 06:44:11 -0000
Message-ID: <158451385142.25102.17225719122050490933@emeril.freedesktop.org>
References: <20200318063038.20988-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200318063038.20988-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fring=5Fsync=5Floop=3A_Removal_of_test?=
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
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ring_sync_loop: Removal of test
URL   : https://patchwork.freedesktop.org/series/74819/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/121079 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1965370):
  Running with gitlab-runner 12.8.0 (1b659122)
    on fdo-packet-m1xl-3 yBVzLPnn
  section_start:1584513441:prepare_executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  section_end:1584513443:prepare_executor
  section_start:1584513443:prepare_script
  section_end:1584513563:prepare_script
  section_start:1584513563:upload_artifacts_on_failure
  section_end:1584513563:upload_artifacts_on_failure
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (executor_docker.go:716:120s)
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1965371):
  Running with gitlab-runner 12.8.0 (1b659122)
    on fdo-packet-m1xl-3 yBVzLPnn
  section_start:1584513441:prepare_executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-d9b288afaeba58d3a755205b0c6b4010ac7f56ee ...
  section_end:1584513443:prepare_executor
  section_start:1584513443:prepare_script
  section_end:1584513563:prepare_script
  section_start:1584513563:upload_artifacts_on_failure
  section_end:1584513563:upload_artifacts_on_failure
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (executor_docker.go:716:120s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/121079
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

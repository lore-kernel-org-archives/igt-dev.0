Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Jun 2023 17:36:06 -0000
Message-ID: <168685056655.10725.3735624549764810273@emeril.freedesktop.org>
References: <20230615163618.3781725-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230615163618.3781725-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_R?=
 =?utf-8?q?FC=3A_FAKE_xe=5Flive=5Fktest_change_to_test_Intel_CI?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: RFC: FAKE xe_live_ktest change to test Intel CI
URL   : https://patchwork.freedesktop.org/series/119395/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910265 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43852173):
  section_start:1686850308:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb5d6143cdd98484cb6f0da6fe608e78ea3bb880 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb5d6143cdd98484cb6f0da6fe608e78ea3bb880 ...
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-eb5d6143cdd98484cb6f0da6fe608e78ea3bb880 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd18b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1686850310:prepare_executor
  section_start:1686850310:prepare_script
  Preparing environment
  Running on runner-yyhtcik-project-3185-concurrent-5 via dcfb9e0d8998...
  section_end:1686850310:prepare_script
  section_start:1686850310:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  section_end:1686850371:get_sources
  section_start:1686850371:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686850372:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910265


Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 14:34:36 -0000
Message-ID: <157616127643.32009.15481522353802040484@emeril.freedesktop.org>
References: <20191212134353.25663-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212134353.25663-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?gt/tests=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28re?=
 =?utf-8?q?v22=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: kms_plane_stress: Add plane stress test (rev22)
URL   : https://patchwork.freedesktop.org/series/58524/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88148 for the overview.

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1132593):
  Removing build/
  Removing installdir/
  
  [32;1mSkipping Git submodules setup[0;m
  section_end:1576161151:get_sources
  [0Ksection_start:1576161151:restore_cache
  [0Ksection_end:1576161155:restore_cache
  [0Ksection_start:1576161155:download_artifacts
  [0Ksection_end:1576161157:download_artifacts
  [0Ksection_start:1576161157:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[32;1m$ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY[0;m
  Error: error authenticating creds for "registry.freedesktop.org": Get https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&service=container_registry: dial tcp 35.185.111.185:443: i/o timeout
  section_end:1576161188:build_script
  [0Ksection_start:1576161188:after_script
  [0Ksection_end:1576161189:after_script
  [0Ksection_start:1576161189:upload_artifacts_on_failure
  [0Ksection_end:1576161191:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88148
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

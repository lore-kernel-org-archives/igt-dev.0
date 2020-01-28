Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 19:05:42 -0000
Message-ID: <158023834280.20534.7392929978211299224@emeril.freedesktop.org>
References: <cover.1580236781.git.dale.b.stimson@intel.com>
In-Reply-To: <cover.1580236781.git.dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fisolation=3A_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_+_engine_mapping?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_isolation: __for_each_physical_engine + engine mapping
URL   : https://patchwork.freedesktop.org/series/72686/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/102352 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1484793):
   * [new tag]         intel/TrybotIGT_99    -> intel/TrybotIGT_99
  [32;1mChecking out e2ebdb75 as intel/IGTPW_4022...[0;m
  
  [32;1mSkipping Git submodules setup[0;m
  section_end:1580238258:get_sources
  [0Ksection_start:1580238258:restore_cache
  [0Ksection_end:1580238261:restore_cache
  [0Ksection_start:1580238261:download_artifacts
  [0Ksection_end:1580238263:download_artifacts
  [0Ksection_start:1580238263:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;mstandard_init_linux.go:207: exec user process caused "exec format error"
  section_end:1580238266:build_script
  [0Ksection_start:1580238266:after_script
  [0Kstandard_init_linux.go:207: exec user process caused "exec format error"
  section_end:1580238268:after_script
  [0Ksection_start:1580238268:upload_artifacts_on_failure
  [0Ksection_end:1580238271:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/102352
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 18 Apr 2023 09:19:26 -0000
Message-ID: <168180956605.17888.7259135559708765176@emeril.freedesktop.org>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntegrate_intel-bb_with_Xe_=28rev2=29?=
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

Series: Integrate intel-bb with Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/116578/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/859921 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/40168139):
  c3d5a1b4e32336421e501a9c3a811edafdad306081c21cedf2746cd0a1580686
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  34c17873ccb2f4470ef8285488477fec4c04ce9c31c2a4102e63becc64733be1
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  61840281f424df9bf5ea1ec16ac392b15e672d97a6dd7dc8476ce3234b862384
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  164a77372e56091a6d5c9cdc91479cab6f0c19584f2a6d9833eb9141553b1c12
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  0e09edbbfedeec45c05a898b9cd95f4a2b4be241712f80438483b42d8aeb407c
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-95348e3f743db5bb5da13c278328e3e7455e54b3
  21168849540702b58d2df6ae80edff974e9bb9d88f8703dd0fe5dc6a037a0268
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1681809431:step_script
  section_start:1681809431:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1681809431:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/859921

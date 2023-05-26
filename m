Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Fri, 26 May 2023 12:42:50 -0000
Message-ID: <168510497041.32386.7497654982678140486@emeril.freedesktop.org>
References: <20230526101803.299705-1-andrzej.hajda@intel.com>
In-Reply-To: <20230526101803.299705-1-andrzej.hajda@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fpersistence=3A_skip_heartbeat_tests_with_GuC?=
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

Series: i915/gem_ctx_persistence: skip heartbeat tests with GuC
URL   : https://patchwork.freedesktop.org/series/118423/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891483 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42510437):
  032e80f7f8e90799b69e3608147f2ab6b6e121800689e417fe46db1beff63024
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  a1a4805be7473966b262734e60e7f15e23c208f8a10689799e3af27de06b7c76
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-72cabc2d7a6286a1e4dc1227051f086a18c232c7
  27fb9763ad508f7920b0b48087a8be6f2f5243ffe5bc3362b91e6d948a7a5950
  Getting image source signatures
  Copying blob sha256:de0e160c9bd15145041bf25b57d9478570d5e5badde3ced5e2b9ef904f51fbf3
  Copying blob sha256:fc3271943af674a76e8a0e8f395fd304076fc047cf0949c02ab7ce7931223e38
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying config sha256:27fb9763ad508f7920b0b48087a8be6f2f5243ffe5bc3362b91e6d948a7a5950
  Writing manifest to image destination
  Storing signatures
  time="2023-05-26T12:39:19Z" level=fatal msg="Error initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-72cabc2d7a6286a1e4dc1227051f086a18c232c7: Error reading manifest commit-72cabc2d7a6286a1e4dc1227051f086a18c232c7 in registry.freedesktop.org/gfx-ci/igt-ci-tags/igt: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1685104761:step_script
  section_start:1685104761:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685104763:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891483

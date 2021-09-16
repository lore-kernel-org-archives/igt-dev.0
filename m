Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Sep 2021 16:31:48 -0000
Message-ID: <163180990883.8838.17508495305224691338@emeril.freedesktop.org>
References: <20210902151334.15818-1-vidya.srinivas@intel.com>
In-Reply-To: <20210902151334.15818-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fpsr2=5Fsf=3A_Skip_tests_if_selected_fetch_is_not_ava?=
 =?utf-8?q?ilable_=28rev2=29?=
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_psr2_sf: Skip tests if selected fetch is not available (rev2)
URL   : https://patchwork.freedesktop.org/series/94288/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/402990 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13739830):
  7535ddbbdd85285b12553940ec36748cfa0f88d3387f6819fc4deaa66b97587e
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  6d12acbfeb7d500a26beb0abb730ca564fa686f5cebd83a0bcdcf58e3cdd5744
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  3cf69afaf41de818356addde50a0740ce4e6178650b8edb1a72b0faab5468f04
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-8efb5b948fb268a02b3380b911bdc05b62e2205f
  3ae5779933f4295d715540e85c506d6021dd0831e07a8daa095fd03a6a1c1131
  Getting image source signatures
  Copying blob sha256:f62c390e613892ffe3bab6d8d7ea9f7cbbdd36acbf46372e38e994f96cf90f5d
  Copying blob sha256:c17c3c56d47cd85adef267f33b658d06446a2f8c8794a5b33873c14e75ec594b
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Error: Error copying image to the remote destination: Error writing blob: Error determining upload URL: http: no Location header in response
  section_end:1631809794:step_script
  section_start:1631809794:cleanup_file_variables
  Cleaning up file based variables
  section_end:1631809795:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/402990

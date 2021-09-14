Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Sep 2021 13:37:49 -0000
Message-ID: <163162666913.3458.11929067929496685612@emeril.freedesktop.org>
References: <20210914112559.556898-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210914112559.556898-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fcolor=5Fchamelium=3A_Skip_CTM_test_if_property_is_no?=
 =?utf-8?q?t_present?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_color_chamelium: Skip CTM test if property is not present
URL   : https://patchwork.freedesktop.org/series/94653/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/401308 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13661606):
  51b1c785e099b311e58a16ee57543174ba648e2b1d8ab81d4930dd89acd3354c
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  8c7ef5b0d50764c5e49ed7bf8780044dfdc74cfdc7af250c9111dc48cf72e844
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  61e4640b8010f25f5e69ae7e5275ea90be7035c8c9aa9b4a81733b71d0611f06
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  08d1703808112e6f020b2dea9e6a82dce3bdb102151e8333629bfa8f228a1eeb
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-5cf4432aaf8bd3fc59592b9f04e4d71b45963f55
  4c847802204e14d25cafeb23231291e3c4123c91855f2078954dc061df15bf39
  Getting image source signatures
  Copying blob sha256:6be3187573680d6b55d973c8dc10842518ec3e558a729aa313e5fbcdd76a771e
  Copying blob sha256:bd9cb1c13a8ad644597c3c327500644c12f915cc29673945152a18bca00d263c
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Error: Error copying image to the remote destination: Error writing blob: Error determining upload URL: http: no Location header in response
  section_end:1631626518:step_script
  section_start:1631626518:cleanup_file_variables
  Cleaning up file based variables
  section_end:1631626519:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/401308

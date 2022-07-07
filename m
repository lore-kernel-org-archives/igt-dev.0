Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Thu, 07 Jul 2022 12:19:10 -0000
Message-ID: <165719635076.2212.15912876108237459883@emeril.freedesktop.org>
References: <20220630145816.68461-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220630145816.68461-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Flegacy=5Fcolorkey=3A_IGT_test_Cleanup_=28rev4?=
 =?utf-8?q?=29?=
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

Series: tests/i915/kms_legacy_colorkey: IGT test Cleanup (rev4)
URL   : https://patchwork.freedesktop.org/series/105222/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/631707 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/25019284):
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  718fc3e45a8406a813ea49394ed6830f1c80c48a888ce1fbd5984858ac097f2f
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  bddcdde325097209d4fef7c33f23843e49469eda95847ab1c4fd5de3f3035a4b
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  d6c45448a16754cc6f190419302987a6c1732d97abb7f470d158d6a1790f584c
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-94f788d8696c1305e0545e3df8d17fe386d872ad
  56995401151258657ebd3236de0c8bb78e83ffa2ee51dd186955b9592fbc21bd
  Getting image source signatures
  Copying blob sha256:88a46a1a329c3b1c97eb7787be11c621f7af5275442fd64cfdbf3a64abc6c5df
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:73f7cb28b5c629583cb25559f97e5a0afdf15b1fddfd111fce0ecd008e559c3a
  Error: Error copying image to the remote destination: Error writing blob: Error determining upload URL: http: no Location header in response
  section_end:1657196100:step_script
  section_start:1657196100:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1657196103:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/631707

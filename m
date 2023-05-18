Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 18 May 2023 15:51:15 -0000
Message-ID: <168442507559.2371.14738971532180705725@emeril.freedesktop.org>
References: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230518151842.287294-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_N?=
 =?utf-8?q?ew_dir_structure_for_intel_specific_tests_=28rev2=29?=
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

Series: New dir structure for intel specific tests (rev2)
URL   : https://patchwork.freedesktop.org/series/117227/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/884498 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42003543):
  22db2d88b566ddd29ec36d263a8ec742b777f6d0fb4b312365130dd30dd2336c
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  de2e35eaefb72accfb6588f973e9fcb60926560ae77d17a39ec5cce744d1d585
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  068d0c4d29d361cca8484c8730fc89a0d8e2ec546fd291104795118860b418bb
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  17d8ec9db281a1eed13c3827831edb43f686091879248f12ae02e2a4d520b47e
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  353452200ee48e6bcc31ada71aa4f464d5429fb46f8232cc4a5513d0f5d0b7cd
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-b00d2d19450128e7ef5262d3980309d1f02ffcaf
  6c31c64d05c7ec5e5289b9783762a1e0c367a054a87fe8d94f965b236e440205
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1684424984:step_script
  section_start:1684424984:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684424985:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/884498

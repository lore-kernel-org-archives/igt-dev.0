Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 28 Jun 2023 14:22:27 -0000
Message-ID: <168796214711.32037.25802585231439608@emeril.freedesktop.org>
References: <20230628093504.517988-1-riana.tauro@intel.com>
In-Reply-To: <20230628093504.517988-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_T?=
 =?utf-8?q?est_for_gtidle_properties?=
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

Series: Test for gtidle properties
URL   : https://patchwork.freedesktop.org/series/119965/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921119 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44585436):
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  7bc43e7f793f1d1401f7abae456bcb5222cb7e6c9ea8bbfca341640dae3ceb1d
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  db72729f19d0efcb10dbafe3e32d107989f38a1e924fc69584feed72eb9f8a82
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  c1b9ffd9f43a38d4173f065f2e7d44616be735d565c679b394d0542bc281b11b
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  29e28ed79f8fb985eeea67802eddf0f306b601f4fda92a71d43b99d311fe0c10
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-813c3c4ff0bba6ccc2b5c7a7ac477a582b846439
  6c0e2e9a59aef100d7fb3ae036836ed3fea59a430a84dfa16033e95846966fe5
  Getting image source signatures
  Copying blob sha256:1861d263807d15172e9db20db23af83d59c5adef038158fb3f1fe33f5be815d2
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1687959236:step_script
  section_start:1687959236:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687959236:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/921119

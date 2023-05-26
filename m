Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erico Nunes" <nunes.erico@gmail.com>
Date: Fri, 26 May 2023 13:12:58 -0000
Message-ID: <168510677818.32386.5620650476248212642@emeril.freedesktop.org>
References: <20230526130001.71730-1-nunes.erico@gmail.com>
In-Reply-To: <20230526130001.71730-1-nunes.erico@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nitial_tests_for_the_lima_drm_driver_=28rev2=29?=
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

Series: Initial tests for the lima drm driver (rev2)
URL   : https://patchwork.freedesktop.org/series/118303/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891503 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42512495):
  79e0b4c6546bf7feb4a58a5d3ffc2d327606c0abaa6f168ce0555e1813683630
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  c0a5e93463d207d46b394a3998d49d40873c849e0d44a358ac7b06a7795ba44e
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  67503cf473505a2d95acdd6a635dac7201c0e69dcebebea8e8509ae0de925c62
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  4a9c16f09f33cc59e1bceb96430c018d71a48d43043c7377d5244d55adf8250c
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  78926b36e30e189fed5f10c33fc2bc5674355eb2f17ccef54eaba3acc96e18b4
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-43a10068b6717c10050d32dfa1db421611566f09
  935f635cfc5b322e1d7f8faf4dbccb17a920f5866a2b837e00ed12025adfc735
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1685106533:step_script
  section_start:1685106533:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685106536:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/891503

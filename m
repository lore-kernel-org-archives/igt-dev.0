Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Fri, 11 Aug 2023 22:32:43 -0000
Message-ID: <169179316389.3118.1335519950866170101@emeril.freedesktop.org>
References: <20230811212801.85404-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230811212801.85404-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_lib/amdgpu=3A_Formatting_the_code?=
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

Series: series starting with [1/2] lib/amdgpu: Formatting the code
URL   : https://patchwork.freedesktop.org/series/122367/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/958971 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47213994):
  8fc4972e879f7b7fa806b9de992b7d2704b20442f5f2c65551f62a8fdba4cde6
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  c4ae8024542846ee5bdf1657bfd53eef2157a8a75facf9d775a83c0ccd48253d
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  8372ea099d54a8163ad70edb6627dfc0bb2fc6932771d0811b90de7d5b7f48e3
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  dff6de6c477b43785c003e04b15a98c198085c4acc3fba789e4f62343eb055ca
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  8bc4008d6d052dbf84c166cb7001af97268d46c6b2dd7b41dfbc363367005298
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-0ab5253a4f02e6a5d9479e66508299943b3e9b12
  42972fdf84d6a428d92e310dad4de3adaa2847c5d3649469822276061532dbf3
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1691793077:step_script
  section_start:1691793077:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691793078:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/958971

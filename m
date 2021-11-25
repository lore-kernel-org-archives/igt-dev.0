Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Nov 2021 18:03:08 -0000
Message-ID: <163786338886.17557.4635873338710866328@emeril.freedesktop.org>
References: <20211125155548.1354801-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211125155548.1354801-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_Add_test_for_AMD_DP_DSC_=28rev6=29?=
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
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/amdgpu: Add test for AMD DP DSC (rev6)
URL   : https://patchwork.freedesktop.org/series/97108/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/453561 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16168063):
  STEP 2: COPY installdir/opt/igt /opt/igt
  1895d20f5469210af8281acac7769fa51efbde5ca3931bd457af2c2834e1f7ee
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  b743d155d30d20100edf9b2df89664275b2ea33d402f9df69cf5a1824a781b01
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  5eb0330fdfca164d1ef769d62f1d3c1a539a09a81da3ca01273c4e7afe2ee974
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  b4ea9d4538270ad267ff798de51f4b7bed3e1ae27f9d3df8cea163e78acc9d3e
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  ae060122c9eeab50d82bbafa097e8cd72bccdc8e8cb00b42de1b38531854d099
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-dcfa579ba0a38131881dfd441d558b54d4cd3183
  fcc29304314f515e7c8612f480ef56419de32ac5b5917000b434768cf94b6793
  Getting image source signatures
  Copying blob sha256:508381dd82aeb851da958db0528f2893285a9392bd0787020d3569a61fcdd513
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:f3f4119da36f8525b923a310c4b1f15579ca311a753c9973ef966cdb2a71a4e8
  section_end:1637863318:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/453561

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Date: Tue, 30 May 2023 20:30:48 -0000
Message-ID: <168547864811.18934.1919485468055971264@emeril.freedesktop.org>
References: <20230530185355.10608-1-hersenxs.wu@amd.com>
In-Reply-To: <20230530185355.10608-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu/amd=5Fvrr=5Frange=3A_add_vrr_range_check_for_edp_?=
 =?utf-8?b?KHJldjIp?=
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

Series: tests/amdgpu/amd_vrr_range: add vrr range check for edp (rev2)
URL   : https://patchwork.freedesktop.org/series/118575/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/894851 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42736066):
  9fd1ffba2187f0b85885886834aef59d8ee1f3c907a38dc4e91b95a2bd15dd66
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  cdb6a9434760c72c6dd727d4343aec66f425e9491217e0344acbc788e4cfe441
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  3c75b801725844a357078eff8235d2b66fe67504c4e76c5e4faa9b96e2dbe51e
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  6adc55fa8209ad8197d641cd9eb827e0cc9eb1cbb8c0c7e8c1aac14d1e8c859d
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-99dee995fc49daccbd4f40e0a63529cb5ad635dd
  f3750046c5abe7c7fd3f441625b6c63fd629409d0edb6345dde742e16b4f8b5f
  Getting image source signatures
  Copying blob sha256:8fb81f3014ce254476416f2d48f2e929fa609b664d379f60342525ccb3acdca0
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:12c519b4e9420c069e8c30120e8a83a6de69345d8efa6d4d76a89fb5cb284097 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1685478535:step_script
  section_start:1685478535:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685478536:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/894851

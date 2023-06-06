Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 06 Jun 2023 10:12:44 -0000
Message-ID: <168604636407.22675.9890757951439232713@emeril.freedesktop.org>
References: <20230606085015.6751-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230606085015.6751-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntegrate_igt=5Fspin=5Fnew_with_Xe_=28rev3=29?=
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

Series: Integrate igt_spin_new with Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/118837/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/901001 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43179016):
  Running with gitlab-runner 15.9.1 (d540b510)
    on fdo-equinix-m3l-17 7f7FXSjW, system ID: s_1d7dfffdd4ac
  section_start:1686046237:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1: reading manifest commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 not found (manager.go:237:4s)
  section_end:1686046244:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1: reading manifest commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-1ed7ec6eddf08e43c1fed442c42ce431c2dbb0c1 not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/901001

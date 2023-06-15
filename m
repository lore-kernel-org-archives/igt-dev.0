Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 15 Jun 2023 16:15:42 -0000
Message-ID: <168684574249.10725.332441759546720001@emeril.freedesktop.org>
References: <20230614165431.532799-1-swati2.sharma@intel.com>
In-Reply-To: <20230614165431.532799-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_c?=
 =?utf-8?q?heck_dsc_hardware_capability_=28rev4=29?=
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

Series: check dsc hardware capability (rev4)
URL   : https://patchwork.freedesktop.org/series/118570/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910157 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43843707):
  Running with gitlab-runner 16.0.2 (85586bd1)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1686845341:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c: reading manifest commit-70c77800942c3ec9cb52806856151f828d4b043c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c not found (manager.go:237:4s)
  section_end:1686845346:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c: reading manifest commit-70c77800942c3ec9cb52806856151f828d4b043c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-70c77800942c3ec9cb52806856151f828d4b043c not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/910157

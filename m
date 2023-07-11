Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Tue, 11 Jul 2023 10:00:20 -0000
Message-ID: <168906962068.18665.1702566414622261619@emeril.freedesktop.org>
References: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_x?=
 =?utf-8?q?e/xe=5Fcreate=3A_Modify_massive_test?=
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

Series: xe/xe_create: Modify massive test
URL   : https://patchwork.freedesktop.org/series/120537/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/932109 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45257588):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1689069250:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c: reading manifest commit-35f7f46cffb2dbe18bb27edee63605403cb0623c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c not found (manager.go:237:4s)
  section_end:1689069256:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c: reading manifest commit-35f7f46cffb2dbe18bb27edee63605403cb0623c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-arm64: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-arm64:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c not found (manager.go:237:4s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45257589):
  Running with gitlab-runner 16.1.0 (b72e108d)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1689069256:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c: reading manifest commit-35f7f46cffb2dbe18bb27edee63605403cb0623c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c not found (manager.go:237:4s)
  section_end:1689069260:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c: reading manifest commit-35f7f46cffb2dbe18bb27edee63605403cb0623c in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-debian-mips: unknown: artifact cache/gfx-ci/igt-ci-tags/build-debian-mips:commit-35f7f46cffb2dbe18bb27edee63605403cb0623c not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/932109

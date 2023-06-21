Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Dec" <katarzyna.dec@intel.com>
Date: Wed, 21 Jun 2023 15:04:12 -0000
Message-ID: <168735985234.7799.8490314604829501801@emeril.freedesktop.org>
References: <20230621124737.1827262-1-katarzyna.dec@intel.com>
In-Reply-To: <20230621124737.1827262-1-katarzyna.dec@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_xe=5Fmmap_=26_xe=5Fcreate_tests_to_f-f?=
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

Series: Add xe_mmap & xe_create tests to f-f
URL   : https://patchwork.freedesktop.org/series/119678/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/914942 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44146157):
  Running with gitlab-runner 15.10.1 (dcfb4b66)
    on fdo-equinix-m3l-21 y559XLTy, system ID: s_e106cb9ff99a
  section_start:1687359640:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684: reading manifest commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 not found (manager.go:237:4s)
  section_end:1687359646:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684: reading manifest commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 in harbor.freedesktop.org/cache/gfx-ci/igt-ci-tags/build-fedora: unknown: artifact cache/gfx-ci/igt-ci-tags/build-fedora:commit-e4951a98689f4efd9a73d2a0466b50f05bf48684 not found (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/914942

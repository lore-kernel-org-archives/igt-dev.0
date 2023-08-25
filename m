Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 10:18:35 -0000
Message-ID: <169295871541.10952.9693566582913786682@emeril.freedesktop.org>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_XE_support_for_Async_flip_tests?=
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

Series: Add XE support for Async flip tests
URL   : https://patchwork.freedesktop.org/series/122893/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970475 for the overview.

test:list-undocumented-tests has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48038232):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-22 YyH_tCiK, system ID: r_a0v3jgyTbvyU
  section_start:1692958420:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b: can't talk to a V1 container registry"},"error":"initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b: can't talk to a V1 container registry"} (manager.go:237:30s)
  section_end:1692958451:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b" with specified policies [if-not-present]: Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b: can't talk to a V1 container registry"},"error":"initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-e0b5bd35e9e1c8bd4dc6744599a23a2416f8824b: can't talk to a V1 container registry"} (manager.go:237:30s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970475

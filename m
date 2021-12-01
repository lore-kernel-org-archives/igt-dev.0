Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB86E0FF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 06:54:56 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Dec 2021 14:54:23 +0800
Message-ID: <20211201065434.48827-1-stylon.wang@amd.com>
In-Reply-To: <20211130083503.10221-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 00/11] Create tests for multi-plane
 overlay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

A series of new tests on MPO is added to tests/amdgpu/amd_plane.

Currently most of the sub-tests are AMD-specific and concerns with
video use cases from projects.

Changes from prior rev1 to now:

v2: Fix conflict in meson.build

Ahmad Othman (1):
  tests/amdgpu/amd_plane: fixes for test-4k-mpo

Anson Jacob (1):
  tests/amdgpu/amd_plane: Ensure pipes are enabled before accessing

Bhawanpreet Lakha (4):
  tests/amdgpu/amd_plane: Create mpo panning test
  tests/amdgpu/amd_plane: Create mpo swap between 2 displays test
  tests/amdgpu/amd_plane: Create mpo scaling tests
  tests/amdgpu/amd_plane: Add full screen scaling test case

Nicholas Kazlauskas (1):
  tests/amdgpu/amd_plane: Add MPO swizzle mode toggle test

Stylon Wang (1):
  tests/amdgpu/amd_plane: Add P010 format to MPO tests and add test
    descriptions

Victor Lu (3):
  tests/amdgpu/amd_plane: Introduced 4K MPO test
  tests/amdgpu/amd_plane: Switch mpo-swizzle-toggle to single-head
  tests/amdgpu/amd_plane: Add MPO scale and pan subtest single display
    option

 tests/amdgpu/amd_plane.c | 805 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 806 insertions(+)
 create mode 100644 tests/amdgpu/amd_plane.c

-- 
2.33.1

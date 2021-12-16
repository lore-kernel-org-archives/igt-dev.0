Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB38112474
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 14:55:17 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Thu, 16 Dec 2021 09:55:00 -0500
Message-ID: <20211216145501.3156345-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v5 0/1] tests/amdgpu: Introduce DSC tests
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
List-ID: <igt-dev@lists.freedesktop.org>

This patchset introduces a set of DSC tests focused on AMDGPU.

Changes since v4:
- Drop first patch
- Drop subtest

Changes since v3:
- Rebase and fix conflicts

Eryk Brol (1):
  tests/amdgpu: Introduces DP DSC test

Rodrigo Siqueira (1):
  lib/kms: Add DSC_SLICE_HEIGHT to CRTC property

 lib/igt_amd.c             | 494 +++++++++++++++++++++++++++++--
 lib/igt_amd.h             |  35 +++
 tests/amdgpu/amd_dp_dsc.c | 607 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 4 files changed, 1115 insertions(+), 22 deletions(-)
 create mode 100644 tests/amdgpu/amd_dp_dsc.c

-- 
2.25.1

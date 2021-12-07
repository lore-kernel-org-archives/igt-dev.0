Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6667CEB404
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 16:43:56 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Tue, 7 Dec 2021 11:43:29 -0500
Message-ID: <20211207164331.306201-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4 0/2] tests/amdgpu: Introduce DSC tests
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Roman Li <roman.li@amd.com>, Hayden Goodfellow <hayden.goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset introduces a set of DSC tests focused on AMDGPU.

Changes since v3:
- Rebase and fix conflicts

Eryk Brol (1):
  tests/amdgpu: Introduces DP DSC test

Rodrigo Siqueira (1):
  lib/kms: Add DSC_SLICE_HEIGHT to CRTC property

 lib/igt_amd.c             | 494 +++++++++++++++++++++++++--
 lib/igt_amd.h             |  35 ++
 lib/igt_kms.c             |   1 +
 lib/igt_kms.h             |   1 +
 tests/amdgpu/amd_dp_dsc.c | 685 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 6 files changed, 1195 insertions(+), 22 deletions(-)
 create mode 100644 tests/amdgpu/amd_dp_dsc.c

-- 
2.25.1

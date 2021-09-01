Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C658828E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 12:10:42 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Sep 2021 20:10:14 +0800
Message-ID: <20210901121017.12398-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 0/3] Add tests to check Freesync capability
 reporting
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
Cc: nicholas.kazlauskas@amd.com, sunpeng.li@amd.com, rodrigo.siqueira@amd.com, Stylon Wang <stylon.wang@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

These new tests check if Freesync capability are correctly parsed from
EDID and reported to debugfs. They were originally made for Freesync
HDMI only and got extended to cover DP displays. Simulated hotplug triggered
via debugfs is used to implement the tests and is the major reason why
the tests are made amdgpu specific.

Stylon Wang (3):
  tests/amdgpu: Add tests for Freesync capability reporting on HDMI & DP
    displays
  tests/amdgpu: Add tests for relaxed reporting of Freesync capability
  tests/amdgpu: Add tests for Freesync capability with suspend-resume

 tests/amdgpu/amd_vrr_range.c | 338 +++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build     |   1 +
 2 files changed, 339 insertions(+)
 create mode 100644 tests/amdgpu/amd_vrr_range.c

-- 
2.32.0

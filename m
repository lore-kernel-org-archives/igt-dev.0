Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1056E195
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 12:38:09 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Sep 2021 20:37:49 +0800
Message-ID: <20210901123752.14633-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add tests to check Freesync
 capability reporting
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

Changes from prior rev1 to now:

v2:
- Add missing call to igt_amd_require_hpd()

Stylon Wang (3):
  tests/amdgpu: Add tests for Freesync capability reporting on HDMI & DP
    displays
  tests/amdgpu: Add tests for relaxed reporting of Freesync capability
  tests/amdgpu: Add tests for Freesync capability with suspend-resume

 tests/amdgpu/amd_vrr_range.c | 342 +++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build     |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 tests/amdgpu/amd_vrr_range.c

-- 
2.32.0

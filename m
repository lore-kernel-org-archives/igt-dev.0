Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3ED10E18E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 18:22:37 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 14:22:25 -0400
Message-ID: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Add a new test for Sub-viewport
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changes in v2
=================

* Removed an unused struct definition
* Fixes style issues reported by checkpatch.pl 
* Added SPDX license identifier to the new test
* Fixed #include order for system includes

---

Aurabindo Pillai (5):
  lib/amdgpu: Remove unused struct
  llib/amd: Update function documentation
  lib/amd: improve readablity for MALL capability check
  lib/amd: Add check for SubVP feature status
  test/amdgpu: Add test for Sub-viewport

 lib/igt_amd.c            |  44 ++++++++--
 lib/igt_amd.h            |   1 +
 tests/amdgpu/amd_subvp.c | 180 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 4 files changed, 217 insertions(+), 9 deletions(-)
 create mode 100644 tests/amdgpu/amd_subvp.c

-- 
2.39.2

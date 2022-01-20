Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F3B10E6E7
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 07:49:50 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Thu, 20 Jan 2022 15:49:29 +0800
Message-ID: <20220120074931.22880-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 0/2] Add new test for Intermediate Link Rate
 feature
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Create new tests for checking if ILR (Intermediate Link Rate) is working
on eDP displays. Tests validate ILR from 2 perspectives:

* Physically check if driver can successfully train link by the ILRs 
reported from DPCD of eDP panel

* Check if driver does use ILRs as the link rate options while doing 
link training. And also validate that the train result is bandwidth 
sufficient for the required resolution.

---

Wayne Lin (2):
  lib/igt_amd: correct the link_settings bug
  test/amdgpu: Add ilr test

 lib/igt_amd.c            | 114 +++++++++++++++-
 lib/igt_amd.h            |   8 ++
 tests/amdgpu/amd_ilr.c   | 275 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 4 files changed, 397 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_ilr.c

-- 
2.25.1

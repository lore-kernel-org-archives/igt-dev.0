Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC7F6E1F5
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Aug 2021 12:27:49 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 25 Aug 2021 20:24:11 +0800
Message-ID: <20210825122413.1708578-1-stylon.wang@amd.com>
In-Reply-To: <20210719125835.652219-1-stylon.wang@amd.com>
References: <20210719125835.652219-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v4 0/2] New ASSR test on DP/eDP links
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

Create new tests for checking if ASSR is working on eDP displays.
The tests also cover embedded and non-removable displays that
appear as DP.

Currrently the tests are verified to work on AMD hardware but failing
on some others, so they are AMD-specific for the time being.

Changes from prior rev1 to now:

v4:
  - Move tests back to being amdgpu specific
  - Fix spacing in the test description
v3:
  - Move tests from amdgpu to generic
v2:
  - Fix static local variable used in path name creation
  - Fix test assertion
  - Allow tests to run on any GPU
  - Keep test in alphabetical order

Stylon Wang (2):
  tests/amdgpu: New ASSR test on DP/eDP links
  tests/amdgpu: Add suspend and DPMS subtests to ASSR test

 tests/amdgpu/amd_assr.c  | 303 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 304 insertions(+)
 create mode 100644 tests/amdgpu/amd_assr.c

-- 
2.32.0

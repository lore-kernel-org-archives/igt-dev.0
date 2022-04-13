Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8D10F0D5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 22:05:33 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Apr 2022 18:05:10 -0400
Message-ID: <20220413220514.1740383-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 0/4] PSR-SU test cases for cursor movement
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

changes in v2:
-------------------
- add test case to validate PSR-SU w/ MPO + cursor move scenario
- refactoring the cursor PSR-SU test function to make it compatible
  to test/validate two scenarios:
  1. static background + cursor movement
  2. MPO + cursor movement

David Zhang (4):
  tests/amdgpu/amd_psr: add helper to draw cursor pattern
  tests/amdgpu/amd_psr: set visual-confirm option required argument
  tests/amdgpu/amd_psr: add PSR-SU cursor movement test case
  tests/amdgpu/amd_psr: add PSR-SU test case for cursor move + MPO
    scenario

 tests/amdgpu/amd_psr.c | 167 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 166 insertions(+), 1 deletion(-)

-- 
2.25.1

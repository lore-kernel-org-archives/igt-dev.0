Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E410E11A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 18:46:13 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 25 Apr 2022 14:45:52 -0400
Message-ID: <20220425184556.771707-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4 0/4] amdgpu PSR-SU cursor move test cases
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

changes in v4:
-----------------------
- rebase w/ latest code base

David Zhang (4):
  tests/amdgpu/amd_psr: add helper to draw cursor pattern
  tests/amdgpu/amd_psr: set visual-confirm default to disabled
  tests/amdgpu/amd_psr: add PSR-SU cursor movement test case
  tests/amdgpu/amd_psr: add PSR-SU test case for cursor move + MPO
    scenario

 tests/amdgpu/amd_psr.c | 191 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 184 insertions(+), 7 deletions(-)

-- 
2.25.1

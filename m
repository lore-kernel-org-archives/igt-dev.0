Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2910E15E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 22:18:36 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 18 Apr 2022 18:18:16 -0400
Message-ID: <20220418221820.2490163-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 0/4] amdgpu PSRSU cursor move test cases
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

including scenarios of
- static background + cursor move
- MPO update + cursor move

changes in v2:
---------------
- add more clear comments for cursor movement test cases

David Zhang (4):
  tests/amdgpu/amd_psr: add helper to draw cursor pattern
  tests/amdgpu/amd_psr: set visual-confirm option required argument
  tests/amdgpu/amd_psr: add PSR-SU cursor movement test case
  tests/amdgpu/amd_psr: add PSR-SU test case for cursor move + MPO
    scenario

 tests/amdgpu/amd_psr.c | 179 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 1 deletion(-)

-- 
2.25.1

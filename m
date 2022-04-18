Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E9910E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 21:33:09 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 18 Apr 2022 17:32:50 -0400
Message-ID: <20220418213253.2484226-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4 0/3] amdgpu PSR-SU full-frame update (FFU) test
 case
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

Changes in v4:
--------------------
- use igt_warn() for any PSR SU cap/support check before FALSE
  returned
- before each panning of primary plane, update alpha region in
  overlay at position/size of primary plane, set alpha to 0.0
  to make it transparent. In addition, set the rest of overlay
  region to 1.0 to make it opaque.

David Zhang (3):
  tests/amdgpu/amd_psr: add interactive option of PSR visual confirm
  tests/amdgpu/amd_psr: add PSR-SU full frame update sub test case
  tests/amdgpu/amd_psr: define reusable wrapper for PSR support check

 tests/amdgpu/amd_psr.c | 194 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 184 insertions(+), 10 deletions(-)

-- 
2.25.1

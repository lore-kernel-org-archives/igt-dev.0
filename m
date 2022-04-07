Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E71210E077
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 14:08:11 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Apr 2022 10:07:53 -0400
Message-ID: <20220407140755.560546-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 0/2] AMDGPU PSR-SU FFU test case
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
------------------
- drop the "_dm_" from helpers of visual confirm debugfs set/get
- drop the non-necessary visual confirm option check after set
  and reset, before and after the test run, respectively
- align the 2nd line code w/ previous line's opening brace

David Zhang (2):
  tests/amdgpu/amd_psr: add interactive option of PSR visual confirm
  tests/amdgpu/amd_psr: add PSR-SU full frame update sub test case

 tests/amdgpu/amd_psr.c | 167 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 165 insertions(+), 2 deletions(-)

-- 
2.25.1

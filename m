Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3810EAE9
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 02:41:20 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 9 May 2022 22:41:07 -0400
Message-ID: <20220510024111.404004-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 0/4] amdgpu PSR-SU scaling tests and some fix
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
- correct comment by using more accurate words
- rebase w/ latest code base

David Zhang (4):
  tests/amdgpu/amd_psr: some fix for PSR-SU MPO test case
  tests/amdgpu/amd_psr: clean-up the code
  tests/amdgpu/amd_psr: use double framebuffers to emulate MPO case
  tests/amdgpu/amd_psr: add PSR-SU scaling test cases

 tests/amdgpu/amd_psr.c | 190 +++++++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 63 deletions(-)

-- 
2.25.1

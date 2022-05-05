Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FFD10F897
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 21:32:43 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 5 May 2022 17:32:22 -0400
Message-ID: <20220505213226.2614662-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/4] amdgpu PSR-SU scaling tests and some fix
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

- add two scaling sub-tests to validate amdgpu PSR-SU
- some fixes for other PSR-SU test cases

David Zhang (4):
  tests/amdgpu/amd_psr: some fix for PSR-SU MPO test case
  tests/amdgpu/amd_psr: clean-up the code
  tests/amdgpu/amd_psr: use double framebuffers to emulate MPO case
  tests/amdgpu/amd_psr: add PSR-SU scaling test cases

 tests/amdgpu/amd_psr.c | 190 +++++++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 63 deletions(-)

-- 
2.25.1

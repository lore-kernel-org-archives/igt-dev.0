Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711DE10E176
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 16:59:40 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Apr 2022 12:59:23 -0400
Message-ID: <20220428165925.1406641-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/2] amdgpu PSR-SU scaling test cases
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

- add primary plane up/down scaling subtest case
- add primary plane up/down scaling + cursor movement subtest case
- fix the "visual confirm debug option" enable issue for amdgpu PSR-SU
  tests

David Zhang (2):
  tests/amdgpu/amd_psr: add PSR-SU scaling test cases
  tests/amdgpu/amd_psr: trigger full modeset if visual confirm enabled

 tests/amdgpu/amd_psr.c | 126 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

-- 
2.25.1

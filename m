Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCF010E040
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 20:28:58 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 16:28:27 -0400
Message-ID: <20220406202829.456384-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/2] replace hardcode of PSR state and drop psr
 state check for PSR-SU MPO test
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


David Zhang (2):
  tests/amdgpu/amd_psr: use PSR state enum replace the integer
  tests/amdgpu/amd_psr: drop the PSR state check for PSR-SU MPO test

 tests/amdgpu/amd_psr.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

-- 
2.25.1

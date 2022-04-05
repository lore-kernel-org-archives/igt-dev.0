Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293CD10E8F6
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 14:24:48 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 5 Apr 2022 10:24:32 -0400
Message-ID: <20220405142434.40630-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/2] add PSR-SU FFU test case w/ visual confirm
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

*** BLURB HERE ***
- add interactive option of PSR visual confirm and set TRUE by default
- add a full-frame update (FFU) PSR-SU test case by visual confirm

David Zhang (2):
  tests/amdgpu/amd_psr: add interactive option of PSR visual confirm
  tests/amdgpu/amd_psr: add PSR-SU full frame update sub test case

 tests/amdgpu/amd_psr.c | 169 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 2 deletions(-)

-- 
2.25.1

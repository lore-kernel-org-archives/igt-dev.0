Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0FD10E08C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 19:21:54 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 12 Apr 2022 15:21:36 -0400
Message-ID: <20220412192139.1530645-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 0/3] amdgpu PSR-SU FFU test case
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

changes in v3:
---------------
- define reusable wrapper for PSR support check
- drop the unnecessary helper panning_pfb_and_psrsu_check() and
  collapse the operations into run_check_psr_su_ffu()
- initial the two overlay FBs w/ global alpha and different color
  not to update the specific alpha region for each panning of the
  primary plane.

David Zhang (3):
  tests/amdgpu/amd_psr: add interactive option of PSR visual confirm
  tests/amdgpu/amd_psr: add PSR-SU full frame update sub test case
  tests/amdgpu/amd_psr: define reusable wrapper for PSR support check

 tests/amdgpu/amd_psr.c | 177 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 167 insertions(+), 10 deletions(-)

-- 
2.25.1

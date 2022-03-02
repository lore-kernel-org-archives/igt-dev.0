Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E871B10F1AA
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:46:49 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Mar 2022 16:46:29 +0800
Message-ID: <20220302084631.10605-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 0/2] Modify amd_link_settings test
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

"7f484824 lib/igt_amd: correct the link_settings bug"
After applying above patch to fix a bug within igt_amd.c, it starts to
fail the test amd_link_settings@link-training-configs. The main readson
for the failure is due to inappropriate implementation of this test.

This patch series is trying to adjust some steps in the test.

Wayne Lin (2):
  tests/amdgpu/amd_link_settings: Ignore CRC checking
  tests/amdgpu/amd_link_settings: Change the flow when exit test

 tests/amdgpu/amd_link_settings.c | 67 ++++++--------------------------
 1 file changed, 11 insertions(+), 56 deletions(-)

-- 
2.25.1

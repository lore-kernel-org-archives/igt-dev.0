Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C376C89FD9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 12:00:49 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 13 Jul 2021 20:00:14 +0800
Message-ID: <20210713120016.463320-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] New tests for ASSR Content Protection
 on DP/eDP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: petri.latvala@intel.com, arek@hiler.eu, markyacoub@google.com, igt-dev@lists.freedesktop.org
Cc: Anson.Jacob@amd.com, Nicholas.Choi@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

New IGT tests to check if ASSR content protection is correctly
enabled/disabled according to eDP specification. Test also applies to
internal/non-removable displays that appears as DP displays.

Stylon Wang (2):
  tests/amdgpu: New ASSR test on DP/eDP links
  tests/amdgpu: Add suspend and DPMS subtests to ASSR test

 tests/amdgpu/amd_assr.c  | 298 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 299 insertions(+)
 create mode 100644 tests/amdgpu/amd_assr.c

-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

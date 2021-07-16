Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F556E979
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 13:16:39 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Fri, 16 Jul 2021 21:16:20 +0800
Message-ID: <20210716131622.103320-1-stylon.wang@amd.com>
In-Reply-To: <20210713120016.463320-1-stylon.wang@amd.com>
References: <20210713120016.463320-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/amdgpu: New ASSR test on
 DP/eDP links
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

Create new tests for checking if ASSR is working on eDP displays.
The tests also cover embedded and non-removable displays that
appears as DP.

Stylon Wang (2):
  tests/amdgpu: New ASSR test on DP/eDP links
  tests/amdgpu: Add suspend and DPMS subtests to ASSR test

 tests/amdgpu/amd_assr.c  | 303 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 304 insertions(+)
 create mode 100644 tests/amdgpu/amd_assr.c

-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

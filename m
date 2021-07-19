Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895D189A88
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 12:58:58 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Mon, 19 Jul 2021 20:58:33 +0800
Message-ID: <20210719125835.652219-1-stylon.wang@amd.com>
In-Reply-To: <20210716131622.103320-2-stylon.wang@amd.com>
References: <20210716131622.103320-2-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/2] New ASSR test on DP/eDP links
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

Changes from prior rev1 to now:

v3:
  - Move tests from amdgpu to generic
v2:
  - Fix static local variable used in path name creation
  - Fix test assertion
  - Allow tests to run on any GPU
  - Keep test in alphabetical order

Stylon Wang (2):
  tests/kms_assr: New ASSR test on DP/eDP links
  tests/kms_assr: Add suspend and DPMS subtests to ASSR test

 tests/kms_assr.c  | 302 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build |   1 +
 2 files changed, 303 insertions(+)
 create mode 100644 tests/kms_assr.c

-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

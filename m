Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BCD10E0CC
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 13:18:52 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 18:48:39 +0530
Message-Id: <20221107131842.31387-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Cold Reset IGT Test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding support for IGT Cold Reset.

Anshuman Gupta (3):
  lib/igt_pm: Refactor get firmware_node fd
  test/device_reset: Refactor initiate_device_reset
  tests/device_reset: Add cold reset IGT test

 lib/igt_pm.c         |  69 ++++++++++++++++++---
 lib/igt_pm.h         |   1 +
 tests/device_reset.c | 139 +++++++++++++++++++++++++++++++++++++++----
 3 files changed, 187 insertions(+), 22 deletions(-)

-- 
2.25.1

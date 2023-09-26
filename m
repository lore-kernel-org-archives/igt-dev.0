Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50210E361
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 08:19:31 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:57:10 +0530
Message-Id: <20230926082712.281687-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Move dpcd_(read/write) to igt_dpcd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

tests can use dpcd_read and dpcd_write for many use cases
one such use case is reading crc present at below address

DP_TEST_CRC_R_CR	0x240
DP_TEST_CRC_G_Y		0x242
DP_TEST_CRC_B_CB	0x244


Kunal Joshi (2):
  lib/igt_dpcd: move dpcd_read and dpcd_write to lib
  lib/meson.build: Add igt_dpcd for compilation

 lib/igt_dpcd.c   | 47 +++++++++++++++++++++++++++++++++++++
 lib/igt_dpcd.h   | 19 +++++++++++++++
 lib/meson.build  |  5 ++++
 tools/dpcd_reg.c | 60 +-----------------------------------------------
 4 files changed, 72 insertions(+), 59 deletions(-)
 create mode 100644 lib/igt_dpcd.c
 create mode 100644 lib/igt_dpcd.h

-- 
2.25.1

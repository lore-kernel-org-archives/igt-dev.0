Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2328610E3FD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 12:02:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 17:32:03 +0530
Message-Id: <20230109120205.2259410-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] PCI WARM_RESET IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add warm_reset IGT Test.

Anshuman Gupta (2):
  test/device_reset: Rename device_fds to device_data
  tests/device_reset: Add warm_reset test

 lib/igt_pci.c        | 28 ++++++++++++++++++++++++++++
 lib/igt_pci.h        |  5 +++++
 tests/device_reset.c | 34 +++++++++++++++++++++++-----------
 3 files changed, 56 insertions(+), 11 deletions(-)

-- 
2.25.1

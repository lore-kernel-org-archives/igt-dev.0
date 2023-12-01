Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1210E0EE
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 11:15:02 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 16:52:45 +0530
Message-Id: <20231201112249.2169767-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Update PSR/PSR2_SF documenation and Add
 FBC support
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

fix kms_psr documentation, subtest naming and add fbc support/test
for kms_psr, kms_psr2_sf.

v2: rebase

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  tests/intel/kms_psr: fix subtest naming
  tests/intel/kms_psr: Add FBC support to PSR/PSR2/PR tests
  tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests

Swati Sharma (1):
  tests/intel/kms_psr: fix documentation

 lib/igt_psr.h             |   5 +
 tests/intel/kms_psr.c     | 569 ++++++++++++++++++-----------------
 tests/intel/kms_psr2_sf.c | 606 +++++++++++++++++++++-----------------
 3 files changed, 646 insertions(+), 534 deletions(-)

-- 
2.25.1

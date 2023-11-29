Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72210E5E2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:45:53 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 20:16:32 +0530
Message-Id: <20231129144634.2091171-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add FBC support to PSR/PSR2 tests
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

From: Kunal Joshi <kunal1.joshi@intel.com>

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/intel/kms_psr: Add FBC support to PSR/PSR2/PR tests
  tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests

 lib/igt_psr.h             |   5 +
 tests/intel/kms_psr.c     | 464 +++++++++++++++++++----------
 tests/intel/kms_psr2_sf.c | 607 +++++++++++++++++++++-----------------
 3 files changed, 652 insertions(+), 424 deletions(-)

-- 
2.25.1

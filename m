Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB9710E074
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 05:46:52 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:25:24 +0530
Message-Id: <20231127055526.2351645-1-jeevan.b@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/intel/kms_psr: Add FBC support to PSR/PSR2 tests
  tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests

 lib/igt_psr.h             |   5 +
 tests/intel/kms_psr.c     | 238 +++++++++-------
 tests/intel/kms_psr2_sf.c | 567 ++++++++++++++++++++------------------
 3 files changed, 435 insertions(+), 375 deletions(-)

-- 
2.25.1

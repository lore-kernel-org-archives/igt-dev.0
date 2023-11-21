Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40FC10E056
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 06:15:11 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:53:18 +0530
Message-Id: <20231121062320.1860993-1-jeevan.b@intel.com>
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
  tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests
  tests/intel/kms_psr: Add FBC support to PSR/PSR2 tests

 tests/intel/kms_psr.c     | 13 +++++++++++++
 tests/intel/kms_psr2_sf.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.25.1

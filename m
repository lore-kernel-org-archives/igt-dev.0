Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9C10E4E0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 11:28:24 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:07:05 +0530
Message-Id: <20231128113707.2463245-1-jeevan.b@intel.com>
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
  tests/intel/kms_psr: Add FBC support to PSR/PSR2/PR tests
  tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests

 lib/igt_psr.h             |   5 +
 tests/intel/kms_psr.c     | 488 ++++++++++++++++++++---------
 tests/intel/kms_psr2_sf.c | 625 +++++++++++++++++++++-----------------
 3 files changed, 711 insertions(+), 407 deletions(-)

-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E7A10E582
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 05:57:17 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 11:34:58 +0530
Message-Id: <20231020060503.870173-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] extend kms_psr test to validate pr
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

Panel Replay behaves same as PSR for DP connector,
modify kms_psr test to validate pr feature as well

Kunal Joshi (5):
  lib/igt_psr: added enum for panel replay
  lib/igt_psr: modified function for pr compaitability
  lib/igt_psr: added function to check output supports pr
  lib/igt_psr: added function to check active dp pr
  tests/intel/kms_psr: made test compaitable with pr

 lib/igt_psr.c         | 104 ++++++++---
 lib/igt_psr.h         |   5 +-
 tests/intel/kms_psr.c | 402 ++++++++++++++++++++++++++++++++++--------
 3 files changed, 414 insertions(+), 97 deletions(-)

-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286A26E8E3
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 21:24:47 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  3 Sep 2021 14:24:40 -0700
Message-Id: <cover.1630704099.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add a couple of tiling checks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add a couple of checks to check for presence of tiling for tests which use
tiling.

Vanshidhar Konda (2):
  i915/i915_fb_tiling: Check if device supports tiling
  tests/kms_addfb_basic: Skip tiling subtests on device without hw
    tiling

 tests/i915/i915_fb_tiling.c | 2 ++
 tests/kms_addfb_basic.c     | 4 ++++
 2 files changed, 6 insertions(+)

-- 
2.31.1

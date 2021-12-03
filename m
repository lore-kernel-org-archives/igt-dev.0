Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56800734A6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Dec 2021 16:24:10 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Fri,  3 Dec 2021 21:58:50 +0530
Message-Id: <20211203162853.14262-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/3] Fix kms_psr2_sf test and add new
 test for FB_DAMAGE_CLIPS plane property
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

Change kms_psr2_sf test design, rename igt_debug_manual_check, patch the igt
functions igt_debug_wait_for_keypress() to assert if "all" is supplied and
change testcase design and add simple test cases to use FB_DAMAGE_CLIPS plane property.

Deepak Rawat (1):
  tests/kms_atomic: Add a new test case for FB_DAMAGE_CLIPS plane
    property

Jeevan B (2):
  lib/igt_aux: Rename igt_debug_manual_check and assert check if all is
    supplied
  tests/kms_psr2_sf: Change testcase design

 lib/igt_aux.c            |   9 +-
 lib/igt_aux.h            |   2 +-
 tests/i915/kms_dsc.c     |   2 +-
 tests/i915/kms_psr.c     |   2 +-
 tests/i915/kms_psr2_sf.c |  28 ++---
 tests/kms_atomic.c       | 219 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 242 insertions(+), 20 deletions(-)

-- 
2.19.1

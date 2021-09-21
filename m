Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E1D6E906
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 07:57:08 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 21 Sep 2021 13:27:46 +0530
Message-Id: <20210921075749.13049-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix kms_psr2_sf test and add new test
 for FB_DAMAGE_CLIPS plane property
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
Cc: daniel@ffwll.ch, jose.souza@intel.com, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Make kms_psr2_sf test generic, rename igt_debug_manual_check, patch the
igt functions igt_debug_manual_check() and igt_debug_wait_for_keypress()
to assert if "all" is supplied and change testcase design and 
add simple test cases to use FB_DAMAGE_CLIPS plane property.

Deepak Rawat (1):
  tests/kms_atomic: Add a new test case for FB_DAMAGE_CLIPS plane
    property

Jeevan B (2):
  lib/igt_aux: Rename igt_debug_manual_check and assert check if all is
    supplied
  tests/kms_psr2_sf: Make this a generic test and change testcase design

 lib/igt_aux.c            |  18 ++-
 lib/igt_aux.h            |   2 +-
 tests/i915/kms_dsc.c     |   2 +-
 tests/i915/kms_psr.c     |   2 +-
 tests/i915/kms_psr2_sf.c |  30 ++---
 tests/kms_atomic.c       | 232 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 262 insertions(+), 24 deletions(-)

-- 
2.19.1

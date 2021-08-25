Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76B56E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Aug 2021 17:09:00 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 25 Aug 2021 22:40:16 +0530
Message-Id: <20210825171018.10821-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix kms_psr2_sf test
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
Cc: jose.souza@intel.com, daniel@ffwll.ch, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Make this test generic, rename igt_debug_manual_check, patch the
igt functions igt_debug_manual_check() and igt_debug_wait_for_keypress()
to assert if "all" is supplied and change testcase design.

Jeevan B (2):
  lib/igt_aux: Rename igt_debug_manual_check and assert check if all is
    supplied
  tests/kms_psr2_sf: Make this a generic test and change testcase design

 lib/igt_aux.c       | 16 +++++++++++-----
 lib/igt_aux.h       |  2 +-
 tests/kms_dsc.c     |  2 +-
 tests/kms_psr.c     |  2 +-
 tests/kms_psr2_sf.c | 30 +++++++++++++++---------------
 5 files changed, 29 insertions(+), 23 deletions(-)

-- 
2.19.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD7E10E496
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 16:14:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 21:43:59 +0530
Message-Id: <20230726161400.900442-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/intel-ci/xe.blocklist:
 Add not present tests"
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

This reverts commit 8808ceee461b174faadf0fa812c00c0fb680da16.

Even if CI BAT doesn't contain chamelium and psr config,
we can't blocklist these tests. These configs are enabled
in resume runs and applying this blocklist, snub these tests
from execution.
---
 tests/intel-ci/xe.blocklist.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ab3945f76..02edeb6b6 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,11 +82,3 @@ igt@kms_plane_lowres@tiling-(4|x|y|yf)
 ##################################################################
 igt@xe_sysfs*
 ##################################################################
-# No chamelium/psr setup on XE bat
-##################################################################
-igt@.*chamelium.*
-igt@.*psr.*
-##################################################################
-# Hang tests not yet enabled
-##################################################################
-igt@kms_.*@.*hang.*
-- 
2.25.1

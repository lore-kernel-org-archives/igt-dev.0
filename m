Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FAB10E5A6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 08:16:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 13:38:39 +0530
Message-Id: <20230906080840.1714917-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
References: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 5/6] tests/intel-ci/xe.blocklist: Drop hang
 tests from xe blocklist
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

As XE spin support changes got merged in IGT lib, drop hang
tests from xe blocklist.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2df3810af..d496a3f6d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -67,8 +67,6 @@ igt@kms_legacy_colorkey@invalid-plane
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
-igt@kms_.*@.*hang.*
 ##################################################################
-- 
2.40.0

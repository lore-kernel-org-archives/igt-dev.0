Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1684710E62C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:19:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:41:52 +0530
Message-Id: <20230825081153.883708-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/4] tests/intel-ci: Drop async flip tests from xe
 blocklist
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

As XE driver supports Async flips, drop those tests from xe
blocklist.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 1778e91f1..e8128a510 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -72,7 +72,6 @@ igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
 igt@kms_addfb_basic@.*-tiling
 igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
-igt@kms_async_flips@.*
 igt@kms_plane_multiple@tiling-(4|x|y|yf)
 igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
 igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
-- 
2.40.0

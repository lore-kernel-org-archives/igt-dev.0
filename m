Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA3110E6E0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 14:54:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: fix regex
Date: Thu, 21 Dec 2023 20:25:01 +0530
Message-Id: <20231221145501.354456-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix regex, since its block-listing
"igt@kms_frontbuffer_tracking@pipe-fbc-rte" which is not
meant to be.

Fixes: 6be4fb999 ("intel-ci: Blacklist tests on pipe I to pipe P")
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 7c28c3471..cd8960c64 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -47,7 +47,7 @@ igt@tools_test
 # KMS: Pipe E to Pipe P are not available on Intel hardware,
 # hence can't use more than 4 displays.
 ##################################################################
-igt@.*@.*pipe-[e-pE-P].*
+igt@.*@.*pipe-[e-pE-P]($|-.*)
 igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415810E6AA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 05:07:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: add i915 specific tests
Date: Wed, 13 Dec 2023 10:38:29 +0530
Message-Id: <20231213050829.291455-1-swati2.sharma@intel.com>
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

Add i915 pm specific tests to blocklist.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 7d1ac38a7..db0846e43 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -69,6 +69,8 @@ igt@kms_pipe_b_c_ivb@.*
 igt@kms_psr@.*-mmap-(cpu|gtt)
 igt@kms_pwrite_crc
 igt@kms_rotation_crc@exhaust-fences
+igt@kms_pm_lpsp@screens-disabled
+igt@kms_pm_rpm@(fences-dpms|pm-caching|pm-tiling)
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4C910E11E
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 08:24:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 13:44:49 +0530
Message-Id: <20231026081449.3967346-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231026081449.3967346-1-bhanuprakash.modem@intel.com>
References: <20231026081449.3967346-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/intel-ci: Drop kms_fb_coherency test
 from XE blocklist
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

Drop kms_fb_coherency test from XE blocklist.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 3d5ec1a43..135ab18a3 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -69,7 +69,6 @@ igt@kms_rotation_crc@exhaust-fences
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-igt@kms_fb_coherency@memset-crc
 igt@kms_prime@.*
 ##################################################################
 # KMS: Non-Intel tests
-- 
2.40.0

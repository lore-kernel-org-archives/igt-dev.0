Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB16D10E5F9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 14:29:02 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Thu,  3 Aug 2023 14:03:07 +0000
Message-Id: <20230803140307.3052435-2-katarzyna.dec@intel.com>
In-Reply-To: <20230803140307.3052435-1-katarzyna.dec@intel.com>
References: <20230803140307.3052435-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/1] tests/intel-ci: Add detailed
 description to blocked tests
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

Update of description of blocked tests:
* mock DRM KUnit:
	igt@dmabuf.*
	igt@drm_buddy
	igt@drm_mm
	igt@kms_selftest.*

v2: Removing comment about xe_sysfs

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index b40dd4f70..f660d8386 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -21,7 +21,8 @@ igt@gen.*
 igt@perf.*
 igt@sysfs_.*
 ##################################################################
-# Exclude kselftest
+# Exclude mock DRM KUnit from IGT, as those already run at build
+# time on Intel CI
 #################################################################
 igt@dmabuf.*
 igt@drm_buddy
-- 
2.34.1



Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A5A10E875
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 07:01:01 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:30:52 +0530
Message-Id: <20230908070053.1283474-4-swati2.sharma@intel.com>
In-Reply-To: <20230908070053.1283474-1-swati2.sharma@intel.com>
References: <20230908070053.1283474-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/intel-ci: remove
 feature_discovery from blocklist
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

Remove feature_discovery from blocklist.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d496a3f6d..e73018ec6 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -38,7 +38,6 @@ igt@drm_fdinfo
 igt@drm_read
 igt@dumb.*
 igt@fbdev
-igt@feature_discovery
 igt@prime_.*
 igt@sw_sync
 igt@syncobj_.*
-- 
2.25.1

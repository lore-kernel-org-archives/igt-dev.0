Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B3310E273
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 07:04:33 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Nov 2023 12:42:15 +0530
Message-Id: <20231106071215.1271281-3-kunal1.joshi@intel.com>
In-Reply-To: <20231106071215.1271281-1-kunal1.joshi@intel.com>
References: <20231106071215.1271281-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX patch do not merge
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

Only for test purpose do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c252e2cf0..fb8e64b6c 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,6 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_big_joiner@simultaneous-modeset
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

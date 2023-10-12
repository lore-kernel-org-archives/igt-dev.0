Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586F10E42F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 07:38:37 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Oct 2023 13:14:49 +0530
Message-Id: <20231012074449.2764136-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] intel-ci/blacklist: Update blocklist
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

targets virtualized drivers only.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/blacklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..cfd4a7768 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -138,3 +138,6 @@ igt@device_reset@reset-bound
 
 # not working for i915
 igt@kms_bw@.*
+
+# targets virtualized drivers only
+igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
-- 
2.25.1

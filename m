Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E6010E60B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:13:47 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 12:47:57 +0530
Message-Id: <20230713071757.246298-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/intel-ci/xe.blocklist: Add discarded tests
 in blocklist
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

Chamelium and PSR config is not present on XE bat as of now
and hang tests are yet to be enabled hence added them in blocklist

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 02edeb6b6..43bd360a8 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,3 +82,11 @@ igt@kms_plane_lowres@tiling-(4|x|y|yf)
 ##################################################################
 igt@xe_sysfs*
 ##################################################################
+# No chamelium/psr setup on XE bat
+##################################################################
+igt@.*chamelium.*
+igt@.*psr.*
+##################################################################
+# Hang tests not yet enabled
+##################################################################
+igt@kms_pipe_crc_basic@hang-read-crc
-- 
2.25.1

Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A31A10E5BD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 12:03:12 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Thu, 20 Jul 2023 17:31:46 +0530
Message-Id: <20230720120147.1057467-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
References: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/intel-ci: Remove xe_sysfs from
 blacklist
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Removing xe_sysfs tests as kernel related patches are ready.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ab3945f76..b984d835a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -80,8 +80,6 @@ igt@kms_force_connector_basic@force-load-detect
 igt@kms_getfb@.*-ccs
 igt@kms_plane_lowres@tiling-(4|x|y|yf)
 ##################################################################
-igt@xe_sysfs*
-##################################################################
 # No chamelium/psr setup on XE bat
 ##################################################################
 igt@.*chamelium.*
-- 
2.25.1

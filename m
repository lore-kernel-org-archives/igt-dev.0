Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66B210E59D
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 06:10:26 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Thu,  3 Aug 2023 11:38:13 +0530
Message-Id: <20230803060814.1180879-5-priyanka.dandamudi@intel.com>
In-Reply-To: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
References: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/intel-ci: Remove xe_sysfs from
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
index b40dd4f70..d7d9c6c93 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -81,5 +81,3 @@ igt@kms_getfb@.*-ccs
 igt@kms_plane_lowres@tiling-(4|x|y|yf)
 igt@kms_.*@.*hang.*
 ##################################################################
-igt@xe_sysfs*
-##################################################################
-- 
2.25.1

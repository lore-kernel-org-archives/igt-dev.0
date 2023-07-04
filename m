Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC610E104
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 06:39:11 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue,  4 Jul 2023 12:08:16 +0530
Message-Id: <20230704063816.670605-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: Block list xe_sysfs tests
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

Black listing xe_sysfs tests until related KMD changes get merged.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2a758359e..02edeb6b6 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -80,3 +80,5 @@ igt@kms_force_connector_basic@force-load-detect
 igt@kms_getfb@.*-ccs
 igt@kms_plane_lowres@tiling-(4|x|y|yf)
 ##################################################################
+igt@xe_sysfs*
+##################################################################
-- 
2.25.1

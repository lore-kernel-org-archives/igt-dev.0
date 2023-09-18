Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C529A10E26F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 11:21:44 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 16:52:15 +0530
Message-Id: <20230918112216.260019-2-swati2.sharma@intel.com>
In-Reply-To: <20230918112216.260019-1-swati2.sharma@intel.com>
References: <20230918112216.260019-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_lease: remove redundant test
 doc
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

We already have IGT_TEST_DESCRIPTION and even testplan
documentation, no need to redundant documentation.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_lease.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 9ada6d5ea..1a91b3eb4 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -21,11 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-/** @file kms_lease.c
- *
- * This is a test of DRM leases
- */
-
 /**
  * TEST: kms lease
  * Category: Display
-- 
2.25.1

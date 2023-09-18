Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519D910E04E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 10:40:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 16:11:30 +0530
Message-Id: <20230918104130.259103-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_sequence: remove redundant test
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
 tests/kms_sequence.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9476203e9..c6d6dea00 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -22,11 +22,6 @@
  * IN THE SOFTWARE.
  */
 
-/** @file kms_sequence.c
- *
- * This is a test of drmCrtcGetSequence and drmCrtcQueueSequence
- */
-
 /**
  * TEST: kms sequence
  * Category: Display
-- 
2.25.1

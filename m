Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736716E35D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 11:01:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu,  6 Aug 2020 16:38:03 +0530
Message-Id: <20200806110803.19062-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

testdisplay should be added to BAT. testdisplay is considered
to be the most basic test to test display functionality.
With this test we will be able to test modesetting.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..b245b7a7 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -149,6 +149,7 @@ igt@vgem_basic@dmabuf-mmap
 igt@vgem_basic@mmap
 igt@vgem_basic@second-client
 igt@vgem_basic@sysfs
+igt@testdisplay
 
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

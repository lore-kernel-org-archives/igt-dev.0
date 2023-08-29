Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DD610E0F9
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 05:52:57 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 11:28:35 +0530
Message-Id: <20230829055835.1750432-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
References: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_uevent: Update documentation
 fields
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

Update Category, Run type and Test Category fields for test.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_uevent.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c
index 4dc49057c..1ad9de909 100644
--- a/tests/xe/xe_uevent.c
+++ b/tests/xe/xe_uevent.c
@@ -5,9 +5,13 @@
 
 /**
  * TEST: cause fake gt reset failure and listen uevent from KMD
- * SUBTEST:fake_reset_uevent_listener
+ * Category: Software building block
  * Functionality: uevent
  * Sub-category: GT reset failure uevent
+ * Test category: functionality test
+ * Run type: FULL
+ *
+ * SUBTEST: fake_reset_uevent_listener
  * Description:
  *		Test creates uevent listener and causes fake reset failure for gt0
  *		and returns success if uevent is sent by driver and listened by listener.
-- 
2.25.1

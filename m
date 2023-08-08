Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7B10E1C1
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:43:55 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 20:19:13 +0530
Message-Id: <20230808144913.600790-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
References: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/xe_uevent: Update
 documentation fields.
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

- Update functionality and sub-category fields.

v2
- Fix compilation failure.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_uevent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c
index 91b14990a..4dc49057c 100644
--- a/tests/xe/xe_uevent.c
+++ b/tests/xe/xe_uevent.c
@@ -6,6 +6,8 @@
 /**
  * TEST: cause fake gt reset failure and listen uevent from KMD
  * SUBTEST:fake_reset_uevent_listener
+ * Functionality: uevent
+ * Sub-category: GT reset failure uevent
  * Description:
  *		Test creates uevent listener and causes fake reset failure for gt0
  *		and returns success if uevent is sent by driver and listened by listener.
-- 
2.25.1

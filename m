Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F3710E272
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 10:49:17 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon, 29 May 2023 16:19:32 +0530
Message-Id: <20230529104932.495519-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 core hotunplug test
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add core hotunplug unbind and rebind test.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 7242c8d8..f8ad160e 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -270,3 +270,9 @@ igt@kms_prop_blob@basic
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
+
+# All tests that do module unloading and reloading are executed last.
+# They will sometimes reveal issues of earlier tests leaving the
+# driver in a broken state that is not otherwise noticed in that test.
+
+igt@core_hotunplug@unbind-rebind
-- 
2.25.1
